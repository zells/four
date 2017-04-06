as yet unclassified
receiveTargeted: signal
	signal at: 0 ifPresent: [ :selector |
		(#draw = selector) ifTrue: [
			| brushes |
			brushes := OrderedCollection new.
			
			(signal at: 1) collect: [ :brush |
				brush at: 0 ifPresent:  [ :shape |
					(#circle = shape) ifTrue: [
						brushes add: [ :c :r |
							c fillOval: (Rectangle 
							            center: ((r origin + ((brush at: #around) / scale)) flipBy: #vertical centerAt: r center)
							            extent: ((brush at: #at) / scale * 2))
								color: (brush at: #color ifAbsent: [Color red]).
						]
					].
					(#line = shape) ifTrue: [
						brushes add: [ :c :r |
							c line: ((r origin + ((brush at: #from) / scale)) flipBy: #vertical centerAt: r center)
								to: ((r origin + ((brush at: #to) / scale)) flipBy: #vertical centerAt: r center)
								width: 1
								color: Color red.
						]
					].
				].
			].
			canvas brushes: brushes.
		]
	]