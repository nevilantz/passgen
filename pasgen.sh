#!/bin/bash

echo "=== Simple Password Generator ==="

# Ask for password type
echo "Choose password type:"
echo "1) Linux password (letters, numbers, minimal symbols)"
echo "2) UI password (letters, numbers, symbols)"
read -p "Enter 1 or 2: " TYPE

# Ask for password length
read -p "Enter desired password length: " LENGTH

# Ask for characters to skip
read -p "Enter any characters to exclude (leave blank for none): " SKIP

# Define character sets
LINUX_CHARS='A-Za-z0-9_'
UI_CHARS='A-Za-z0-9!@#$%^&*()_+-='

# Select character set based on type
if [[ "$TYPE" == "1" ]]; then
    CHAR_SET="$LINUX_CHARS"
    else
        CHAR_SET="$UI_CHARS"
	fi

	# Remove skipped characters from character set
	for (( i=0; i<${#SKIP}; i++ )); do
	    CHAR="${SKIP:$i:1}"
	        CHAR_SET="${CHAR_SET//$CHAR/}"
		done

		# Generate password
		PASSWORD=$(tr -dc "$CHAR_SET" < /dev/urandom | head -c "$LENGTH")

		echo
		echo "Your generated password: $PASSWORD"

