#!/bin/bash
# @Author: _dp95


#To color the output text in different colours
green=$(tput setaf 71);
red=$(tput setaf 1);
blue=$(tput setaf 32);
orange=$(tput setaf 178);
bold=$(tput bold);
reset=$(tput sgr0);

#To remove the generated object and text files before exiting
clean_up(){
	rm -f gen
	rm -f sol
	rm -f brt
	rm -f in
	rm -f out2
	rm -f out1
	rm -f tmp
	exit 1;
}

#C++ compilation flags
flags="-std=c++11 -O2";

#Compiling and generating the object files
#Throws an error in case of failed compilation and then perfoms the cleanup
g++ $flags GEN.cpp -o gen || { echo ${bold}${orange}Compilation Error in ${reset} GEN.cpp; clean_up; }
g++ $flags SOL.cpp -o sol || { echo ${bold}${orange}Compilation Error in ${reset} SOL.cpp; clean_up; }
g++ $flags BRT.cpp -o brt || { echo ${bold}${orange}Compilation Error in ${reset} BRT.cpp; clean_up; }

#Set the number of Tests to be run
#Default is 10, unless the number is specified by the user as 2nd argument
if [ $# -ne 1 ]
	then
		max_tests=10 # default number of test cases | change it accordingly
	else
		max_tests=$1
fi

diff_found=0
i=1

while [ $i -le $max_tests ]
do
	# Generate test_case
	./gen > in

	# Get output of optimal solution on generated test case
	./sol < in > out1

	# Get output of brute-force solution on generated test case
	./brt < in > out2

	# check if files original_output and brute_output
	# differs(we are ignoring spaces and then comparing files)
  if diff --tabsize=1 -F --label --side-by-side --ignore-space-change out1 out2 > tmp; then
	    echo "${orange}test_case #$i: ${bold}${green}passed${reset}"
	else
		echo "${orange}test_case #$i: ${bold}${red}failed${reset}"
		diff_found=1
		break
	fi
	i=$((i+1))
done

#Generating final summary
#In different outputs are produced, display the input and generated outputs
if [ $diff_found -eq 1 ]
then
	clear;
	echo "${blue}Input: ${reset}"
	cat in
	echo ""

	echo "${blue}Output: ${reset}"
	cat out1
	echo ""

	echo "${blue}Expected: ${reset}"
	cat out2

	echo "${bold}${red}Wrong Answer${reset}"
else
	clear;
	echo "${bold}${green}Accepted${reset}"
fi

#Perform final cleanup
clean_up;
