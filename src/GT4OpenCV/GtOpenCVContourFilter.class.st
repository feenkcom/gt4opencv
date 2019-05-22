Class {
	#name : #GtOpenCVContourFilter,
	#superclass : #Object,
	#category : #'GT4OpenCV-Examples'
}

{ #category : #glamour }
GtOpenCVContourFilter >> glamourValueWithArgs: theArgs [
	| anImage anElement theContours maxContour aContainer aConvexHull |
	
	anImage := theArgs first.
	anElement := theArgs second.
	anElement removeChildNamed: #contour.
	
	aContainer := BlElement new.
	aContainer constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	theContours := anImage contours.
	maxContour := theContours detectMax: [ :each | each contour area ].
	maxContour
		ifNil: [ ^ anImage ].

	aConvexHull := maxContour contour convexHull.
	self paintConvexHull: aConvexHull in: aContainer.

	"aContainer addChild: (BlTextElement new
		padding: (BlInsets all: 5);
		text: (maxContour contour area asString asRopedText foreground: Color red);
		relocate: maxContour rectangle origin;
		size: maxContour rectangle extent;
		border: (BlBorder paint: Color red width: 1))."
		
	anElement addChild: aContainer as: #contour.

	^ anImage
]

{ #category : #'as yet unclassified' }
GtOpenCVContourFilter >> paintConvexHull: aConvexHull in: anElement [
	anElement addChild: (BlElement new
		geometry: (BlPolygon vertices: aConvexHull asPoints);
		background: (Color green alpha: 0.2);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ])
]
