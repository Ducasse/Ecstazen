"
I'm just a special item wrapping a citezen entry. 
Since pillar uses the parser to identify which item to render (based on - #...)

It is unclear that I should subclass one of the item class. 
"
Class {
	#name : #PRBibItem,
	#superclass : #PRListItem,
	#instVars : [
		'czentry'
	],
	#category : 'Ecstazen-Pillar'
}

{ #category : #testing }
PRBibItem class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRBibItem >> accept: aVisitor [

	aVisitor visitBibItem: self.
]

{ #category : #accessing }
PRBibItem >> czentry [
	^ czentry
]

{ #category : #accessing }
PRBibItem >> czentry: anObject [
	czentry := anObject
]
