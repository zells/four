as yet unclassified
drawOn: aCanvas
	super drawOn: aCanvas.
	brushes collect: [ :brush | 
		brush value: aCanvas value: (self bounds).
	]