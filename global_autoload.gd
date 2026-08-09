extends Node


# Sends signal when money is added, for UI purposes and other scripted events 
var voice := 0.0
var strength_upgrade
var player_vision

var difficulty := 0.0
var difficulty_inc := 0.2

var money := 0: 
	set(x):
		money = x
		#Increase difficulty from 0 to 1 (depending on total number of collectibles)
		difficulty += difficulty_inc
		collected_money.emit(money)
		change_difficulty.emit()

signal collected_money
signal change_difficulty

func _ready() -> void:
	pass



@warning_ignore("unused_signal")
signal speed_up
@warning_ignore("unused_signal")
signal escape
