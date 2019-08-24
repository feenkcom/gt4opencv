Class {
	#name : #GtOpenCVConvexHull,
	#superclass : #GtOpenCVSeq,
	#instVars : [
		'hasPoints',
		'contour',
		'points'
	],
	#category : #'GT4OpenCV-Structures'
}

{ #category : #converting }
GtOpenCVConvexHull >> asElement [
	| thePoints aContourElement anOrigin anExtent aColor |
	
	thePoints := self asPoints.
	anOrigin := thePoints min.
	thePoints := thePoints collect: [ :each | each - anOrigin ].
	anExtent := thePoints max - thePoints min.
	aColor := BrGlamorousColors primaryBorderColor.

	aContourElement := BlElement new.
	aContourElement clipChildren: false.
	aContourElement geometry: (BlPolygon vertices: thePoints).
	aContourElement background: (aColor alpha: 0.2).
	aContourElement border: (BlBorder paint: (aColor alpha: 0.8) width: 2).
	aContourElement size: anExtent.
	aContourElement when: BlClickEvent do: [ :anEvent |	anEvent consumed: true. anEvent currentTarget phlow spawnObject: self ].

	aContourElement addChildren: (thePoints collect: [ :eachPoint |
		BlElement new
			border: (BlBorder paint: aColor width: 1);
			background: Color white;
			geometry: BlEllipse new;
			size: 8@8;
			relocate: (eachPoint - (4@4));
			when: BlClickEvent do: [ :anEvent | anEvent consumed: true. anEvent currentTarget phlow spawnObject: eachPoint ].
	]).

	^ aContourElement
]

{ #category : #'api - opencv' }
GtOpenCVConvexHull >> asPoints [
	<return: #Collection of: #Point>
	
	^ (1 to: self total) collect: [ :anIndex | (GtOpenCVPoint fromHandle: (self at: anIndex) getHandle) asPoint ]
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> block_max [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_BLOCK_MAX) type: ExternalType sbyte asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> block_max: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_BLOCK_MAX put: anObject getHandle.
]

{ #category : #accessing }
GtOpenCVConvexHull >> contour [
	<return: #GtOpenCVContourTreeNode>

	^ contour
]

{ #category : #accessing }
GtOpenCVConvexHull >> contour: aContourTreeNode [
	contour := aContourTreeNode
]

{ #category : #'opencv - api' }
GtOpenCVConvexHull >> defects [
	| aConvexHull theDefects |
	aConvexHull := self hasPoints
		ifTrue: [ self contour convexHullWithoutPoints ]
		ifFalse: [ self ].

	theDefects := (GtOpenCvImgproc uniqueInstance
		convexityDefects: contour contour
		hull: aConvexHull) asDefects.
	
	theDefects contour: self contour.

	^ theDefects
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> delta_elems [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DELTA_ELEMS
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> delta_elems: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DELTA_ELEMS put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> elem_size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ELEM_SIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> elem_size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ELEM_SIZE put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> first [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FIRST) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> first: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FIRST put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> flags [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FLAGS
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> flags: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> free_blocks [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_FREE_BLOCKS) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> free_blocks: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FREE_BLOCKS put: anObject getHandle.
]

{ #category : #'gt-inspector-extension' }
GtOpenCVConvexHull >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [
			| aContainer |

			aContainer := BlElement new.
			aContainer size: self contour root image extent.
			aContainer background: self contour root image asForm.
			aContainer margin: (BlInsets all: 20).
			aContainer addChild: (self asElement relocate: self origin).
			aContainer asScalableElement ]
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> h_next [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_H_NEXT) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> h_next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_H_NEXT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> h_prev [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_H_PREV) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> h_prev: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_H_PREV put: anObject getHandle.
]

{ #category : #accessing }
GtOpenCVConvexHull >> hasPoints [
	^ hasPoints
]

{ #category : #accessing }
GtOpenCVConvexHull >> hasPoints: anObject [
	hasPoints := anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> header_size [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEADER_SIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> header_size: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEADER_SIZE put: anObject
]

{ #category : #accessing }
GtOpenCVConvexHull >> origin [
	^ self points min
]

{ #category : #accessing }
GtOpenCVConvexHull >> points [
	^ points ifNil: [
		points := self hasPoints
			ifTrue: [ self asPoints ]
			ifFalse: [ self contour convexHull points ] ]
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> ptr [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PTR) type: ExternalType sbyte asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> ptr: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PTR put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> storage [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_STORAGE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> storage: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_STORAGE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> total [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TOTAL
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> total: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TOTAL put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> v_next [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_V_NEXT) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> v_next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_V_NEXT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> v_prev [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_V_PREV) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexHull >> v_prev: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_V_PREV put: anObject getHandle.
]
