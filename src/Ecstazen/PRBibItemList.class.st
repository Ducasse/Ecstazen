"
I'm a list of bibitems. My children are bibitem.

"
Class {
	#name : #PRBibItemList,
	#superclass : #PRList,
	#category : 'Ecstazen-Pillar'
}

{ #category : #testing }
PRBibItemList class >> isAbstract [
	^ false
]

{ #category : #visiting }
PRBibItemList >> accept: aVisitor [

	aVisitor visitBibItemList: self.
]
