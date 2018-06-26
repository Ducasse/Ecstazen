private
testExpansionIsWorking
	| doc documentGroup sections |
	doc := PRDocument new
				add:
				(PRPublicationsAnnotation new
					parameterAt: 'author' put: 'Ducasse';
					parameterAt: 'bibFile' put: 'rmod.bib';
					parameterAt: 'sections' put: #(#internationalConference #internationalJournal #topConference);
					yourself);
				yourself.
	"Pay attention that here the values should really be the values as created by the ${publications:... parser}$"
	
	((PRPublicationsTransformer withContext: (PRProject on: testingFileSystem )) start: doc).
	
	documentGroup := doc children first.
	sections := documentGroup children. 
	
	self assert: sections size equals: 2.
	self assert: sections first children second children size equals: 3.
	self assert: sections second children second children size equals: 2.
	self assert: sections first children first text equals: 'Refereed Articles in International Conferences'
	