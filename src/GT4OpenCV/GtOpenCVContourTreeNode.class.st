Class {
	#name : #GtOpenCVContourTreeNode,
	#superclass : #Object,
	#instVars : [
		'parent',
		'children',
		'rectangle',
		'contour'
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
GtOpenCVContourTreeNode >> children [
	^ children
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> contour [
	<return: #GtOpenCVContour>

	^ contour
]

{ #category : #accessing }
GtOpenCVContourTreeNode >> contour: anObject [
	contour := anObject
]

{ #category : #initialization }
GtOpenCVContourTreeNode >> initialize [
	super initialize.

	children := OrderedCollection new
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
