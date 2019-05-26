# Port ndbm.h from FreeBSD to Newlib
---
Notes: 
* Use `find <location-of-direcotry-to-be-searched> -name \<file-name>` to search for any needed file. It searches recursively inside sub-directories too, for the given file. For example, if I need to search for `ndbm.h` inside my current folder, I will use `find ./ -name \ndbm.h`.
---
### Search for ndbm.h and ndbm.c
* Go to cloned folder of `freebsd`.
* `$ cd freebsd`
* Search for `ndbm.h` and `ndbm.c`.
* `$ find ./ -name \ndbm.h`
* `$ find ./ -name \ndbm.c`
* I copied these files from their place to my home folder.
* Copy `ndbm.h` to `newlib-cygwin/newlib/libc/include/`
* Copy `ndbm.c` to `newlib-cygwin/newlib/libc/posix`
--- 
### Additional files
Now Additional files are neede. When explore `ndbm.h`, it requires `db.h`.
* Import it in similar way, from freebsd to `newlib-cygwin/newlib/libc/include`, we did for `.h` and `.c`.

When we explore `ndbm.c`, it requires `hash.h`
* `hash.h` can be found in `newlib-cygwin/newlib/libc/search` directory.
* Copy it from there to `newlib-cygwin/newlib/libc/include`.
---
### Run `autoreconf`
* Move to `newlib-cygwin/newlib/libc/` directory.
* `$ autoreconf -fvi`.
* Move to `b-sparc-rtems5-newlib` directory.
* `$ make all`
* `$ sudo make install`.
---
### Confirm the compilation using `nm`

We can check for the presence of `dbm_close` function, if it is compiled or not.

`$ cd  ~/development/newlib/b-sparc-rtems5-newlib/sparc-rtems5/newlib/libc/posix`

`$ nm -A ./*.o | grep dbm_close`
---
