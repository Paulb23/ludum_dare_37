extends Node2D

var start_game = true
var loading = false;

func _ready():
	set_fixed_process(true);
	get_node("door").open();
	get_node("edoor").close();
	pass

func _fixed_process(delta):
	if start_game:
		get_node("player").reset = true
		start_game = false;

func load_next():
	if not loading:
		get_node("player").exited = true
		get_node("door").close();
		get_node("edoor").open();
		loading = true

func play_next():
	if loading:
		get_node("edoor").close();
		loading = true