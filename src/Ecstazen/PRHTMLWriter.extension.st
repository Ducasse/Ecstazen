Extension { #name : #PRHTMLWriter }

{ #category : #'*Ecstazen' }
PRHTMLWriter >> visitBibItem: anItem [
	canvas tag
		name: 'li';
		with: (CZHTMLGenerator new visitEntryBody: anItem czentry) outputStream contents.
	canvas newLine
]
