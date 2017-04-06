as yet unclassified
receive: aSignal
	aSignal at: #target ifPresent: [ :target |
		target = identity ifTrue: [ behaviour value: aSignal ]
	]