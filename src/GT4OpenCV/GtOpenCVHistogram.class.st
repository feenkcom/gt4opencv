Class {
	#name : #GtOpenCVHistogram,
	#superclass : #FFIExternalObject,
	#traits : 'TGtOpenCVPtr',
	#classTraits : 'TGtOpenCVPtr classTrait',
	#category : #'GT4OpenCV-!OpenCV'
}

{ #category : #'private - ffi' }
GtOpenCVHistogram class >> ffiLibraryName [
	^ GtOpenCVLibrary
]

{ #category : #'private - ffi' }
GtOpenCVHistogram class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	^ self ffiCall: #(void cvReleaseHist(void* aHandle))
]

{ #category : #finalization }
GtOpenCVHistogram class >> release: aHandle [

	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :) "
		ifTrue: [ ^ self ].

	self warning: [ '(release) Ptr: ', aHandle value asString ].
	self primRelease: aHandle pointer.
	aHandle beNull
]

{ #category : #'library path' }
GtOpenCVHistogram >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #'external resource management' }
GtOpenCVHistogram >> resourceData [
	^ self getHandle
]
