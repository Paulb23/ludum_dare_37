extends Area2D

func _ready():
	connect("body_enter", self, "body_enter")
	pass

func body_enter(body):
	get_parent().load_next();

