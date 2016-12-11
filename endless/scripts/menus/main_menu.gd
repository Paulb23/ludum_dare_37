extends Node2D

func _ready():
	get_node("play").connect("pressed", self, "play")
	get_node("exit").connect("pressed", self, "exit")
	pass

func play():
	get_node("/root/globals").set_scene("res://scenes/endless.tscn")
	pass

func exit():
	get_tree().quit()
	pass