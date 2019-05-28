# Allow Vitual Machines To connect to internet.

**Note:** As desired, enable some of the following services:

* `vmware-usbarbitrator.service` for connecting USB devices to guest
* `vmware-hostd.service` for sharing virtual machines

---

1- Starting the service, `vmware-networks.service` for guest network access.
	* `$ sudo systemctl start vmware-networks.service`.

2- Run following commands:
~~~~
$ sudo modprobe -a vmmon

$ sudo modprobe -a vmw_vmci

$ sudo modprobe -a vmnet

$ sudo /usr/bin/vmware-networks --start -v
~~~~

---

### References
* https://wiki.archlinux.org/index.php/VMware

---
