#!/usr/bin/env bash
#TEL extras setup file
#set color and update vars
UPDATE=false
WHITE=${1:-"38;5;07"}
GREEN=${1:-"38;5;02"}
RED=${1:-"38;5;01"}

catch(){
if [ $?  -ne 0 ]
then
        error "${1}"
	error "please try again"
        exit 0
else
	logf "done"
fi
}


log() {
	printf "\033[0;%sm%s\033[0m\033[0;%sm%s\033[0m\n" "${WHITE}" "[TEL]: " "${GREEN}" "${1}"
}
error() {
	printf "\033[0;%sm%s\033[0m\033[0;%sm%s\033[0m\n" "${WHITE}" "[TEL]: " "${RED}" "${1}"
}

apt-get update -y && apt-get upgrade -y && logf "finished updating Termux packages" #print to screen as hotfix

# VIM SETUP
echo 'Would you like to install VIM editor?'
read userinput
if [ $userinput == Y ] || [ $userinput == y ]  ; then
catch "$(git clone https://github.com/sealedjoy/setup-vim 2>&1)"
cd setup-vim
chmod +x setup.sh
./setup.sh
fi

# GAMES setup
echo 'Would you like to install cli games?'
echo 'includes: tetris, pacman, sudoku, snake, dungeon crawler, solitaire'
read userinput
if [ $userinput == Y ] || [ $userinput == y ]  ; then
catch "$(apt-get install vitetris nudoku nsnake nethack tty-solitaire myman -y 2>&1)"
fi

echo 'Would you like to install cmatrix?'
read userinput
if [ $userinput == Y ] || [ $userinput == y ]  ; then
catch "$(apt-get install cmatrix -y 2>&1)"
fi




log "finished"
error "app will restart in 3 seconds!"
sleep 3
tel-restart
error 'Restart cannot be performed automatically when the TEL app is not active, Please run the command "tel-restart" manually'