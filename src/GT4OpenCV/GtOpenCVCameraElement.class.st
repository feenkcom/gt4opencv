Class {
	#name : #GtOpenCVCameraElement,
	#superclass : #BlElement,
	#instVars : [
		'video',
		'capture',
		'image',
		'updater',
		'filters'
	],
	#category : #GT4OpenCV
}

{ #category : #drawing }
GtOpenCVCameraElement >> drawOnSpartaCanvas: aCanvas [
	| surface |
	
	super drawOnSpartaCanvas: aCanvas.

	image ifNil: [ ^ self ].

	surface := aCanvas bitmap
		fromBGR: image imageData
		extent: image width @ image height
		stride: image widthStep.

	aCanvas fill
		paint: surface;
		path: surface bounds;
		draw
]

{ #category : #initialization }
GtOpenCVCameraElement >> filter: aFilter [
	filters add: aFilter
]

{ #category : #initialization }
GtOpenCVCameraElement >> initialize [
	super initialize.
	
	video := GtOpenCvVideoIO uniqueInstance.
	capture := video createCameraCapture: 0.
	filters := OrderedCollection new.
	
	updater := self newTask
]

{ #category : #initialization }
GtOpenCVCameraElement >> newTask [
	^ BlRepeatedTaskAction new
		delay: 0;
		action: [
			image := video queryFrame: capture.
			filters do: [ :aFilter | image := aFilter value: image ].
			
			self size: image width @ image height.
			self invalidate ]
]

{ #category : #initialization }
GtOpenCVCameraElement >> onAddedToSceneGraph [
	super onAddedToSceneGraph.
	
	self dequeueTask: updater.
	self enqueueTask: (updater := self newTask)
]

{ #category : #initialization }
GtOpenCVCameraElement >> onRemovedFromSceneGraph [
	super onRemovedFromSceneGraph.
	
	updater stop.
	self dequeueTask: updater
]
