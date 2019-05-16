Class {
	#name : #GtOpenCvImgproc,
	#superclass : #GtOpenCVLibrary,
	#category : #'GT4OpenCV-Library'
}

{ #category : #'opencv - api' }
GtOpenCvImgproc >> calcBackProject: aBackProject images: theImages histogram: aHistogram [ 
	| ffiImages |
	
	ffiImages := FFIExternalArray externalNewType: 'void*' size: theImages size.
	theImages withIndexDo: [ :eachImage :anIndex | ffiImages at: anIndex put: eachImage getHandle ].

	self
		primCalcBackProject: aBackProject
		images: ffiImages getHandle
		histogram: aHistogram.

	ffiImages free
]

{ #category : #'opencv - api' }
GtOpenCvImgproc >> calcHistogram: aHistogram images: theImages [
	| ffiImages |
	
	ffiImages := FFIExternalArray externalNewType: 'void*' size: theImages size.
	theImages withIndexDo: [ :eachImage :anIndex | ffiImages at: anIndex put: eachImage getHandle ].
	
	self
		primCalcHist: aHistogram
		images: ffiImages getHandle
		accumulate: 0 mask: nil.
		
	ffiImages free.
	
	aHistogram images: theImages
]

{ #category : #'opencv - api' }
GtOpenCvImgproc >> contourArea: aContour slice: aSlice oriented: isOriented [
	<return: #Number>

	^ self
		primContourArea: aContour
		slice: aSlice
		oriented: isOriented asBit
]

{ #category : #'opencv - api' }
GtOpenCvImgproc >> cvtColorSrc: aSourceImage dest: aDestinationImage to: aFormat [
	^ self ffiCall: #(void cvCvtColor (GtOpenCVImage* aSourceImage, GtOpenCVImage* aDestinationImage, int aFormat))
]

{ #category : #'opencv - api' }
GtOpenCvImgproc >> findContours: anImage [
	| aFirstContour aMemoryStorage |
	
	aMemoryStorage := self createMemStorage.
	aFirstContour := ExternalAddress new.

	self
		primFindContours: anImage
		storage: aMemoryStorage
		contours: aFirstContour
		headerSize: GtOpenCVContour structureSize
		mode: CV_RETR_TREE
		method: CV_LINK_RUNS
		offset: (GtOpenCVPoint fromPoint: 0@0).
	
	^ (GtOpenCVContourTree fromOpenCVContour: (GtOpenCVContour fromHandle: aFirstContour)) storage: aMemoryStorage
]

{ #category : #'private - ffi' }
GtOpenCvImgproc >> primCalcBackProject: aBackProject images: theImages histogram: aHistogram [ 
	^ self ffiCall: #(void cvCalcArrBackProject (
		void* theImages,
		GtOpenCVImage* aBackProject,
		GtOpenCVHistogram aHistogram))
]

{ #category : #'private - ffi' }
GtOpenCvImgproc >> primCalcHist: aHistogram images: theImages accumulate: shouldAccumulate mask: aMask [
	^ self ffiCall: #(void cvCalcArrHist (
		void* theImages,
		GtOpenCVHistogram aHistogram,
		int shouldAccumulate,
		void* aMask))
]

{ #category : #'private - ffi' }
GtOpenCvImgproc >> primContourArea: aContour slice: aSlice oriented: isOriented [
	^ self ffiCall: #(double cvContourArea (
		GtOpenCVContour* aContour,
		GtOpenCVSlice aSlice,
		int isOriented))
]

{ #category : #'private - ffi' }
GtOpenCvImgproc >> primFindContours: anImage storage: aStorage contours: theContours headerSize: aHeaderSize mode: aMode method: aMethod offset: anOffset [
	^ self ffiCall: #(int cvFindContours (
		GtOpenCVImage* anImage,
		GtOpenCVMemStorage aStorage,
		void** theContours,
		int aHeaderSize,
		int aMode,
		int aMethod,
		GtOpenCVPoint anOffset))
]

{ #category : #'opencv - api' }
GtOpenCvImgproc >> resizeSrc: aSourceImage dest: aDestinationImage using: anInterpolator [
	^ self ffiCall: #(void cvResize (GtOpenCVImage* aSourceImage, GtOpenCVImage* aDestinationImage, int anInterpolator))
]

{ #category : #'opencv - api' }
GtOpenCvImgproc >> thresholdSrc: aSourceImage dest: aDestinationImage threshold: threshold max: aMaxValue type: thresholdType [
	^ self ffiCall: #(void cvThreshold (
		GtOpenCVImage* aSourceImage,
		GtOpenCVImage* aDestinationImage,
		double threshold,
		double aMaxValue,
		int thresholdType))
]
