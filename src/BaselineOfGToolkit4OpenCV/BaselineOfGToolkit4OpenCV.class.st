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
    			with: [ spec repository: 'github://syrel/libtensorflow-pharo-bindings:TF_NewTensor' ].
			spec package: 'GT4OpenCV' with: [ spec requires: #('LibTensorFlowPharoBinding' ) ] ]
]
