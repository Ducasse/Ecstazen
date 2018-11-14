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

{ #category : #initialization }
PRPublicationsTransformer >> initialize [

	super initialize.
	workingDirectory := FileSystem workingDirectory
]

{ #category : #visiting }
PRPublicationsTransformer >> visitPublicationsAnnotation: aPRPublicationAnnotation [
	
	self replace: {(self createPublications: aPRPublicationAnnotation)}
	
]

{ #category : #accessing }
PRPublicationsTransformer >> workingDirectory: aFileReference [

	workingDirectory := aFileReference 
]
