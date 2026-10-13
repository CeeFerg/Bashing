#!/bin/bash

#Bash Script that travels through directorys and lists files 1GB or greater

G='\033[1;32m'
R='\033[0;31m' 
B='\033[1;34m'
NC='\033[0m'

Find_Large_Files()

{

dir="$1"

#goes though each file & directory in the home directory
for file in "$dir"/*; 

do

#is it  file???? (isn't everything in linux a file?)
if [ -f "$file" ];

then

#looks at the size of the file
size=$(stat -c %s "$file")

#checks if the file is bigger or smaller than 1,048,576 bytes, ignores if it's smaller
if [[ -n "$size" && "$size" -gt 1,048,576 ]]; 

then

echo -e "${R}File:${NC} $file,${R} Size: ${NC}$size bytes\n"

fi

#checks if its a directory
elif [ -d "$file" ]; 

then

echo -e "${B}$file${NC} is a directory\n"

#calls the function again for the subdirectory
Find_Large_Files "$file"

echo -e "I'm Back From The Sub Directory\n"

fi

done

}

#starts the search again fromm the current directory
Find_Large_Files "$PWD"

echo -e "${G}_________                       .__          __             .___${NC}"
echo -e "${G}\_   ___ \  ____   _____ ______ |  |   _____/  |_  ____   __| _/${NC}"
echo -e "${G} /    \  \/ /  _ \ /     \\____ \|  | _/ __ \   __\/ __ \ / __ |${NC}" 
echo -e "${G} \     \___(  <_> )  Y Y  \  |_> >  |_\  ___/|  | \  ___// /_/ |${NC}" 
echo -e "${G}  \______  /\____/|__|_|  /   __/|____/\___  >__|  \___  >____ |${NC}" 
echo -e "${G}         \/             \/|__|             \/          \/     \/${NC}" 