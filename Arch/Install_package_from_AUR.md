# How to install a package from AUR.

```
$ git clone <link to git file>
$ cd <cloned-folder>
$ makepkg -si
```

-----------------------------------------------------------------
If you made some changes to contents in cloned folder, for example when I installed VS-Code, VS-Code used to change default-application to open directories to itself, so I had to change its entry, re calculate its sha256-sum and reflect the new sum in its pkg build file.

I will include the whole process once i get time.
---