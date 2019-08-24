Class {
	#name : #GtOpenCVSlice,
	#superclass : #GtOpenCVStructure,
	#classVars : [
		'OFFSET_END',
		'OFFSET_START'
	],
	#pools : [
		'GtOpenCVConstants'
	],
	#category : #'GT4OpenCV-Structures'
}

{ #category : #'field definition' }
GtOpenCVSlice class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
	int start
	int end
	)
]

{ #category : #'field definition' }
GtOpenCVSlice class >> whole [
	^ self new start: 0; end: CV_WHOLE_SEQ_END_INDEX
]

{ #category : #'accessing structure variables' }
GtOpenCVSlice >> end [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_END
]

{ #category : #'accessing structure variables' }
GtOpenCVSlice >> end: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_END put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVSlice >> start [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_START
]

{ #category : #'accessing structure variables' }
GtOpenCVSlice >> start: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_START put: anObject
]
