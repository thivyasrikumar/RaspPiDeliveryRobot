#!/usr/bin/env python

import rospy
from nodes.msg import MotorCmd
from nodes.msg import OCRResponse
from sensor_msgs.msg import Image as ROSImage
from std_msgs.msg import Bool

# input topics
TOPIC_FROM_IMG_CAP = "img_raw"
TOPIC_FROM_IMG_PROC = "lane_pos"
TOPIC_FROM_IMG_TEXT = "text_pos"
TOPIC_FROM_IMG_TEXT_READY = "ocr_ready"

# output topics
TOPIC_TO_MTR_CMD = "motor_cmd"
TOPIC_TO_IMG_PROC = "img_proc"
TOPIC_TO_IMG_TEXT = "img_text"

# publishers
pub_motor_cmd = None
pub_img_proc = None
pub_img_text = None

# state variables
ocr_ready = True        # is the OCR node ready for a new image


"""
This callback will be called when the OCR node is ready to take in its next
image. This is necessary to save system resources, otherwise the node would try
processing every incoming image in a separate thread; the images would come in
faster than they can be processed, leading to exponential slowdown.
"""
def handle_ocr_ready(data):
    global ocr_ready

    if data.is_ready == True:
        ocr_ready = True

        print("===START DETECTED TEXT===")
        print(data.detected_text)
        print("===END DETECTED TEXT===\n")


"""
Callback function to handle an image being received from the capture node and 
forward it to the processing and text nodes
"""
def handle_img_in(img):
    global pub_motor_cmd
    global pub_img_proc 
    global pub_img_text 
    global ocr_ready

    pub_img_proc.publish(img)
        
    if ocr_ready:
        pub_img_text.publish(img)
        ocr_ready = False


"""
Main function
"""
def main():
    global pub_motor_cmd
    global pub_img_proc 
    global pub_img_text 

    # initialize ROS node
    rospy.init_node("main")

    # initialize subscribers
    rospy.Subscriber(TOPIC_FROM_IMG_CAP, ROSImage, handle_img_in)
    rospy.Subscriber(TOPIC_FROM_IMG_TEXT_READY, OCRResponse, handle_ocr_ready)

    # initialize publishers
    pub_motor_cmd = rospy.Publisher(TOPIC_TO_MTR_CMD, MotorCmd, queue_size=1)
    pub_img_proc = rospy.Publisher(TOPIC_TO_IMG_PROC, ROSImage, queue_size=1)
    pub_img_text = rospy.Publisher(TOPIC_TO_IMG_TEXT, ROSImage, queue_size=1)
    
    rospy.spin()

if __name__ == "__main__":
    main()