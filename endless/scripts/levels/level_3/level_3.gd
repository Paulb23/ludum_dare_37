extends Node2D

func _ready():
	get_node("Area2D").connect("body_enter", self, "body_enter")
	var lights = get_node("lights")

	lights.get_node("light25").toggle()
	lights.get_node("light2").toggle()
	lights.get_node("light3").toggle()

	lights.get_node("light4").toggle()
	lights.get_node("light6").toggle()
	lights.get_node("light7").toggle()
	lights.get_node("light24").toggle()

	lights.get_node("light8").toggle()
	lights.get_node("light9").toggle()
	lights.get_node("light10").toggle()
	lights.get_node("light11").toggle()

	lights.get_node("light13").toggle()
	lights.get_node("light15").toggle()
	lights.get_node("light22").toggle()

	lights.get_node("light18").toggle()
	lights.get_node("light19").toggle()
	lights.get_node("light20").toggle()


func body_enter(body):
	var lights = get_node("lights")
	for l in lights.get_children():
		if l.on:
			get_node("SamplePlayer").play("button_fail");
			return
	get_parent().level_complete()
	get_node("button").set_frame(1)