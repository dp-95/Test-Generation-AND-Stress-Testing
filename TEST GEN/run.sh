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
  rm -f sol
  rm -f gen
  rm -f temp.txt
  exit 1;
}

# Removing residue input and output files
  rm -rf input
  rm -rf output

# Creating Directory and temporary files for input and output files
  mkdir input
  mkdir output
  touch temp.txt

flags="-std=c++11 -O2";

# sol.cpp : Solution Generator
  g++ $flags SOL.cpp -o sol || { echo ${bold}${orange}Compilation Error in ${reset} SOL.cpp; clean_up; }

# gen.cpp : Test Case Generator
  g++ $flags GEN.cpp -o gen || { echo ${bold}${orange}Compilation Error in ${reset} GEN.cpp; clean_up; }

#Set the number of Tests to be generated
#Default is 10, unless the number is specified by the user as 2nd argument
if [ $# -ne 1 ]
  then
    mx=10
  else
    mx=$1
fi

#Limit the number of test to below 31
if [ $mx -gt 30 ]
  then mx=30
fi

i=0
while [ $i -lt $mx ]
do
# Generating name of input and output file
  if [ $i -le 9 ]
  then
    in="input0$i.txt"
    out="output0$i.txt"
  else
    in="input$i.txt"
    out="output$i.txt"
  fi

  echo $i > temp.txt
  echo "#$i"

#   Generating Test Case
  ./gen < temp.txt > "input/$in"

#   Generating solutions
  ./sol < "input/$in" > "output/$out"

  i=$((i+1))
done

#Perform cleanup to remove residue files
clean_up;
