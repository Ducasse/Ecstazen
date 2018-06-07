tests
testUsingFileNamed
	| builder |
	builder := CZPillarObjectDocBuilder new
					workingDirectory: testingFileSystem;
					fileNamed: self class bibFileNameForTest;
					authorMatchingString: '*Ducasse*';
					bodySpecification: #( #internationalConference #internationalJournal #topConference);
					build.
	
	self assert: builder document children size equals: 2.
	"we get only 2 and not 3 because book is not in the list"
			
	