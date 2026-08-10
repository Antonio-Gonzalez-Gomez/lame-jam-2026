extends Control



# hardcoding cause I can't be bothered to do it the proper way

func _on_option_1_pressed() -> void:
	if GlobalAutoload.money >= 5:
		GlobalAutoload.speed_up.emit()
		GlobalAutoload.money -= 5
		$"Option 1".queue_free()

func _on_option_2_pressed() -> void:
	if GlobalAutoload.money >= 5:
		GlobalAutoload.strength_upgrade = true
		GlobalAutoload.money -= 5
		$"Option 2".queue_free()


func _on_option_3_pressed() -> void:
	if GlobalAutoload.money >= 20:
		GlobalAutoload.escape.emit()
		GlobalAutoload.money -= 20


func _on_option_4_pressed() -> void:
	if GlobalAutoload.money >= 5:
		GlobalAutoload.xray.emit()
		GlobalAutoload.money -= 5
		$"Option 4".queue_free()
