# RTEMS Docs are build using Sphinx Builder.

#### Note: Make sure you have `Sphinx`, installed on your system

---

I will clone the docs inside `~/github` directory.

~~~~
$ cd ~/github
$ git clone git://git.rtems.org/rtems-docs.git
		#make changes to any of the topic inside 'rtems-docs' folder.
		#Suppose you made changes to 'User'
~~~~

~~~~
$ cd ~/github
$ sphinx-build -b html ./rtems-docs/user ./final
$ cd final
	#you will find your web page
~~~~

---
