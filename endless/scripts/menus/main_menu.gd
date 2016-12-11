extends Node2D

func _ready():
	get_node("play").connect("pressed", self, "play")
	get_node("exit").connect("pressed", self, "exit")
	get_node("music_vol").connect("value_changed", self, "music_vol")
	get_node("sfx_vol").connect("value_changed", self, "sfx_vol")
	pass

func play():
	var voice = get_node("SamplePlayer").play("menu_click")
	while get_node("SamplePlayer").is_voice_active(voice):
		pass
	get_node("/root/globals").set_scene("res://scenes/endless.tscn")
	pass

func exit():
	var voice = get_node("SamplePlayer").play("menu_click")
	while get_node("SamplePlayer").is_voice_active(voice):
		pass
	get_tree().quit()
	pass

func music_vol(val):
	AudioServer.set_stream_global_volume_scale(val)
	pass

func sfx_vol(val):
	AudioServer.set_fx_global_volume_scale(val)
	pass