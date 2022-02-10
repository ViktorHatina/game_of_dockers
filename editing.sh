#!/bin/sh

#This script contains several case statements that allow the user to interact with the final chapter txt file.

# Case for reading chapter
read -p "Would you like to read the final chapter?  " choice
case $choice in
  yes|Yes|yea|yeah|y|Y) 
    echo '\n'
    echo '\033[1mFinal Chapter: \033[0m'
    echo "-------------------------------------------------- \n"
    cat DOCK_CHAPTER.txt
    echo "\n -------------------------------------------------- \n";;
  no|No|n|N|nope)
    echo "Understood"
    echo "\n -------------------------------------------------- \n";;
  *)
    echo "Sorry, I do not understand."
    echo "\n -------------------------------------------------- \n";;
esac


# Case for removing text from final chapter
read -p "Would you like to remove any text?  " option
case $option in 
  yes|Yes|yea|yeah|y|Y)
    #command to find / match line and reme it
    read -p "Please copy and paste the exact text that you wish to remove from the final chapter:  " rem_text
    sed -i -e "s/$rem_text//g" DOCK_CHAPTER.txt
    echo "Good choice, the book just keeps getting better";;
  no|No|n|N|nope)
    echo "Understood. Personally, I like it as it is.";;
  *)
    echo "I do not understand";;
esac

#Case for adding text to final chapter
echo "\n -------------------------------------------------- \n"
read -p "Would you like to add any text?  " option
case $option in 
  yes|Yes|yea|yeah|y|Y)
    #command to add any text to the chapter
    read -p "Add any text that you wish to conclude this chapter with:  " add_text
    echo $add_text >> DOCK_CHAPTER.txt;;
  no|No|n|N|nope)
    echo "Understood, the story looks great!";;
  *) 
    echo "I do not understand. Do not think this would work well with your current theme.";;
esac


#Case for final reading chapter before it is published :)
echo "\n -------------------------------------------------- \n"
read -p "Would you like to read the final chapter one last time before it's published?  " choice
case $choice in
  yes|Yes|yea|yeah|y|Y) 
    echo '\n'
    echo '\033[1mFinal Chapter: \033[0m'
    echo '-------------------------------------------------- \n'
    cat DOCK_CHAPTER.txt
    echo '\n -------------------------------------------------- \n'
    echo 'Great work. What a pleasant read! \n';;
  no|No|n|N|nope)
    echo "Understood, the story looks good! \n";;
  *)
    echo "Sorry, did not understand, but I'm certain we are ready to publish! Great work!\n";;
esac
