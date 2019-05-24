Class {
	#name : #GtOpenCVDefect,
	#superclass : #Object,
	#instVars : [
		'start',
		'end',
		'far',
		'depth'
	],
	#category : #'GT4OpenCV-!Core'
}

{ #category : #accessing }
GtOpenCVDefect >> angle [
	"Angle in degrees between of this defect"
	<return: #Number>
	| aStartVector anEndVector |
	
	aStartVector := (self start - self far) asBlocVector normalized.
	anEndVector := (self end - self far) asBlocVector normalized.
	
	^ (aStartVector dotProduct: anEndVector) arcCos radiansToDegrees
]

{ #category : #converting }
GtOpenCVDefect >> asPoints [
	^ {
		self start.
		self far.
		self end }
]

{ #category : #accessing }
GtOpenCVDefect >> depth [
	^ depth
]

{ #category : #accessing }
GtOpenCVDefect >> depth: anObject [
	depth := anObject
]

{ #category : #accessing }
GtOpenCVDefect >> end [
	^ end
]

{ #category : #accessing }
GtOpenCVDefect >> end: anObject [
	end := anObject
]

{ #category : #accessing }
GtOpenCVDefect >> far [
	^ far
]

{ #category : #accessing }
GtOpenCVDefect >> far: anObject [
	far := anObject
]

{ #category : #extensions }
GtOpenCVDefect >> gtInfoFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Info' translated;
		priority: 10;
		items: [ { 
			'Start' -> self start.
			'End' -> self end.
			'Far' -> self far.
			'Depth' -> self depth.
			'Angle' -> self angle
		} ];
		column: 'Key' do: [:aColumn | 
			aColumn item: [ :each | each key asString ]; matchParent ];
		column: 'Value' do: [:aColumn |
			aColumn item: [ :each | each value gtDisplayString ]; matchParent ];
		send: #value
]

{ #category : #'as yet unclassified' }
GtOpenCVDefect >> isUp [
	<return: #Boolean>

	^ self start y < self far y
		and: [ self end y < self far y ]
]

{ #category : #accessing }
GtOpenCVDefect >> start [
	^ start
]

{ #category : #accessing }
GtOpenCVDefect >> start: anObject [
	start := anObject
]
