
alias clipboard="xsel -b"

PS1="\[\e]0;\u @ \h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[00m\] \[\033[01;32m\]@\[\033[00m\] \[\033[01;37m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
