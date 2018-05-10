tests
testThreeSections
	| builder |
	builder := CZPillarObjectDocBuilder new 
					bibset: self bibset;
					authorMatchingString: '*Ducasse*';
					bodySpecification: #( #internationalJournal #nationalJournal #topConference);
					build.
	
	self assert: builder document children size equals: 3.
			
	