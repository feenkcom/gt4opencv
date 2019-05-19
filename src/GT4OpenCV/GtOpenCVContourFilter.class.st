Class {
	#name : #GtOpenCVContourFilter,
	#superclass : #Object,
	#category : #'GT4OpenCV-Examples'
}

{ #category : #glamour }
GtOpenCVContourFilter >> glamourValueWithArgs: theArgs [
	| anImage anElement contours maxContour aCopy |
	
	anImage := theArgs first.
	anElement := theArgs second.
	
	aCopy := anImage clone.
	contours := GtOpenCvImgproc uniqueInstance findContours: aCopy.
	maxContour := contours detectMax: [ :each | each contour area ].
	maxContour
		ifNil: [ ^ anImage ].

	anElement removeChildren.
	contours allContoursDo: [ :each |
		each ~~ maxContour ifTrue: [
			anElement addChild: (BlElement new
				relocate: each rectangle origin;
				size: each rectangle extent;
				border: (BlBorder paint: Color blue width: 1)) ] ].
		
	anElement addChild: (BlTextElement new
		padding: (BlInsets all: 5);
		text: (maxContour contour area asString asRopedText foreground: Color red);
		relocate: maxContour rectangle origin;
		size: maxContour rectangle extent;
		border: (BlBorder paint: Color red width: 1)).

	^ anImage
]
