import cv2
import numpy as np 

def thresh(img): 
    HSVimg = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    lower = np.array([80,0,0])        # change this later
    upper = np.array([255,160,255])
    MASKimg = cv2.inRange(HSVimg,lower,upper)
    return MASKimg 


# we want to see the road from the 'top' rather than a front view
# manual way to warp the camera by selecting points on image 
# this gives us a region of interest
def warp(img, points, w, h, inverse = False):
    # original four points
    pt1 = np.float32(points)
    # warp points 
    pt2 = np.float32([0,0],[w,0],[0,h],[w,h])
    # matrix allows us to convert points from original to warped image 
    if inv: 
        matrix = cv2.getPerspectiveTransform(pts2,pts1)
    else: 
        matrix = cv2.getPerspectiveTransform(pts1,pts2)
    WARPimg = cv2.warpPerspective(img,matrix,(w,h))
    return WARPimg

# called when change in trackbar occurs
def change(x):
    pass

def trackbars(init, w, h):
    cv2.namedWindow("Trackbars")
    cv2.resizeWindow("Trackbars", 360, 240)
    cv2.createTrackbar("Width Top", "Trackbars", init[0], w//2, change)
    cv2.createTrackbar("Height Top", "Trackbars", init[1], h, change)
    cv2.createTrackbar("Width Bottom", "Trackbars", init[2], w//2, change)
    cv2.createTrackbar("Height Bottom", "Trackbars", init[3], h, change)

def getPositions(w=480, h=240):
    widthTop = cv2.getTrackbarPos("Width Top", "Trackbars")
    heightTop = cv2.getTrackbarPos("Height Top", "Trackbars")
    widthBottom = cv2.getTrackbarPos("Width Bottom", "Trackbars")
    heightBottom = cv2.getTrackbarPos("Height Bottom", "Trackbars")
    points = np.float32([(widthTop,heightTop), (w-widthTop,heightTop),
        (widthBottom, heightBottom), (w-widthBottom, heightBottom)])
    return points

def drawPoints(img, points):
    for x in range(4):
        cv2.circle(img,(int(points[x][0]),int(points[x][1])),15,(0,0,255),cv2.FILLED)
    return img

# findings summation of pixels 
def distribution(img, minPercentage = 0.1, display = False, region=1):
    
    if region == 1: 
        # summing up all vertical pixels 
        distValues = np.sum(img,axis=0)
    else: 
        # summing up vertical pixels in some region 
        distValues = np.sum(img[img.shape[0]//region:,:],axis=0)
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
            cv2.line(hist,(x,img.shape[0]),(x,img.shape[0]-intensity//255//region), (255,0,255),1)
            # shows basePoint
            cv2.circle(imgHist,(basePoint,img.shape[0]),20,(0,255,255),cv2.FILLED)
        return basePoint, imgHist
    return basePoint

