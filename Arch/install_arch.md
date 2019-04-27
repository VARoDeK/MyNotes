----------------------------------------
## 1 - First Download Arch and make a Bootable Pendrive
* http://mirror.cse.iitk.ac.in/archlinux/iso/2019.04.01/
* Download ISO file
* Make a bootable pendrive. You can use [Balena - Etcher](https://www.balena.io/etcher/) for this purpose. It's a very handy and easy to use tool.

----------------------------------------
## 2 - Boot Your system with your bootable pendrive
----------------------------------------
## 3 - Verify the Boot Mode
	`ls /sys/firmware/efi/efivars`.
If the some output is given, it means the `ls` comand is able to read the `efivars` directory, hence UEFI mode is enabled on your system.
 
----------------------------------------
## 4 - Connect to internet

	* If you have ethernet cable, just plug it in and run the command:
		`$ dhcpcd`. 
	* Else, figure out your interface using the command:
		`$ ip link` 
	  and connect to it.
	* The connection maybe verified with `ping`. Run the following command:
		`$ ping -c 3 archlinux.org`.
