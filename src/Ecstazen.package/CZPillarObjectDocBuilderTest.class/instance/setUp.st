tests
setUp

	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / self class bibFileNameForTest)
		writeStreamDo: [ :stream | 
			stream nextPutAll: self class bibContentsForTest ]