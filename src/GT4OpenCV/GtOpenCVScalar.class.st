Class {
	#name : #GtOpenCVScalar,
	#superclass : #GtOpenCVStructure,
	#classVars : [
		'OFFSET_FIRST',
		'OFFSET_FOURTH',
		'OFFSET_SECOND',
		'OFFSET_THIRD'
	],
	#category : #'GT4OpenCV-Structures'
}

{ #category : #'field definition' }
GtOpenCVScalar class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		double first
		double second
		double third
		double fourth
	)
]

{ #category : #'instance creation' }
GtOpenCVScalar class >> fromArray: anArray [
	| aScalar |
	
	aScalar := self new.
	anArray size >= 1
		ifTrue: [ aScalar first: anArray first ].
	anArray size >= 2
		ifTrue: [ aScalar second: anArray second ].
	anArray size >= 3
		ifTrue: [ aScalar third: anArray third ].
	anArray size >= 4
		ifTrue: [ aScalar fourth: anArray fourth ].
		
	^ aScalar
]

{ #category : #converting }
GtOpenCVScalar >> asArray [
	^ { 
		self first.
		self second.
		self third.
		self fourth
	}
]

{ #category : #'accessing structure variables' }
GtOpenCVScalar >> first [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_FIRST
]

{ #category : #'accessing structure variables' }
GtOpenCVScalar >> first: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_FIRST put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVScalar >> fourth [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_FOURTH
]

{ #category : #'accessing structure variables' }
GtOpenCVScalar >> fourth: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_FOURTH put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVScalar >> second [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_SECOND
]

{ #category : #'accessing structure variables' }
GtOpenCVScalar >> second: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_SECOND put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVScalar >> third [
	"This method was automatically generated"
	^handle doubleAt: OFFSET_THIRD
]

{ #category : #'accessing structure variables' }
GtOpenCVScalar >> third: anObject [
	"This method was automatically generated"
	handle doubleAt: OFFSET_THIRD put: anObject
]
