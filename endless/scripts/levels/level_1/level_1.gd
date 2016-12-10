extends Node2D

func _ready():
	get_node("Area2D").connect("body_enter", self, "body_enter")

func body_enter(body):
	get_parent().level_complete()
	get_node("button").set_frame(1)