as yet unclassified
receiveTargeted: m
	m at: 0 ifPresent: [ :selector  | 
		(#reset = selector) ifTrue: [
			self reset.
			self redraw.
		].
		(#go = selector) ifTrue: [
			m at: #forward ifPresent: [ :distance | self go: distance ].
			m at: #back ifPresent: [ :distance | self go: distance negated ].
			self redraw.
		].
		(#turn = selector) ifTrue: [
			m at: #right ifPresent: [ :angle | self turn: angle negated ].
			m at: #left ifPresent: [ :angle | self turn: angle ].
			self redraw.
		].
		(#canvas = selector) ifTrue: [
			m at: #add ifPresent: [ :canvas | self addCanvas: canvas ].
			self redraw.
		] .
	].
	m at: #then ifPresent: [ :then | dish present: then ].