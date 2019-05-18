# Set up RTEMS SPARC Architecture on Host OS

#### Note: Make sure you have `python 2.7` (devloper version), `python 3` and `pax` package installed on your system.

---

## Setup RSB
### Set Paths and Check Environment
~~~~
$ cd
$ mkdir -p development/rtems && cd development/rtems
$ git clone git://git.rtems.org/rtems-source-builder.git rsb
$ export PATH=$HOME/development/rtems/5/bin:$PATH 
~~~~

	#copy paste the above line in `.zshrc` or `.bashrc`, whichever terminal you are using.

`$ cd rsb`

`$ ./source-builder/sb-check`

`$ ./source-builder/sb-set-builder --list-bsets`

### Make RSB
`$ cd rtems`

`$ ../source-builder/sb-set-builder --prefix=/home/varodek/development/rtems/5 5/rtems-sparc`

---

## Setup RTEMS using RSB


