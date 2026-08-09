extends Node3D

@export var ammount := 5

var collectibles: Array[Node] = []

func _ready() -> void:
	collectibles = find_children("*", "Area3D")
	#Deletes random collectibles from the map to only have the set ammount
	collectibles.shuffle()
	collectibles.resize(ammount)
	GlobalAutoload.difficulty_inc = 1.0 / ammount
