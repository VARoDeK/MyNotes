# Port ndbm.h from FreeBSD to Newlib

---

Notes: 
* Use `find <location-of-direcotry-to-be-searched> -name \<file-name>` to search for any needed file. It searches recursively inside sub-directories too, for the given file. For example, if I need to search for `ndbm.h` inside my current folder, I will use `find ./ -name \ndbm.h`.

---

### 1- Search for ndbm.h and ndbm.c
* Go to cloned folder of `freebsd`.
* `$ cd freebsd`
* Search for `ndbm.h` and `ndbm.c`.
* `$ find ./ -name \ndbm.h`
* `$ find ./ -name \ndbm.c`
* I copied these files from their place to my home folder.
* Copy `ndbm.h` to `newlib-cygwin/newlib/libc/include/`
* Copy `ndbm.c` to `newlib-cygwin/newlib/libc/posix`

--- 

### 2- Additional files
Now Additional files are neede. When explore `ndbm.h`, it requires `db.h`.
* Import it in similar way, from freebsd to `newlib-cygwin/newlib/libc/include`, we did for `ndbm.h`.

When we explore `ndbm.c`, it requires `hash.h`
* `hash.h` can be found in `newlib-cygwin/newlib/libc/search` directory.
* Open `posix/ndbm.c` and modify the line `#incude "hash.h"` to `#include <hash.h>`.
* We need to specify `libc/search` as alternative include directory to compiler. We will do it after running `autoreconf`
 
Now modify Makefile.am file in `newlib-cygwin/newlib/libc/posix`.
* Add `ndbm.c` under `GENERAL_SOURCES` in this file.

---

### Run `autoreconf`
* Move to `newlib-cygwin/newlib/libc/` directory.
* `$ autoreconf -fvi`.

---

### Specify `libc/search` as alternative include directory to compiler.
* Open `posix/Makefile.in`

* Search for following line:
~~~~
lib_a-ndbm.o: ndbm.c
      	$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-ndbm.o `test -f 'ndbm.c' || echo '$(srcdir)/'`ndbm.c
~~~~	

Now add `-I $(top_srcdir)/search`.

~~~~
lib_a-ndbm.o: ndbm.c
        $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -I $(top_srcdir)/search -o lib_a-ndbm.o `test -f 'ndbm.c' || echo '$(srcdir)/'`ndbm.c
~~~~

---

**Do similarly for:**
~~~~
lib_a-ndbm.obj: ndbm.c
        $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -o lib_a-ndbm.obj `if test -f 'ndbm.c'; then $(CYGPATH_W) 'ndbm.c'; else $(CYGPATH_W) '$(srcdir)/ndbm.c'; fi`
~~~~

Now add `-I $(top_srcdir)/search`.

~~~~
lib_a-ndbm.obj: ndbm.c
        $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(lib_a_CFLAGS) $(CFLAGS) -c -I $(top_srcdir)/search -o lib_a-ndbm.obj `if test -f 'ndbm.c'; then $(CYGPATH_W) 'ndbm.c'; else $(CYGPATH_W) '$(srcdir)/ndbm.c'; fi`
~~~~

---

* Move to `b-sparc-rtems5-newlib` directory.
* `$ rm $(find ./ -name \config.cache)`. [Why run this? Refer here](https://github.com/VARoDeK/MyNotes/blob/master/Newlib/error_when_run_make_after_modification_in_newlib_repo.md).
* `$ make all`
* `$ sudo make install`.

---

### Confirm the compilation using `nm`

We can check for the presence of `dbm_close` function, if it is compiled or not.

`$ cd  ~/development/newlib/b-sparc-rtems5-newlib/sparc-rtems5/newlib/libc/posix`

`$ nm -A ./*.o | grep dbm_close`

---
