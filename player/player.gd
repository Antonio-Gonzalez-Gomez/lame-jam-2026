extends CharacterBody3D

@export var speed := 5.0
@export var mouse_sensitivity := 0.002
const GRAVITY := 9.8
@onready var cam = $CameraPoint
@onready var hud: CanvasLayer = $"../../../HUD"
@onready var villian: Node3D = $"../villian"
@onready var ray_cast_3d: RayCast3D = $CameraPoint/Camera3D/RayCast3D

func _ready() -> void:
	GlobalAutoload.speed_up.connect(speed_up)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	
	
	
	if event.is_action_pressed("open_store"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			hud.show_store()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else :
			hud.hide_store()
			var center = get_viewport().size / 2
			get_viewport().warp_mouse(center)
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if !(event is InputEventMouseMotion):
		return

	rotate_y(-event.relative.x * mouse_sensitivity)
	
	cam.rotate_x(-event.relative.y * mouse_sensitivity)
	cam.rotation.x = clamp(
		cam.rotation.x,
		deg_to_rad(-89),
		deg_to_rad(89)
	)

func _process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	var input_dir = Input.get_vector(
		"move_left",
		"move_right",
		"move_forward",
		"move_backward"
	)

	var direction = (
		transform.basis *
		Vector3(input_dir.x, 0, input_dir.y)
	).normalized()

	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = direction.x * 0
		velocity.z = direction.z * 0

	move_and_slide()

	if ray_cast_3d.is_colliding():
		GlobalAutoload.player_vision = ray_cast_3d.get_collider()
	else : GlobalAutoload.player_vision = null

func speed_up():
	speed += 2.5
