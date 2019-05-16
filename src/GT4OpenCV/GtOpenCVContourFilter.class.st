Class {
	#name : #GtOpenCVContourFilter,
	#superclass : #Object,
	#instVars : [
		'limitBlock'
	],
	#category : #'GT4OpenCV-Examples'
}

{ #category : #glamour }
GtOpenCVContourFilter >> glamourValueWithArgs: theArgs [
	| anImage anElement threshold contours maxContour aLimit |
	
	anImage := theArgs first.
	anElement := theArgs second.

	aLimit := limitBlock value.
	
	threshold := anImage threshold: aLimit.
	contours := GtOpenCvImgproc uniqueInstance findContours: threshold.
	maxContour := contours detectMax: [ :each | each contour area ].

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

	^ anImage threshold: aLimit.
]

{ #category : #initialization }
GtOpenCVContourFilter >> initialize [
	super initialize.
	
	limitBlock := 160
]

{ #category : #accessing }
GtOpenCVContourFilter >> limit: anObject [
	limitBlock := anObject
]
