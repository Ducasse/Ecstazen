visiting
createPublications: aPRPublicationAnnotation
	
	^ CZPillarObjectDocBuilder new 
			fileNamed: (aPRPublicationAnnotation bibFile);
			authorMatchingString: '*', aPRPublicationAnnotation author, '*';
			setLanguage: (aPRPublicationAnnotation language asSymbol);
			keysOfBlackListedEntries: (Array readFromString: (aPRPublicationAnnotation blackListed));
			bodySpecification:  (Array readFromString: (aPRPublicationAnnotation sections));
			build;
			document