# Tracking Scenario
## Objective

Create a system/mechanism which completed several important parts of a tracking process with a drone. For the given task our system needed to be initiated by either an RF related lock access attack which initiated two specific phases of a tracking scenario. The RF lock attack scenario would activate a RF controlled camera which would drive up to the given room, this said camera would then begin taking images of an individual which accessed the locked door. The next step of the plan is to then take the images and upload them into a pre-trained model which would allow for facial tracking capabilities to be enabled into a program. The program would then begin controlling a drone which would seek out the accessed door and search and track the target within the previously uploaded images.

## Dependencies and Use Case
### Hardware
--Nvidia TX2 Board
--DJI Tello Drone
--14.8V Generic PolyLithium Battery
--
--

### Software
### --Jetpack
With a new TX2, flash it with Jetpack to install basic OS, Cuda, CuDNN, etc.
### --Python
For this, we used Python 2.7. It is recommended that this is set up in a python virtual 
### --Tensorflow
https://www.tensorflow.org/install/ 
Install Tensorflow for your system. You can either install it directly using pip, or use their tutorial for building Tensorflow for your system, if that is what you want to do.
`pip install tensorflow-gpu` if you have an NVIDIA GPU that you want to use, or
`pip install tensorflow` if you don’t have an NVIDIA GPU that you want to use.
If you build Tensorflow from source, it will take a while ~6 hours, but it should theoretically run faster than it would from just installing it. Also, using the GPU version is theoretically faster than the CPU version.
### --OpenCV
Install OpenCV for your system. Like Tensorflow, you can either install it directly or build it for your system.
`pip install opencv-python`
Or https://docs.opencv.org/3.3.1/d7/d9f/tutorial_linux_install.html for building OpenCV
### --Python Libraries
Complete the following command for the listed libraries
`pip install [library]`
Numpy, Six, Pandas, Matplotlib, PIL, Pynput

## Running Process
### Scripts


### Trigger


## RC Car
### Controller



### Person Detection



## Drone
### Movement and Communication



### Person Tracking
