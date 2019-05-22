Class {
	#name : #GtOpenCVSeq,
	#superclass : #FFIExternalStructure,
	#traits : 'TGtOpenCVPtr',
	#classTraits : 'TGtOpenCVPtr classTrait',
	#classVars : [
		'OFFSET_BLOCK_MAX',
		'OFFSET_DELTA_ELEMS',
		'OFFSET_ELEM_SIZE',
		'OFFSET_FIRST',
		'OFFSET_FLAGS',
		'OFFSET_FREE_BLOCKS',
		'OFFSET_HEADER_SIZE',
		'OFFSET_H_NEXT',
		'OFFSET_H_PREV',
		'OFFSET_PTR',
		'OFFSET_STORAGE',
		'OFFSET_TOTAL',
		'OFFSET_V_NEXT',
		'OFFSET_V_PREV'
	],
	#pools : [
		'GtOpenCVConstants'
	],
	#category : #'GT4OpenCV-!OpenCV'
}

{ #category : #'library path' }
GtOpenCVSeq class >> ffiLibraryName [
	^ GtOpenCVLibrary
]

{ #category : #'field definition' }
GtOpenCVSeq class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		"Miscellaneous flags."
		int flags
		"Size of sequence header"
		int header_size
		"Previous sequence"
		void* h_prev
		"Next sequence"
		void* h_next
		"2nd previous sequence"
		void* v_prev
		"2nd next sequence."
		void* v_next
		
		"Total number of elements."
		int total
		"Size of sequence element in bytes"
		int elem_size
		"Maximal bound of the last block."
		schar* block_max
		"Current write pointer."
		schar* ptr
		"Grow seq this many at a time."
		int delta_elems
		"Where the seq is stored."
		void* storage
		"Free blocks list."
		void* free_blocks
		"Pointer to the first sequence block."
		void* first
	)
]

{ #category : #'api - opencv' }
GtOpenCVSeq >> asConvexityDefects [
	<return: #Collection of: #Point>

	^ (1 to: self total) collect: [ :anIndex | GtOpenCVConvexityDefect fromHandle: (self at: anIndex) getHandle ]
]

{ #category : #'api - opencv' }
GtOpenCVSeq >> asPoints [
	<return: #Collection of: #Point>
	
	^ (1 to: self total) collect: [ :anIndex | (GtOpenCVPoint fromHandle: (self at: anIndex) getHandle) asPoint ]
]

{ #category : #accessing }
GtOpenCVSeq >> at: anIndex [
	^ GtOpenCVLibrary uniqueInstance getSeqElem: self at: anIndex
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> block_max [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BLOCK_MAX) type: ExternalType sbyte asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> block_max: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BLOCK_MAX put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> delta_elems [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DELTA_ELEMS
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> delta_elems: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DELTA_ELEMS put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> elem_size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ELEM_SIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> elem_size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ELEM_SIZE put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> first [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FIRST) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> first: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FIRST put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> flags [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FLAGS
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> flags: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> free_blocks [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FREE_BLOCKS) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> free_blocks: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FREE_BLOCKS put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> h_next [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_H_NEXT) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> h_next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_H_NEXT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> h_prev [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_H_PREV) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> h_prev: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_H_PREV put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> header_size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEADER_SIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> header_size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEADER_SIZE put: anObject
]

{ #category : #accessing }
GtOpenCVSeq >> pointerAt: byteOffset [
	^ handle pointerAt: byteOffset
]

{ #category : #accessing }
GtOpenCVSeq >> pointerAt: byteOffset put: value [
	handle pointerAt: byteOffset put: value
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> ptr [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PTR) type: ExternalType sbyte asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> ptr: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PTR put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> storage [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_STORAGE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> storage: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_STORAGE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> total [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TOTAL
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> total: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TOTAL put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> v_next [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_V_NEXT) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> v_next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_V_NEXT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> v_prev [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_V_PREV) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVSeq >> v_prev: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_V_PREV put: anObject getHandle.
]
