Class {
	#name : #GtTensorFlowDetectedObject,
	#superclass : #Object,
	#instVars : [
		'image',
		'label',
		'score',
		'area'
	],
	#category : #'GT4OpenCV-Hand Detection'
}

{ #category : #accessing }
GtTensorFlowDetectedObject >> area [
	^ area
]

{ #category : #accessing }
GtTensorFlowDetectedObject >> area: anObject [
	area := anObject
]

{ #category : #converting }
GtTensorFlowDetectedObject >> asElement [
	| aContainer aColor aLabel aTextElement |
	
	aColor := BrGlamorousColors primaryBorderColor.
	
	aContainer := BlElement new.
	aContainer size: area extent.
	aContainer border: (BlBorder paint: (aColor alpha: 1) width: 2).
	aContainer background: (aColor alpha: 0.2).
	
	aLabel := ((self label asString, ' ', (self score * 100) rounded asString, '%') asRopedText foreground: Color white; bold; fontSize: self area height / 15.0).
	
	aTextElement := BlTextElement new.
	aTextElement background: (aColor alpha: 0.8).
	aTextElement padding: (BlInsets all: 10).
	aTextElement text: aLabel.

	aContainer addChild: aTextElement.
	aContainer when: BlClickEvent do: [ :anEvent | anEvent consumed: true. aContainer phlow spawnObject: self ].
	
	^ aContainer
]

{ #category : #'gt-inspector-extension' }
GtTensorFlowDetectedObject >> gtPreviewFor: aView [
	<gtView>

	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [ (self image asElement addChild: (self asElement relocate: self area origin)) asScalableElement ]
]

{ #category : #accessing }
GtTensorFlowDetectedObject >> image [
	^ image
]

{ #category : #accessing }
GtTensorFlowDetectedObject >> image: anObject [
	image := anObject
]

{ #category : #accessing }
GtTensorFlowDetectedObject >> label [
	^ label
]

{ #category : #accessing }
GtTensorFlowDetectedObject >> label: anObject [
	label := anObject
]

{ #category : #accessing }
GtTensorFlowDetectedObject >> score [
	^ score
]

{ #category : #accessing }
GtTensorFlowDetectedObject >> score: anObject [
	score := anObject
]
