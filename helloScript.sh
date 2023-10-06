#! /bin/bash

: '
# for adding text to new file
echo "hello bash" > file.txt

# to add new text in file from terminal
cat > file.txt

# to add new text in file from terminal
cat >> file.txt

# prints the text on terminal
cat << kreativ
this is hello creative text
add another line
kreativ'

# Conditional Statements

count=10

: '
if [ $count -eq 10 ]
then 
	echo "True"
fi


if [ $count -ne 9 ]
then 
	echo "True"
else 
	echo "False"
fi


if [ $count -gt 9 ]
then 
	echo "True"
else 
	echo "False"
fi


if (( $count < 9 ))
then 
	echo "True"
else 
	echo "False"
fi


if (( $count < 9 ))
then 
	echo "First True"
elif (( $count > 9 ))
then
	echo "Second True"
else 
	echo "False"
fi


age=21
if [ "$age" -gt 18 ] && [ $age -lt 40 ]
then 
	echo "Age is Legal"
else 
	echo "False"
fi



age=21
if [[ "$age" -gt 18  &&  $age -lt 40 ]]
then 
	echo "Age is Legal"
else 
	echo "False"
fi


age=21
if [ "$age" -gt 18  -a  $age -lt 40 ]
then 
	echo "Age is Legal"
else 
	echo "False"
fi

age=50
if [ "$age" -gt 18  -o  $age -lt 40 ]
then 
	echo "Age is Legal"
else 
	echo "False"
fi

age=9
if [[ "$age" -gt 18  ||  $age -lt 40 ]]
then 
	echo "Age is Legal"
else 
	echo "False"
fi


# Loops

no=1
while [ $no -le 10 ]
do
	echo "$no"
	no=$(( no+1 ))
done

# until runs until the condition is false
no=1
until [ $no -ge 10 ]
do
	echo $no
	no=$(( no+1 ))
done


for i in 1 2 3 4 5
do
	echo $i
don


for i in {1..20}
do
	echo $i
done

#{start..ending..increment}
for i in {0..20..2} 
do
	echo $i
done


for (( i=0; i<5; i++ ))
do
	echo $i
done


for (( i=0; i<=10; i++ ))
do
	if [ $i -gt 5 ]
	then
		break
	fi
	echo $i
done



# Script input

#prints the written args
echo $0 $1 $2 $3


# array

args=("$@")
# for unlimited items @ or for specific items that number
#echo ${args[0]} ${args[1]} ${args[2]}

#prints out all the array members
echo $@

#print the length of the array
echo $#


# read the file line by line using stdin

while read line
do 	
	echo "$line"
# dollar one would be the input given of the file name
done < "${1:-/dev/stdin}"

# if no input is given it will read the terminal and print out
# if spaces are in between the filename "\" to escape the space


# Script Output STDOUT STDERR
ls -al 1>file1.txt 2>file2.txt


# if not specified 1 for stdout and 2 for stderr
# the output will be shown in file and error would be shown on terminal
ls -al > file1.txt


# Now both output n error will be in the file
ls +al >file1.txt 2>&1


#Shortcut to do the above
ls +al >&file1.txt


# Send Output from one script to another script
MESSAGE="Hello LinuxHint Audience"
export MESSAGE
./secondScript.sh


# String Processing
echo "enter 1st string"
read st1

echo "enter 2nd string"
read st2

if [ "$st1" == "$st2" ]
then
	echo "strings match"
else
	echo "string does not match"
fi


echo "enter 1st string"
read st1

echo "enter 2nd string"
read st2

if [ "$st1" \< "$st2" ]
then
	echo "$st1 is smaller than $st2"
elif [ "$st1" \> "$st2" ]
then
	echo "$st2 is smaller than $st1"
else
	echo "both strings are equal"
fi


# to concatenate the strings
echo "enter 1st string"
read st1

echo "enter 2nd string"
read st2

c=$st1$st2

echo $c


# to uppercase and capitalize
echo "enter 1st string"
read st1

echo "enter 2nd string"
read st2

echo ${st1^}
echo ${st1^^}


echo "enter 1st string"
read st1

echo "enter 2nd string"
read st2

echo ${st1^l}


# Numbers and Arithmetic
n1=4
n2=20

echo $(( n1 + n2 ))
echo $(( n1 - n2 ))
echo $(( n1 * n2 ))
echo $(( n1 / n2 ))
echo $(( n1 % n2 ))

