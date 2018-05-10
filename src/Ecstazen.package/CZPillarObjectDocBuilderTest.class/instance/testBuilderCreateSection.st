tests
testBuilderCreateSection
	| builder |
	builder := CZPillarObjectDocBuilder new 
					bibset: self bibset;
					authorMatchingString: '*Ducasse*';
					build.
	
	self assert: builder document children size equals: 13.
	
	