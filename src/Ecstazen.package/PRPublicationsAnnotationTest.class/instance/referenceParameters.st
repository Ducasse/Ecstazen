private
referenceParameters
	^ OrderedDictionary new
		add: 'author' -> 'Ducasse';
		add: 'bibFile' -> 'rmod.bib';
		add: 'language' -> 'french';
		add: 'blackListed' -> '#(Foo)';
		yourself