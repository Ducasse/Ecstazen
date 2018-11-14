Extension { #name : #PRVisitor }

{ #category : #'*Ecstazen' }
PRVisitor >> visitBibItem: anItem [
	"by default visiting a bibItem is just visiting a document item"
	self visitListItem: anItem
]

{ #category : #'*Ecstazen' }
PRVisitor >> visitBibItemList: anItem [
	"by default visiting a list bibItem is just visiting an ordered list"
	self visitOrderedList: anItem
]

{ #category : #'*Ecstazen' }
PRVisitor >> visitPublications: aPRPublicationAnnotation [ 
	self visitAnnotation: aPRPublicationAnnotation
]

{ #category : #'*Ecstazen' }
PRVisitor >> visitPublicationsAnnotation: aPRPublicationAnnotation [ 
	self visitAnnotation: aPRPublicationAnnotation
]
