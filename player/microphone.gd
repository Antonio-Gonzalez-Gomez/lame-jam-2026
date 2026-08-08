extends AudioStreamPlayer

var capture: AudioEffectCapture
var volume := 0.0

func _ready():
	var bus_index = AudioServer.get_bus_index("Microphone")
	capture = AudioServer.get_bus_effect(bus_index, 0) as AudioEffectCapture


func _process(_delta):
	var frames = capture.get_frames_available()

	if frames > 0:
		var buffer = capture.get_buffer(frames)
		var sum := 0.0

		for sample in buffer:
			# Stereo sample: x = left, y = right
			var amplitude = (abs(sample.x) + abs(sample.y)) / 2.0
			sum += amplitude

		volume = sum / buffer.size() * 1000
		$"../HUD/ProgressBar".value = volume
		
