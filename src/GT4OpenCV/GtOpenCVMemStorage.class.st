Class {
	#name : #GtOpenCVMemStorage,
	#superclass : #FFIExternalObject,
	#traits : 'TGtOpenCVObject',
	#classTraits : 'TGtOpenCVObject classTrait',
	#category : #'GT4OpenCV-!OpenCV'
}

{ #category : #'library path' }
GtOpenCVMemStorage class >> ffiLibraryName [
	^ GtOpenCVLibrary
]

{ #category : #'private - ffi' }
GtOpenCVMemStorage class >> primRelease: aHandle [
	GtOpenCVLibrary uniqueInstance primReleaseMemStorage: aHandle
]
