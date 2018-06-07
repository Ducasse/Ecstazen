*Ecstazen
visitBibItem: anItem
	canvas tag
		name: 'li';
		with: (CZHTMLGenerator new visitEntryBody: anItem czentry) outputStream contents.
	canvas newLine