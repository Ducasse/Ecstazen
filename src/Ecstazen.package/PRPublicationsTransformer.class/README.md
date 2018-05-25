Right now I replace 

${publications:....}$
By document group composed of a list of sections themselves containing list of bibitems.


| wiki doc |
wiki := '!! List of Publications
	Here is my list of publications...
	
${publications:Ducasse|bibFile=rmod.bib}$

If you are interested, do not hesitate to contact me'.
doc := PRPillarParser parse: wiki. 
PRPublicationsTransformer new start: doc. 
doc.
PRXHTMLWriter write: doc