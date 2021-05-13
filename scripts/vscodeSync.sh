#!/bin/sh

EXTENSIONS=$(cat ~/scripts/storage/extensions.txt)

read -p "pull = 'PULL' || push = <return> ==> " input

if [ -z $input ]; then
	code --list-extensions > $HOME/scripts/storage/extensions.txt

	echo 
	cat $HOME/scripts/storage/extensions.txt

	echo $'\n\nsuccessfully PUSHED'

elif [ $input == "pull" ]; then

	cat ~/scripts/storage/extensions.txt | while read line; do
	   code --install-extension $line
	done;

else 
	echo "invalid: push or PULL? "
fi






