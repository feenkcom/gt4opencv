Class {
	#name : #BaselineOfGToolkit4OpenCV,
	#superclass : #BaselineOf,
	#classVars : [
		'PostLoaded'
	],
	#category : #BaselineOfGToolkit4OpenCV
}

{ #category : #baselines }
BaselineOfGToolkit4OpenCV >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
    			baseline: 'LibTensorFlowPharoBinding'
    			with: [ spec repository: 'github://PolyMathOrg/libtensorflow-pharo-bindings' ].
			
			spec
				preLoadDoIt: #preLoadGT4OpenCV;
				postLoadDoIt: #postLoadGT4OpenCV.
			
			spec
				package: 'GT4OpenCV'
				with: [ spec requires: #('LibTensorFlowPharoBinding' ) ] ]
]

{ #category : #baselines }
BaselineOfGToolkit4OpenCV >> postLoadGT4OpenCV [
	(PostLoaded isNotNil and: [ PostLoaded ])
		ifTrue: [ ^ self ].

	PostLoaded := true.

	(self class environment at: #GtOpenCVLibrary) install.
	(self class environment at: #GtTensorflowLibrary) install.
	
	(self class environment at: #TensorFlowCAPI) compile: 'macModuleName
	^ self detectLibrary: ''libtensorflow.dylib'''.
	
	(self class environment at: #TF_Structure) withAllSubclassesDo: #rebuildFieldAccessors.
	(self class environment at: #GtOpenCVStructure) withAllSubclassesDo: #rebuildFieldAccessors
]

{ #category : #baselines }
BaselineOfGToolkit4OpenCV >> preLoadGT4OpenCV [
	"Make sure we have GT installed"
	self class environment
		at: #BaselineOfGToolkit
		ifAbsent: [
			Metacello new
				baseline: 'GToolkit';
				repository: 'github://feenkcom/gtoolkit/src';
				load ]
]
