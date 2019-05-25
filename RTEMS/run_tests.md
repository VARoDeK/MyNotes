# RTEMS Test

#### We will run tests on executables present in `testsuites/samples` of SPARC BSP.
~~~~
$ rtems-test --rtems-bsp=erc32-run --rtems-tools=$HOME/development/rtems/5 ~/development/rtems/kernel/erc32/sparc-rtems5/c/erc32/testsuites/samples
~~~~

---
#### To run test on any other executables
* `rtems-test` -  Name of program, present inside `rtmes/5/bin`.
* The options starting with `--` are actually arguments to the `rtems-test`.
* The **only** option not starting with `--` is the path to the directory, where the executables are present, on which tests are to be performed.
---
