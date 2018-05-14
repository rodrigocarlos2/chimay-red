QEMU set up for testing Chimay Red exploit
==========================================

.. toctree::
   :maxdepth: 2
   :caption: Contents:


## Network setup

sudo brctl addbr br0
sudo ip addr add 10.0.0.1/24 dev br0
sudo ip link set br0 up



## Not sure if this needed:

sudo vi /etc/qemu/bridge.conf
allow br0
include /etc/qemu/sv.conf




https://wiki.qemu.org/Documentation/Networking

https://en.wikibooks.org/wiki/QEMU/Networking

https://unix.stackexchange.com/questions/375733/host-guest-networking-using-qemu

https://www.linux-kvm.org/page/Networking


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
