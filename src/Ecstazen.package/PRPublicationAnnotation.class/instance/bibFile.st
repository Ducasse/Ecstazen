accessing
bibFile

	^ self parameters at: #bibFile ifAbsent: [ 'publication.bib' ]