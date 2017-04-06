# zells (prototype four)

This is the fourth incarnation of a *zells* prototype, this time implemented with Squeak Smalltalk.

This one has an even simpler model, where messages are sent without receiver by *presenting* them to the Dish. A message is therefore reveived by all Zells which decide themselves whether and how to react to it.

## Installation

You need [Squeak] with [Metacello] installed. After you've cloned the project with [git], you can use the Monticello browser to load its content into your image.

[Squeak]: http://squeak.org/
[Metacello]: https://github.com/dalehenrich/metacello-work
[git]: https://git-scm.com/

## Usage 

To give it a spin execute the following code.

	"Create new dish with a turtle and canvas"
	dish := Dish new. 
	(dish add: (CanvasZell named: #one)) canvas openInWorld.
	dish add: ((TurtleZell named: #shelly) inside: dish).
	dish present: (Dictionary newFrom: {#target -> #shelly. 0 -> #canvas. #add -> #one }).

	"Send commands to the turtle"
	dish present: (Dictionary newFrom: {#target -> #shelly. 0 -> #go. #forward -> 100}).
	dish present: (Dictionary newFrom: {#target -> #shelly. 0 -> #turn. #right -> 30}).
	dish present: (Dictionary newFrom: {#target -> #shelly. 0 -> #reset}).

	"Make turtle draw a spiral"
	turn := (dish add: (NamedZell named: #turn)).
	count := 0.
	turn do: [ :m |
		| step |
		step := (m at: #step ifAbsent: [ 10 ]).
		(count < 200) ifTrue: [
			count := count + 1.
			dish present: (Dictionary newFrom: {#target -> #shelly. 0 -> #turn. #right -> 10. #then ->
				(Dictionary newFrom: {#target -> #shelly. 0 -> #go. #forward -> step. #then ->
					(Dictionary newFrom: {#target -> #turn. #step -> (step + 0.3)})})
			}).
		]
		ifFalse: [ count := 0 ]
	].

	dish present: (Dictionary newFrom: {#target -> #turtle. 0 -> #reset}).
	[ dish present: (Dictionary newFrom: {#target -> #turn}) ] fork.