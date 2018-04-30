tests
testVisitAnnotation

	| item dictionary |
	self halt. 
	item := PRDocument new
		add:
			(PRPublicationAnnotation new
				parameterAt: 'author' put: 'Ducasse';
				parameterAt: 'bibFile' put: 'rmod.bib';
				yourself);
		yourself.
	dictionary := Dictionary with: 'foo' -> 1.
	self
		assert:
			(self actualInstance
				start: item)
		equals: dictionary