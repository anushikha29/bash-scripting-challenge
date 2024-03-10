#part-1 file and directory exploration
echo "                ----- Welcome to File Explorer -----"
sleep 2
echo "Current working directory: $PWD"
sleep 2
echo " "
echo "The files present in this directory are:"

ls -lh

sleep 3
echo " "
#part-2 character counting
read -p "Please enter a line of text: " line

if [ -z "$line" ]; then #-z return true if the string is empty
        echo "0 characters. nothing is entered"
        exit 
else
        counter=$(echo -n "$line" | wc -m) #-n echoes the line wo adding a new line and wc -m>
        echo "Character count is: $counter"
fi


