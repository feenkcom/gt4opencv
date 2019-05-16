Trait {
	#name : #TGtOpenCVObject,
	#category : #'GT4OpenCV-Library'
}

{ #category : #finalization }
TGtOpenCVObject classSide >> finalizeResourceData: aHandle [
	
	self release: aHandle
]

{ #category : #'private - ffi' }
TGtOpenCVObject classSide >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	^ self explicitRequirement
]

{ #category : #finalization }
TGtOpenCVObject classSide >> release: aHandle [

	aHandle isNull
		"A handle may already be null, if garbage collector did his job before us :) "
		ifTrue: [ ^ self ].

	self warning: [ '(release) Ptr: ', aHandle value asString ].
	self primRelease: aHandle pointer.
	aHandle beNull
]

{ #category : #debug }
TGtOpenCVObject classSide >> warning: aMessageBlock [ 
	"| message |

	message := '[', self name asString ,'] ', aMessageBlock value.

	Transcript show: message; cr"
]

{ #category : #'initialize-release' }
TGtOpenCVObject >> autoRelease [
	FFIExternalResourceManager addResource: self
]

{ #category : #'initialize-release' }
TGtOpenCVObject >> release [

	self class release: self resourceData.
	
	"#release is sent manually, so we want to make sure that resource is no longer
	added to weak registry - performance improvement"
	(FFIExternalResourceManager uniqueInstance instVarNamed: #registry) remove: self ifAbsent: [ ]
]
