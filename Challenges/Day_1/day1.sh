
#task-1 
#this is a bash scripting file 
#this is a comment

#task-2
#echo is used to display messages on the terminal
echo "hello. im doing the 7 days bash scripting challenge"
echo " ------------ "
sleep 2

#task-3
#variables are used to store data and referenced by their name
var1="this is a variable"
name="nova"

#task-4
#using variables by their reference
echo $var1
echo "hello $name. this is day1 in bash scripting challenge"
echo " ------------ "
sleep 2

#task-5
#using built-in variables in bash 
pwd=$PWD 
number=$RANDOM

echo "hello $USER. you are currently at $pwd"
echo "also here's a random number generated: $number"
echo "the bash version you are right now is: $BASH_VERSION"
echo "the name of this script is $0"
echo " ------------ "
sleep 4

#task-6
#wildcards
#used for pattern searching
# * -zero or more characters
# ? -single character
# [] -range of character
# ^ -beginning of the line
# $ -end of the line
# {} -matches any comma-seperated patterns in the braces
# \ -escapes the special meaning

#to list all the files with a specififc extension in a directory

echo "the current working directory is $PWD"
echo "all the scripting files in the directory are given below:"
ls -l *.sh
echo " ------------ "
