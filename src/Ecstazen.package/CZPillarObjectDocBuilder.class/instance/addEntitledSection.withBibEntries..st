building
addEntitledSection: aString withBibEntries: entries

	| section |
	section := PRSection new add:
					(PRHeader new
						level: 1;
						add: (PRText content: aString);
						yourself).
	doc add: section.
	entries do: [ :each | section add: (PRBibItem new czentry: each) ]. 