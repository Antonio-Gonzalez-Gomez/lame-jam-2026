extends StaticBody3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalAutoload.player_vision == self and GlobalAutoload.voice >= 100:
		queue_free()
