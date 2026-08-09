extends Area3D


@export var rotation_speed := 3.0
#In case the bills are of different amounts, this one is 5 dollars
@export var money_value := 5

func _ready() -> void:
	GlobalAutoload.xray.connect(xray)

func _process(delta: float) -> void:
	#Cosmetic rotation
	rotate_y(rotation_speed * delta)

func _on_body_entered(_body: Node3D) -> void:
	#Execute code on the autoload
	GlobalAutoload.money += money_value
	#Destroys itself after being collected
	queue_free()

func xray():
	var overlay_mat = $MeshInstance3D.material_overlay
	if overlay_mat is ShaderMaterial:
		overlay_mat.set_shader_parameter("enabled", true)
