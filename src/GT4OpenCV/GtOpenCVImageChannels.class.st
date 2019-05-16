Class {
	#name : #GtOpenCVImageChannels,
	#superclass : #Object,
	#instVars : [
		'channels'
	],
	#category : #'GT4OpenCV-!OpenCV'
}

{ #category : #adding }
GtOpenCVImageChannels >> add: anImageChannel [
	channels add: anImageChannel
]

{ #category : #converting }
GtOpenCVImageChannels >> asElement [
	^ BlElement new
		layout: (BlLinearLayout horizontal cellSpacing: 15);
		constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal fitContent ];
		addChildren: (channels collect: [ :each |
			each asElement asScalableElement
				width: 200;
				constraintsDo: [ :c | c vertical fitContent ];
				fitWidth;
				margin: (BlInsets top: 10 bottom: 10);
				look: BrShadowLook;
				when: BlClickEvent do: [ :anEvent | anEvent currentTarget phlow spawnObject: each ] ])
]

{ #category : #accessing }
GtOpenCVImageChannels >> channels [
	^ channels
]

{ #category : #converting }
GtOpenCVImageChannels >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [self asElement asScalableElement ]
]

{ #category : #'opecv - api' }
GtOpenCVImageChannels >> histogram [
	
	^ self
		histogramSizes: (self size timesCollect: [ 32 ])
		ranges: (self size timesCollect: [ #(0 256) ])
]

{ #category : #'opecv - api' }
GtOpenCVImageChannels >> histogramSizes: aCollectionOfSizes ranges: aCollectionOfRanges [
	"aCollectionOfSizes - describes in how many levels to quantize each channel"
	| aHistogram |

	aHistogram := GtOpenCvImgproc uniqueInstance
		createHistogram: self channels size
		sizes: aCollectionOfSizes
		ranges: aCollectionOfRanges.
		
	GtOpenCvImgproc uniqueInstance
		calcHistogram: aHistogram images: self images.
		
	^ aHistogram
]

{ #category : #accessing }
GtOpenCVImageChannels >> images [
	^ self channels collect: #image
]

{ #category : #initialization }
GtOpenCVImageChannels >> initialize [
	super initialize.
	
	channels := OrderedCollection new
]

{ #category : #accessing }
GtOpenCVImageChannels >> size [
	^ self channels size
]