echo $(expr $n1 + $n2)
echo $(expr $n1 - $n2)
echo $(expr $n1 \* $n2) #expr doesnt recognise *
echo $(expr $n1 / $n2)
echo $(expr $n1 % $n2)


#Hexa to Decimal

echo "Enter Hex Number of your choice"
read Hex

echo -n "The Decimal value of $Hex is : "
echo "obase=10; ibase=16; $Hex" | bc


# Declare Commands
# the bash doesnt have a strong data type system so you cant restrict the variable
# to allow type like behave it uses atributes that can set by a command "declare"
# bash builtin command that allows u yo update attributes applied to variables within the scope of shell

# declare -p : shows all the variables
# declare myvariable : to initialize variable
# declare myvariable=22 : to set the value of variable

# you can also declare read-only variables

declare -r pwdfile=/etc/passwd
echo $pwdfile


# Arrays

cars=("BMW" "Toyota" "Honda")

echo "${cars[@]}"

unset cars[1] #to delete the item
cars[1]="Mercedes"

echo "${cars[@]}"

echo "${cars[0]}"
echo "${cars[1]}"
echo "${cars[2]}"

echo "${!cars[@]}" #shows the index of all items

echo "${#cars[@]}" #shows the no of items


# Functions

function funcName()
{
	echo "This is new function" 
}

#funcName

#passing the arguments
function funcPrint()
{
	#echo $1 
	echo $1 $2 $3 $4
}

#funcPrint Hi
funcPrint Hi This is noor


function funcCheck()
{
	newVar="I love Linux" 
}

newVar="I love Mac"
echo $newVar
funcCheck
#the newVar has been updated
echo $newVar


# Files and Directories

mkdir -p Directory2

echo "Enter directory name to check"
read direct

if [ -d "$direct" ]
then 
	echo "$direct exists"
else
	echo "$direct doesnt exists"
fi

echo "Enter file name to create"
read filename

touch $filename


echo "Enter file name to check"
read filename

if [ -f "$filename" ]Tex
then 
	echo "$filename exists"
else
	echo "$filename doesnt exists"
fi


echo "Enter file name which you want to append"
read filename

if [ -f "$filename" ]
then 
	echo "Enter the text you want to append"
	read fileText
	echo "$fileText" >> $filename
else
	echo "$filename doesnt exists"
fi


# To read
echo "Enter file name which you want to read"
read filename

if [ -f "$filename" ]
then 
	while IFS="" read -r line
	do
		echo "$line"
	done < $filename
else
	echo "$filename doesnt exists"
fi


# To delete
echo "Enter file name which you want to delete"
read filename

if [ -f "$filename" ]
then 
	rm $filename
	echo "file has been deleted successfully"
else
	echo "$filename doesnt exists"
fi


#Sending an email via Script
# first we have to install: sudo apt install ssmtp
# setup /etc/ssmtp/ssmtp.conf
# ssmtp testingemail@gmail.com

# Curl in Scripts
cd Directory2
#install file from web
url="http://www.ovh.net/files/1Mio.dat"
#curl ${url} -O #installs with default name
#curl ${url} -o NewFileDw #installs with given name
curl ${url} > outputFile #installs with given name
curl -I ${url} #downloads & shows just the header of the file


# Professional menus
select car in BMW MERCEDES TESLA ROVER TOYOTA
do
	case $car in
	BMW)	
		echo "BMW SELECTED";;
	MERCEDES)	
		echo "MERCEDES SELECTED";;
	TESLA)	
		echo "TESLA SELECTED";;
	ROVER)	
		echo "ROVER SELECTED";;
	TOYOTA)	
		echo "TOYOTA SELECTED";;
	*)	
		echo "ERROR! Please select between 1..5";;
	esac
done


#waits for the user to perform action
echo "press any key to continue"
while [ true ]
do
	read -t 3 -n 1
if [ $? = 0 ]
then
	echo "You have terminated the script."
	exit;
else
	echo "Waiting for you to press any key"
fi
done

'

# Wait for filesystem events with inotify
# Inotify is Inode notify i.e. Linux kernel subsystem that acts to extend file systems to notice changes to the file system applications. In simple words, iit monitors the files and directories.
# first of install it: sudo apt install inotify-tools

#inotifywait -m /temp/NwFolder #if there is no such file
mkdir -p temp/NwFolder
inotifywait -m /temp/NwFolder #if there is no such file

