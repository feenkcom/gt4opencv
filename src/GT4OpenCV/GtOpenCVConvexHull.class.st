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

{ #category : #accessing }
GtOpenCVConvexHull >> hasPoints [
	^ hasPoints
]

{ #category : #accessing }
GtOpenCVConvexHull >> hasPoints: anObject [
	hasPoints := anObject
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
