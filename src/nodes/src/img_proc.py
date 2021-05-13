#!/usr/bin/env python

import cv2
import rospy
import numpy as np
from cv_bridge import CvBridge
from sensor_msgs.msg import Image as ROSImage
from std_msgs.msg import Int64

# whether or not to display intermediate images for debugging
DISPLAY_IMG = False

# HSV threshold values
HSV_LOWER = [68, 0, 0]
HSV_UPPER = [179,255,255]

img = None              # raw image from main
bridge = None           # ROS to OpenCV image converter
pub_offset = None       # ROS publisher of the result to main
offset_lst = []         # rotation of 10 last offsets


"""
Function to warp image to focus on birds eye region of interest
img: OpenCV image 
"""
def warp(img):
    h,w,c = img.shape  # height, width, channels

    # map points on the original image to warp points and perform the transform
    pts_warp = np.float32([[112,234],[368,234],[0,368],[480,368]])
    pts_orig = np.float32([[0,0],[w,0],[0,h],[w,h]])
    transform_matrix = cv2.getPerspectiveTransform(pts_warp, pts_orig)
    img_warp = cv2.warpPerspective(img, transform_matrix, (w,h))

    return img_warp


"""
Function to threshold image to focus on road (black and white)
img: OpenCV image
"""
def threshold(img):
    img_hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    lower = np.array(HSV_LOWER)
    upper = np.array(HSV_UPPER)
    img_mask = cv2.inRange(img_hsv,lower,upper)

    return img_mask
    

"""
Function to determine distribution of white pixels by summing up columns 
img: OpenCV image
minPercentage: minimum % of max value to filter out noise
display: will display histogram distribution if true 
roi: region of interest, divides image into roi number of regions and looks at 
     bottom region
"""
def distribution(img, minPercentage=0.1, roi=1):
    global DISPLAY_IMG

    (h,w) = img.shape   # height, width, #channels

    # creating array containing distribution of white pixels
    if roi == 1: 
        # summing up all vertical pixels 
        dist_vals = np.sum(img,axis=0)
    else: 
        # summing up vertical pixels in lower roi 
        dist_vals = np.sum(img[img.shape[0]//roi:,:],axis=0)

    # find maximum value in distribution
    max_val = np.max(dist_vals)
    # set threshold minimum, everything below this minimum is noise
    min_val = minPercentage * max_val

    # finding the index of each "column" from distValues where value is greater than minValue
    indices = np.where(dist_vals >= min_val)

    # find base point by averaging 
    mid_pt = int(np.average(indices))

    # showing histogram of distribution
    if DISPLAY_IMG:
        hist = np.zeros((h, w, 3), np.uint8)  # 3 for the color values
        for x,intensity in enumerate(dist_vals):
            # shows histogram of distribution
            cv2.line(hist,(x,h),(x,int(h-intensity//255//roi)),(255,0,255),1)
            # shows mid_pt
            cv2.circle(hist,(mid_pt,img.shape[0]),20,(0,255,255),cv2.FILLED)
        return mid_pt, hist
    return mid_pt


"""
Function to find lane curvature from an image
ros_img: ROSImage
"""
def lane_curve(ros_img):
    global img
    global bridge
    global offset_lst
    global pub_offset
    global DISPLAY_IMG

    # convert ROS image to OpenCV
    img = bridge.imgmsg_to_cv2(ros_img)
    
    # warp image and threshold the result to isolate the lane
    warp_img = warp(img)
    thresh_img = threshold(warp_img)

    # find the average point in the lane in the bottom quarter of the image,
    # and then in the full image; the difference between these two will give
    # the curvature of the lane
    '''
    mid_pt = distribution(thresh_img, minPercentage=0.5, roi=4)
    base_pt = distribution(thresh_img, minPercentage=0.9, roi=1)
    '''

    if DISPLAY_IMG:
        mid_pt, histm = distribution(thresh_img, minPercentage=0.5, roi=4)
        base_pt, histb = distribution(thresh_img, minPercentage=0.9, roi=1)
    else:
        mid_pt = distribution(thresh_img, minPercentage=0.5, roi=4)
        base_pt = distribution(thresh_img, minPercentage=0.9, roi=1)
    offset = base_pt - mid_pt

    # keep the last 10 offsets in rotation
    # offset_lst.append(offset)
    # if len(offset_lst) > 10:
    #     offset_lst.pop(0)
    # offset_avg = int(sum(offset_lst)/len(offset_lst))

    # display intermediate images
    if DISPLAY_IMG:
        cv2.imshow("Histogram: Midpoint", histm)
        cv2.imshow("Histogram: Basepoint", histb)
        cv2.imshow("Threshold", thresh_img)
        if cv2.waitKey(1) == ord('q'):
            cv2.destroyAllWindows()
    
    # 
    pub_offset.publish(offset)


"""
Main function
"""
def main():
    global bridge
    global img
    global pub_offset

    # ROS <-> OpenCV image converter
    bridge = CvBridge()

    # initialize node and subscribe to raw image topic
    rospy.init_node("img_proc")
    rospy.Subscriber("img_proc", ROSImage, lane_curve)

    # publisher to send offset results to main
    pub_offset = rospy.Publisher("offset", Int64, queue_size=1)

    rospy.spin()


if __name__ == "__main__":
    main()
