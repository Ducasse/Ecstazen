visiting
visitEntry: anEntry

	| fields fieldsText |
	fields := anEntry fieldSortedFollowingKeys: fieldOrder.
	"else I could have a PRBibEntry but I do not know the impact
	on the visitor."
	fieldsText := String streamContents: [ :s | fields do: [:f | s nextPutAll: f value ] separatedBy: [s nextPutAll: ', ']].
	document add: (PRListItem new 
							propertyAt: #citationEntry put: #citationEntry ; 
							add: (PRText content: fieldsText))
	