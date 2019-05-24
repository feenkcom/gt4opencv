Class {
	#name : #GtOpenCVConvexityDefectStruct,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_DEPTH',
		'OFFSET_DEPTH_POINT',
		'OFFSET_END',
		'OFFSET_START'
	],
	#category : #'GT4OpenCV-Structures'
}

{ #category : #'field definition' }
GtOpenCVConvexityDefectStruct class >> fieldsDesc [
	"
	self rebuildFieldAccessors
	"
	^ #(
		"point of the contour where the defect begins"
		GtOpenCVPoint* start
		"point of the contour where the defect ends"
		GtOpenCVPoint* end
		"the farthest from the convex hull point within the defect"
		GtOpenCVPoint* depth_point
		"distance between the farthest point and the convex hull"
		float depth
	)
]

{ #category : #converting }
GtOpenCVConvexityDefectStruct >> asDefect [
	^ GtOpenCVDefect new
		start: self start asPoint;
		end: self end asPoint;
		far: self depth_point asPoint;
		depth: self depth
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexityDefectStruct >> depth [
	"This method was automatically generated"
	^handle floatAt: OFFSET_DEPTH
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexityDefectStruct >> depth: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_DEPTH put: anObject
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexityDefectStruct >> depth_point [
	"This method was automatically generated"
	^GtOpenCVPoint fromHandle: (handle pointerAt: OFFSET_DEPTH_POINT)
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexityDefectStruct >> depth_point: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DEPTH_POINT put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexityDefectStruct >> end [
	"This method was automatically generated"
	^GtOpenCVPoint fromHandle: (handle pointerAt: OFFSET_END)
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexityDefectStruct >> end: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_END put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexityDefectStruct >> start [
	"This method was automatically generated"
	^GtOpenCVPoint fromHandle: (handle pointerAt: OFFSET_START)
]

{ #category : #'accessing structure variables' }
GtOpenCVConvexityDefectStruct >> start: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_START put: anObject getHandle.
]
