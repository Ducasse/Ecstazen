"
Right now I replace 

${publications:....}$
By document group composed of a list of sections themselves containing list of bibitems.


| wiki doc |
wiki := '!! List of Publications
	Here is my list of publications...
	
${publications:Ducasse|bibFile=rmod.bib}$

If you are interested, do not hesitate to contact me'.
doc := PRPillarParser parse: wiki. 
PRPublicationsTransformer new start: doc. 
doc.
PRXHTMLWriter write: doc
"
Class {
	#name : #PRPublicationsTransformer,
	#superclass : #PRNodeTransformer,
	#instVars : [
		'workingDirectory'
	],
	#category : 'Ecstazen-Pillar'
}

{ #category : #'instance-creation' }
PRPublicationsTransformer class >> withContext: aContext [

	| inst |
	inst := super withContext: aContext.
	inst workingDirectory: aContext baseDirectory.
	^ inst
]

{ #category : #visiting }
PRPublicationsTransformer >> createPublications: aPRPublicationAnnotation [
	
	^ CZPillarObjectDocBuilder new 
			workingDirectory: workingDirectory;
			fileNamed: (aPRPublicationAnnotation bibFile);
			authorMatchingString: '*', aPRPublicationAnnotation author, '*';
			setLanguage: (aPRPublicationAnnotation language asSymbol);
			keysOfBlackListedEntries: aPRPublicationAnnotation blackListed;
			bodySpecification:  aPRPublicationAnnotation sections;
			build;
			document
]

{ #category : #visiting }
PRPublicationsTransformer >> errorMessageAsDocumentEntities: aString [

	^ PRParagraph with: (PRText content: aString)
	
]

{ #category : #initialization }
PRPublicationsTransformer >> initialize [

	super initialize.
	workingDirectory := FileSystem workingDirectory
]

{ #category : #visiting }
PRPublicationsTransformer >> visitPublicationsAnnotation: aPRPublicationAnnotation [
	
	| entity |
	entity := [ (self createPublications: aPRPublicationAnnotation) ]
		on: FileDoesNotExistException  
		do: [ :ex | self errorMessageAsDocumentEntities: 'Pillar does not find the file: ', ex fileName asString, '. Check your bibFile= specification. The file publications.bib is the one lookup by default by Ecstazen.' ].
	self replace: { entity }
	
]

{ #category : #accessing }
PRPublicationsTransformer >> workingDirectory: aFileReference [

	workingDirectory := aFileReference 
]
