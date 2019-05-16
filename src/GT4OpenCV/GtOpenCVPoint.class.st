Class {
	#name : #GtOpenCVPoint,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : #'GT4OpenCV-Library'
}

{ #category : #'field definition' }
GtOpenCVPoint class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		int x
		int y
	)
]

{ #category : #'instance creation' }
GtOpenCVPoint class >> fromPoint: aPoint [
	^ self new
		x: aPoint x asInteger;
		y: aPoint y asInteger
]

{ #category : #'accessing structure variables' }
GtOpenCVPoint >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
GtOpenCVPoint >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVPoint >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
GtOpenCVPoint >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
