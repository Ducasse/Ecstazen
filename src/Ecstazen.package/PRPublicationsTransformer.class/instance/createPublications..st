visiting
createPublications: aPRPublicationAnnotation
	
	^ CZPillarObjectDocBuilder new 
			new
			fileNamed: 'rmod.bib';
			authorMatchingString: '*Ducasse*';
			generate