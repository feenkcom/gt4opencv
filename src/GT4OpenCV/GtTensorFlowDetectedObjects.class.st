Class {
	#name : #GtTensorFlowDetectedObjects,
	#superclass : #Collection,
	#instVars : [
		'image',
		'objects'
	],
	#category : #'GT4OpenCV-Hand Detection'
}

{ #category : #adding }
GtTensorFlowDetectedObjects >> add: newObject [ 
	"Include newObject as one of the receiver's elements. Answer newObject. 
	ArrayedCollections cannot respond to this message."

	objects add: newObject
]

{ #category : #'gt-inspector-extension' }
GtTensorFlowDetectedObjects >> asElement [
	| anImageElement |
	
	anImageElement := image asElement.
	anImageElement addChildren: (self collect: [ :eachObject | eachObject asElement relocate: eachObject area origin ]).
	
	^ anImageElement
]

{ #category : #enumerating }
GtTensorFlowDetectedObjects >> do: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument."

	objects do: aBlock
]

{ #category : #'gt-inspector-extension' }
GtTensorFlowDetectedObjects >> gtPreviewFor: aView [
	<gtView>

	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [ self asElement asScalableElement ]
]

{ #category : #accessing }
GtTensorFlowDetectedObjects >> image [
	^ image
]

{ #category : #accessing }
GtTensorFlowDetectedObjects >> image: anObject [
	image := anObject
]

{ #category : #initialization }
GtTensorFlowDetectedObjects >> initialize [
	super initialize.

	objects := OrderedCollection new
]

{ #category : #removing }
GtTensorFlowDetectedObjects >> remove: oldObject ifAbsent: anExceptionBlock [ 
	"Remove oldObject from the receiver's elements. If several of the 
	elements are equal to oldObject, only one is removed. If no element is 
	equal to oldObject, answer the result of evaluating anExceptionBlock. 
	Otherwise, answer the argument, oldObject. ArrayedCollections cannot 
	respond to this message."

	self shouldNotImplement
]

{ #category : #private }
GtTensorFlowDetectedObjects >> species [
	^ OrderedCollection
]
