extends Node3D

@export var ammount := 8


var collectibles: Array[Node] = []

func _ready() -> void:
	collectibles = find_children("*", "Area3D")
	collectibles.shuffle()
	#Deletes random collectibles from the map to only have the set ammount
	var excess = collectibles.slice(ammount)
	for c in excess:
		c.queue_free()

	GlobalAutoload.difficulty_inc = 1.0 / ammount
