as yet unclassified
buildNodeFor: aPRPublications

	| builder document |
	builder := CZPillarNewDocBuilder new
		fileNamed: (self outputDirectory / (aPRPublications bibFile)) fullName;
		authorMatchingString: '*', (aPRPublications author) ,'*';
		setFilteringOn;
		yourself.
	document := builder build document.
	builder generateFor: document on: self stream.
	
	