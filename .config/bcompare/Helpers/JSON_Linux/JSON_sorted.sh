#!/bin/bash
os=$(echo `uname -m`)
if [[ "$os" == "x86_64" ]]; then
	echo `Helpers/JSON_Linux/jq64 -S . "$1" > "$2"`
else
	echo `Helpers/JSON_Linux/jq -S . "$1" > "$2"`
fi
