*Ecstazen
visitBibItem: anItem
	canvas tag
		name: 'li';
		with:
				[ "to give a try. 
				localisattion is probably missing" 
				(CZHTMLGenerator new visitEntryBody: anItem czentry) outputStream contents ].
	canvas newLine