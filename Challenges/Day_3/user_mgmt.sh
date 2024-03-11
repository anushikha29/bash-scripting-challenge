#day-3

display_options(){ #showing all the functions the script can perform
	echo "Options: "
        echo "-c or --create  (Creates a new account)"
        echo "-d or --delete (Deletes an existing account)"
        echo "-r or --reset (Reset the password  of an existing account)"
        echo "-l or --list (List all the user accounts on the system)"
        echo "-h or --help (Display the usage information and available command)"

}

display_options

create_account(){ #creates a new user account and also checks if the user account already exists or not
        read -p "enter the username: " username

	if getent passwd "$username" >/dev/null; then
                echo "the username already exists"
	else
                read -p "enter the password: " pass
		useradd -m -p "$pass" "$username"
                echo "The account has been successfully created :D"
	fi
}

delete_account(){ #checks if the user account exists or not and deletes it if it does
        read -p "enter the username of the account  to delete: " delete
        if id "$delete" &>/dev/null; then
                echo "the username exist. deletion in process..."
                userdel -r "$delete"
                echo "the account has been deleted"
        else
                echo "the username does not exist"
                exit
	fi
}

reset_pass(){ #resets the password of the user account selected
        read -p "enter the username: " username
	if id "$username" &>/dev/null; then
		read -p "enter new password: " new_pass
	else
		echo "$username does not exist"
	fi
	echo "$username:$new_pass" | chpasswd
	if [ $? -eq 0 ]; then
		echo "password reset successfully"
	else
		echo "failed to reset password"
	fi
}

list_accounts(){ #list all the accounts in the system
	echo "List of all accounts:"
	echo "Username UID"
	echo "---------"
	awk -F: '{print $1" " $3 }' /etc/passwd
}

if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ];then #displays the options when -h or --help is passed
	display_options
	exit 0
fi


while [ $# -gt 0 ]; do
	case "$1" in #case statement used for conditional execution of the functions made based on the option chosen
		-c|--create)
			create_account
			;;
		-d|--delete)
			delete_account
			;;
		-r|--reset)
			reset_pass
			;;
		-l|--list)
			list_accounts
			;;
		*)
			echo "Invalid option: '$1'. Use '--help' to see avaiable options."
			exit 1
			;;
	esac
	shift
done

#end
