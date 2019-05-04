Class {
	#name : #GtOpenCVImage,
	#superclass : #FFIExternalStructure,
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
	#category : #GT4OpenCV
}

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

{ #category : #private }
GtOpenCVImage >> convertTo: aModel in: aDestinationImageBlock [
	| cv dest |

	self colorModel = aModel
		ifTrue: [ ^ self ].
		
	cv := GtOpenCvImgproc uniqueInstance.
	dest := aDestinationImageBlock value.
	
	cv cvtColorSrc: self dest: dest to: (self convertionTo: aModel).
	
	^ dest
]

{ #category : #private }
GtOpenCVImage >> convertionTable [
	^ {
		(#BGR -> #RGBA) -> 2.
		(#BGR -> #GRAY) -> 6.
		(#GRAY -> #RGBA) -> 9.
		(#BGRA -> #GRAY) -> 10.
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

{ #category : #'api - accessing' }
GtOpenCVImage >> extent [
	^ self width @ self height
]

{ #category : #extensions }
GtOpenCVImage >> gtInfoFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Info' translated;
		priority: 10;
		items: [ { 
			'Color Model' -> self colorModel.
			'Extent' -> self extent
		} ];
		column: 'Key' do: [:aColumn | 
			aColumn item: [ :each | each key asString ]; matchParent ];
		column: 'Value' do: [:aColumn |
			aColumn item: [ :each | each value gtDisplayString ]; matchParent ];
		send: #value
]

{ #category : #extensions }
GtOpenCVImage >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [
			| canvas surface rgba |
			rgba := self toRGBA.
			canvas := MozCanvas extent: rgba extent.
			surface := canvas bitmap
				fromRGBA: rgba imageData
				extent: rgba extent
				stride: rgba widthStep.
			canvas fill
				paint: surface;
				path: surface bounds;
				draw.
			BlElement new
				size: rgba extent;
				background: canvas asForm;
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

{ #category : #'api - accessing' }
GtOpenCVImage >> size [
	^ GtOpenCVSize new width: self width; height: self height
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
GtOpenCVImage >> toGray [
	<return: #GtOpenCVImage>
	
	^ self convertTo: #GRAY in: [
		GtOpenCvImgproc uniqueInstance
			createImage: self size
			depth: 8
			channels: 1 ]
]

{ #category : #'api - converting' }
GtOpenCVImage >> toRGBA [
	<return: #GtOpenCVImage>

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
