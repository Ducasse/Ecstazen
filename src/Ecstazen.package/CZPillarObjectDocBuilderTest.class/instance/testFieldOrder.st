tests
testFieldOrder
	| builder entry1 |
	builder := CZPillarObjectDocBuilder new 
					bibset: self bibset;
					authorMatchingString: '*Ducasse*';
					fieldOrder: #(#title #author);
					bodySpecification: #( #internationalConference);
					build.
	
	self assert: builder document children size equals: 1.
	entry1 := builder document children first children second.
	self assert: entry1  equals: 1.
			
	