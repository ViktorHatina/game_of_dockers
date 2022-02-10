#!/bin/sh
#Give permissions to supplementary files
chmod +x cdockers.sh
chmod +x alg.sh
chmod +x editing.sh
chmod +x rmdockers.sh


#Start by creating 3 dockers and copying files to them.
#Creates a sorted txt file within each docker and copies it back to the host
echo '\n'
echo '\033[1mCreating Dockers: \033[0m'
./cdockers.sh

#The algorithm uses the imported txt sorted file as reference and loops over the files
# and dockers in according to the round robin algorithm
echo '\n'
echo '\033[1mRunning Round Robin algorithm: \033[0m'
./alg.sh

#The editing file provides the final edits using cases where the user can interact with the final chapter
#The user will read, remove, and add text to the final chapter before it is published
echo '\n'
echo '\033[1mEditing Final Chapter: \033[0m'
./editing.sh

#Chapter is complete and dockers will be stopped and removed.Remove
echo '\n'
echo '\033[1mDeleting Dockers: \033[0m'

# Case for deleting dockers
read -p "Do you want to stop and remove the Dockers at this stage?  " choice
case $choice in
  yes|Yes|yea|yeah|y|Y) 
    echo "Removing Dockers:  "
    ./rmdockers.sh;;
  no|No|n|N|nope)
    echo "Okay, we will keep them for now. Run the ./rmdockers.sh script to stop & remove them later.";;
  *)
    echo "Sorry, I do not understand."
    echo "\n -------------------------------------------------- \n";;
esac

echo "\nScript Finished"
