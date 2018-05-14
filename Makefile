BASE_URL=https://download2.mikrotik.com/routeros/


VERSION?=6.38.4
ISO=download/mikrotik-$(VERSION).iso
VDISK=vdisk/routeros-$(VERSION).qcow2

.PHONY: help
# target: help - Display callable targets
help:
	@egrep "^# target:" [Mm]akefile | sed "s/# target:/make/g"


# target: dl - download mikrotik ISO image
dl:
	test -f $(ISO) || wget -c -O $(ISO) $(BASE_URL)$(VERSION)/mikrotik-$(VERSION).iso


.PHONY: cvd
# target: cvd - create RouterOS virtual disk
cvd:
	test -f $(VDISK) || qemu-img create -f qcow2 $(VDISK) 200M


.PHONY: install
# target: install- install RouterOS into virtual disk from mikrotik ISO image
install: dl cvd
	# select: system, advanced-tools, routing, security
	qemu-system-x86_64 -m 512 -enable-kvm -boot d -cdrom $(ISO) $(VDISK)


.PHONY: vm
# target: vm - start RouterOS virtual machine
vm:
	qemu-system-x86_64 -m 512 -enable-kvm \
		-boot c $(VDISK) \
		-netdev bridge,id=hn0 \
		-device virtio-net-pci,netdev=hn0,id=nic1 \
		-nographic -serial \
		telnet::2323,server,nowait

		#-net user,hostfwd=tcp::10023-:23 \
# 		-netdev bridge,id=bridge,br=brkvm \
# 		-device virtio net-pci,netdev=bridge \
	# enable network:
	# /ip address add interface=ether1 address=10.0.2.4/24 disabled=no
	# /ip route add gateway=10.0.2.2 
	#
	# THIS WORKS 
	# qemu-system-x86_64 -m 512 -enable-kvm -boot c vdisk/alpine.img -netdev bridge,id=hn0 -device virtio-net-pci,netdev=hn0,id=nic1
