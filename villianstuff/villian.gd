extends Node3D

@onready var player: CharacterBody3D = $"../Player"

var speed = 5

func _process(delta: float) -> void:
	position = position.move_toward(player.global_position,delta * speed)
	position.y = 0
	look_at(player.global_position)
	rotation.x = 0
