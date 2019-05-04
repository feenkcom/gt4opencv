Class {
	#name : #GtOpenCVIplImage,
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
GtOpenCVIplImage class >> fieldsDesc [
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
GtOpenCVIplImage >> BorderConst_1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERCONST_1
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderConst_1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERCONST_1 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderConst_2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERCONST_2
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderConst_2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERCONST_2 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderConst_3 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERCONST_3
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderConst_3: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERCONST_3 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderConst_4 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERCONST_4
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderConst_4: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERCONST_4 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderMode_1 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERMODE_1
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderMode_1: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERMODE_1 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderMode_2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERMODE_2
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderMode_2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERMODE_2 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderMode_3 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERMODE_3
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderMode_3: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERMODE_3 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderMode_4 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_BORDERMODE_4
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> BorderMode_4: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_BORDERMODE_4 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> ID [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ID
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> ID: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ID put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> align [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ALIGN
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> align: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ALIGN put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> alphaChannel [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ALPHACHANNEL
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> alphaChannel: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ALPHACHANNEL put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> channelSeq_1 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_CHANNELSEQ_1
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> channelSeq_1: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_CHANNELSEQ_1 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> channelSeq_2 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_CHANNELSEQ_2
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> channelSeq_2: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_CHANNELSEQ_2 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> channelSeq_3 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_CHANNELSEQ_3
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> channelSeq_3: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_CHANNELSEQ_3 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> channelSeq_4 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_CHANNELSEQ_4
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> channelSeq_4: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_CHANNELSEQ_4 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> colorModel_1 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_COLORMODEL_1
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> colorModel_1: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_COLORMODEL_1 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> colorModel_2 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_COLORMODEL_2
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> colorModel_2: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_COLORMODEL_2 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> colorModel_3 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_COLORMODEL_3
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> colorModel_3: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_COLORMODEL_3 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> colorModel_4 [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_COLORMODEL_4
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> colorModel_4: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_COLORMODEL_4 put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> dataOrder [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DATAORDER
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> dataOrder: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DATAORDER put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> depth [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DEPTH
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> depth: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DEPTH put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> height [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HEIGHT
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> height: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HEIGHT put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> imageData [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_IMAGEDATA) type: ExternalType char asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> imageData: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_IMAGEDATA put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> imageDataOrigin [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_IMAGEDATAORIGIN) type: ExternalType char asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> imageDataOrigin: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_IMAGEDATAORIGIN put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> imageId [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_IMAGEID) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> imageId: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_IMAGEID put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> imageSize [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_IMAGESIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> imageSize: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_IMAGESIZE put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> maskROI [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_MASKROI) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> maskROI: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_MASKROI put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> nChannels [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NCHANNELS
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> nChannels: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NCHANNELS put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> nSize [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NSIZE
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> nSize: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NSIZE put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> origin [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ORIGIN
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> origin: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ORIGIN put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> roi [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ROI) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> roi: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ROI put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> tileInfo [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_TILEINFO) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> tileInfo: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_TILEINFO put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> width [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTH
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> width: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTH put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> widthStep [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WIDTHSTEP
]

{ #category : #'accessing structure variables' }
GtOpenCVIplImage >> widthStep: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WIDTHSTEP put: anObject
]
