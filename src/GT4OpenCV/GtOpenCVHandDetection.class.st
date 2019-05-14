"
First we connect to a camera

[[[
camera := GtOpenCvVideoIO uniqueInstance createCameraCapture: 0.	
]]]

then for process captured frames (images) from the camera

[[[
frame := camera captureFrame.
]]]

[[[
1+1
]]]
"
Class {
	#name : #GtOpenCVHandDetection,
	#superclass : #Object,
	#category : #'GT4OpenCV-Examples'
}
