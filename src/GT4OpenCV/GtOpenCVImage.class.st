Class {
	#name : #GtOpenCVImage,
	#superclass : #GtOpenCVStructure,
	#traits : 'TGtOpenCVPtr',
	#classTraits : 'TGtOpenCVPtr classTrait',
	#classVars : [
		'OFFSET_ALIGN',
		'OFFSET_ALPHACHANNEL',
		'OFFSET_BORDERCONST_1',
		'OFFSET_BORDERCONST_2',
		'OFFSET_BORDERCONST_3',
		'OFFSET_BORDERCONST_4',
		'OFFSET_BORDERMODE_1',
		'OFFSET_BORDERMODE_2',
		'OFFSET_BORDERMODE_3',
		'OFFSET_BORDERMODE_4',
		'OFFSET_CHANNELSEQ_1',
		'OFFSET_CHANNELSEQ_2',
		'OFFSET_CHANNELSEQ_3',
		'OFFSET_CHANNELSEQ_4',
		'OFFSET_COLORMODEL_1',
		'OFFSET_COLORMODEL_2',
		'OFFSET_COLORMODEL_3',
		'OFFSET_COLORMODEL_4',
		'OFFSET_DATAORDER',
		'OFFSET_DEPTH',
		'OFFSET_HEIGHT',
		'OFFSET_ID',
		'OFFSET_IMAGEDATA',
		'OFFSET_IMAGEDATAORIGIN',
		'OFFSET_IMAGEID',
		'OFFSET_IMAGESIZE',
		'OFFSET_MASKROI',
		'OFFSET_NCHANNELS',
		'OFFSET_NSIZE',
		'OFFSET_ORIGIN',
		'OFFSET_ROI',
		'OFFSET_TILEINFO',
		'OFFSET_WIDTH',
		'OFFSET_WIDTHSTEP'
	],
	#pools : [
		'GtOpenCVConstants'
	],
	#category : #'GT4OpenCV-!OpenCV'
}

{ #category : #resources }
GtOpenCVImage class >> ffiLibraryName [
	^ GtOpenCVLibrary
]

{ #category : #'field definition' }
GtOpenCVImage class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
	int 	nSize
	int 	ID
	int 	nChannels
	int 	alphaChannel
	int 	depth
		
	char 	colorModel_1
	char 	colorModel_2
	char 	colorModel_3
	char 	colorModel_4
	char 	channelSeq_1
	char 	channelSeq_2
	char 	channelSeq_3
	char 	channelSeq_4
	int 	dataOrder
	
	int 	origin
		
	int 	align
		
	int 	width
	int 	height
	void* 	roi
	void* 	maskROI
	void* 	imageId
	void* 	tileInfo
 	int 	imageSize
		
	char* 	imageData
	int 	widthStep
	int 	BorderMode_1
	int 	BorderMode_2
	int 	BorderMode_3
	int 	BorderMode_4
	int 	BorderConst_1
	int 	BorderConst_2
	int 	BorderConst_3
	int 	BorderConst_4
	char* 	imageDataOrigin)
]

