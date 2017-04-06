as yet unclassified
initialize
	canvases := Set new.
	self reset.
	self do: [ :m | 
		self receiveTargeted: m.
	]