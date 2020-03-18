# Basic commands

`passwd`: Change password
`sudo passwd USERNAME`: Change password of other user if current user has `sudo` permissions
`sudo adduser USERNAME`: Creates a new user
`sudo usermod -a -G GROUPNAME USERNAME`: Adds USERNAME to GROUPNAME
`sudo userdel -r pi`: Removes user including he's home directory