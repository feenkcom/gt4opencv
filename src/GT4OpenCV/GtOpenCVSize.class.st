Class {
	#name : #GtOpenCVSize,
	#superclass : #GtOpenCVStructure,
	#classVars : [
		'OFFSET_HEIGHT',
		'OFFSET_WIDTH'
	],
	#category : #'GT4OpenCV-Structures'
}

{ #category : #'field definition' }
GtOpenCVSize class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
	int width
	int height
	)
]

{ #category : #'instance creation' }
GtOpenCVSize class >> fromPoint: aPoint [
	^ self new
		width: aPoint x asInteger;
		height: aPoint y asInteger
]

{ #category : #'accessing structure variables' }
GtOpenCVSize >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : #'accessing structure variables' }
GtOpenCVSize >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVSize >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : #'accessing structure variables' }
GtOpenCVSize >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]
