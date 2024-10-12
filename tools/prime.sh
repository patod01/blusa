#! /bin/bash


if [[ $1 = "h" ]]; then
     echo Run this file from project\'s root folder!
     echo \`source\` command needed.
     exit
fi

if [[ $1 = "i" ]]; then
     python -m venv .venv
     source .venv/bin/activate
     pip install --upgrade pip
     pip install bottle
     deactivate
     echo Dependencies installed
     echo Creating bugs folder
     mkdir app/bugs
     echo buggin it...
     cp .venv/lib/python3.12/site-packages/bottle* -r app/bugs
     echo finished!
fi

echo pathing...

if [ "$old_PATH" = "" ]; then
     old_PATH="$PATH"
     PATH="$(pwd)/tools:$PATH"
     export old_PATH
     export PATH
else
     echo old_PATH already saved
fi

killme() {
     PATH=$old_PATH
     unset old_PATH
     export PATH
     unset -f killme
     echo some vars cleaned
}

export -f killme
