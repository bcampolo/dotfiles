#!/bin/bash
os=$(echo `uname -m`)
if [[ "$os" == "x86_64" ]]; then
	echo `Helpers/JSON_Linux/jq64 . "$1" > "$2"`
else
	echo `Helpers/JSON_Linux/jq . "$1" > "$2"`
fi
