Class {
	#name : #GtOpenCvImgproc,
	#superclass : #GtOpenCVLibrary,
	#category : #GT4OpenCV
}

{ #category : #'as yet unclassified' }
GtOpenCvImgproc >> cvtColorSrc: aSourceImage dest: aDestinationImage to: aFormat [
	^ self ffiCall: #(void cvCvtColor (GtOpenCVImage* aSourceImage, GtOpenCVImage* aDestinationImage, int aFormat))
]

{ #category : #'as yet unclassified' }
GtOpenCvImgproc >> resizeSrc: aSourceImage dest: aDestinationImage using: anInterpolator [
	^ self ffiCall: #(void cvResize (GtOpenCVImage* aSourceImage, GtOpenCVImage* aDestinationImage, int anInterpolator))
]

{ #category : #'as yet unclassified' }
GtOpenCvImgproc >> thresholdSrc: aSourceImage dest: aDestinationImage threshold: threshold max: aMaxValue type: thresholdType [
	^ self ffiCall: #(void cvThreshold (
		GtOpenCVImage* aSourceImage,
		GtOpenCVImage* aDestinationImage,
		double threshold,
		double aMaxValue,
		int thresholdType))
]
