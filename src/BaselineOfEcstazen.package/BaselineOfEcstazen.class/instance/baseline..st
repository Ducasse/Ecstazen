baselines
baseline: spec
	<baseline>
	spec
		baseline: 'Citezen'
		with: [ spec repository: 'github://Ducasse/Citezen/src' ].
	spec
		baseline: 'Pillar'
		with: [ spec repository: 'github://pillar-markup/pillar/src' ].
	
	spec
		for: #pharo
		do: [ 
			spec
				package: 'Ecstazeb' with: [ spec requires: #('Citezen' 'Pillar') ].
		 ]