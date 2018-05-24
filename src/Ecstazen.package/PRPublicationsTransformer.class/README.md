Right now I replace 

${publications:....}$
By a list of section and list of item.

Now it may not be wise because during next step I will not be able to distinguish
bib entry from mere item. 

So I should introduce 
PRBibEntry. 


| wiki doc |
wiki := '!! Heading
${publications:Ducasse|bibFile=rmod.bib}$'.
doc := PRPillarParserMain parse: wiki. 
PRPublicationsTransformer new start: doc. 
self halt.