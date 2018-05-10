tests
test
	| builder |
	builder := CZPillarObjectDocBuilder new 
					fileNamed: 'rmod.bib';
					authorMatchingString: '*Ducasse*';
					build.
	
	self assert: builder document children size > 0.
	self halt. 			
	