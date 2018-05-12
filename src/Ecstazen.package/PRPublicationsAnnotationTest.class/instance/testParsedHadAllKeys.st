tests
testParsedHadAllKeys

	| annotation |
	annotation :=  (self parser parse:  '${' , self referenceString , '}$') children first children first.
	self assert: annotation language equals: 'french'.
	self assert: annotation bibFile equals: 'rmod.bib'.
	self assert: annotation author equals: 'Ducasse'.
	self assert: annotation blackListed equals: '#(Foo)'.