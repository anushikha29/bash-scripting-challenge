
path=$1 #getting the path from the argument
if [ ! -e "$path" ]; then #true if the directory does not exists
	echo "Directory does not exist"
	exit
elif [ ! -d "$path" ]; then #true if the path is a directory
	echo "Not a directory"
	exit
fi

timestamp=$(date +"%Y%m%d_%H%M%S") #getting the date in a specific format
backup_folder="backup_$timestamp" #saving the name

echo "the files  in the current directory are: "
ls -lh "$path" #printing the files in the directory

read -p "Press enter to create a backup of these files in a folder: " input #getting user input 

echo "-------"

mkdir "$backup_folder" #creating a backup folder
cp -r "$path" "$backup_folder" #copying the files from the given path to the backup folder
tar -cvf backup_folder.tag.gz "$path" #creating an archive of it

read -p "Press enter to list all the backup folders created: " input #getting user input
ls backup_2* #getting all the files whose name start from backup_2 and ends with anything else

backup_folders=($(ls -dt "$PWD/backup_2"* 2>/dev/null)) #creating an array of the backup folders created and redirecting the error message if no backup folder is created

echo " "

if [ "${#backup_folders[@]}" -gt 3 ]; then #code to remove the folders if the amount of these folders exceeds by 3
	echo "more than 3 folders detected"
	folder_to_remove=("${backup_folders[@]:3}")
	sleep 2
	echo "deleting the oldest folder....."
	sleep 2
	rm -rf "${folder_to_remove[@]}"
	echo "oldest folder is deleted"

fi

#end

