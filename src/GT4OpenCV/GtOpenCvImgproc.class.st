Class {
	#name : #GtOpenCvImgproc,
	#superclass : #GtOpenCVLibrary,
	#category : #GT4OpenCV
}

{ #category : #'as yet unclassified' }
GtOpenCvImgproc >> cvtColorSrc: aSourceImage dest: aDestinationImage to: aFormat [
	^ self ffiCall: #(void cvCvtColor (GtOpenCVImage* aSourceImage, GtOpenCVImage* aDestinationImage, int aFormat))
]
