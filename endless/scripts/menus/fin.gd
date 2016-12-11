extends Node2D

func _ready():
	get_node("menu").connect("pressed", self, "menu")
	get_node("exit").connect("pressed", self, "exit")
	pass

func menu():
	get_node("/root/globals").set_scene("res://menus/main_menu.tscn")
	pass

func exit():
	get_tree().quit()
	pass