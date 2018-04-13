visiting
accept: aVisitor
	"why on the class side"
	| builder document |
	builder := CZPillarNewDocBuilder new
		"perform: language asSymbol;" 
		fileNamed: (self outputDirectory / (self parameters at: #bibFile)) fullName;
		authorMatchingString: '*', (self parameters at: #author) ,'*';
		setFilteringOn;
		yourself.
	document := builder build document.
	builder generateFor: document on: aVisitor stream.
	
	