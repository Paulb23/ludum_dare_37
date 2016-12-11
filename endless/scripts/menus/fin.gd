extends Node2D

func _ready():
	get_node("menu").connect("pressed", self, "menu")
	get_node("exit").connect("pressed", self, "exit")
	pass

func menu():
	var voice = get_node("SamplePlayer").play("menu_click")
	while get_node("SamplePlayer").is_voice_active(voice):
		pass
	get_node("/root/globals").set_scene("res://menus/main_menu.tscn")
	pass

func exit():
	var voice = get_node("SamplePlayer").play("menu_click")
	while get_node("SamplePlayer").is_voice_active(voice):
		pass
	get_tree().quit()
	pass