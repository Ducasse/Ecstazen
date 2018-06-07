tests
setUp

	super setUp.
	testingFileSystem := FileSystem memory.
	(testingFileSystem workingDirectory / self bibFileNameForTest)
		writeStreamDo: [ :stream | 
			stream nextPutAll: self bibContentsForTest ]