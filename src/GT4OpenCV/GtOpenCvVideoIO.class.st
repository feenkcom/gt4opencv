Class {
	#name : #GtOpenCvVideoIO,
	#superclass : #GtOpenCVLibrary,
	#category : #GT4OpenCV
}

{ #category : #'as yet unclassified' }
GtOpenCvVideoIO >> createCameraCapture: index [
	^ self ffiCall: #(void* cvCreateCameraCapture (int index))
]

{ #category : #'as yet unclassified' }
GtOpenCvVideoIO >> grabFrame: capture [
	^ self ffiCall: #(int cvGrabFrame (void* capture))
]

{ #category : #'as yet unclassified' }
GtOpenCvVideoIO >> queryFrame: capture [
	^ self ffiCall: #(GtOpenCVIplImage* cvQueryFrame (void* capture))
]

{ #category : #'as yet unclassified' }
GtOpenCvVideoIO >> releaseCapture: capture [
	^ self ffiCall: #(void cvReleaseCapture (void* capture))
]

{ #category : #'as yet unclassified' }
GtOpenCvVideoIO >> setCaptureProperty: capture id: propertyId value: propertyValue [
	^ self ffiCall: #(void cvSetCaptureProperty (void* capture, int propertyId, double propertyValue))
]
