#!/bin/bash

APPS="$HOME/.local/share/applications/"
BIN="$PREFIX/bin/"

if [[ ! -f ./sms-gui ]]; then
	echo -e "\n\e[31mMain file \"sms-gui\" not found...\n" >&2
	exit 1
fi

if [[ ! -f ./sms.desktop ]]; then
	echo -e "\n\e[31mDesktop entry file \"sms.desktop\" not found...\n" >&2
	exit 1
fi

if [[ -z $PREFIX || -z $HOME ]]; then
	echo -e "\n\e[31mAre you using Termux? Some enviromental variables missing...\n" >&2
	exit 1
fi

if [[ $(echo -en $PREFIX) != "/data/data/com.termux/files/usr" || $(echo -en $HOME) != "/data/data/com.termux/files/home" ]]; then
	echo -e "\n\e[31mAre you using Termux? Some enviromental variables missmatch...\n" >&2
	exit 1
fi

if [[ ! -d $BIN ]]; then
	echo -e "\n\e[31mMain binary directory not found...\n" >&2
	exit 1
fi

if [[ ! -d $APPS ]]; then
	echo -e "\n\e[31mDirectory for desktop entries not found...\n" >&2
	exit 1
fi

echo -e "\nMoving script file..."
cp ./sms-gui $BIN/sms-gui && {
	echo -e "\e[32mDone!\e[0m" 
} || {
	echo -e "\e[31mFail!\e[0m" 
	exit 1
}

echo -e "\nChanging perrmissions..."
chmod +x $BIN/sms-gui && {
	echo -e "\e[32mDone!\e[0m" 
} || {
	echo -e "\e[31mFail!\e[0m" 
	exit 1
}

echo -e "\nMoving desktop entry file..."
cp ./sms.desktop $APPS/sms.desktop && {
	echo -e "\e[32mDone!\e[0m" 
} || {
	echo -e "\e[31mFail!\e[0m" 
	exit 1
}

echo -e "\nChanging perrmissions..."
chmod +x $APPS/sms.desktop && {
	echo -e "\e[32mDone!\e[0m" 
} || {
	echo -e "\e[31mFail!\e[0m" 
	exit 1
}

echo -e "\nUpdating desktop entries database..."
update-desktop-database $APPS && {
	echo -e "\e[32mDone!\e[0m" 
} || {
	echo -e "\e[31mFail!\e[0m" 
	exit 1
}



echo -e "\n\e[38;5;45mInstalled!\n\e[0mNow you can type \"sms-gui\" or launch \"SMS\" app from apps menu!\n"