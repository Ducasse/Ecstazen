building
addEntitledSection: aString withBibEntries: entries

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