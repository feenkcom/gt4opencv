Class {
	#name : #GtOpenCVHistogram,
	#superclass : #FFIExternalObject,
	#traits : 'TGtOpenCVObject',
	#classTraits : 'TGtOpenCVObject classTrait',
	#instVars : [
		'images'
	],
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

{ #category : #'library path' }
GtOpenCVHistogram >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #accessing }
GtOpenCVHistogram >> images [
	^ images
]

{ #category : #accessing }
GtOpenCVHistogram >> images: aCollectionOfImages [
	"A collection of images used to create this histogram"
	images := aCollectionOfImages
]
