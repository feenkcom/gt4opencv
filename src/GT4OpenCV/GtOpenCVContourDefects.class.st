Class {
	#name : #GtOpenCVContourDefects,
	#superclass : #GtOpenCVSeq,
	#category : #'GT4OpenCV-Structures'
}

{ #category : #'api - opencv' }
GtOpenCVContourDefects >> asDefects [
	<return: #Collection of: #Point>
	| theDefects |
	
	theDefects := GtOpenCVDefects new.

	(1 to: self total) do: [ :anIndex |
		theDefects add: (GtOpenCVConvexityDefectStruct fromHandle: (self at: anIndex) getHandle) asDefect ].
	
	^ theDefects
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> block_max [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BLOCK_MAX) type: ExternalType sbyte asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> block_max: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BLOCK_MAX put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> delta_elems [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DELTA_ELEMS
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> delta_elems: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DELTA_ELEMS put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> elem_size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ELEM_SIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> elem_size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ELEM_SIZE put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> first [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FIRST) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> first: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FIRST put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> flags [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FLAGS
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> flags: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> free_blocks [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FREE_BLOCKS) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> free_blocks: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FREE_BLOCKS put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> h_next [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_H_NEXT) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> h_next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_H_NEXT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> h_prev [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_H_PREV) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> h_prev: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_H_PREV put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> header_size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEADER_SIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> header_size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEADER_SIZE put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> ptr [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PTR) type: ExternalType sbyte asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> ptr: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PTR put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> storage [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_STORAGE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> storage: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_STORAGE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> total [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TOTAL
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> total: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TOTAL put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> v_next [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_V_NEXT) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> v_next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_V_NEXT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> v_prev [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_V_PREV) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContourDefects >> v_prev: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_V_PREV put: anObject getHandle.
]
