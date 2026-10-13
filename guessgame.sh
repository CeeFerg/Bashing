#!/bin/bash

guesser() {

random=$((RANDOM % 50 + 1))

maxattempts=3
attempts=0
guess=0

echo "Try to guess the number between 1 - 50 with only 3 attempts!"

while (($attempts < $maxattempts))
do

read -p "Guess the number! " guess 

((attempts++))

if (($guess == $random))
then 

echo "Wow you actually did it!"
return 

elif (($guess < $random)); 
then 

echo "Too low"

else 

echo "too high"

fi

echo "Attempts remaining: $((maxattempts - attempts))"

done  

echo "You Suck! Better Luck Next Time!" 
}
while true; do guesser

read -p "Would you like to play again? (y/n): " guesser

if [[ "$guesser" != "y" && "$gusser" != "Y" ]]
then

echo "Thank you for playing"

exit 0
fi
done