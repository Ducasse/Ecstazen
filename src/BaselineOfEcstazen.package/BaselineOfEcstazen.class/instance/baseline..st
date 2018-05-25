baselines
baseline: spec
	<baseline>
	spec
		baseline: 'Citezen'
		with: [ spec repository: 'github://Ducasse/Citezen/src' ].
	spec
		baseline: 'Pillar'
		with: [ spec repository: 'github://pillar-markup/pillar/src:dev-7' ].
	
	spec
		for: #pharo
		do: [ 
			spec
				package: 'Ecstazen' with: [ spec requires: #('Citezen' 'Pillar') ].
		 ]