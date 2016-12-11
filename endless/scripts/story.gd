extends Sprite

var show_opening = false
var opening_part = 0;

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	opening_part = 0
	pass

func _fixed_process(delta):
	if show_opening:
		if opening_part == 0:
			get_node("text").set_text("Uhhh...Whhaa....Where...Where..am I..!?!")
		if opening_part ==1:
			get_node("text").set_text("How..do I get..out of here!...")
		if opening_part == 2:
			get_parent().opening_finshed()

func _input(event):
	if show_opening:
		if event.type == InputEvent.MOUSE_BUTTON:
			if event.button_index == BUTTON_LEFT and event.pressed:
				opening_part += 1;

func show_opening():
	show_opening = true