"
I'm a document builder generating pillar objects.

Here are the customization points expressed as messages:

	- keysOfBlackListedEntries: aCollection of bib keys
	- english/french
	- authorMatchingString: '*', 'Ducasse', '*'
	- allowEmptySections / doNotAllowEmptySections (default)
	- setFilteringOn (default) to debug setFileringOff
	- bodySpecification: defaul is #(#PhDAndHabilitation #internationalJournal #nationalJournal #topConference #internationalConference  #nationalConference #invitedPaper #bookChapter #book #editor #internationalWorkshop #toolDemo #vulgarisation)
	

Right now the field order is hardcoded as #(#author #title #chapter #journal #booktitle #volume #pages #publisher #school #year #url #doi)
"
Class {
	#name : #CZPillarObjectDocBuilder,
	#superclass : #CZBodyDocBuilder,
	#category : 'Ecstazen-Citezen'
}

{ #category : #building }
CZPillarObjectDocBuilder >> addEntitledSection: aString withBibEntries: entries [

	| section list |
	section := PRSection new.
	doc add: section.
	"not sure that this is the right structure"
	section add:
		(PRHeader new
					level: 1;
					add: (PRText content: aString);
					yourself).
	list := PRBibItemList new.
	section add: list. 
	entries do: [ :each | list add: (PRBibItem new czentry: each) ]. 
]

{ #category : #hooks }
CZPillarObjectDocBuilder >> rootDocumentClass [
	^ PRDocumentGroup
]
