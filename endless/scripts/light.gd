extends Area2D

signal toggled

var on = false

func _ready():
	connect("body_enter", self, "body_enter")
	pass

func body_enter(body):
	emit_signal("toggled")
	toggle()

func toggle():
	get_node("SamplePlayer").play("light")
	if on :
		get_node("Sprite").set_frame(0)
		on = false
	else:
		get_node("Sprite").set_frame(1)
		on = true