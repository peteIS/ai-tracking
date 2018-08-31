# Tracking Scenario
## Objective

Create a system/mechanism which completed several important parts of a tracking process with a drone. For the given task our system needed to be initiated by either an RF related lock access attack which initiated two specific phases of a tracking scenario. The RF lock attack scenario would activate a RF controlled camera which would drive up to the given room, this said camera would then begin taking images of an individual which accessed the locked door. The next step of the plan is to then take the images and upload them into a pre-trained model which would allow for facial tracking capabilities to be enabled into a program. The program would then begin controlling a drone which would seek out the accessed door and search and track the target within the previously uploaded images.

## Dependencies and Use Case
### Hardware
- Nvidia TX2 Board
- DJI Tello Drone
- 14.8V Generic PolyLithium Battery
- Traxxas Automobile Remote Control Vehicle
- Enertion FOCBOX Controller
- Logitech C920 HD WebCam
- Computing Server*

### Software
- **Jetpack**

  With a new TX2, flash it with [Jetpack](https://docs.nvidia.com/jetpack-l4t/2_1/content/developertools/mobile/jetpack/jetpack_l4t/2.0/jetpack_l4t_install.htm) to install basic OS, Cuda, CuDNN, etc
- **Python**
  
  For this, we used Python 2.7. It is recommended that this is set up in a python virtual 
- **Tensorflow** 
  
  Install [Tensorflow](https://www.tensorflow.org/install/) for your system. You can either install it directly using pip, or use their tutorial for building Tensorflow for your system, if that is what you want to do. `pip install tensorflow-gpu` if you have an NVIDIA GPU that you want to use, or `pip install tensorflow` if you don’t have an NVIDIA GPU that you want to use.
  
  Within the general directory complete the following command `git clone https://github.com/tensorflow/models`
  
  If you build Tensorflow from source, it will take a while ~6 hours, but it should theoretically run faster than it would from just installing it. Also, using the GPU version is theoretically faster than the CPU version.
  
  The current person_detection_new.py script requires the Tensorflow models to be downloaded in `/`, as well as a specific set of folders to exist, which requires root access (admin privileges). 
- **OpenCV**
  
  Install OpenCV for your system. Like Tensorflow, you can either install it directly or build it for your system.
`pip install opencv-python`. Or for building [OpenCV](https://docs.opencv.org/3.3.1/d7/d9f/tutorial_linux_install.html).

- **Python Libraries**

  Complete the following command for the listed libraries
  `pip install [library]`

  Numpy, Six, Pandas, Matplotlib, PIL, Pynput

## Running Process
### Scripts
 - **person_detection_new.py**
 
  - Capturing video
    Line 31 starts a video capture, which can be either from a video file or from using a camera attached to the system. You need to change what is being passed into cv2.VideoCapture() to meet your needs. In our case, the USB camera was `1`, but if you only have one camera attached, it will probably be `0`. If you want to use a video file, put in the location of the file.
  
  - Saving Images
    Line 28 is used for naming the folder in which images are saved, so if you’re using a camera feed, change this to something descriptive. There is a block of code that creates new directories for saving images, but it will fail if you have more than 10 folders with the same basic name, so that it does not infinitely create folders.
    
  - Person Identification
    Majority of other lines are directly related to person identification.
 
 - **trackingScenario.sh**
 
 
 
 - **hostServerTraining.sh**



### Trigger


## RC Car Setup
### Controller
 - **BLDC-Tool**
  
   Follow the [BLDC Tool](https://github.com/vedderb/bldc-tool) guide for proper setup on the TX2 system.
   
### Person Detection
 - **person_detection_new.py** 
    From our repo, person_detection_new.py needs to be copied into `/tensorflow/models/research/object_detection/`
Lines 79-85 of this script should be uncommented for the first run, in order to download and unzip the Tensorflow model we used for this. After it exists, it should be commented out to speed up the script, since you do not need to re-download and unzip the model files.

   The following directory needs to exist in order for proper image storage from the person detection video feed.
`/tf_files/people/`


## Drone Setup
### Movement and Communication
 - GO Packages
  Download and install the [Go language](https://golang.org/doc/install), which will be used to control the drone. `go get` the GoCV and GoBot packages, which includes a driver for interfacing with the Tello drone.

 - Interface With Tello
  Connect the Tello drone to the computer via Wi-Fi.  [Tutorial](https://gobot.io/blog/2018/04/20/hello-tello-hacking-drones-with-go/) that shows how simple it is to control the Tello using Go code and capture video from the Tello. This video can then be pipelined to a program that detects people, classifies them as the attacker or not, then controls the drone to keep the attacker in the center of the frame or looks around for the attacker

### Person Tracking
- **OSVOS Project**

  Setting up the propper environment for the building the drone machine learning model which will control and guide the drone movements can be found [here](https://github.com/gitForce99/OSVOS_Project_Tensorflow). This is the only component which should be setup on an efficient external conputing environment for time efficiency purposes. Following the guide for the setup provided in the link is the best process of setting everything up.
  
  - Potential Improvement/Addition
  That’s the general idea of what the drone should do. A similar implementation would be to track faces, which was implemented and showcased [here](https://github.com/sofwerx/docker-tello-facetrack).
Line 90 of face tracking.go shows that a Caffe model used in detecting faces was implemented. This could be altered such that a Tensorflow model for detecting people, which we have, is used. The only other addition would be to classify the person detected, which could be implemented within the same go file.

