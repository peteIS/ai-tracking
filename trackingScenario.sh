#!/bin/bash


#Start Person Detection on RCCar
gnome-terminal -e "bash -c 'python person_detection_new.py;exec $SHELL'"
#Wait for Person Detection to Initilize
sleep 60s
printf "Person detection initilized"

#start the controller for the RC-Car
gnome-terminal -e "bash -c './bldc-tool/BLDC_Tool;exec $SHELL'"

#GUI automation for bldc-tool

#Trigger
#printf "%s" "waiting for Trigger..."
#while ! timeout 0.2 ping -c 1 -n IPoFbOXuSED &> /dev/null
#do
#    printf "%c" "."
#done
#printf "\n%s\n"  "Trigger is activated"

# move car
# make sure BLDCtool is the last focused window
python ~/moveCar.py forw 0.5

# let the python script get the images for 25 seconds
sleep 10s
printf "images gathered"

# kill the python process, freeing gpu
killall -9 python
printf "Person detection stopped"

# Send data for train
#We can use 'scp -r' for a whole folder/directory
#scp remote_user@remote_host:/path/to/remote/file /path/to/local/file
sleep 30s
printf "data sent"



# Download model for tello with
# (possibly 'scp -r' also)
#scp /path/to/local/file remote_user@remote_host:/path/to/remote/file

# launch of tello and let it do its thing
cd /home/nvidia/swx/goStuff/telloGoVideo/
./telloGoVideo

# Run model in conjuntion with tello
#python osvos_demo.py


