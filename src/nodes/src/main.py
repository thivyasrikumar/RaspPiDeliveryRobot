#!/usr/bin/env python

import rospy
from nodes.msg import MotorCmd
from sensor_msgs.msg import Image as ROSImage

# input topics
TOPIC_FROM_IMG_CAP = "img_raw"
TOPIC_FROM_IMG_PROC = "lane_pos"
TOPIC_FROM_IMG_TEXT = "text_pos"

# output topics
TOPIC_TO_MTR_CMD = "motor_cmd"
TOPIC_TO_IMG_PROC = "img_proc"
TOPIC_TO_IMG_TEXT = "img_text"

# publishers
pub_motor_cmd = None
pub_img_proc = None
pub_img_text = None


"""
Callback function to handle an image being received from the capture node and 
forward it to the processing and text nodes
"""
def handle_img_in(img):
    global pub_motor_cmd
    global pub_img_proc 
    global pub_img_text 

    pub_img_proc.publish(img)


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

    # initialize publishers
    pub_motor_cmd = rospy.Publisher(TOPIC_TO_MTR_CMD, MotorCmd, queue_size=20)
    pub_img_proc = rospy.Publisher(TOPIC_TO_IMG_PROC, ROSImage, queue_size=20)
    pub_img_text = rospy.Publisher(TOPIC_TO_IMG_TEXT, ROSImage, queue_size=20)
    
    rospy.spin()

if __name__ == "__main__":
    main()