# Running a Testsuite in RTEMS

## You can use `gdb` to run a testsuite, or can run it directly.

#### We will run the testsuite present inside SPARC BSP

---

### Locate the testsuite
~~~~
$ cd
$ cd development/rtems/kernel/erc32/sparc-rtems5/c/erc32/testsuites/samples
$ export PATH=$HOME/development/rtems/5/bin:$PATH 
~~~~

---

### Run Using GDB
~~~~
$ sparc-rtems5-gdb hello.exe
~~~~
~~~~
	#gdb asks for several inputs. 
		$ tar sim
		$ load
		$ r

	#Program runs.
		$ q
	# you can also type 'quit' instead of 'q' to terminate.
~~~~

### Run Directly
~~~~
$ sparc-rtems5-run hello.exe
~~~~
