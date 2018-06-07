tests
testBuilderCreateSection
	| builder |
	builder := CZPillarObjectDocBuilder new 
					bibset: self class bibset;
					authorMatchingString: '*Ducasse*';
					build.
	
	self assert: builder document children size equals: 3.
	
	