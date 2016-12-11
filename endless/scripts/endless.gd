extends Node2D

var levels = [
	preload("res://scenes/levels/blank.tscn"),
	preload("res://scenes/levels/level_2.tscn"),
	preload("res://scenes/levels/level_4.tscn"),
	preload("res://scenes/levels/level_3.tscn"),
	preload("res://scenes/levels/blank.tscn")
]

var player_start = Vector2(288, 480)

var level = 2;
var start_game = false
var start_ending = false
var loading = false;
var playing = true

func _ready():
	set_fixed_process(true);
	get_node("door").close();
	get_node("edoor").close();
	reload()
	play_next()
	pass

func _fixed_process(delta):
	if start_game == false:
		get_node("player").canMove = false
		get_node("story").show()
		get_node("story").show_opening()
		get_node("edoor").close();
	if start_ending == true:
		start_game = true
		get_node("player").canMove = false
		get_node("player").moving = false
		get_node("story").show()
		get_node("story").show_ending()

func ending_finished():
	get_node("/root/globals").set_scene("res://menus/fin.tscn")

func opening_finshed():
	get_node("story").hide()
	start_game = true;
	get_node("Camera2D").set_zoom(Vector2(1,1))
	get_node("Camera2D").set_pos(Vector2(550,240))
	get_node("player").canMove = true

func load_next():
	if not loading:
		level+=1;
		if level >= levels.size():
			get_node("door").close();
			get_node("edoor").open();
			get_node("the_room/SamplePlayer").play("level_load")
			get_node("the_room/level").free()
			get_node("the_room").add_child(levels[0].instance())
			get_node("door").close();
			get_node("edoor").open();
			loading = true
			playing = false
			return

		get_node("the_room/SamplePlayer").play("level_load")
		get_node("the_room/level").free()
		get_node("the_room").add_child(levels[level].instance())
		get_node("door").close();
		get_node("edoor").open();
		loading = true
		playing = false

func play_next():
	if loading and not playing:
		get_node("edoor").close();
		loading = false
		playing = true

		if level >= levels.size():
			get_node("Camera2D").set_zoom(Vector2(0.5,0.5))
			get_node("Camera2D").set_pos(Vector2(250,550))
			get_node("player").set_pos(player_start);
			get_node("player").speed = 0
			get_node("player").moving = false
			start_ending = true;

func reload():
	if playing:
		get_node("the_room/level").free()
		get_node("the_room").add_child(levels[level].instance())
		get_node("door").close();
		get_node("edoor").open();
		get_node("player").moving = false;
		get_node("player").set_pos(player_start);

func open_door():
	get_node("door").open()

func close_door():
	get_node("door").close()