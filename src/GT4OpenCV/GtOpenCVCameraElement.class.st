Class {
	#name : #GtOpenCVCameraElement,
	#superclass : #BlElement,
	#instVars : [
		'image',
		'updater',
		'filters',
		'camera'
	],
	#category : #'GT4OpenCV-Elements'
}

{ #category : #'instance creation' }
GtOpenCVCameraElement class >> on: aCameraCapture [
	^ self basicNew
		camera: aCameraCapture;
		initialize
]

{ #category : #accessing }
GtOpenCVCameraElement >> camera: aCameraCapture [
	camera := aCameraCapture
]

{ #category : #drawing }
GtOpenCVCameraElement >> drawOnSpartaCanvas: aCanvas [
	| surface |
	
	super drawOnSpartaCanvas: aCanvas.

	(image isNil or: [ image isNull ])
		ifTrue: [ ^ self ].

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

	camera ifNil: [ camera := GtOpenCvVideoIO uniqueInstance createCameraCapture: 0 ].
	camera disableAutoExposure.

	filters := OrderedCollection new.
	
	updater := self newTask
]

{ #category : #initialization }
GtOpenCVCameraElement >> newTask [
	^ BlRepeatedTaskAction new
		delay: 16 milliSeconds;
		action: [
			image := camera captureFrame.
			image isNull
				ifTrue: [ self size: 0@0 ]
				ifFalse: [
					filters do: [ :aFilter | image := aFilter glamourValueWithArgs: { image . self } ].
					self size: image width @ image height ].
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
