I'm a document builder generating pillar objects.

Here are the customization points expressed as messages:

	- keysOfBlackListedEntries: aCollection of bib keys
	- english/french
	- authorMatchingString: 'Ducasse'
	
	- doNotAllowEmptySections
	- setFilteringOn (default) to debug setFileringOff
	- bodySpecification: defaul is #(#PhDAndHabilitation #internationalJournal #nationalJournal #topConference #internationalConference  #nationalConference #invitedPaper #bookChapter #book #editor #internationalWorkshop #toolDemo #vulgarisation)
	

Right now the field order is hardcoded as #(#author #title #chapter #journal #booktitle #volume #pages #publisher #school #year #url #doi)