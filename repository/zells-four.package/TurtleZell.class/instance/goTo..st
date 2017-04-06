as yet unclassified
goTo: aPoint
	((0@0 extent: 1000@1000) containsPoint: aPoint) ifTrue: [
		lines add:{position. aPoint}.
		position := aPoint.
	]