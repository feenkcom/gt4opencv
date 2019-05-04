Class {
	#name : #GtOpenCVLibrary,
	#superclass : #FFILibrary,
	#category : #GT4OpenCV
}

{ #category : #'as yet unclassified' }
GtOpenCVLibrary >> createImage: aSize depth: depth channels: channels [
	^ self ffiCall: #(GtOpenCVImage* cvCreateImage(GtOpenCVSize aSize, int depth, int channels))
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> detectLibrary: aFileName [
	^ ({ Smalltalk imageDirectory . Smalltalk vmDirectory . FileSystem workingDirectory }
		collect: [ :aPath | aPath asFileReference / aFileName ])
			detect: #exists
			ifFound: #fullName
			ifNone: [ aFileName ]
]

{ #category : #'as yet unclassified' }
GtOpenCVLibrary >> getSize: anImage [
	^ self primGetSize: anImage getHandle
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> macModuleName [
	^ self detectLibrary: self moduleName, '.dylib'
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> moduleName [
	^ 'libopencv_world.3.4.6'
]

{ #category : #'as yet unclassified' }
GtOpenCVLibrary >> primGetSize: anImage [
	^ self ffiCall: #(GtOpenCVSize cvGetSize(void* anImage))
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> unixModuleName [
	^ self detectLibrary: self moduleName, '.so'
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> win32ModuleName [
	^ self detectLibrary: self moduleName, '.dll'
]
