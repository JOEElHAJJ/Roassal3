"
A RSAngleLineLayout locates all the elements following an angle
"
Class {
	#name : #RSAngleLineLayout,
	#superclass : #RSAbstractLineLayout,
	#instVars : [
		'angle'
	],
	#category : #'Roassal3-Layouts-Core'
}

{ #category : #hook }
RSAngleLineLayout >> angle [
^ angle
]

{ #category : #hook }
RSAngleLineLayout >> angle:anAngle [
 angle:=anAngle .
]

{ #category : #hook }
RSAngleLineLayout >> defaultAngle [
^ 90  .
]

{ #category : #hook }
RSAngleLineLayout >> doExecute: elements [

	| originalCenter radius gap ang |
	originalCenter := self positionOriginalPointer.
	radius := 0.
	gap := self gapSize.
	ang := self angle degreesToRadians .
	elements do: [ :element |
		| point | 
		point := (ang cos @ ang sin ) * radius .
		translator translateTopLeftOf: element to: originalCenter + point.
		radius := radius + gap ]
]

{ #category : #hook }
RSAngleLineLayout >> initialize [
	super initialize.
	angle:= self defaultAngle .

]

{ #category : #hook }
RSAngleLineLayout >> movePointer: pointer [ 
	^  pointer setX: self angle asFloat degreesToRadians cos 
             setY: self angle asFloat degreesToRadians sin
]

{ #category : #hook }
RSAngleLineLayout >> positionOriginalPointer [
	^ (0) @ (0)
]
