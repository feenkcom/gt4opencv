Class {
	#name : #GtOpenCVContourTreeNode,
	#superclass : #Object,
	#instVars : [
		'parent',
		'children',
		'rectangle',
		'contour',
		'convexHull'
	],
	#pools : [
		'GtOpenCVConstants'
	],
	#category : #'GT4OpenCV-!OpenCV'
}

{ #category : #'instance creation' }
GtOpenCVContourTreeNode class >> fromOpenCVContour: anOpenCVContour [
	^ self new
		rectangle: anOpenCVContour rect asRectangle;
		contour: anOpenCVContour;
		yourself
]

{ #category : #adding }
GtOpenCVContourTreeNode >> addChild: aNode [
	children add: aNode.
	aNode parent: self
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> allContoursDo: aBlock [
	aBlock value: self.

	self children do: [ :each | each allContoursDo: aBlock ]
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> area [
	^ self contour area
]

{ #category : #converting }
GtOpenCVContourTreeNode >> asElement [
	| thePoints aContourElement anOrigin anExtent aConvexHull |
	
	aConvexHull := self convexHull.

	thePoints := aConvexHull points.
	anOrigin := thePoints min.
	thePoints := thePoints collect: [ :each | each - anOrigin ].
	anExtent := thePoints max - thePoints min.
	
	aContourElement := BlElement new.
	aContourElement geometry: (BlPolygon vertices: thePoints).
	aContourElement background: (BrGlamorousColors primaryBorderColor alpha: 0.2).
	aContourElement border: (BlBorder paint: (BrGlamorousColors primaryBorderColor alpha: 0.8) width: 2).
	aContourElement size: anExtent.
	aContourElement when: BlClickEvent do: [ :anEvent |	anEvent consumed: true. anEvent currentTarget phlow spawnObject: aConvexHull ].

	^ aContourElement
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> children [
	^ children
]

{ #category : #private }
GtOpenCVContourTreeNode >> contour [
	<return: #GtOpenCVContour>

	^ contour
]

{ #category : #private }
GtOpenCVContourTreeNode >> contour: anObject [
	contour := anObject
]

{ #category : #'opencv - api' }
GtOpenCVContourTreeNode >> convexHull [
	^ convexHull
		ifNil: [
			| aConvexHull |
			aConvexHull := GtOpenCvImgproc uniqueInstance
				convexHull: self contour
				orientation: CV_CLOCKWISE
				returnPoints: true.
			aConvexHull hasPoints: true.
			aConvexHull contour: self.
			convexHull := aConvexHull ]
]

{ #category : #'opencv - api' }
GtOpenCVContourTreeNode >> convexHullWithoutPoints [
	| aConvexHull |
	aConvexHull := GtOpenCvImgproc uniqueInstance
		convexHull: self contour
		orientation: CV_CLOCKWISE
		returnPoints: false.
	aConvexHull hasPoints: false.
	aConvexHull contour: self.
	^ aConvexHull
]

{ #category : #'opencv - api' }
GtOpenCVContourTreeNode >> defects [
	^ self convexHullWithoutPoints defects
]

{ #category : #'gt-inspector-extension' }
GtOpenCVContourTreeNode >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [
			| aContainer |
			aContainer := BlElement new.
			aContainer size: self root image extent.
			aContainer addChild: (self asElement relocate: self convexHull origin).
			aContainer background: self root image asForm.
			aContainer margin: (BlInsets all: 20).
			aContainer asScalableElement ]
]

{ #category : #initialization }
GtOpenCVContourTreeNode >> initialize [
	super initialize.

	children := OrderedCollection new
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> origin [
	^ self convexHull origin
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> parent [
	^ parent
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> rectangle [
	^ rectangle
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> rectangle: anObject [
	rectangle := anObject
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> root [
	^ self parent root
]
