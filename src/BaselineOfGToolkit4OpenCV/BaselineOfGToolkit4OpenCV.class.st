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
		do: [ spec package: 'GT4OpenCV' ]
]
