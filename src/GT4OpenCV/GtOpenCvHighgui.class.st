Class {
	#name : #GtOpenCvHighgui,
	#superclass : #GtOpenCVLibrary,
	#category : #GT4OpenCV
}

{ #category : #'as yet unclassified' }
GtOpenCvHighgui >> destroyWindow: aString [
	^ self ffiCall: #(void cvDestroyWindow (String aString))
]

{ #category : #'accessing platform' }
GtOpenCvHighgui >> moduleName [
	^ 'libopencv_highgui.4.1.0'
]

{ #category : #'as yet unclassified' }
GtOpenCvHighgui >> namedWindow: aString [
	^ self ffiCall: #(void cvNamedWindow (String aString, 0))
]

{ #category : #'as yet unclassified' }
GtOpenCvHighgui >> resizeWindow: aString width: width height: height [
	^ self ffiCall: #(void cvResizeWindow (String aString, int width, int height))
]
