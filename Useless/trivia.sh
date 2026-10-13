#!/bin/bash
#Trivia game By Curtis Ferguson
# Future Curtis here, this horrible trivia game was made years ago. Not even sure if it works.

R='\033[0;31m'
E='\033[0m'

score=0
total_questions=10
total_available_questions=30

echo "Hello there! Welcome to my trivia game!"
echo

echo "Before we get started, please enter your name: "
read name

echo "Thank you, $name! You will be asked 10 questions. You need to get at least 7 right to win."
echo

echo "Press any key to start the game"
read -n 1 -s
echo

#functions for the questions
question1() {
echo -e "${R}Question:${E} What year did World War 2 end?"
echo "A) 1939"
echo "B) 1947"
echo "C) 1915"
echo "D) 1945"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "D" || "$answer" == "d" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was 1945"

fi

echo
}


question2() {
echo -e "${R}Question:${E} What is China's national animal?"
echo "A) Snow leopard"
echo "B) Giant Panda"
echo "C) Red Panda"
echo "D) Pangolin"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "B" || "$answer" == "b" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Giant Panda"

fi

echo
}



question3() {
echo -e "${R}Question:${E} How many time zones does Russia have?"
echo "A) 11"
echo "B) 5"
echo "C) 1"
echo "D) 8"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "A" || "$answer" == "a" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was 11"

fi

echo
}



question4() {
echo -e "${R}Question:${E} What was the most watched TV series in 2019?"
echo "A) Euphoria"
echo "B) The Boys"
echo "C) Stranger Things"
echo "D) The Mandolorian"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "C" || "$answer" == "c" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Stranger Things"

fi

echo
}



question5() {
echo -e "${R}Question:${E} What year did the Berlin Wall fall?"
echo "A) 1989"
echo "B) 1991"
echo "C) 1985"
echo "D) 1994"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "A" || "$answer" == "a" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was 1989"

fi

echo
}



question6() {
echo -e "${R}Question:${E} What natural disaster is measured with the Richter scale?"
echo "A) Tsunami"
echo "B) Tornado"
echo "C) Hurricanes"
echo "D) Earthquakes"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "D" || "$answer" == "d" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Earthquakes"

fi

echo
}



question7() {
echo -e "${R}Question:${E} Who discovered Penicillin?"
echo "A) Alexander Fleming"
echo "B) Isaac Newton"
echo "C) Marie Curie"
echo "D) Micheal Faraday"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "A" || "$answer" == "a" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Alexander Fleming"

fi

echo
}



question8() {
echo -e "${R}Question:${E} In what city is Broadway located?"
echo "A) Los Angles"
echo "B) Chicago"
echo "C) New York"
echo "D) Atlanta"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "C" || "$answer" == "c" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was New York"

fi

echo
}


question9() {
echo -e "${R}Question:${E} What is the largest state in the US?"
echo "A) Texas"
echo "B) Alaska"
echo "C) Washington"
echo "D) California"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "B" || "$answer" == "b" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Alaska"

fi

echo
}



question10() {
echo -e "${R}Question:${E} What is the largest river in the world?"
echo "A) Amazon River"
echo "B) Yellow river"
echo "C) Nile River"
echo "D) Congo River"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "B" || "$answer" == "b" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was the Nile River"

fi

echo
}




question11() {
echo -e "${R}Question:${E} What band was the guitarist Jimmy Page in?"
echo "A) AC/DC"
echo "B) Led Zepplin"
echo "C) The Doors"
echo "D) Greta Van Fleet"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "B" || "$answer" == "b" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Led Zepplin"

fi

echo
}



question12() {
echo -e "${R}Question:${E} What is the tallest breed of dog?"
echo "A) Clifford"
echo "B) Great Dane"
echo "C) Burmese Mountain Dog"
echo "D) Pug"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "B" || "$answer" == "b" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Great Dane"

fi

echo
}

question13() {
echo -e "${R}Question:${E} What is the bodies largest organ?"
echo "A) Heart"
echo "B) Small intestine"
echo "C) Skin"
echo "D) Brain"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "C" || "$answer" == "c" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Skin"

fi

echo
}



question14() {
echo -e "${R}Question:${E} What is the largest country?"
echo "A) Russia"
echo "B) Canada"
echo "C) Unites States"
echo "D) Chine"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "A" || "$answer" == "a" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Russia"

fi

echo
}



question15() {
echo -e "${R}Question:${E} What is the only food that never spoils?"
echo "A) Butter"
echo "B) Honey"
echo "C) Vegetable Oil"
echo "D) Pasta Noodles"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "B" || "$answer" == "b" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Honey"

fi

echo
}


question16() {
echo -e "${R}Question:${E} When was earth day first celebrated?"
echo "A) 1982"
echo "B) 1990"
echo "C) 2005"
echo "D) 1970"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "D" || "$answer" == "d" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was 1970"

fi

echo
}



question17() {
echo -e "${R}Question:${E} Who did the U.S. purchase the Louisiana Territory from?"
echo "A) Italy"
echo "B) United Kingdom"
echo "C) France"
echo "D) Spain"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "C" || "$answer" == "c" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was France"

fi

echo
}


question18() {
echo -e "${R}Question:${E} What year did World War 1 begin?"
echo "A) 1910"
echo "B) 1914"
echo "C) 1918"
echo "D) 1912"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "B" || "$answer" == "b" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was 1914"

fi

echo
}



