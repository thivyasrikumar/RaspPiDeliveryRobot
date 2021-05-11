#!/usr/bin/env python

import cv2
import rospy
from cv_bridge import CvBridge
from sensor_msgs.msg import Image as ROSImage


bridge = None


"""
Function to find text in image
ros_img: ROSImage
"""
def text_detect(ros_img):
	# convert ROS image to OpenCV
	img = bridge.imgmsg_to_cv2(ros_img)


"""
Main function
"""
def main():
	global bridge

	# ROS <-> OpenCV image converter
	bridge = CvBridge()

	# subscribe to raw image topic
	rospy.Subscriber("img_raw_ocr", ROSImage, text_detect)


if __name__ == "__main__":
	main()
