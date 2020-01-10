Class {
	#name : #GtTensorFlowHandDetector,
	#superclass : #Object,
	#instVars : [
		'smalltalkSession',
		'session',
		'image_tensor',
		'detection_boxes',
		'detection_scores',
		'detection_classes',
		'num_detections',
		'graph',
		'threshold'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'GT4OpenCV-Hand Detection'
}

{ #category : #accessing }
GtTensorFlowHandDetector class >> cleanUp [
	super cleanUp.
	uniqueInstance := nil
]

{ #category : #enumerating }
GtTensorFlowHandDetector class >> detect: anImage [
	^ self uniqueInstance detect: anImage
]

{ #category : #accessing }
GtTensorFlowHandDetector class >> uniqueInstance [
	^ (uniqueInstance isNotNil and: [  uniqueInstance isValid ])
		ifTrue: [ ^ uniqueInstance ]
		ifFalse: [ uniqueInstance := self new ]
]

{ #category : #enumerating }
GtTensorFlowHandDetector >> detect: anImage [
	<return: #GtTensorFlowDetectedObjects>
	| imageRGB image_tensor_value output scores rects objects |
	imageRGB := anImage toRGB.

	image_tensor_value := TensorFlowCAPI current
			newTensorType: TF_Tensor typeUInt8
			shape: (FFIExternalArray externalNewType: 'int64' fromArray: { 1 . imageRGB height . imageRGB width . imageRGB nChannels }) getHandle
			rank: 4
			data: imageRGB imageData
			length: imageRGB imageSize
			deallocator: nil
			args: nil.

	output := session
		runInputs: { image_tensor }
		values: { image_tensor_value }
		outputs: { detection_boxes . detection_scores . detection_classes . num_detections }.

	scores := Array streamContents: [ :aStream |
		output second asNumbers first withIndexDo: [ :eachScore :eachIndex |
			eachScore >= self threshold value
				ifTrue: [ aStream nextPut: eachScore -> eachIndex ] ] ].

	rects := output first asNumbers first.

	objects := GtTensorFlowDetectedObjects new.
	objects image: anImage.
	scores do: [ :eachAssociation |
		| left right top bottom eachBox eachScore |
		eachScore := eachAssociation key.
		eachBox := rects at: eachAssociation value.
		left := (eachBox at: 2) * imageRGB width.
		right := (eachBox at: 4) * imageRGB width.
		top := (eachBox at: 1) * imageRGB height.
		bottom := (eachBox at: 3) * imageRGB height.

		objects add: (GtTensorFlowDetectedObject new
			image: anImage;
			label: 'Hand';
			score: eachScore;
			area: ((left @ top) corner: right @ bottom)) ].
		
	^ objects
]

{ #category : #'gt-inspector-extension' }
GtTensorFlowHandDetector >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [
			| anElement |
			anElement := GtOpenCVCameraElement new.
			anElement filter: [ :anImage | anImage scaleBy: 0.5 ].
			anElement filter: (GtOpenCVTensorFlowFilter new detector: self); filter: #toBGR.
			anElement asScalableElement ]
]

{ #category : #initialization }
GtTensorFlowHandDetector >> initialize [
	super initialize.
	
	graph := TF_Graph fromBinaryFileNamed: (GtResourcesUtility resourceAtPath: Path * 'feenkcom' / 'gt4opencv' / 'models') fullName, '/frozen_inference_graph.pb'.

	image_tensor := TF_Input onOperation: (graph operationNamed: 'image_tensor') index: 0.
	detection_boxes := TF_Output onOperation: (graph operationNamed: 'detection_boxes') index: 0.
	detection_scores := TF_Output onOperation: (graph operationNamed: 'detection_scores') index: 0.
	detection_classes := TF_Output onOperation: (graph operationNamed: 'detection_classes') index: 0.
	num_detections := TF_Output onOperation: (graph operationNamed: 'num_detections') index: 0.

	threshold := 0.70.

	session := TF_Session on: graph.
	smalltalkSession := Smalltalk session
]

{ #category : #testing }
GtTensorFlowHandDetector >> isValid [
	^ Smalltalk session == smalltalkSession and: [ graph isNull not ]
]

{ #category : #accessing }
GtTensorFlowHandDetector >> threshold [
	^ threshold value
]

{ #category : #accessing }
GtTensorFlowHandDetector >> threshold: anObject [
	threshold := anObject
]
