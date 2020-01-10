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

{ #category : #'as yet unclassified' }
GtTensorFlowDetectedObject >> gtHandsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Path' translated;
		priority: 10;
		stencil: [
			| aContainer aHandImage aConvexHull theDefects |
			aContainer := (self image asElement addChild: (self asElement relocate: self area origin)).
		
			aHandImage := (((self image crop: self wideArea) toHSV gaussianBlur: 25@25) extractMean expandBy: 10) inverted.
			aConvexHull := aHandImage contours max convexHull.
			theDefects := aConvexHull defects select: [ :each | each angle < 90 ].
			theDefects := theDefects select: [ :each | each isUp ].
			aContainer addChild: (theDefects asElement relocate: self area origin).
					
			aContainer
				when: BlClickEvent do: [ :anEvent |	anEvent consumed: true. anEvent currentTarget phlow spawnObject: self ];
				asScalableElement ]
]

{ #category : #'gt-inspector-extension' }
GtTensorFlowDetectedObject >> gtPreviewFor: aView [
	<gtView>

	^ aView explicit
		title: 'Live' translated;
		priority: 11;
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

{ #category : #accessing }
GtTensorFlowDetectedObject >> wideArea [
	| aSquaredExtent anExpansion |
	
	aSquaredExtent := (self area extent max asPoint * 1.25).
	anExpansion := (aSquaredExtent - self area extent) / 4.0.

	^ (self area expandBy: anExpansion) floor intersect: (0@0 extent: self image extent) 
]
