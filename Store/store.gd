extends Control



# hardcoding cause I can't be bothered to do it the proper way

func _on_option_1_pressed() -> void:
	if GlobalAutoload.money >= 10:
		GlobalAutoload.speed_up.emit()
		GlobalAutoload.money -= 10
		$"Option 1".queue_free()

func _on_option_2_pressed() -> void:
	if GlobalAutoload.money >= 10:
		GlobalAutoload.strength_upgrade = true
		GlobalAutoload.money -= 10
		$"Option 2".queue_free()


func _on_option_3_pressed() -> void:
	if GlobalAutoload.money >= 40:
		GlobalAutoload.escape.emit()
		GlobalAutoload.money -= 40
