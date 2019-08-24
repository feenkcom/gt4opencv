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
			spec package: 'GT4OpenCV' with: [ spec requires: #('LibTensorFlowPharoBinding' ) ] ]
]
