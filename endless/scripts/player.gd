extends KinematicBody2D

const MOVE_UP = 0
const MOVE_DOWN = 1
const MOVE_LEFT = 2
const MOVE_RIGHT = 3
const MOVE_NONE = 4

var moving = false
var speed = 10
var time_to_move = 15;

var starting_pos = get_pos()
var target_pos = get_pos();
var actual_pos = get_pos();

var start_at = Vector2(384, 352);

var reset = false
var exited = false

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	get_node("Area2D").connect("body_enter", self, "collision")
	get_node("Area2D").connect("body_exit", self, "collision_end")
	starting_pos = get_pos()
	pass

func _fixed_process(delta):

	# ugly but Meh!
	for i in range(0, time_to_move):
		if get_pos().distance_to(actual_pos) <= 0.1:
			moving = false

		if !moving:
			var direction = handle_direction_input()

			if direction != MOVE_NONE:
				move_player(direction)
		if moving:
			var motion = get_pos() - target_pos;
			motion = motion.normalized()
			motion = motion * delta * speed
			move(motion)
	pass

func collision(body):
	if body.get_name() == "player":
		return
	moving = false

func collision_end(body):
	pass

func move_player(direction):
	moving = true
	target_pos = get_pos()
	actual_pos = get_pos()
	if direction == MOVE_UP:
		target_pos.y += Globals.get("TILE_SIZE")
		actual_pos.y -= Globals.get("TILE_SIZE")

	if direction == MOVE_DOWN:
		target_pos.y -= Globals.get("TILE_SIZE")
		actual_pos.y += Globals.get("TILE_SIZE")

	if direction == MOVE_LEFT:
		target_pos.x += Globals.get("TILE_SIZE")
		actual_pos.x -= Globals.get("TILE_SIZE")

	if direction == MOVE_RIGHT:
		target_pos.x -= Globals.get("TILE_SIZE")
		actual_pos.x += Globals.get("TILE_SIZE")

	var check_pos = actual_pos
	if direction == MOVE_DOWN and not exited:
		check_pos = Vector2(actual_pos.x, check_pos.y + 32)

	if is_tile_solid(get_tile_type(check_pos)):
		moving = false

func handle_direction_input():
	if ( Input.is_action_pressed("up") ):
		return MOVE_UP
	if ( Input.is_action_pressed("down") ):
		return MOVE_DOWN
	if ( Input.is_action_pressed("left") ):
		return MOVE_LEFT
	if ( Input.is_action_pressed("right") ):
		return MOVE_RIGHT
	return MOVE_NONE

func get_tile_type(pos):
	return get_parent().get_node("the_room").get_tile_type(pos)

func is_tile_solid(tile):
	return get_parent().get_node("the_room").is_tile_solid(tile)