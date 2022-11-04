"
A RSAngleLineLayout locates all the elements following an angle
"
Class {
	#name : #RSAngleLineLayout,
	#superclass : #RSAbstractLineLayout,
	#category : #'Roassal3-Layouts-Core'
}

{ #category : #'initialize-release' }
RSAngleLineLayout >> initialize [
	super initialize.
	angle := self defaultAngle
]

{ #category : #'overrides' }
RSAngleLineLayout >>doExecute: [
doExecute: elements 
	| pointer  |
	pointer := self positionOriginalPointer.
	elements do: [ :element |
		translator translateTopLeftOf: element to: pointer.
		pointer := self 
			movePointer: pointer 
		]
]

{ #category : #hook }
RSAngleLineLayout >> movePointer: pointer  [
	^  pointer setX: self angle asFloat degreesToRadians cos 
             setY: self angle asFloat degreesToRadians sin
]

{ #category : #hook }
RSAngleLineLayout >> positionOriginalPointer [ 
	^ (0) @ (0)
]
