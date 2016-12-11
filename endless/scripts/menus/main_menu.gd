extends Node2D

func _ready():
	get_node("play").connect("pressed", self, "play")
	get_node("exit").connect("pressed", self, "exit")
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