as yet unclassified
receive: signal
	super receive: signal.
	signal at: #target ifPresent: [ :target |
		(#turtle = target) ifTrue: [ self receiveTargeted: signal ]
	]