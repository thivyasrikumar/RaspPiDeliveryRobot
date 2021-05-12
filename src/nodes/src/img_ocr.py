#!/usr/bin/env python

import cv2
import rospy
import pytesseract
from cv_bridge import CvBridge
from sensor_msgs.msg import Image as ROSImage
from nodes.msg import OCRResponse


pub_ready = None		# publisher to notify main that node is ready for img
bridge = None			# converter between ROS and OpenCV img
initial_recv = False    # has the first image been received yet


"""
Function to find text in image
ros_img: ROSImage
"""
def text_detect(ros_img):
	global bridge
	global pub_ready
	global initial_recv

	# at least one image has been received
	initial_recv = True

	# convert ROS image to OpenCV
	img = bridge.imgmsg_to_cv2(ros_img)
	gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
	img_text = pytesseract.image_to_string(img)

	# send detected text back to main and notify that node is ready for new img
	response = OCRResponse()
	response.is_ready = True
	response.detected_text = img_text
	pub_ready.publish(response)


"""
Main function
"""
def main():
	global bridge
	global pub_ready
	global initial_recv

	# ROS <-> OpenCV image converter
	bridge = CvBridge()

	# initialize node and subscribe to raw image topic
	rospy.init_node("img_ocr")
	rospy.Subscriber("img_text", ROSImage, text_detect)

	# publisher to confirm that OCR is ready for new image
	pub_ready = rospy.Publisher("ocr_ready", OCRResponse, queue_size=1)

	# keep notifying main that node is ready until first image is received
	while not initial_recv and not rospy.is_shutdown():
		response = OCRResponse()
		response.is_ready = True
		response.detected_text = "test"
		pub_ready.publish(response)

	rospy.spin()


if __name__ == "__main__":
	main()
