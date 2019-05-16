Class {
	#name : #GtOpenCVLibrary,
	#superclass : #FFILibrary,
	#pools : [
		'GtOpenCVConstants'
	],
	#category : #'GT4OpenCV-Library'
}

{ #category : #installation }
GtOpenCVLibrary class >> install [
	<script: 'self install'>
	| installer |

	installer := GtLibraryInstaller new.
	installer library: 'OpenCV'.
	installer version: '3.4.6'.
	installer icon: (Form extent: 1@1 depth: 32).
	installer binary: 'libopencv_world'.
	installer url: 'https://dl.feenk.com/{library}/{platform}/{version}/{arch}/{binary}.{version}.{extension}'.

	installer run
]

{ #category : #'opencv - core' }
GtOpenCVLibrary >> convert: aSourceImage to: aDestinationImage [
	self primConvert: aSourceImage to: aDestinationImage scale: 1 shift: 0
]

{ #category : #'opencv - instance creation' }
GtOpenCVLibrary >> createHistogram: theDimensions sizes: theSizes ranges: theRanges [
	^ self
		createHistogram: theDimensions
		sizes: theSizes
		type: CV_HIST_ARRAY
		ranges: theRanges
		uniform: true
]

{ #category : #'opencv - instance creation' }
GtOpenCVLibrary >> createHistogram: theDimensions sizes: theSizes type: aType ranges: theRanges uniform: isUniform [
	| ffiSizes ffiRanges ffiIsUniform aHistogram ffiSubRanges |
	
	ffiSizes := FFIExternalArray externalNewType: 'int' size: theSizes size.
	ffiSizes atAll: (1 to: theSizes size) putAll: theSizes.
	
	ffiRanges := FFIExternalArray externalNewType: 'float*' size: theRanges size.
	ffiSubRanges := theRanges collect: [ :eachRange |
		| eachFfiRange |
		eachFfiRange := FFIExternalArray externalNewType: 'float' size: eachRange size.
		eachFfiRange atAll: (1 to: eachRange size) putAll: eachRange.
		eachFfiRange ].
	ffiSubRanges withIndexDo: [ :eachRange :anIndex | ffiRanges at: anIndex put: eachRange getHandle ].
	
	ffiIsUniform := isUniform asBit.
	
	aHistogram := self
		primCreateHistogram: theDimensions
		sizes: ffiSizes getHandle
		type: aType
		ranges: ffiRanges getHandle
		uniform: ffiIsUniform.
	
	ffiSubRanges do: #free.
	ffiRanges free.
	ffiSizes free.
	
	^ aHistogram autoRelease
]

{ #category : #'opencv - instance creation' }
GtOpenCVLibrary >> createImage: aSize depth: depth channels: channels [
	^ (self primCreateImage: aSize depth: depth channels: channels) autoRelease
]

{ #category : #'opencv - instance creation' }
GtOpenCVLibrary >> createMemStorage [
	^ self primCreateMemStorage: 0
]

{ #category : #'opencv - instance creation' }
GtOpenCVLibrary >> createSeq: anElementType storage: aMemStorage [
	^ self
		primCreateSeq: 0
		headerSize: GtOpenCVSeq structureSize
		elemSize: GtOpenCVContour structureSize
		storage: aMemStorage
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> detectLibrary: aFileName [
	^ ({ Smalltalk imageDirectory . Smalltalk vmDirectory . FileSystem workingDirectory }
		collect: [ :aPath | aPath asFileReference / aFileName ])
			detect: #exists
			ifFound: #fullName
			ifNone: [ aFileName ]
]

{ #category : #'opencv - accessing' }
GtOpenCVLibrary >> getSize: anImage [
	^ self primGetSize: anImage getHandle
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> macModuleName [
	^ self detectLibrary: self moduleName, '.dylib'
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> moduleName [
	^ 'libopencv_world'
]

{ #category : #'private - ffi' }
GtOpenCVLibrary >> primConvert: aSource to: aDestination scale: aScale shift: aShift [
	^ self ffiCall: #(void cvConvertScale (GtOpenCVImage *aSource, GtOpenCVImage *aDestination, double aScale, double aShift))
]

{ #category : #'private - ffi' }
GtOpenCVLibrary >> primCreateHistogram: theDimensions sizes: theSizes type: aType ranges: theRanges uniform: isUniform [
	^ self ffiCall: #(GtOpenCVHistogram cvCreateHist(int theDimensions, void* theSizes, int aType, void* theRanges, int isUniform))
]

{ #category : #'private - ffi' }
GtOpenCVLibrary >> primCreateImage: aSize depth: depth channels: channels [
	^ self ffiCall: #(GtOpenCVImage* cvCreateImage(GtOpenCVSize aSize, int depth, int channels))
]

{ #category : #'private - ffi' }
GtOpenCVLibrary >> primCreateMemStorage: aBlockSize [
	^ self ffiCall: #(GtOpenCVMemStorage cvCreateMemStorage(int aBlockSize))
]

{ #category : #'private - ffi' }
GtOpenCVLibrary >> primCreateSeq: theSeqFlags headerSize: aHeaderSize elemSize: anElementSize storage: aMemStorage [
	^ self ffiCall: #(GtOpenCVSeq* cvCreateSeq (
		int theSeqFlags,
		size_t aHeaderSize,
		size_t anElementSize,
		GtOpenCVMemStorage aMemStorage))
]

{ #category : #'private - ffi' }
GtOpenCVLibrary >> primGetSize: anImage [
	^ self ffiCall: #(GtOpenCVSize cvGetSize(void* anImage))
]

{ #category : #'private - ffi' }
GtOpenCVLibrary >> primReleaseMemStorage: aMemStorage [
	^ self ffiCall: #(void cvReleaseMemStorage(void* aMemStorage))
]

{ #category : #'private - ffi' }
GtOpenCVLibrary >> primSplit: aSource dest0: dest0 dest1: dest1 dest2: dest2 dest3: dest3 [
	^ self ffiCall: #(void cvSplit (GtOpenCVImage *aSource, GtOpenCVImage *dest0, GtOpenCVImage *dest1, GtOpenCVImage *dest2, GtOpenCVImage *dest3))
]

{ #category : #'opencv - core' }
GtOpenCVLibrary >> split: anImage into: theOutputImages [
	| dest0 dest1 dest2 dest3 |

	dest0 := theOutputImages at: 1 ifAbsent: nil.
	dest1 := theOutputImages at: 2 ifAbsent: nil.
	dest2 := theOutputImages at: 3 ifAbsent: nil.
	dest3 := theOutputImages at: 4 ifAbsent: nil.

	self primSplit: anImage dest0: dest0 dest1: dest1 dest2: dest2 dest3: dest3
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> unixModuleName [
	^ self detectLibrary: self moduleName, '.so'
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> win32ModuleName [
	^ self detectLibrary: self moduleName, '.dll'
]
