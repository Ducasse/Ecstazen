Class {
	#name : #PRPublicationsAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Ecstazen-Pillar'
}

{ #category : #testing }
PRPublicationsAnnotationTest class >> isAbstract [
	^ false
]

{ #category : #private }
PRPublicationsAnnotationTest >> actualClass [
	^PRPublicationsAnnotation
]

{ #category : #private }
PRPublicationsAnnotationTest >> referenceParameters [
	"Pay attention the order is important"
	^ OrderedDictionary new
		add: 'author' -> 'Ducasse';
		add: 'bibFile' -> 'rmod.bib';
		add: 'language' -> 'french';
		add: 'blackListed' -> #(Foo);
		add: 'sections' -> #(internationalConference);
		yourself
]

{ #category : #private }
PRPublicationsAnnotationTest >> referenceString [
	^ 'publications:author=Ducasse|bibFile=rmod.bib|language=french|blackListed=#(#Foo)|sections=#(#internationalConference)'
]

{ #category : #tests }
PRPublicationsAnnotationTest >> testParsedHadAllKeys [

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: annotation language equals: 'french'.
	self assert: annotation bibFile equals: 'rmod.bib'.
	self assert: annotation author equals: 'Ducasse'.
	self assert: annotation blackListed equals: #(#Foo).
]
