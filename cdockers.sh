#! /bin/sh

#Creating Dockers and Loading corresponding txt files from host
#When copying txt files from host to docker - please check local path matches on your machine!!

# Create a Docker1
sudo docker run --name Docker1 -it -d ubuntu /bin/sh
echo "Docker1 Created!"

#Copy files from Docker1 file to Docker1 container
echo "Copying files to Docker 1"
sudo docker cp ~/'Docker Files/Docker1' Docker1:'/'
echo "Completed!"

# Create a Docker2
sudo docker run --name Docker2 -it -d ubuntu /bin/sh
echo "Docker2 Created!"


#Copy files from Docker2 file to Docker2 container
echo "Copying files to Docker 2"
sudo docker cp ~/'Docker Files/Docker2' Docker2:'/'
echo "Completed!"

# Create a Docker3
sudo docker run --name Docker3 -it -d ubuntu /bin/sh
echo "Docker3 Created!"

#Copy files from Docker3 file to Docker3 container
echo "Copying files to Docker 3"
sudo docker cp ~/'Docker Files/Docker3' Docker3:'/'
echo "Completed!"

#Executing a command within individual Dockers, creating a sorted text file within the directory, and sending a copy to the host.
#This script will be run within the application.sh script. Make sure they are in the same direcotry & with alg.sh, editing.sh.
#This is because, the sorted file copy will be copied into the dir this script is run from (home dir - ./)

# Add sorted text file to Docker1 & send copy to host
sudo docker exec Docker1 /bin/sh -c "cd Docker1; ls -Sr > .sorted_files_Docker1.txt && mv .sorted_files_Docker1.txt sorted_files_Docker1.txt"
sudo docker cp Docker1:/Docker1/sorted_files_Docker1.txt ./

# Add sorted text file to Docker2 & and send copy to host
sudo docker exec Docker2 /bin/sh -c "cd Docker2; ls -Sr > .sorted_files_Docker2.txt && mv .sorted_files_Docker2.txt sorted_files_Docker2.txt"
sudo docker cp Docker2:/Docker2/sorted_files_Docker2.txt ./

# Add sorted text file to Docker3 & and send copy to host
sudo docker exec Docker3 /bin/sh -c "cd Docker3; ls > .sorted_files_Docker3.txt && mv .sorted_files_Docker3.txt sorted_files_Docker3.txt"
sudo docker cp Docker3:/Docker3/sorted_files_Docker3.txt ./
