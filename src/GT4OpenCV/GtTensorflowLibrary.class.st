Class {
	#name : #GtTensorflowLibrary,
	#superclass : #Object,
	#category : #'GT4OpenCV-Library'
}

{ #category : #installation }
GtTensorflowLibrary class >> install [
	<script: 'self install'>
	| installer |

	installer := GtLibraryInstaller new.
	installer library: 'Tensorflow'.
	installer version: '1.13.1'.
	installer icon: (Form extent: 1@1 depth: 32).
	installer binary: 'libtensorflow'.
	installer url: 'https://dl.feenk.com/{library}/{platform}/{version}/{arch}/{binary}.{version}.{extension}'.

	installer run
]
