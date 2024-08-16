# Run it from project's root folder.

if [[ $1 = "v" ]]; then
     vite app
elif [[ $1 = "h" ]]; then
     echo Use from project\'s root folder:
     printf "  srv.sh [h|v|MODE] [PORT]\n"
else
     cd app
     python slave.py ${1:-dev} ${2:-8080}
     cd ..
fi
