Class {
	#name : #GtOpenCVDefects,
	#superclass : #OrderedCollection,
	#instVars : [
		'contour'
	],
	#category : #'GT4OpenCV-!Core'
}

{ #category : #converting }
GtOpenCVDefects >> asElement [
	| aContourElement |
	
	aContourElement := self contour convexHull asElement.
	
	aContourElement addChildren: (self collect: [ :eachDefect |
		| thePoints eachLineOrigin |
		
		thePoints := eachDefect asPoints.
		eachLineOrigin := thePoints min.
		
		BlElement new
			relocate: eachLineOrigin - self origin;
			geometry: (BlPolyline vertices: eachDefect asPoints - eachLineOrigin);
			border: (BlBorder builder dashed paint: Color red; width: 1; build) ]).
		
	aContourElement addChildren: (self collect: [ :eachDefect |		
		BlElement new
			relocate: eachDefect far - self origin - (4@4);
			size: 8@8;
			geometry: BlEllipse new;
			background: Color white;
			border: (BlBorder paint: Color red width: 1);
			when: BlClickEvent do: [ :anEvent | anEvent consumed: true. anEvent currentTarget phlow spawnObject: eachDefect ] ]).

	^ aContourElement
]

{ #category : #accessing }
GtOpenCVDefects >> contour [
	^ contour
]

{ #category : #accessing }
GtOpenCVDefects >> contour: anObject [
	contour := anObject
]

{ #category : #copying }
GtOpenCVDefects >> copyEmpty [
	"Answer a copy of the receiver that contains no elements."

	^ super copyEmpty contour: self contour
]

{ #category : #converting }
GtOpenCVDefects >> gtPreviewFor: aView [
	<gtView>

	contour ifNil: [ ^ aView empty ].
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

{ #category : #converting }
GtOpenCVDefects >> origin [
	^ self contour convexHull origin
]
