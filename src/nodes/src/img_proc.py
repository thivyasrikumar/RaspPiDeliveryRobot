#!/usr/bin/env python

import cv2
import rospy
from cv_bridge import CvBridge
from sensor_msgs.msg import Image as ROSImage

img = None
bridge = None

"""
Function to warp image to focus on birds eye region of interest
img: OpenCV image 
"""
def warp(img):
	h,w,c = img.shape  # height, width, #channels
	pts_warp = np.float32([[112,234],[368,234],[0,368],[480,368]])
	pts_orig = np.float32([[0,0],[w,0],[0,h],[w,h]])
	transform_matrix = cv2.getPerspectiveTransform(pts_warp, pts_orig)
	img_warp = cv2.warpPerspective(img, transform_matrix, (w,h)) 
	return img_warp

"""
Function to find lane curvature from an image
ros_img: ROSImage
"""
def lane_curve(ros_img):
	global img
	global bridge
	
	# convert ROS image to OpenCV
	
	img = bridge.imgmsg_to_cv2(ros_img)
	img = warp(img)


"""
Main function
"""
def main():
	global bridge
	global img

	# ROS <-> OpenCV image converter
	bridge = CvBridge()

	# initialize node subscribe to raw image topic
	rospy.init_node("img_proc")
	rospy.Subscriber("img_raw_proc", ROSImage, lane_curve)

	# DELETE LATER
	while not rospy.is_shutdown():
		if not (type(img) == type(None)):
			cv2.imshow("img", img)
			if cv2.waitKey(1) & 0xFF == ord('q'):
				break

if __name__ == "__main__":
	main()
