#!/usr/bin/env python
import cv2
import rospy
from cv_bridge import CvBridge
from sensor_msgs.msg import Image as ROSImage


bridge = None
img = None


"""
Callback function to display any image received from the topic
"""
def handle_img(data):
	global bridge
	global img

	img = bridge.imgmsg_to_cv2(data)


"""
Main function
"""
def main():
	global bridge
	global img

	# initialize node and create subscriber	
	bridge = CvBridge()
	rospy.init_node("rcv_img")
	rospy.Subscriber("img_proc", ROSImage, handle_img)
	
	while not rospy.is_shutdown():
		if not (type(img) == type(None)): 
			cv2.imshow("img", img)
			if cv2.waitKey(1) & 0xFF == ord('q'):
				break

if __name__ == "__main__":
	main()

