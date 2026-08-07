extends CharacterBody3D

@export var speed := 5.0
@export var mouse_sensitivity := 0.002

const GRAVITY := 9.8
@onready var cam = $CameraPoint

func _ready() -> void:
	#Lock cursor for camera movement
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	#Esc to show the cursor and close the game window
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	#There is probably a better way to register mouse event input than using this function and this condition
	if !(event is InputEventMouseMotion):
		return

	#Rotate the player horizontally
	rotate_y(-event.relative.x * mouse_sensitivity)
	
	#Rotate its head (camera point) vertically
	cam.rotate_x(-event.relative.y * mouse_sensitivity)
	cam.rotation.x = clamp(
		cam.rotation.x,
		deg_to_rad(-89),
		deg_to_rad(89)
	)

func _process(delta: float) -> void:
	#Falling down
	if not is_on_floor():
		velocity.y -= GRAVITY * delta

	#Wasd movement
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
	#We can change this later to give the player inertia but meh
	else:
		velocity.x = direction.x * 0
		velocity.z = direction.z * 0

	move_and_slide()
