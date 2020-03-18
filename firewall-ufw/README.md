# Uncomplicated Firewall (ufw)

## Packages

* `ufw`: Uncomplicated Firewall
* `gufw`: Graphical interface for ufw.

## Basics

* `sudo ufw enable`: Enable UFW
* `sudo ufw disable`: Disable UFW

## Rules managment

* `sudo ufw reset`: Reset UFW Rules
* `sudo ufw status numbered`: Show all rules numbered. Useful if we want to delete by number
* `sudo ufw delete N`: Delete rule number N
* `sudo ufw allow|deny <WHAT>`
  * `PORT`: Port number, i.e. `22`
  * `PORT_FROM:PORT_TO/tcp|udp`: Port number, i.e. `6000:6007/tcp` or `6000:6007/udp`
  * `SERVICE_NAME`: Name of the service, i.e. `http` or `ssh`
  * `IP`: The ip address, i.e. `192.168.15.51`
