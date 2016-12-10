extends Node2D

var player_pushed = false

func _ready():
	get_node("Area2D").connect("body_enter", self, "button_pressed")
	get_node("Area2D").connect("body_exit", self, "collision_end")
	get_node("Area2D").connect("area_enter", self, "button_pressed")
	get_node("Area2D").connect("area_exit", self, "button_pressed")
	player_pushed = false

func button_pressed(body):
	if body.get_name() == "player":
		player_pushed = true
	get_parent().level_complete()
	get_node("button").set_frame(1)

func collision_end(body):
	if body.get_name() == "player" and player_pushed:
		player_pushed = false
		get_parent().level_not_complete()
		get_node("button").set_frame(0)