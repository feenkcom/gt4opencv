Class {
	#name : #GtOpenCVContour,
	#superclass : #GtOpenCVStructure,
	#traits : 'TGtOpenCVPtr',
	#classTraits : 'TGtOpenCVPtr classTrait',
	#classVars : [
		'OFFSET_BLOCK_MAX',
		'OFFSET_COLOR',
		'OFFSET_DELTA_ELEMS',
		'OFFSET_ELEM_SIZE',
		'OFFSET_FIRST',
		'OFFSET_FLAGS',
		'OFFSET_FREE_BLOCKS',
		'OFFSET_HEADER_SIZE',
		'OFFSET_H_NEXT',
		'OFFSET_H_PREV',
		'OFFSET_PTR',
		'OFFSET_RECT',
		'OFFSET_RESERVED_1',
		'OFFSET_RESERVED_2',
		'OFFSET_RESERVED_3',
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
GtOpenCVContour class >> ffiLibraryName [
	^ GtOpenCVLibrary
]

{ #category : #'field definition' }
GtOpenCVContour class >> fieldsDesc [
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
		
		GtOpenCVRect rect
		int color
		int reserved_1
		int reserved_2
		int reserved_3
	)
]

{ #category : #'opencv - api' }
GtOpenCVContour >> area [
	^ GtOpenCvImgproc uniqueInstance
		contourArea: self
		slice: GtOpenCVSlice whole
		oriented: false
]

{ #category : #converting }
GtOpenCVContour >> asElement [
	^ BlElement new
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> block_max [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BLOCK_MAX) type: ExternalType sbyte asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> block_max: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BLOCK_MAX put: anObject getHandle.
]

{ #category : #'opencv - api' }
GtOpenCVContour >> boundingRect [
	<return: #Rectangle>

	^ GtOpenCvImgproc uniqueInstance
		boundingRect: self
		update: true
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> color [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_COLOR
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> color: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_COLOR put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> delta_elems [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DELTA_ELEMS
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> delta_elems: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DELTA_ELEMS put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> elem_size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ELEM_SIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> elem_size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ELEM_SIZE put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> first [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FIRST) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> first: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FIRST put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> flags [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FLAGS
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> flags: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> free_blocks [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FREE_BLOCKS) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> free_blocks: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FREE_BLOCKS put: anObject getHandle.
]

{ #category : #'gt-inspector-extension' }
GtOpenCVContour >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [ (self asElement asScalableElement) margin: (BlInsets all: 20) ]
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> h_next [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_H_NEXT) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> h_next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_H_NEXT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> h_prev [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_H_PREV) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> h_prev: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_H_PREV put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> header_size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEADER_SIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> header_size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEADER_SIZE put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> ptr [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PTR) type: ExternalType sbyte asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> ptr: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PTR put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> rect [
	"This method was automatically generated"
	^ GtOpenCVRect fromHandle: (handle referenceStructAt: OFFSET_RECT length: GtOpenCVRect byteSize)
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> rect: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_RECT put: anObject getHandle length: GtOpenCVRect byteSize
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> reserved_1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED_1
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> reserved_1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED_1 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> reserved_2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED_2
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> reserved_2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED_2 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> reserved_3 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RESERVED_3
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> reserved_3: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RESERVED_3 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> storage [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_STORAGE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> storage: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_STORAGE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> total [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TOTAL
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> total: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TOTAL put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> v_next [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_V_NEXT) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> v_next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_V_NEXT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> v_prev [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_V_PREV) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVContour >> v_prev: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_V_PREV put: anObject getHandle.
]
