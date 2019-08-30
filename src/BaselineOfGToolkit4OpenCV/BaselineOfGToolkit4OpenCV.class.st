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
    			baseline: 'GToolkit'
    			with: [ spec repository: 'github://feenkcom/gtoolkit/src' ].
			spec
    			baseline: 'LibTensorFlowPharoBinding'
    			with: [ spec repository: 'github://PolyMathOrg/libtensorflow-pharo-bindings' ].
			
			spec
				postLoadDoIt: #postLoadGT4OpenCV.
			
			spec
				package: 'GT4OpenCV'
				with: [ spec requires: #('GToolkit' 'LibTensorFlowPharoBinding') ] ]
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
