extends Node3D

@export var voice_requirement := 200.0

@onready var player: CharacterBody3D = $"../Player"

var speed = 5

func _process(delta: float) -> void:
	position = position.move_toward(player.global_position,delta * speed)
	position.y = 0
	look_at(player.global_position)
	rotation.x = 0
	
	if GlobalAutoload.player_vision == $Face and GlobalAutoload.voice >= 100:
		speed = -10
	else : 
		speed = 5
