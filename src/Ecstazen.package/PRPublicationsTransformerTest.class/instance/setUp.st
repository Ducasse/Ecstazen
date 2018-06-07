private
setUp

	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / CZPillarObjectDocBuilderTest bibFileNameForTest)
		writeStreamDo: [ :stream | 
			stream nextPutAll: CZPillarObjectDocBuilderTest bibContentsForTest ]