extends Node3D

@export var voice_requirement := 200.0

@onready var player: CharacterBody3D = $"../Player"
@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D


var scare_meter := 0.0
var scare_requirement := 0.9
var speed = 5.0

func _ready() -> void:
	await get_tree().physics_frame

func _physics_process(delta: float) -> void:
	nav_agent.target_position = player.global_position
	
	if GlobalAutoload.player_vision == $Face and GlobalAutoload.voice >= 100:
		speed = 0
		scare_meter += delta
		if scare_meter >= scare_requirement:
			position = Vector3(-7,1,-47)
			scare_meter = 0
			scare_requirement += 0.15
	else:
		speed = 5.0
		scare_meter -= delta/5
		if scare_meter < 0: scare_meter = 0

	var current_pos = global_position
	var next_pos = nav_agent.get_next_path_position()
	var direction = current_pos.direction_to(next_pos)

	global_position += direction * speed * delta
	global_position.y = 1
	
	look_at(player.global_position)
	rotation.x = 0
