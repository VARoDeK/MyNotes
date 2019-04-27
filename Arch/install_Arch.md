# Pre-Installation

---

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

`$ ip link`

and connect to it. [Refer Here](https://wiki.archlinux.org/index.php/Installation_guide#Connect_to_the_internet).
* The connection may be verified with `ping`. Run the following command:

`$ ping -c 3 archlinux.org`.

---

## 5 - Update the system clock

`$ timedatectl set-ntp true`

---

## 6 - Partition Disk
Run the following command:

`$ lsblk -o name,size,type,mountpoint,fstype`

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

|Partition Name | Partition Type | Size|
|:-------------:|:--------------:|:---:|
| `sda1`        | vfat           | 550M|
| `sda2`        | ext4           | 923G|
| `sda3`        | swap           | 7.8G|

Note - The size of swap (sda3 in my case) should be almost eqal to the size of your RAM.

---

## 7 - Coverting Partiton-Type of each Partition
I will explain it using the partitions of my own system.
**Use the partition name of your drive in your system**.

* `sda1` should be of `vfat` type.

`$ mkfs.vfat /dev/sda1`

* `sda2` should be of `ext4` type.

`$ mkfs.ext4 /dev/sda2`

* `sda3` is a swap.

`$ mkswap /dev/sda3`
`$ swapon /dev/sda3`

---

## 8 - Mount File Systems
Run the Following Commands:

`$ mkdir /mnt/boot`
`$ mount /dev/sda1 /mnt/boot`
`$ mount /dev/sda2 /mnt`

---

# Installation

---

## 1 - Installing the base packages

Run the Following Command:

`$ pacstrap /mnt base base-devel dialog iw wpa_supplicant sudo`

---

# Configure the system

---

## 1 - Fstab
Generate and fstab file

`$ genfstab -U /mnt >> /mnt/etc/fstab`

---

## 2 - Chroot
Change root into new system

`$ srch-chroot /mnt`

---

## 3 - Time Zone
Now find out your time zone.

* find the `Region` by running command: `$ ls /usr/share/zoneinfo`. For example, in my case, region is 'Asia'.
* find the `city` by running command: `$ ls /usr/share/zoneinfo/Region`. For example, I will run the command, `$ ls /usr/share/zoneinfo/Asia`.
* Hence my Region is Asia and City is Kolkata.

Run the command:

`$ ln -sf /usr/share/zoneinfo/Asia/Kolkata`.

Run `hwclock` to generate `/etc/adjtime`

`$ hwclock --systohc`

---

## 4 - Locale
Install `vim`.

`$ pacman -S vim`.

Open `/etc/locale.gen` usin `vim`.

`$ vim /etc/locale.gen`.

* Using arrow keys find `#en_US.UTF-8 UTF-8`.
* Using arrow keys, place the cursor after **#** and press **i**.
* Using Backspace key, remove the **#**. Now, it will look like, `en_US.UTF-8 UTF 8`.
* Without Pressing any other key, press **Esc** key.
* Type **:wq** and hit enter.

Now run the following command:

`$ locale-gen`

Now, open `/etc/locale.conf` file using command:

`$ vim /etc/locale.conf`

* Press **i** and type:
 `LANG = en_US.UTF-8`
* Press **Esc** key.
* Type **:wq** and hit enter.

---

## 5 - Network Configuration
 
