extends Node3D

@export var voice_requirement := 200.0
@export var base_speed := 1.0
@export var max_speed := 4.0
@export var base_scare_requirement := 0.15
@export var max_scare_requirement := 1.0

@onready var player: CharacterBody3D = $"../Player"
@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D

@onready var spawn_location: Node3D = $"../Map/Spawn location"
@onready var spawn_location_2: Node3D = $"../Map/Spawn location 2"

var scare_meter := 0.0
var speed = base_speed
var scare_requirement = base_scare_requirement

func _ready() -> void:
	await get_tree().physics_frame
	GlobalAutoload.change_difficulty.connect(reset_stats)

func _physics_process(delta: float) -> void:
	nav_agent.target_position = player.global_position
	
	if GlobalAutoload.player_vision == $Face and GlobalAutoload.voice >= 200:
		nav_agent.target_position = position
		scare_meter += delta
		if scare_meter >= scare_requirement:
			position = get_farthest_spawn().position
			reset_stats()
			scare_meter = 0
			#speed = 3 + ((speed - 3)/3)
			#scare_requirement += 0.1
	else:
		scare_meter -= delta/5
		if scare_meter < 0: scare_meter = 0
		if scare_meter == 0:
			speed += 0.15 * delta

	var current_pos = global_position
	var next_pos = nav_agent.get_next_path_position()
	var direction = current_pos.direction_to(next_pos)

	global_position += direction * speed * delta
	global_position.y = 1
	
	look_at(player.global_position)
	rotation.x = 0

func get_farthest_spawn() -> Node3D:
	var dist1 = player.global_position.distance_squared_to(spawn_location.global_position)
	var dist2 = player.global_position.distance_squared_to(spawn_location_2.global_position)
	
	if dist1 > dist2:
		return spawn_location
	else:
		return spawn_location_2
		
func reset_stats() -> void:
	speed = base_speed + (max_speed - base_speed) * GlobalAutoload.difficulty
	scare_requirement = base_scare_requirement + (max_scare_requirement - base_scare_requirement) * GlobalAutoload.difficulty
