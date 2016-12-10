extends Node2D

var levels = [
	preload("res://scenes/levels/blank.tscn"),
	preload("res://scenes/levels/level_2.tscn"),
	preload("res://scenes/levels/level_3.tscn")
]

var level = 1;
var start_game = true
var loading = false;
var playing = true

func _ready():
	set_fixed_process(true);
	get_node("door").close();
	get_node("edoor").close();
	load_next()
	play_next()
	pass

func _fixed_process(delta):
	pass

func load_next():
	if not loading:
		get_node("the_room/level").free()
		get_node("the_room").add_child(levels[level].instance())
		get_node("door").close();
		get_node("edoor").open();
		loading = true
		playing = false
		level+=1;

func play_next():
	if loading and not playing:
		get_node("edoor").close();
		loading = false
		playing = true

func open_door():
	get_node("door").open()

func close_door():
	get_node("door").close()