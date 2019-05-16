"
! Moldable Object Detection with OpenCV

First we connect to a camera
[[[show=gtPreviewFor:|height=200
camera := GtOpenCvVideoIO uniqueInstance createCameraCapture: 0.	
]]]

and capture each frame (image) from that camera for further process
[[[show=gtPreviewFor:|height=200
frame := camera captureFrame toRGBA.
]]]

once frame is captured we split it in channels to compute a histogram out of them
[[[show=gtPreviewFor:|height=100
channels := frame splitChannels: { 0 -> #Red . 1 -> #Green . 2 -> #Blue }.
]]]


"
Class {
	#name : #GtOpenCVHandDetection,
	#superclass : #Object,
	#category : #'GT4OpenCV-Examples'
}
