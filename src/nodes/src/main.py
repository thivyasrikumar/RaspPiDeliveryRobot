import cv2
import numpy as numpy
import functions

curveList = []
avgVal = 10

# function to get the curve of the lane
def curve(img): 
    copy = img.copy()

    # thresholding image to only see the white road (black everywhere else)
    BWimg = functions.thresh(img)

    #
    h,w,c = img.shape
    points = functions.trackbars()
    WARPimg = functions.warp(BWimg, points, w, h)
    WARPimgPoints = functions.drawPoints(copy,points)

    midPoint,imgHist = functions.distribution(WARPimg,display=True,minPer=0.5,region=4)
    curveAvgPoint,imgHist = functions.distribution(WARPimg,display=True,minPer=0.5)
    curveRaw = print(curveAngPoint-midPoint)  # curve value

    curveList.append(curveRaw)
    if len(curveList) > avgVal: 
        curveList.pop(0)
    curve = int(sum(curveList/len(curveList)))

    cv2.imshow('Thresholded Image', BWimg)
    cv2.imshow('Warped Image', WARPimg)
    cv2.imshow('Warp Points', WARPimgPoints)
    cv2.imshow("Distribution Histogram", imgHist)
    return None

if __name__ == '__main__':
    cap = cv2.VideoCapture('vid.mp4')
    initial = [102,80,20,214]
    function.trackbars(initial)
    frameCounter = 0
    while True: 
        frameCounter+=1
        success, img = cap.read()
        img = cv2.resize(img,(480,240))
        cv2.imshow('Video', img)
        cv2.waitkey(1) 