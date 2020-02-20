# Git Notes

### Symbols Used:

* **`$`** - The content written after this symbol is meant to be typed on terminal.
* **`#`** - The content written after this, is a comment to explain the commands. This should not be written on terminal.

---

#### 1) - `git clone <repo-location>`
This will clone the repository from a particular location _(location can be a URL too)_. For ex:
```
$ git clone https://github.com/VARoDeK/MyNotes.git
```

---

#### 2) - `git remote add <name-of-new-remote> <remote>`
To add a new remote. For ex:
```
$ git remote add varodek https://github.com/VARoDeK/newlib.git

```
Here, `varodek` is the name of remote and `https://github.com/VARoDeK/newlib.git` is the remote value, i.e. location.

---

#### 3) - `git pull <remote-name> <branch-name>`

This will fetch and merge the commits from the mentioned branch of the mentioned remote. For ex:
```
$ git pull varodek newBranch1
```
This will sync you current branch with `newBranch1` branch of the remote `varodek`.

---

#### 4) - `git push <remote-name> <branch-name>`
Similar to `git pull`, but this will sync the remote with your current branch. For ex:
```
$ git push varodek newBranch1
```

---

#### 5) - `git checkout -b <branch-name>`
This will create a new branch and make this as your current. For ex:
```
$ git checkout -b newBranch2
```
This will create a new branch with name `newBranch2` and now your current working branch will be `newBranch2`.

---

#### 6) - `git add -A`
This will add all the changes, made after latest commit, to staging area. For ex:
```
$ git add -A
```

---

#### 7) - `git checkout -f`
After adding changes to staging area, before commiting them, if you want to delte all changes and go back to previous commit. Use this command. For ex:
```
$ git checkout -f
```

---

#### 8) - `git format-patch`
To Do

---

#### 9) - `git send-email`
To Do

---