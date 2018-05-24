accessing
sections 

	^ self parameters at: #sections ifAbsent: [ '#(#internationalJournal #topConference #nationalJournal #internationalConference #nationalConference #invitedPaper #bookChapter #book #editor #internationalWorkshop #PhDAndHabilitation #toolDemo #vulgarisation)' ]