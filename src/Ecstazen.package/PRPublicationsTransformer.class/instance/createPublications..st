visiting
createPublications: aPRPublicationAnnotation
	
	^ CZPillarObjectDocBuilder new 
			workingDirectory: workingDirectory;
			fileNamed: (aPRPublicationAnnotation bibFile);
			authorMatchingString: '*', aPRPublicationAnnotation author, '*';
			setLanguage: (aPRPublicationAnnotation language asSymbol);
			keysOfBlackListedEntries: aPRPublicationAnnotation blackListed;
			bodySpecification:  aPRPublicationAnnotation sections;
			build;
			document