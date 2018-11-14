"
I build Pillar object model instead of plain text (HTML, latex...)
"
Class {
	#name : #CZPillarObjectDocBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'testingFileSystem'
	],
	#category : 'Ecstazen-Citezen'
}

{ #category : #accessing }
CZPillarObjectDocBuilderTest class >> bibContentsForTest [

	^ '@inproceedings{Denk08b,
  Annote       = {internationalconference},
  Author       = {Marcus Denker and Mathieu Suen and St\''ephane
                  Ducasse},
  Booktitle    = {Proceedings of TOOLS EUROPE 2008},
  peer	       = {yes},
  pages	       = {218--237},
  aeres	       = {ACT},
  aeresstatus  = {aeres12},
  inria	       = {RMOD},
  selectif     = {non},
  ISSN	       = {1865-1348},
  Keywords     = {scg-pub jb08 fb08 snf08 reflectivity},
  labo 		= {dans},
  Publisher    = {Springer-Verlag},
  Series       = {LNBIP},
  Url	       = {http://scg.unibe.ch/archive/papers/Denk08bMetaContextLNBIP.pdf},
  Title	       = {Blablabbbablla },
  Year	       = {2008}
}

@inproceedings{Denk08c,
  Annote       = {internationalconference},
  Author       = {Marcus Denker and Mathieu Suen and St\''ephane
                  Ducasse},
  Booktitle    = {Proceedings of TOOLS EUROPE 2008},
  peer	       = {yes},
  pages	       = {218--237},
  aeres	       = {ACT},
  aeresstatus  = {aeres12},
  inria	       = {RMOD},
  selectif     = {non},
  ISSN	       = {1865-1348},
  Keywords     = {scg-pub jb08 fb08 snf08 reflectivity},
  labo 		= {dans},
  Publisher    = {Springer-Verlag},
  Series       = {LNBIP},
  Volume       = 11,
  Doi	       = {10.1007/978-3-540-69824-1_13},
  Url	       = {http://scg.unibe.ch/archive/papers/Denk08bMetaContextLNBIP.pdf},
  Title	       = {The Meta in Meta-object Architectures},
  hal          = {inria-00271286,p56w09p},
  Year	       = {2008}
}

@article{Duca10a,
Annote       = {internationaljournal},
author = {St\''ephane Ducasse and Damien Pollet},
title = {Fingerprints},
journal = {Journal of Information System},
year = {2010}
}

@inproceedings{Abde08a,
Annote       = {internationalconference},
author = {Hani Abdeen and Ilham Alloui and St\''ephane Ducasse and Damien Pollet and Mathieu Suen},
title = {Package Reference Fingerprint: a Rich and Compact Visualization to Understand Package Relationships},
booktitle = {European Conference on Software Maintenance and Reengineering (CSMR)},
pages = {213--222},
publisher = {IEEE Computer Society Press},
year = {2008},
acceptnum = {24},
accepttotal = {87}
}


@article{Duca10a,
Annote       = {internationaljournal},
author = {St\''ephane Ducasse and Damien Pollet},
title = {Fingerprints},
journal = {Journal of Information System},
  Url	       = {obsoleteData.pdf},
year = {2010}
}

@book{Duca11a,
Annote       = {book},
author = {St\''ephane Ducasse},
title = {Whatever},
year = {2011}
}

'
]

{ #category : #tests }
CZPillarObjectDocBuilderTest class >> bibFileNameForTest [
	^ 'rmod.bib'
]

{ #category : #accessing }
CZPillarObjectDocBuilderTest class >> bibset [
	^ CZBibParser parse: self bibContentsForTest
]

{ #category : #tests }
CZPillarObjectDocBuilderTest >> setUp [

	super setUp.
	testingFileSystem := FileSystem memory workingDirectory.
	(testingFileSystem / self class bibFileNameForTest)
		writeStreamDo: [ :stream | 
			stream nextPutAll: self class bibContentsForTest ]
]

{ #category : #tests }
CZPillarObjectDocBuilderTest >> testBuilderCreateSection [
	| builder |
	builder := CZPillarObjectDocBuilder new 
					bibset: self class bibset;
					authorMatchingString: '*Ducasse*';
					build.
	
	self assert: builder document children size equals: 3.
	
	
]

{ #category : #tests }
CZPillarObjectDocBuilderTest >> testSelectingSections [
	| builder |
	builder := CZPillarObjectDocBuilder new 
					bibset: self class bibset;
					authorMatchingString: '*Ducasse*';
					bodySpecification: #( #internationalConference #internationalJournal #topConference);
					build.
	
	self assert: builder document children size equals: 2.
	"we get only 2 and not 3 because book is not in the list"
			
	
]

{ #category : #tests }
CZPillarObjectDocBuilderTest >> testUsingFileNamed [
	| builder |
	builder := CZPillarObjectDocBuilder new
					workingDirectory: testingFileSystem;
					fileNamed: self class bibFileNameForTest;
					authorMatchingString: '*Ducasse*';
					bodySpecification: #( #internationalConference #internationalJournal #topConference);
					build.
	
	self assert: builder document children size equals: 2.
	"we get only 2 and not 3 because book is not in the list"
			
	
]
