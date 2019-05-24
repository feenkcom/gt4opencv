Class {
	#name : #GtOpenCVContourTree,
	#superclass : #Collection,
	#instVars : [
		'children',
		'storage',
		'image'
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
GtOpenCVContourTree >> add: newObject [ 
	"Include newObject as one of the receiver's elements. Answer newObject. 
	ArrayedCollections cannot respond to this message."

	self addChild: newObject
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

{ #category : #adding }
GtOpenCVContourTree >> asElement [
	| aContainer theContourElements |
	
	aContainer := BlElement new.
	aContainer size: self image extent.

	theContourElements := Array streamContents: [ :aStream |
		self allContoursDo: [ :eachContourNode |
			| eachContourElement |
			
			eachContourElement := eachContourNode asElement.
			eachContourElement relocate: eachContourNode origin.
			
			aStream nextPut: eachContourElement ] ].
	
	aContainer addChildren: theContourElements.
	^ aContainer
]

{ #category : #accessing }
GtOpenCVContourTree >> children [
	^ children
]

{ #category : #enumerating }
GtOpenCVContourTree >> do: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument."

	self allContoursDo: aBlock
]

{ #category : #'gt-inspector-extension' }
GtOpenCVContourTree >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 10;
		stencil: [ (self asElement background: self image asForm; asScalableElement) margin: (BlInsets all: 20) ]
]

{ #category : #'gt-inspector-extension' }
GtOpenCVContourTree >> gtTreeFor: aView [
	<gtView>
	
	^ aView mondrian
		title: 'Tree';
		painting: [ :aMondrian | self paintTreeWith: aMondrian ]
]

{ #category : #accessing }
GtOpenCVContourTree >> image [
	<return: #GtOpenCVImage>

	^ image
]

{ #category : #accessing }
GtOpenCVContourTree >> image: anOpenCVImage [
	image := anOpenCVImage
]

{ #category : #initialization }
GtOpenCVContourTree >> initialize [
	super initialize.

	children := OrderedCollection new
]

{ #category : #accessing }
GtOpenCVContourTree >> max [
	^ self detectMax: #area
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

{ #category : #removing }
GtOpenCVContourTree >> remove: oldObject ifAbsent: anExceptionBlock [ 
	"Remove oldObject from the receiver's elements. If several of the 
	elements are equal to oldObject, only one is removed. If no element is 
	equal to oldObject, answer the result of evaluating anExceptionBlock. 
	Otherwise, answer the argument, oldObject. ArrayedCollections cannot 
	respond to this message."

	self shouldNotImplement
]

{ #category : #accessing }
GtOpenCVContourTree >> root [
	^ self
]

{ #category : #accessing }
GtOpenCVContourTree >> storage [
	^ storage
]

{ #category : #accessing }
GtOpenCVContourTree >> storage: anObject [
	storage := anObject
]
