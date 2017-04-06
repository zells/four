as yet unclassified
drawSignal: canvas
	| brushes |
	brushes := OrderedCollection newFrom: {
		(Dictionary newFrom: {0 -> #circle. #around -> position. #at -> 50} ).
		(Dictionary newFrom: {0 -> #circle. #around -> (position + (self delta: 55)). #at -> 10. #color -> Color blue} ).
	}.
	lines collect: [ :line | brushes add: (Dictionary newFrom: {
		0 -> #line.
		#from -> (line at: 1).
		#to -> (line at: 2)
	}) ].
	^ Dictionary newFrom: {#target -> canvas. 0 -> #draw. 1 -> brushes}