question19() {
echo -e "${R}Question:${E} How long was the first Thanksgiving?"
echo "A) Four days"
echo "B) Seven Days"
echo "C) Three Days"
echo "D) Two Days"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "C" || "$answer" == "c" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Three Days"

fi

echo
}



question20() {
echo -e "${R}Question:${E} What is the worlds most populates city?"
echo "A) Tokyo, Japan"
echo "B) Bejing, China"
echo "C) New York, USA"
echo "D) Dheli, India"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "A" || "$answer" == "a" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Tokyo, Japan"

fi

echo
}



question21() {
echo -e "${R}Question:${E} How many sides does a trapezoid have?"
echo "A) Six"
echo "B) Four"
echo "C) Eight"
echo "D) Ten"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "B" || "$answer" == "b" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Four"

fi

echo
}



question22() {
echo -e "${R}Question:${E} What animal has the largest eye?"
echo "A) Elephant"
echo "B) Sperm Whale"
echo "C) Giant Squid"
echo "D) Hippo"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "C" || "$answer" == "c" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Giant Squid"

fi

echo
}



question23() {
echo -e "${R}Question:${E} What animal breathes through its butt?"
echo "A) Turtle"
echo "B) Snake"
echo "C) Gecko"
echo "D) Shark"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "A" || "$answer" == "a" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Turtle"

fi

echo
}



question24() {
echo -e "${R}Question:${E} The unicorn is the national animal of what country?"
echo "A) Ireland"
echo "B) Norwar"
echo "C) Scotland"
echo "D) Sweden"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "C" || "$answer" == "c" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Scotland"

fi

echo
}



question25() {
echo -e "${R}Question:${E} What country uses four billion miles of toilet paper each year?"
echo "A) China"
echo "B) India"
echo "C) Unites States"
echo "D) Russia"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "A" || "$answer" == "a" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was China"

fi

echo
}



question26() {
echo -e "${R}Question:${E} What condiment was once sold as a cure for diarrhea?"
echo "A) Mustard"
echo "B) Relish"
echo "C) Mayo"
echo "D) ketchup"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "D" || "$answer" == "d" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Ketchup"

fi

echo
}



question27() {
echo -e "${R}Question:${E} Bill Gates is the founder of what company?"
echo "A) Apple"
echo "B) Google"
echo "C) Microsoft"
echo "D) McAfee"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "C" || "$answer" == "c" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Microsoft"

fi

echo
}



question28() {
echo -e "${R}Question:${E} How many cards are there in a deck of Uno?"
echo "A) 120"
echo "B) 108"
echo "C) 105"
echo "D) 112"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "B" || "$answer" == "b" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was 108"

fi

echo
}



question29() {
echo -e "${R}Question:${E} What is the largest human bone?"
echo "A) Femur"
echo "B) Spine"
echo "C) Skull"
echo "D) Rib Cage"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "A" || "$answer" == "a" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was Femur"

fi

echo
}



question30() {
echo -e "${R}Question:${E} What year did the Titanic sink?"
echo "A) 1910"
echo "B) 1908"
echo "C) 1912"
echo "D) 1905"
read -p "Answer here: " answer
echo 
if [[ "$answer" == "C" || "$answer" == "c" ]]; then
echo -e "${R}Correct!!${E}"
((score++))

else
echo -e "${R}Wrong!${E} The correct answer was 1912"

fi

echo
}

#array of the 30 questions. Eventually I would like to add atleast a hundred

questions=("question1" "question2" "question3" "question4" "question5" "question6" "question7" "question8" "question9" "question10" 
           "question11" "question12" "question13" "question14" "question15" "question16" "question17" "question18" "question19" "question20"
           "question21" "question22" "question23" "question24" "question25" "question26" "question27" "question28" "question29" "question30")

#shuffles the 30 total questions and picks 10 of them for the game

shuffled_questions=($(shuf -e "${questions[@]}" -n $total_questions))


for q in "${shuffled_questions[@]}"; do

$q

done

echo "your final score is: $score out of $total_questions"

if [[ $score -eq $total_questions ]];
then 

echo " __   __  _______  __   __    _     _  _______  __    _  __   __   __ " 
echo "|  | |  ||       ||  | |  |  | | _ | ||       ||  |  | ||  | |  | |  |" 
echo "|  |_|  ||   _   ||  | |  |  | || || ||   _   ||   |_| ||  | |  | |  |" 
echo "|       ||  | |  ||  |_|  |  |       ||  | |  ||       ||  | |  | |  |" 
echo "|_     _||  |_|  ||       |  |       ||  |_|  ||  _    ||__| |__| |__|" 
echo "  |   |  |       ||       |  |   _   ||       || | |   | __   __   __ " 
echo "  |___|  |_______||_______|  |__| |__||_______||_|  |__||__| |__| |__|" 

else

echo " __   __  _______  __   __    ___      _______  _______  _______  __   __   __ " 
echo "|  | |  ||       ||  | |  |  |   |    |       ||       ||       ||  | |  | |  |" 
echo "|  |_|  ||   _   ||  | |  |  |   |    |   _   ||  _____||_     _||  | |  | |  |" 
echo "|       ||  | |  ||  |_|  |  |   |    |  | |  || |_____   |   |  |  | |  | |  |" 
echo "|_     _||  |_|  ||       |  |   |___ |  |_|  ||_____  |  |   |  |__| |__| |__|" 
echo "  |   |  |       ||       |  |       ||       | _____| |  |   |   __   __   __ " 
echo "  |___|  |_______||_______|  |_______||_______||_______|  |___|  |__| |__| |__|" 


fi