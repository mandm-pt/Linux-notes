# Permissions

| Mask (Octal) | Letter |    Description     |
| :----------: | :----: | :----------------: |
|      4       |   r    |  read permission   |
|      2       |   w    |  write permission  |
|      1       |   x    | execute permission |
|      -       |   -    |   no permission    |

## Numerical permissions

|   #   |       Permission        |  rwx  | Binary |
| :---: | :---------------------: | :---: | :----: |
|   7   | read, write and execute |  rwx  |  111   |
|   6   |     read and write      |  rw-  |  110   |
|   5   |    read and execute     |  r-x  |  101   |
|   4   |        read only        |  r--  |  100   |
|   3   |    write and execute    |  -wx  |  011   |
|   2   |       write only        |  -w-  |  010   |
|   1   |      execute only       |  --x  |  001   |
|   0   |          none           |  ---  |  000   |

### Example

```
- rwx r-x r-x 1 root root                 890 Mar 17 18:45 FILE
- --- --- ---
|  |   |   |> Other(r-x)
|  |   |
|  |   |> Group (-xr)
|  |
|  |> Owner (rwx)
|
|> File type
```

## Directory Permissions

* `r`: Allows the contents of the directory to be listed if the x attribute is also set.
* `w`: Allows files within the directory to be created, deleted, or renamed if the x attribute is also set.
* `x`: Allows a directory to be entered (i.e. cd dir).

## Commands

* `chmod`: Modify file access rights
* `su`: Temporarily become the superuser
* `sudo`: Temporarily become the superuser
* `chown`: Change file ownership
* `chgrp`: Change a file's group ownership

### chmod classes

Example: `chmod  g+w shared_dir`

| Reference | Class  |                              Description                               |
| :-------: | :----: | :--------------------------------------------------------------------: |
|     u     |  user  |                               file owner                               |
|     g     | group  |                      members of the file's group                       |
|     o     | others | users who are neither the file's owner nor members of the file's group |
|     a     |  all   |                  all three of the above, same as ugo                   |
