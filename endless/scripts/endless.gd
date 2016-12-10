extends Node2D

var start_game = true
var loading = false;
var playing = true

func _ready():
	set_fixed_process(true);
	get_node("door").close();
	get_node("edoor").close();
	pass

func _fixed_process(delta):
	if not start_game:
		start_game = false;
		playing = true

func load_next():
	if not loading:
		get_node("door").close();
		get_node("edoor").open();
		loading = true
		playing = false

func play_next():
	if loading and not playing:
		get_node("edoor").close();
		loading = false
		playing = true

func open_door():
	get_node("door").open()