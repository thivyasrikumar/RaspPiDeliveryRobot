#!/usr/bin/env python

import cv2					# computer vision
from cv_bridge import CvBridge			# convert btwn ROS image and OpenCV image
import rospy					# python wrapper for ROS
import numpy as np				# numpy
from picamera import PiCamera			# raspberry pi camera
from sensor_msgs.msg import Image as ROSImage	# ROS image data type


CAPTURE_RATE = 20				# Image capture frequency in Hz


"""
Main function
"""
def main():
	# initialize node and create publisher
	rospy.init_node("img_cap")
	img_pub = rospy.Publisher("img_raw", ROSImage, queue_size=20)
	rate = rospy.Rate(CAPTURE_RATE)

	# set up camera
	camera = PiCamera()
	camera.resolution = (480, 368)
	camera.framerate = 60

	# 529920 x 1 array to hold raw image data
	# data stored as [R1, G1, B1, R2, G2, B2, ...]
	raw_img = np.empty(368*480*3,dtype=np.uint8)

	# ROS <-> OpenCV image converter
	bridge = CvBridge()

	# capture and publish image
	while not rospy.is_shutdown():
		# write image data into raw_img in BGR format
		camera.capture(raw_img, "bgr")
		
		# convert numpy array of image data to ROS image
		raw_img_cv2 = bridge.cv2_to_imgmsg(np.flipud(raw_img.reshape(368, 480, 3)), "bgr8") 
		img_pub.publish(raw_img_cv2)

		# sleep for the remainder of 1/CAPTURE_RATE seconds
		rate.sleep()


if __name__ == "__main__":
	main()
