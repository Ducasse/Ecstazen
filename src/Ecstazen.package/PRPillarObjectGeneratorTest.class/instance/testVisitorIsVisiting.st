tests
testVisitorIsVisiting

	| tmp |
	tmp := PRPillarObjectGenerator new visit: (CZSet fromDeclarations: entries).
	self halt.