# Running a Testsuite in RTEMS

#### Note: You can use `gdb` to run a testsuite, or can run it directly.

---

### 1) - Locate the testsuite (for example let's locate SPARC tests)
~~~~
$ cd
$ cd development/rtems/kernel/erc32/sparc-rtems5/c/erc32/testsuites/samples
$ export PATH=$HOME/development/rtems/5/bin:$PATH 
~~~~

---

### 2) - Run

---

#### 2.1) - For SPARC
##### 2.1.1) - Using GDB
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

##### 2.1.2) - Using Emulator
~~~~
$ sparc-rtems5-run hello.exe
~~~~
---

#### 2.2) - For ARM
##### 2.2.1) - Using GDB
To Do
##### 2.2.2) - Using Emulator
~~~
qemu-system-arm -no-reboot -serial null -serial mon:stdio -net none -nographic -M xilinx-zynq-a9 -m 256M -kernel hello.exe
~~~

---

#### 2.3) - For RISCV
##### 2.3.1) - Using GDB
To Do
##### 2.3.2) - Using Emulator
~~~
qemu-system-riscv32 -no-reboot -nographic -machine virt -m 256M -kernel hello.exe
~~~

---
