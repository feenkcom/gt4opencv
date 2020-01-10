Class {
	#name : #BaselineOfGToolkit4OpenCVWithoutGT,
	#superclass : #BaselineOf,
	#classVars : [
		'PostLoaded'
	],
	#category : #BaselineOfGToolkit4OpenCVWithoutGT
}

{ #category : #baselines }
BaselineOfGToolkit4OpenCVWithoutGT >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
    			baseline: 'LibTensorFlowPharoBinding'
    			with: [ spec repository: 'github://PolyMathOrg/libtensorflow-pharo-bindings' ].
			
			spec
				postLoadDoIt: #postLoadGT4OpenCV.
			
			spec
				package: 'GT4OpenCV'
				with: [ spec requires: #('LibTensorFlowPharoBinding') ] ]
]

{ #category : #baselines }
BaselineOfGToolkit4OpenCVWithoutGT >> postLoadGT4OpenCV [
	(PostLoaded isNotNil and: [ PostLoaded ])
		ifTrue: [ ^ self ].

	PostLoaded := true.

	(self class environment at: #GtOpenCVLibrary) install.
"	(self class environment at: #GtTensorflowLibrary) install."
	
	(self class environment at: #TF_Structure) withAllSubclassesDo: #rebuildFieldAccessors.
	(self class environment at: #GtOpenCVStructure) withAllSubclassesDo: #rebuildFieldAccessors
]
