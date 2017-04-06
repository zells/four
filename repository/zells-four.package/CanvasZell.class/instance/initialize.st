as yet unclassified
initialize
	scale := 5.
	canvas := BrushedCanvas new.
	canvas brushes: {}.
	canvas extent: (1000 / scale)@(1000 / scale).
	
	self do: [ :s | self receiveTargeted: s ]