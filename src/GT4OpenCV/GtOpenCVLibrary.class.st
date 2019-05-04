Class {
	#name : #GtOpenCVLibrary,
	#superclass : #FFILibrary,
	#category : #GT4OpenCV
}

{ #category : #'accessing platform' }
GtOpenCVLibrary >> detectLibrary: aFileName [
	^ ({ Smalltalk imageDirectory . Smalltalk vmDirectory . FileSystem workingDirectory }
		collect: [ :aPath | aPath asFileReference / aFileName ])
			detect: #exists
			ifFound: #fullName
			ifNone: [ aFileName ]
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> macModuleName [
	^ self detectLibrary: self moduleName, '.dylib'
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> moduleName [
	^ 'libopencv_world.3.4.6'
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> unixModuleName [
	^ self detectLibrary: self moduleName, '.so'
]

{ #category : #'accessing platform' }
GtOpenCVLibrary >> win32ModuleName [
	^ self detectLibrary: self moduleName, '.dll'
]
