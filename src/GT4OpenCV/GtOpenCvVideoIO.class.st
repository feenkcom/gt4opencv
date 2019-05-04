Class {
	#name : #GtOpenCvVideoIO,
	#superclass : #GtOpenCVLibrary,
	#category : #GT4OpenCV
}

{ #category : #'as yet unclassified' }
GtOpenCvVideoIO >> createCameraCapture: index [
	^ self ffiCall: #(void* cvCreateCameraCapture (int index))
]

{ #category : #'accessing platform' }
GtOpenCvVideoIO >> moduleName [
	^ 'libopencv_videoio.4.1.0'
]
