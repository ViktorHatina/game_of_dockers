#!/bin/sh

echo "\nCreating Final Chapter: DOCK_CHAPTER.txt \n"

#Defining variables that will be used in the loop
files_appended=0
total_files=19
outercounter=0

#The while loop is the main loop, which will break once the amount of files appended is  equal to number of total files
#The for loop insures that the operations are conducted for each Docker
#The operations that are conducted for each docker are inside a while loop - which achieves the affect having a round robin quantum of to files per iteration.
#Within the while loop, a filename variable is defined (referencing the name of file from the sorted files txt file) and a docker command
#is executed in - which finds the file in the docker container and appends it to the final chapter txt file on the host machine

while [ "$files_appended" -lt "$total_files" ]
do 
  for doc in Docker1 Docker2 Docker3
  do 
    innercounter=1 
    while [ "$innercounter" -le 2 ]
    do
      num_of_files=`wc --lines < sorted_files_$doc.txt`
      n=`expr $innercounter + $outercounter`
      if [ "$n" -gt "$num_of_files" ]
      then
        break
      fi
      filename=$(cat sorted_files_$doc.txt | head -$n | tail -1)
      echo "Loading $filename text from $doc" 
      sudo docker exec -it $doc cat /$doc/$filename >> DOCK_CHAPTER.txt
      files_appended=`expr $files_appended + 1`
      innercounter=`expr $innercounter + 1`
    done
  done
outercounter=`expr $outercounter + 2`
done
