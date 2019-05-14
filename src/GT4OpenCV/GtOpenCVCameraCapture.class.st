Class {
	#name : #GtOpenCVCameraCapture,
	#superclass : #FFIExternalObject,
	#category : #'GT4OpenCV-!OpenCV'
}

{ #category : #'opencv - api' }
GtOpenCVCameraCapture >> captureFrame [
	<return: #GtOpenCVImage>
	
	^ GtOpenCvVideoIO uniqueInstance queryFrame: self
]

{ #category : #'gt-inspector-extension' }
GtOpenCVCameraCapture >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [ (GtOpenCVCameraElement on: self) asScalableElement ]
]
