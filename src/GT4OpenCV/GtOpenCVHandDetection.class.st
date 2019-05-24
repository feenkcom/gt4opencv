"
! Moldable Object Detection with OpenCV

First we connect to a camera
[[[show=gtPreviewFor:|height=200
camera := GtOpenCVCameraCapture at: 0.	
]]]

and capture each frame (image) from that camera for further process
[[[show=gtPreviewFor:|height=200
frame := camera captureFrame clone.
]]]

once frame is captured we detect hands on the image
[[[show=gtPreviewFor:|height=200
hands := GtTensorFlowHandDetector detect: frame.
]]]

extract hand out of the image
[[[show=gtPreviewFor:|height=200
hand := frame crop: hands anyOne area
]]]

convert it to gray
[[[show=gtPreviewFor:|height=200
grayed := hand toGray.
]]]

smooth out various defects
[[[show=gtPreviewFor:|height=200
blured := grayed gaussianBlur: 25@25.
]]]

and convert it to black and white only
[[[show=gtPreviewFor:|height=200
blackWhiteAdaptive := blured adaptiveThreshold.
]]]

and convert it to black and white only
[[[show=gtPreviewFor:|height=200
blackWhite := blured otsuThreshold.
]]]

[[[show=gtPreviewFor:|height=200
contours := blackWhite contours.
]]]
"
Class {
	#name : #GtOpenCVHandDetection,
	#superclass : #Object,
	#category : #'GT4OpenCV-Hand Detection'
}

{ #category : #examples }
GtOpenCVHandDetection >> example01 [
	<gtExample>
	| image hands hand hsv mask contours contour |
	image := GtOpenCVImage fromFileNamed: 'hand.jpg'.

	hands := GtTensorFlowHandDetector detect: image.
	hand := image crop: (hands anyOne wideArea).

	hsv := hand toHSV.
	hsv := hsv gaussianBlur: 25@25.
	mask := hsv extractMean.
	mask := mask expandBy: 10.

	mask := mask inverted.

	contours := mask contours.
	contour := contours max.
]
