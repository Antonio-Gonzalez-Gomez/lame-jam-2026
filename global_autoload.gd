extends Node

# Sends signal when money is added, for UI purposes and other scripted events 

var money := 0: 
	set(x):
		money = x
		collected_money.emit(money)

signal collected_money


@warning_ignore("unused_signal")
signal speed_up
@warning_ignore("unused_signal")
signal strength_up
@warning_ignore("unused_signal")
signal escape
