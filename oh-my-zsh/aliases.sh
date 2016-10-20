# Basic functions
alias clip="xclip -selection c"

# Places
alias dt="cd ~/Desktop"
alias dirs="dirs -v"

# Git
alias g="git "
alias s="git status -s"
alias a="git add "
alias aa="git add -A"
alias c="git commit "
alias cm="git commit -m "
alias cam="git commit -am "
alias d="git diff "
alias p="git push"
alias pl="git pull"
alias new="clone git@github.com:Marcel-Robitaille/template.git "

# Misc
alias sql="mysql -u lan -p personal --host 192.168.0.120"
alias starwars="telnet towel.blinkenlights.nl"
alias fonts="fc-cache -fv"
alias scan="sudo chmod 666 /dev/bus/usb/$(lsusb | grep Brother | sed s/Bus\ // | sed s:\ Device\ :/: | cut -d':' -f 1 ) && simple-scan"
