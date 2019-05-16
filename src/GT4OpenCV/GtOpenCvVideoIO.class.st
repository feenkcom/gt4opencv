Class {
	#name : #GtOpenCvVideoIO,
	#superclass : #GtOpenCVLibrary,
	#category : #'GT4OpenCV-Library'
}

{ #category : #'opencv -  api' }
GtOpenCvVideoIO >> createCameraCapture: anIndex [
	^ (self primCreateCameraCapture: anIndex) autoRelease
]

{ #category : #'opencv -  api' }
GtOpenCvVideoIO >> grabFrame: capture [
	^ self ffiCall: #(int cvGrabFrame (void* capture))
]

{ #category : #'private - ffi' }
GtOpenCvVideoIO >> primCreateCameraCapture: index [
	^ self ffiCall: #(GtOpenCVCameraCapture cvCreateCameraCapture (int index))
]

{ #category : #'private - ffi' }
GtOpenCvVideoIO >> primReleaseCapture: aCapture [
	^ self ffiCall: #(void cvReleaseCapture(void* aCapture))
]

{ #category : #'opencv -  api' }
GtOpenCvVideoIO >> queryFrame: capture [
	^ self ffiCall: #(GtOpenCVImage* cvQueryFrame (GtOpenCVCameraCapture capture))
]

{ #category : #'opencv -  api' }
GtOpenCvVideoIO >> releaseCapture: aCapture [
	self primReleaseCapture: aCapture pointer
]

{ #category : #'opencv -  api' }
GtOpenCvVideoIO >> setCaptureProperty: capture id: propertyId value: propertyValue [
	^ self ffiCall: #(void cvSetCaptureProperty (void* capture, int propertyId, double propertyValue))
]
