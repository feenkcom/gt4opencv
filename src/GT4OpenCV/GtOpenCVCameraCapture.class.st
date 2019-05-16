Class {
	#name : #GtOpenCVCameraCapture,
	#superclass : #FFIExternalObject,
	#traits : 'TGtOpenCVPtr',
	#classTraits : 'TGtOpenCVPtr classTrait',
	#category : #'GT4OpenCV-!OpenCV'
}

{ #category : #'instance creation' }
GtOpenCVCameraCapture class >> at: anIndex [
	<return: #GtOpenCVCameraCapture>

	^ GtOpenCvVideoIO uniqueInstance createCameraCapture: anIndex
]

{ #category : #'library path' }
GtOpenCVCameraCapture class >> ffiLibraryName [
	^ GtOpenCVLibrary
]

{ #category : #'private - ffi' }
GtOpenCVCameraCapture class >> primRelease: aHandle [
	GtOpenCvVideoIO uniqueInstance primReleaseCapture: aHandle
]

{ #category : #finalization }
GtOpenCVCameraCapture class >> release: aHandle [

	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :) "
		ifTrue: [ ^ self ].

	self warning: [ '(release) Ptr: ', aHandle value asString ].
	self primRelease: aHandle pointer.
	aHandle beNull
]

{ #category : #'opencv - api' }
GtOpenCVCameraCapture >> captureFrame [
	<return: #GtOpenCVImage>
	
	^ GtOpenCvVideoIO uniqueInstance queryFrame: self
]

{ #category : #'library path' }
GtOpenCVCameraCapture >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #'gt-inspector-extension' }
GtOpenCVCameraCapture >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [ ((GtOpenCVCameraElement on: self) filter: [ :anImage | anImage scaleBy: 0.5 ]) asScalableElement ]
]
