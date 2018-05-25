tests
testVisitAnnotation

	| item dictionary |
	item := PRDocument new
		add:
			(PRPublicationsAnnotation new
				parameterAt: 'author' put: 'Ducasse';
				parameterAt: 'bibFile' put: 'rmod.bib';
				yourself);
		yourself.
	self
		assert:
			(PRPublicationsTransformer new
				start: item)
		equals: dictionary