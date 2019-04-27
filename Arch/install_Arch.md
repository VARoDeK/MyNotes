## 1 - First Download Arch and make a Bootable Pendrive
* [Download Arch From Here](http://mirror.cse.iitk.ac.in/archlinux/iso/2019.04.01/).
* Download ISO File.
* Make a bootable pendrive. You can use [Balena - Etcher](https://www.balena.io/etcher/) for this purpose. It's a very handy and easy to use tool for burning Linux images.

---

## 2 - Boot your system with your bootable pendrive

---

## 3 - Verify the Boot Mode
Run the following Command:

`$ ls /sys/firmware/efi/efiwars`

If some output is given, it means `ls` command is able to read `efivars` directory, hence UEFI mode is enabled on your system.

---

## 4 - Connect to internet
* If you have ethernet connection, just plug it in and run the command:

`$ dhcpcd`

* Else figure out your interface using the command:

`$ip link`

and connect to it. [Refer Here](https://wiki.archlinux.org/index.php/Installation_guide#Connect_to_the_internet).
* The connection may be verified with `ping`. Run the following command:

`$ ping -c 3 archlinux.org`.

---

