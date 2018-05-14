Initial setup
=============

### Create Python2 virtual environment

    virtualenv -p `which python2` .venv


and activate it:

    source .venv/bin/activate


Install required Python libraries within just created virtual environment:

    pip install -r requirements.txt


### Download vulnerable version of Mikrotik

    wget https://download2.mikrotik.com/routeros/6.38.4/mikrotik-6.38.4.iso



### Create Qemu Virtual Disk and Start Virtual Machine


    qemu-img create -f qcow2 routeros-6.38.4.qcow2 200M
    qemu-system-i386 -m 512 -enable-kvm -boot d -cdrom mikrotik-6.38.4.iso routeros-6.38.4.qcow2


### Network setup

https://wiki.mikrotik.com/wiki/Manual:Simple_Static_Routing


## Useful Links

- [Dealing with backdoored Mikrotik router](http://www.r00t.cz/Misc/MikrotikBackdoor)
- [Running Mikrotik RouterOS x86 on GNS3](http://brezular.com/2014/07/09/running-mikrotik-routeros-x86-on-gns3/)
- [Chimay Red, TinyShell, and BusyBox Quick Start Guide](https://wikileaks.org/ciav7p1/cms/page_16384604.html)
- [Mikrotik Router Configuration](http://mikrotikroutersetup.blogspot.cz/p/mikrotik-router-basic-configuration_29.html)
