tests
testVisitTransformer
	| wiki doc |
	wiki := '!! Heading
	${publications:Ducasse|bibFile=rmod.bib}$'.
	doc := PRPillarParserMain parse: wiki. 
	PRPublicationsTransformer new start: doc. 
	self halt.