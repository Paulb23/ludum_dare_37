extends Area2D

func _ready():
	connect("area_enter", self, "body_enter")
	pass

func body_enter(body):
	get_parent().play_next();

