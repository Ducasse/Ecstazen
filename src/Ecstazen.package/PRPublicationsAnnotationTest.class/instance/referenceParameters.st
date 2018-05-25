private
referenceParameters
	"Pay attention the order is important"
	^ OrderedDictionary new
		add: 'author' -> 'Ducasse';
		add: 'bibFile' -> 'rmod.bib';
		add: 'language' -> 'french';
		add: 'blackListed' -> '#(Foo)';
		add: 'sections' -> '#(internationalConference)';
		yourself