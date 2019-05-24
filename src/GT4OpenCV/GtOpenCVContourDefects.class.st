Class {
	#name : #GtOpenCVContourDefects,
	#superclass : #GtOpenCVSeq,
	#category : #'GT4OpenCV-Structures'
}

{ #category : #'api - opencv' }
GtOpenCVContourDefects >> asDefects [
	<return: #Collection of: #Point>
	| theDefects |
	
	theDefects := GtOpenCVDefects new.

	(1 to: self total) do: [ :anIndex |
		theDefects add: (GtOpenCVConvexityDefectStruct fromHandle: (self at: anIndex) getHandle) asDefect ].
	
	^ theDefects
]
