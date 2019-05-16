Class {
	#name : #GtOpenCVImageChannel,
	#superclass : #Object,
	#instVars : [
		'index',
		'image',
		'name'
	],
	#category : #'GT4OpenCV-!OpenCV'
}

{ #category : #'gt-inspector-extension' }
GtOpenCVImageChannel >> asElement [
	| aLabelText |
	
	aLabelText := ('Channel #', self name asString) asRopedText
		bold;
		foreground: Color white;
		fontSize: 10.

	^ BlElement new
		layout: BlFrameLayout new;
		constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal fitContent ];
		addChild: (self image asElement);
		addChild: (BlElement new
			layout: BlLinearLayout vertical alignCenter;
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical exact: 100.
				c frame vertical alignBottom ];
			background: (Color black alpha: 0.3);
			padding: (BlInsets all: 15);
			clipChildren: false;
			addChild: (BlTextElement new text: aLabelText; padding: (BlInsets all: 2)) asScalableElement);
		yourself
]

{ #category : #accessing }
GtOpenCVImageChannel >> depth [
	^ self image depth
]

{ #category : #'gt-inspector-extension' }
GtOpenCVImageChannel >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [self asElement asScalableElement ]
]

{ #category : #accessing }
GtOpenCVImageChannel >> image [
	^ image
]

{ #category : #accessing }
GtOpenCVImageChannel >> image: anObject [
	image := anObject
]

{ #category : #accessing }
GtOpenCVImageChannel >> index [
	^ index
]

{ #category : #accessing }
GtOpenCVImageChannel >> index: anObject [
	index := anObject
]

{ #category : #accessing }
GtOpenCVImageChannel >> name [
	^ name
]

{ #category : #accessing }
GtOpenCVImageChannel >> name: anObject [
	name := anObject
]
