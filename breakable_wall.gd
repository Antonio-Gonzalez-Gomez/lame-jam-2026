extends StaticBody3D



func _process(_delta: float) -> void:
	if GlobalAutoload.player_vision == self and GlobalAutoload.voice >= 200 and not $CollisionShape3D.disabled:
		death()

func death():
	$plank4/AnimationTree.active = true
	$plank3/AnimationTree.active = true
	$CollisionShape3D.disabled = true
