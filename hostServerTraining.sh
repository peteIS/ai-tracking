#!/bin/bash

FILE=$1



if [ -f $FILE ]; then
   echo "File for training $FILE exists."
else
   echo "File for training $FILE does not exist."
fi

#initialize training for $FILE
python osvos_parent_demo.py

if python osvos_parent_demo.py; then
    printf 'Model Training Started... \n'
else
    printf 'ERROR: Model Training Failed... \n'
fi

#send the data back to the tx2/tello ?
#scp -r user@server:/home/folder /home/
#scp $FILE /
