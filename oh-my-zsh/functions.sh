# Prints colours. Nuff said.
colourtest(){
  for x in 0 1 4 5 7 8; do for i in `seq 30 37`; do for a in `seq 40 47`; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; printf "\e[0m\n";
}

# Clones repo, cds into it, and opens it in your text editor
clone(){
  local FOLDER=""
  if [ "$#" -gt "1" ]; then
    FOLDER=$2
  else
    FOLDER=$(echo $1 | grep -o "[^\/]*\.git$" | sed s/\.git//)
  fi;

  git clone $1 $FOLDER
  cd $FOLDER
  $EDITOR_CLI .
}

# Create a new directory and enter it
mkd(){
  mkdir -p "$@" && cd "$_";
}

gen_pass(){
  # Length defaults to 32 if no argument given
  if [ -z "$1" ]; then
    length=100
  else
    length="$1"
  fi

  echo -n $(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$length};echo;)
}

timer(){
  if [ -z "$2" ]; then
    m="Timer up"
  else
    m="$2"
  fi

  date1=$((`date +%s` + $1));
  while [ "$date1" -ge `date +%s` ]; do
    echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
    sleep 0.1
  done

  notify-send "$m"
  ffplay -nodisp -loop 0 -loglevel quiet ~/sounds/alarm.mp3
}
