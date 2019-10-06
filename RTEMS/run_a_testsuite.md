# Running a Testsuite in RTEMS

#### Note: You can use `gdb` to run a testsuite, or can run it directly.

---

### Symbols Used:

* `$` - The content written after this symbol is meant to be typed on terminal.
* `#` - The content written after is comment to explain the commands. This should not be written on terminal.

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
        # gdb asks for several inputs. 
                $ tar sim
                $ load
                $ r

        # Program runs.
                $ q
        # you can also type 'quit' instead of 'q' to terminate.
~~~~

##### 2.1.2) - Using Emulator
~~~~
$ sparc-rtems5-run hello.exe
~~~~

#### 2.1.3) - Using SIS
SIS can be connected to gdb through a network socket using the gdb remote interface.
Either start SIS with `-gdb`, or issue the ’gdb’ command inside SIS, and connect gdb with
`target extended-remote localhost:1234` (as default port number of SIS is '1234'). The 
port can be changed using the `-port` option.

**Open Terminal 1 and write:**
~~~~
$ sparc-rtems5-sis -gdb
        # It will print 'gdb: listening on port 1234'.
        # Note you can define port number with '-port' option.
~~~~

**Open Terminal 2 and write:**
~~~~
$ sparc-rtems5-gdb hello.exe
~~~~
~~~~
        # gdb asks for several inputs
                $ target extended-remote localhost:1234
                $ load
                $ r
~~~~

**You will see output in Terminal 1.**

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
