Class {
	#name : #GtOpenCVTensorFlowFilter,
	#superclass : #Object,
	#instVars : [
		'detector'
	],
	#category : #'GT4OpenCV-Examples'
}

{ #category : #accessing }
GtOpenCVTensorFlowFilter >> detector [
	^ detector
]

{ #category : #accessing }
GtOpenCVTensorFlowFilter >> detector: anObject [
	detector := anObject
]

{ #category : #glamour }
GtOpenCVTensorFlowFilter >> glamourValueWithArgs: theArgs [
	| anImage anElement aContainer theHands |
	
	anImage := theArgs first.
	anElement := theArgs second.
	anElement removeChildNamed: #contour.
	
	aContainer := BlElement new.
	aContainer constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	
	theHands := detector detect: anImage.
	aContainer addChildren: (theHands
		collect: [ :aDetectedHand | aDetectedHand asElement relocate: aDetectedHand area origin ]).
		
	anElement addChild: aContainer as: #contour.

	^ anImage
]

{ #category : #initialization }
GtOpenCVTensorFlowFilter >> initialize [
	super initialize.
	
	detector := GtTensorFlowHandDetector uniqueInstance.
]

{ #category : #accessing }
GtOpenCVTensorFlowFilter >> threshold [
	^ detector threshold
]

{ #category : #accessing }
GtOpenCVTensorFlowFilter >> threshold: anObject [
	detector threshold: anObject
]
