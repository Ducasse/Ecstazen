*Ecstazen
entryBody: anItem
	
	| aField outputStream |
	aField isURL
		ifTrue: [ outputStream nextPutAll: '<a href="' ].
	aField isDoi
		ifTrue: [ outputStream nextPutAll: '<a href="http://dx.doi.org/' ].
	aField dispatchVisitor: self.
	aField isURL
		ifTrue: [ outputStream nextPutAll: '">PDF</a>' ].
	aField isDoi
		ifTrue: [ outputStream nextPutAll: '">DOI</a>' ].
	outputStream nextPutAll: '</span>'