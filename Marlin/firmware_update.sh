#!/bin/bash
file="Marlin.ino.mega.hex"
dest="192.168.1.31"
if [ -f "$1" ]
	then file="$1"
elif [ ! -z "$1" ]
	then dest="$1"
fi
if [ ! -z "$2" ]; then
	dest="$2"
fi
if [ ! -f "$file" ]; then
	echo "$file not found"
	exit 1
fi
echo "Sending $file to $dest"
cat "$file" | ssh "pi@$dest" "cat > $file && ./firmware_update.sh \"$file\""
rm "$file"
