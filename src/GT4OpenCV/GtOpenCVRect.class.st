Class {
	#name : #GtOpenCVRect,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_HEIGHT',
		'OFFSET_WIDTH',
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : #'GT4OpenCV-Structures'
}

{ #category : #'field definition' }
GtOpenCVRect class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		int x
		int y
		int width
		int height
	)
]

{ #category : #'instance creation' }
GtOpenCVRect class >> fromRectangle: aRectangle [
	^ self new
		x: aRectangle left;
		y: aRectangle top;
		width: aRectangle width;
		height: aRectangle height
]

{ #category : #converting }
GtOpenCVRect >> asRectangle [
	^ Rectangle origin: self x @ self y extent: (self width @ self height)
]

{ #category : #'accessing structure variables' }
GtOpenCVRect >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : #'accessing structure variables' }
GtOpenCVRect >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVRect >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : #'accessing structure variables' }
GtOpenCVRect >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVRect >> x [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_X
]

{ #category : #'accessing structure variables' }
GtOpenCVRect >> x: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_X put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVRect >> y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{ #category : #'accessing structure variables' }
GtOpenCVRect >> y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]
