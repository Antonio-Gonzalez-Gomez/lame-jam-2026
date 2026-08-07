extends Area3D

@export var rotation_speed := 3.0
#In case the bills are of different ammounts, this one is 5 dollars
@export var money_value := 5

func _process(delta: float) -> void:
	#Cosmetic rotation
	rotate_y(rotation_speed * delta)

func _on_body_entered(body: Node3D) -> void:
	#Execute code on the player
	body.collect_money(money_value)
	#Destroys itself after being collected
	queue_free()
