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
Function to determine distribution of white pixels by summing up columns 
img: OpenCV image
minPercentage: 
display: will display histogram distribution if true 
ROI: Region of Interest , divides image into ROI number of regions and looks at bottom region
"""
# findings summation of pixels 
def distribution(img, minPercentage = 0.1, display = False, ROI=1):
    # img.shape[0] = height 
	dist_vals = np.sum(img[img.shape[0]//ROI:,:],axis=0)
    
	'''
	if ROI == 1: 
        # summing up all vertical pixels 
        distValues = np.sum(img,axis=0)
    else: 
        # summing up vertical pixels in some lower region 
        distValues = np.sum(img[img.shape[0]//ROI:,:],axis=0)
   '''
    # find maximum value in distValues
    # if you have at least 50-60% of max value, that is valid noise
    # everything below this percentage is invalid 
    maxValue = np.max(distValues)
    # set threshold minimum
    minValue = minPercentage * maxValue
    # finding the index of each "column" from distValues
    # gives us array of indexes where value is greater than minValue
    indices = np.where(histValues >= minValue)
    # find base point by averaging 
    basePoint = int(np.average(indices))
    # showing histogram of distribution
    if display:
        hist = np.zeros((img.shape[0], img.shape[1],3),np.uint8)
        for x,intensity in enumerate(distValues):
            # shows histogram of distribution
            cv2.line(hist,(x,img.shape[0]),(x,img.shape[0]-intensity//255//ROI), (255,0,255),1)
            # shows basePoint
            cv2.circle(hist,(basePoint,img.shape[0]),20,(0,255,255),cv2.FILLED)
        return basePoint, hist
    return basePoint


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
