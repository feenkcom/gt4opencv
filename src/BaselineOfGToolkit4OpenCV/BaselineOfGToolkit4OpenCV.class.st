Class {
	#name : #BaselineOfGToolkit4OpenCV,
	#superclass : #BaselineOf,
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
				preLoadDoIt: #preLoadGToolkit.
			
			spec
				package: 'GT4OpenCV'
				with: [ spec requires: #('LibTensorFlowPharoBinding' ) ] ]
]

{ #category : #baselines }
BaselineOfGToolkit4OpenCV >> preLoadGToolkit [
	self class environment
		at: #BaselineOfGToolkit
		ifAbsent: [
			Metacello new
				baseline: 'GToolkit';
				repository: 'github://feenkcom/gtoolkit/src';
				load ]
]
