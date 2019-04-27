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

## 5 - Update the system clock

`timedatectl set-ntp true`

---

## 6 - Partition Disk
Run the following command:

`lsblk -o name,size,type,mountpoint,fstype`

This will print the list of storage drives and thier pre-existing partitions with their file-system types.
The Partitions are written in form of `sdxn`.
**x** - tells the storage device number.
**n** - tells the partition number.

For example, my HDD has three partitions. And its the only secondary memory device in my laptop. It's partitions are named as:
* `sda1`.
* `sda2`.
* `sda3`.

Recommended - Make three partitions for installing Arch Linux.
I will exaplin it with the help of my system.
* `sda1`	|	partition type: vfat	|	size: 550M
* `sda2`	|	partition type: ext4	|	size: 923G
* `sda3`	|	partition type: swap	|	size: 7.8G

Note - The size of swap (sda3 in my case) should be almost eqal to the size of your RAM.

---

## 7 - Coverting Partiton-Type of each Partition

