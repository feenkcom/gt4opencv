Class {
	#name : #GtOpenCvImgCodecs,
	#superclass : #GtOpenCVLibrary,
	#category : #'GT4OpenCV-Library'
}

{ #category : #'opencv - instance creation' }
GtOpenCvImgCodecs >> loadImage: aFileName format: aLoadImageFormat [
	^ (self primLoadImage: aFileName format: aLoadImageFormat) autoRelease
]

{ #category : #'private - ffi' }
GtOpenCvImgCodecs >> primLoadImage: aFileName format: aLoadImageFormat [
	^ self ffiCall: #(GtOpenCVImage* cvLoadImage(String aFileName, int aLoadImageFormat))
]

{ #category : #'accessing platform' }
GtOpenCvImgCodecs >> unixModuleName [
	^ self detectLibrary: 'libopencv_imgcodecs.so'
]
