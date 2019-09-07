"
I represent an annotation for a list of publications. 

	${publications|author=Ducasse|bibFile=rmod.bib}$
	
I will be expanded into a list of sections sorted publications.

Here are the possible parameters:
	author mandatory
	bibFile the name of the file containing the bib
	blackListed a collection of the keys that should ignored.
	language the language
	sections by default #(#internationalJournal #topConference #nationalJournal #internationalConference #nationalConference #invitedPaper #bookChapter #book #editor #internationalWorkshop #PhDAndHabilitation #toolDemo #vulgarisation)
	
Implementation notes

I use the specific pillar object doc builder extension (CZPillarObjectDocBuilder) for Citezen

"
Class {
	#name : #PRPublicationsAnnotation,
	#superclass : #PRAbstractAnnotation,
	#category : #'Ecstazen-Pillar'
}

{ #category : #visiting }
PRPublicationsAnnotation class >> accept: aVisitor [
	"why on the class side"
	| builder document |
	builder := CZPillarNewDocBuilder new
		"perform: language asSymbol;" 
		fileNamed: (self outputDirectory / (self parameters at: #bibFile)) fullName;
		authorMatchingString: '*', (self parameters at: #author) ,'*';
		setFilteringOn;
		yourself.
	document := builder build document.
	builder generateFor: document on: aVisitor stream.
	
	
]

{ #category : #accessing }
PRPublicationsAnnotation class >> defaultParameterName [
	"So that we can define ${publications:Ducasse}$ instead of ${publications:author=Ducasse}$ "
	
	^ 'author'
]

{ #category : #accessing }
PRPublicationsAnnotation class >> possibleParameters [
	^ #(author bibFile blackListed language sections)
]

{ #category : #accessing }
PRPublicationsAnnotation class >> tag [
	^ #publications
]

{ #category : #visiting }
PRPublicationsAnnotation >> accept: aVisitor [

	aVisitor visitPublicationsAnnotation: self
]

{ #category : #accessing }
PRPublicationsAnnotation >> author [ 

	^ self parameters at: #author
]

{ #category : #accessing }
PRPublicationsAnnotation >> bibFile [

	^ self parameters at: #bibFile ifAbsent: [ 'publications.bib' ]
]

{ #category : #accessing }
PRPublicationsAnnotation >> blackListed [

	^ self parameters at: #blackListed ifAbsent: [ #() ]
]

{ #category : #accessing }
PRPublicationsAnnotation >> language [

	^ self parameters at: #language ifAbsent: [ #english ]
]

{ #category : #accessing }
PRPublicationsAnnotation >> sections [ 

	^ self parameters at: #sections ifAbsent: [ #(#internationalJournal #topConference #nationalJournal #internationalConference #nationalConference #invitedPaper #bookChapter #book #editor #internationalWorkshop #PhDAndHabilitation #toolDemo #vulgarisation) ]
]
