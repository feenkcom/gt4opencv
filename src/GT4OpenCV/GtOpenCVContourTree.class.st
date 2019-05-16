Class {
	#name : #GtOpenCVContourTree,
	#superclass : #Object,
	#instVars : [
		'children'
	],
	#category : #'GT4OpenCV-!OpenCV'
}

{ #category : #'instance creation' }
GtOpenCVContourTree class >> fromOpenCVContour: anOpenCVContour [
	| aRoot |

	aRoot := self new.

	self
		processNode: (GtOpenCVContourTreeNode fromOpenCVContour: anOpenCVContour)
		ofContour: anOpenCVContour
		in: aRoot.

	^ aRoot
]

{ #category : #'instance creation' }
GtOpenCVContourTree class >> processNode: aTreeNode ofContour: anOpenCVContour in: aParentTreeNode [
	"h_next is a sibling
	v_next is a child"

	"if we have a sibling of aTreeNode we should add it to aParentTreeNode"
	anOpenCVContour h_next isNull
		ifFalse: [
			| nextSiblingContour nextSiblingNode |
			nextSiblingContour := GtOpenCVContour fromHandle: anOpenCVContour h_next getHandle.
			nextSiblingNode := GtOpenCVContourTreeNode fromOpenCVContour: nextSiblingContour.
			aParentTreeNode addChild: nextSiblingNode.
		
			"h_next does not change current parent"
			self processNode: nextSiblingNode ofContour: nextSiblingContour in: aParentTreeNode ].

	"if aTreeNode has a child we should add it to aTreeNode"
	anOpenCVContour v_next isNull
		ifFalse: [
			| nextChildContour nextChildNode |
			
			nextChildContour := GtOpenCVContour fromHandle: anOpenCVContour v_next getHandle.
			nextChildNode := GtOpenCVContourTreeNode fromOpenCVContour: nextChildContour.

			aTreeNode addChild: nextChildNode.
			
			"v_next changes current parent"
			self processNode: nextChildNode ofContour: nextChildContour in: nextChildNode ].
]

{ #category : #adding }
GtOpenCVContourTree >> addChild: aNode [
	children add: aNode.
	aNode parent: self
]

{ #category : #accessing }
GtOpenCVContourTree >> allContoursDo: aBlock [
	self children do: [ :each | each allContoursDo: aBlock ]
]

{ #category : #accessing }
GtOpenCVContourTree >> children [
	^ children
]

{ #category : #'gt-inspector-extension' }
GtOpenCVContourTree >> gtTreeFor: aView [
	<gtView>
	
	^ aView mondrian
		title: 'Tree';
		painting: [ :aMondrian | self paintTreeWith: aMondrian ]
]

{ #category : #initialization }
GtOpenCVContourTree >> initialize [
	super initialize.

	children := OrderedCollection new
]

{ #category : #'gt-inspector-extension' }
GtOpenCVContourTree >> paintTreeWith: view [
	view nodes
		shape: [ :each | 
			BlElement new 
				when: BlClickEvent do: [:event | event target fireEvent: (GtPhlowObjectToSpawn new object: each; sourceElement: event target)];
				zIndex: 10;
				geometry: BlEllipse new;
				border: (BlBorder paint: Color black width: 1);
				background: ((each isKindOf: BlAttributeRope) ifTrue: [ Color orange ] ifFalse: [ Color white ]);
				size: 10@10 ];
		with: (self deepCollect: #children).
	view edges
		shape: [ :each | BlLineElement new border: (BlBorder paint: (Color gray alpha: 0.5) width: 1 ) ];
		connectToAll: #children.
	view layout custom: (GtGradNorthHierarchicalLayout new)
]

{ #category : #accessing }
GtOpenCVContourTree >> parent [
	^ nil
]