{ #category : #'instance creation' }
GtOpenCVImage class >> fromFileNamed: aFileName [
	^ GtOpenCVLibrary uniqueInstance
		loadImage: aFileName
		format: CV_LOAD_IMAGE_COLOR "in BGR"
]

{ #category : #'private - ffi' }
GtOpenCVImage class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	^ self ffiCall: #(void cvReleaseImage(void** aHandle))
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderConst_1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERCONST_1
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderConst_1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERCONST_1 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderConst_2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERCONST_2
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderConst_2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERCONST_2 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderConst_3 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERCONST_3
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderConst_3: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERCONST_3 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderConst_4 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERCONST_4
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderConst_4: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERCONST_4 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderMode_1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERMODE_1
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderMode_1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERMODE_1 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderMode_2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERMODE_2
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderMode_2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERMODE_2 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderMode_3 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERMODE_3
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderMode_3: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERMODE_3 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderMode_4 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERMODE_4
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> BorderMode_4: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERMODE_4 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> ID [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ID
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> ID: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ID put: anObject
]

{ #category : #'api - opencv' }
GtOpenCVImage >> adaptiveThreshold [
	^ self
		adaptiveThreshold: CV_ADAPTIVE_THRESH_MEAN_C
		max: 255
		using: CV_THRESH_BINARY
]

{ #category : #'api - opencv' }
GtOpenCVImage >> adaptiveThreshold: aMethod max: aMaxValue using: thresholdType [
	| aResult |
	
	aResult := self similar.
	
	GtOpenCvImgproc uniqueInstance
		adaptiveThresholdSrc: self
		dest: aResult
		max: aMaxValue
		adaptiveMethod: aMethod
		type: thresholdType
		blockSize: 35
		param: 2.

	^ aResult
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> align [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ALIGN
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> align: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ALIGN put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> alphaChannel [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ALPHACHANNEL
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> alphaChannel: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ALPHACHANNEL put: anObject
]

{ #category : #extensions }
GtOpenCVImage >> asElement [
	^ BlElement new
		size: self extent;
		background: self asForm
]

{ #category : #extensions }
GtOpenCVImage >> asForm [
	| rgba aCanvas aSurface |
	rgba := self toRGBA.

	aCanvas := SkiaCanvas extent: rgba extent.
	aSurface := aCanvas bitmap
		fromRGBA: rgba imageData
		extent: rgba extent
		stride: rgba widthStep.
	aCanvas fill
		paint: aSurface;
		path: aSurface bounds;
		draw.
		
	^ aCanvas asForm
]

{ #category : #'api - opencv' }
GtOpenCVImage >> borderWidth: aWidth color: aColor [
	| aResult |
	
	aResult := GtOpenCvImgproc uniqueInstance
		createImage: (GtOpenCVSize fromPoint: self extent + (aWidth * 2))
		depth: self depth
		channels: self nChannels.

	GtOpenCvImgproc uniqueInstance
		copyMakeBorder: self
		dest: aResult
		offset: (GtOpenCVPoint fromPoint: aWidth asPoint)
		type: BORDER_CONSTANT
		value: (GtOpenCVScalar fromArray: ({ aColor blue . aColor green . aColor red } collect: [ :each | (each * 255) floor ])).

	^ aResult
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> channelSeq_1 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_CHANNELSEQ_1
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> channelSeq_1: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_CHANNELSEQ_1 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> channelSeq_2 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_CHANNELSEQ_2
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> channelSeq_2: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_CHANNELSEQ_2 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> channelSeq_3 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_CHANNELSEQ_3
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> channelSeq_3: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_CHANNELSEQ_3 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> channelSeq_4 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_CHANNELSEQ_4
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> channelSeq_4: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_CHANNELSEQ_4 put: anObject
]

{ #category : #'api - converting' }
GtOpenCVImage >> clone [
	^ GtOpenCVLibrary uniqueInstance cloneImage: self
]

{ #category : #'api - accessing' }
GtOpenCVImage >> colorModel [
	<return: #String>

	^ Symbol streamContents: [ :aStream |
		self channelSeq_1 ~= Character null
			ifTrue: [ aStream nextPut: self channelSeq_1 ].
		self channelSeq_2 ~= Character null
			ifTrue: [ aStream nextPut: self channelSeq_2 ].
		self channelSeq_3 ~= Character null
			ifTrue: [ aStream nextPut: self channelSeq_3 ].
		self channelSeq_4 ~= Character null
			ifTrue: [ aStream nextPut: self channelSeq_4 ] ].
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> colorModel_1 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_COLORMODEL_1
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> colorModel_1: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_COLORMODEL_1 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> colorModel_2 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_COLORMODEL_2
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> colorModel_2: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_COLORMODEL_2 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> colorModel_3 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_COLORMODEL_3
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> colorModel_3: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_COLORMODEL_3 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> colorModel_4 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_COLORMODEL_4
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> colorModel_4: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_COLORMODEL_4 put: anObject
]

{ #category : #'api - opencv' }
GtOpenCVImage >> contours [
	<return: #GtOpenCVContourTree>

	^ (GtOpenCvImgproc uniqueInstance
		findContours: self clone) image: self
]

{ #category : #private }
GtOpenCVImage >> convertTo: aModel in: aDestinationImageBlock [
	| cv dest src |

	self colorModel = aModel
		ifTrue: [ ^ self ].

	cv := GtOpenCvImgproc uniqueInstance.
	dest := aDestinationImageBlock value.
	
	src := dest depth = self depth
		ifTrue: [ self ]
		ifFalse: [
			| anSrc |
			anSrc := cv createImage: self size depth: dest depth channels: self nChannels.
			cv convert: self to: anSrc.
			anSrc ].
	
	cv cvtColorSrc: src dest: dest to: (self convertionTo: aModel).
	^ dest
]

{ #category : #private }
GtOpenCVImage >> convertionTable [
	^ {
		(#BGR -> #RGBA) -> CV_BGR2RGBA.
		(#BGR -> #BGRA) -> CV_BGR2BGRA.
		(#BGR -> #RGB) -> CV_BGR2RGB.
		(#RGB -> #RGBA) -> CV_RGB2RGBA.
		(#RGB -> #BGRA) -> CV_RGB2BGRA.
		(#BGR -> #GRAY) -> CV_BGR2GRAY.
		(#GRAY -> #RGBA) -> CV_GRAY2RGBA.
		(#BGRA -> #GRAY) -> CV_BGRA2GRAY.
		(#BGRA -> #RGBA) -> CV_BGRA2RGBA.
		(#BGRA -> #BGR) -> CV_BGRA2BGR.
		(#GRAY -> #BGR) -> CV_GRAY2BGR.
		(#BGR -> #HSV) -> CV_BGR2HSV.
		(#HSV -> #BGR) -> CV_HSV2BGR.
		(#HSV -> #RGB) -> CV_HSV2RGB.
	} asDictionary
]

{ #category : #private }
GtOpenCVImage >> convertionTo: aMode [
	^ self convertionTo: aMode ifAbsent: [ self error: 'Can not convert ', self colorModel, ' to ', aMode ]
]

{ #category : #private }
GtOpenCVImage >> convertionTo: aMode ifAbsent: aBlock [
	^ self convertionTable
		at: (self colorModel -> aMode)
		ifAbsent: aBlock
]

{ #category : #'api - converting' }
GtOpenCVImage >> crop: aRectangle [
	| aCropedImage cv aRoundedRectangle |
	
	aRoundedRectangle := aRectangle ceiling.
	
	cv := GtOpenCvImgproc uniqueInstance.
	
	aCropedImage := cv
		createImage: (GtOpenCVSize fromPoint: aRoundedRectangle extent)
		depth: self depth
		channels: self nChannels.
	
	cv
		setImage: self
		regionOfInterest: aRoundedRectangle.
		
	cv
		copy: self to: aCropedImage.
	
	cv
		resetImageRegionOfInterest: self.
		
	^ aCropedImage
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> dataOrder [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DATAORDER
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> dataOrder: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DATAORDER put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> depth [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DEPTH
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> depth: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DEPTH put: anObject
]

{ #category : #'api - converting' }
GtOpenCVImage >> equalizeHistogram [
	| aGrayImage aResult |

	aGrayImage := self toGray.
	aResult := aGrayImage similar.
	
	GtOpenCvImgproc uniqueInstance equalizeHist: aGrayImage dest: aResult.
	
	^ aResult
]

{ #category : #'api - converting' }
GtOpenCVImage >> expandBy: aNumber [
	^ self borderWidth: 10 color: Color transparent
]

{ #category : #'api - accessing' }
GtOpenCVImage >> extent [
	^ self width @ self height
]

{ #category : #'api - opencv' }
GtOpenCVImage >> extractMean [
	| sampleBox sample mean offsetLowThreshold offsetHighThreshold lowerSkin upperSkin |

	sampleBox := (self extent / (4.0 @ 4.0)) extent: (self extent / (2.0 @ (2) )).
	sample := self crop: sampleBox.

	mean := sample mean first: 3.
	
	offsetLowThreshold := 30.
	offsetHighThreshold := 30.

	lowerSkin := mean - offsetLowThreshold.
	upperSkin := mean + offsetHighThreshold.

	^ self inRangeLower: lowerSkin upper: upperSkin.
]

{ #category : #'api - opencv' }
GtOpenCVImage >> extractMeanColor [
	| sampleBox sample mean |

	sampleBox := (self extent / (4.0 @ 4.0)) extent: (self extent / (2.0 @ (2) )).
	sample := self crop: sampleBox.

	mean := sample mean first: 3.
	
	^ Color r: mean third g: mean second b: mean first range: 255
]

{ #category : #resources }
GtOpenCVImage >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #'api - opencv' }
GtOpenCVImage >> gaussianBlur: aKernelSize [
	"aSize x is the aperture width. Must be a positive odd number (1, 3, 5, ...).
	aSize y is the aperture height. Must be a positive odd number (1, 3, 5, ...).
	Sigma will be computed based on the kernel size"

	^ self gaussianBlur: aKernelSize sigma: 0
]

{ #category : #'api - opencv' }
GtOpenCVImage >> gaussianBlur: aKernelSize sigma: aSigma [
	"aSize x is the aperture width. Must be a positive odd number (1, 3, 5, ...).
	aSize y is the aperture height. Must be a positive odd number (1, 3, 5, ...).
	aSigma may specify Gaussian σ (standard deviation). If it is zero, it is calculated from the kernel size.
	Using standard sigma for small kernels ( 3×3 to 7×7 ) gives better speed."
	| aResult aKernelSizePoint |
	
	aKernelSizePoint := aKernelSize asPoint.

	self
		assert: [ aKernelSizePoint >= 0 asPoint ]
		description: [ 'Aperture must be a positive number' ].
	
	self
		assert: [ aKernelSizePoint x odd ]
		description: [ 'Aperture width must be a positive odd number' ].
		
	self
		assert: [ aKernelSizePoint y odd ]
		description: [ 'Aperture width must be a positive odd number' ].
	
	aResult := self similar.
	
	GtOpenCvImgproc uniqueInstance
		smooth: self
		dest: aResult
		type: CV_GAUSSIAN
		size1: aKernelSizePoint x
		size2: aKernelSizePoint y
		sigma1: aSigma
		sigma2: 0.

	^ aResult
]

{ #category : #extensions }
GtOpenCVImage >> gtInfoFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Info' translated;
		priority: 12;
		items: [ {('Extent' -> self extent).
			('Channels' -> self nChannels).
			('Color Model' -> self colorModel)} ];
		column: 'Key'
			do: [ :aColumn | 
			aColumn
				item: [ :each | each key asString ];
				weight: 1 ];
		column: 'Value'
			do: [ :aColumn | 
			aColumn
				item: [ :each | each value gtDisplayString ];
				weight: 1 ];
		send: #value
]

{ #category : #extensions }
GtOpenCVImage >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 11;
		stencil: [ self asElement
			when: BlClickEvent do: [ :anEvent |	anEvent consumed: true. anEvent currentTarget phlow spawnObject: self ];
			asScalableElement ]
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> imageData [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_IMAGEDATA) type: ExternalType char asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> imageData: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_IMAGEDATA put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> imageDataOrigin [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_IMAGEDATAORIGIN) type: ExternalType char asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> imageDataOrigin: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_IMAGEDATAORIGIN put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> imageId [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_IMAGEID) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> imageId: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_IMAGEID put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> imageSize [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_IMAGESIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> imageSize: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_IMAGESIZE put: anObject
]

{ #category : #'api - opencv' }
GtOpenCVImage >> inRangeLower: aLowerArray upper: anUpperArray [
	| aResult |
	
	aResult := GtOpenCvImgproc uniqueInstance
		createImage: self size
		depth: 8
		channels: 1.

	GtOpenCvImgproc uniqueInstance
		inRangeSrc: self
		dest: aResult
		lowerScalar: (GtOpenCVScalar fromArray: aLowerArray)
		upperScalar: (GtOpenCVScalar fromArray: anUpperArray).
		
	^ aResult
]

{ #category : #'api - converting' }
GtOpenCVImage >> inverted [
	| aResult |
	
	aResult := self similar.

	GtOpenCVLibrary uniqueInstance not: self dest: aResult.
	
	^ aResult
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> maskROI [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_MASKROI) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> maskROI: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_MASKROI put: anObject getHandle.
]

{ #category : #'api - opencv' }
GtOpenCVImage >> mean [
	<return: #Array of: #Number>

	^ (GtOpenCVLibrary uniqueInstance
		average: self
		mask: nil) asArray
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> nChannels [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NCHANNELS
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> nChannels: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NCHANNELS put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> nSize [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NSIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> nSize: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NSIZE put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> origin [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ORIGIN
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> origin: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ORIGIN put: anObject
]

{ #category : #'api - opencv' }
GtOpenCVImage >> otsuThreshold [
	^ self
		threshold: 0
		max: 255
		using: CV_THRESH_BINARY_INV | CV_THRESH_OTSU
]

{ #category : #'api - converting' }
GtOpenCVImage >> resize: anExtent [
	anExtent = self extent
		ifTrue: [ ^ self ].
	anExtent > self extent
		ifTrue: [ ^ self resize: anExtent using: CV_INTER_LINEAR ].
	anExtent < self extent
		ifTrue: [ ^ self resize: anExtent using: CV_INTER_AREA ].
		
	^ self resize: anExtent using: CV_INTER_LINEAR
]

{ #category : #'api - converting' }
GtOpenCVImage >> resize: anExtent using: anInterpolation [
	| aResizedImage |

	aResizedImage := GtOpenCvImgproc uniqueInstance
		createImage: (GtOpenCVSize fromPoint: anExtent)
		depth: self depth
		channels: self nChannels.

	GtOpenCvImgproc uniqueInstance
		resizeSrc: self
		dest: aResizedImage
		using: anInterpolation.

	^ aResizedImage
]

{ #category : #'initialize-release' }
GtOpenCVImage >> resourceData [
	^ self getHandle
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> roi [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ROI) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> roi: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ROI put: anObject getHandle.
]

{ #category : #'api - converting' }
GtOpenCVImage >> scaleBy: aPointOrNumber [

	^ self resize: self extent * aPointOrNumber asPoint
]

{ #category : #'api - converting' }
GtOpenCVImage >> similar [
	^ GtOpenCvImgproc uniqueInstance
		createImage: self size
		depth: self depth
		channels: self nChannels
]

{ #category : #'api - accessing' }
GtOpenCVImage >> size [
	^ GtOpenCVSize new width: self width; height: self height
]

{ #category : #'api - opencv' }
GtOpenCVImage >> splitChannels: anArrayOfChannels [
	"image split: #(0 1 2)"
	| channelsDictionary channels |

	channelsDictionary := anArrayOfChannels collect: [ :eachChannel |
		| aChannelIndex aChannelName |
		
		aChannelIndex := (eachChannel isKindOf: Association)
			ifTrue: [ eachChannel key ]
			ifFalse: [ eachChannel ]. 
			
		aChannelName := eachChannel value asString.
		
		aChannelIndex -> (GtOpenCVImageChannel new
			image: (GtOpenCvImgproc uniqueInstance
				createImage: self size
				depth: self depth
				channels: 1);
			name: aChannelName;
			index: aChannelIndex) ] as: OrderedDictionary.
		
	GtOpenCvImgproc uniqueInstance
		split: self
		into: { 
			channelsDictionary at: 0 ifPresent: #image ifAbsent: nil.
			channelsDictionary at: 1 ifPresent: #image ifAbsent: nil.
			channelsDictionary at: 2 ifPresent: #image ifAbsent: nil.
			channelsDictionary at: 3 ifPresent: #image  ifAbsent: nil }.
			
	channels := GtOpenCVImageChannels new.
	channelsDictionary valuesDo: [ :each | channels add: each ].
	^ channels
]

{ #category : #'api - opencv' }
GtOpenCVImage >> threshold: aThreshold [
	^ self
		threshold: aThreshold
		max: 255
		using: CV_THRESH_BINARY_INV
]

{ #category : #'api - opencv' }
GtOpenCVImage >> threshold: aThreshold max: aMaxValue using: thresholdType [
	| aResult |
	
	aResult := self similar.
	
	GtOpenCvImgproc uniqueInstance
		thresholdSrc: self
		dest: aResult
		threshold: aThreshold max: aMaxValue
		type: thresholdType.
		
	^ aResult
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> tileInfo [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TILEINFO) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> tileInfo: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TILEINFO put: anObject getHandle.
]

{ #category : #'api - converting' }
GtOpenCVImage >> toBGR [
	<return: #GtOpenCVImage>

	^ self convertTo: #BGR in: [
		GtOpenCvImgproc uniqueInstance
			createImage: self size
			depth: 8
			channels: 3 ]
]

{ #category : #'api - converting' }
GtOpenCVImage >> toBGRA [
	<return: #GtOpenCVImage>

	^ self toRGBA
]

{ #category : #'api - converting' }
GtOpenCVImage >> toFloat [
	| cv dest |

	cv := GtOpenCvImgproc uniqueInstance.
	dest := GtOpenCvImgproc uniqueInstance
		createImage: self size
		depth: 32
		channels: self nChannels.
	
	cv primConvert: self to: dest scale: 1 / 255.0 shift: 0.
	
	^ dest
]

{ #category : #'api - converting' }
GtOpenCVImage >> toGray [
	<return: #GtOpenCVImage>
	
	^ self convertTo: #GRAY in: [
		GtOpenCvImgproc uniqueInstance
			createImage: self size
			depth: 8
			channels: 1 ]
]

{ #category : #'api - converting' }
GtOpenCVImage >> toHSV [
	<return: #GtOpenCVImage>

	^ self convertTo: #HSV in: [
		GtOpenCvImgproc uniqueInstance
			createImage: self size
			depth: 8
			channels: 3 ]
]

{ #category : #'api - converting' }
GtOpenCVImage >> toRGB [
	<return: #GtOpenCVImage>

	^ self convertTo: #RGB in: [
		GtOpenCvImgproc uniqueInstance
			createImage: self size
			depth: 8
			channels: 3 ]
]

{ #category : #'api - converting' }
GtOpenCVImage >> toRGBA [
	<return: #GtOpenCVImage>

	self colorModel = #BGRA
		ifTrue: [ ^ self ].
		
	self colorModel = #HSV
		ifTrue: [ ^ self toBGR toRGBA ].

	^ self convertTo: #RGBA in: [
		GtOpenCvImgproc uniqueInstance
			createImage: self size
			depth: 8
			channels: 4 ]
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> widthStep [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTHSTEP
]

{ #category : #'accessing structure variables' }
GtOpenCVImage >> widthStep: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTHSTEP put: anObject
]
