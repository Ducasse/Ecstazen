visiting
createPublications: aPRPublicationAnnotation
	
	^ CZPillarObjectDocBuilder new 
			new
			fileNamed: (aPRPublicationAnnotation bibFile);
			authorMatchingString: '*', aPRPublicationAnnotation author, '*';
			document