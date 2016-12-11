extends StaticBody2D

var moving = false
var speed = 4

var direction = Vector2(0,0)
var startPos = Vector2(0,0)
const GRID = 32
var world

func _ready():
	get_node("Area2D").connect("body_enter", self, "body_entered")
	set_fixed_process(true)
	set_process_input(true)
	world = get_parent().get_world_2d().get_direct_space_state()
	pass

func _fixed_process(delta):
	if moving:
		set_pos(get_pos() + direction * speed)
		if get_pos() == startPos + Vector2(GRID * direction.x, GRID * direction.y):
			moving = false

func push(dir):
	if moving:
		return
	var resultUp = world.intersect_point(get_pos() + Vector2(0, -GRID))
	var resultDown = world.intersect_point(get_pos() + Vector2(0, GRID))
	var resultLeft = world.intersect_point(get_pos() + Vector2(-GRID, 0))
	var resultRight = world.intersect_point(get_pos() + Vector2(GRID, 0))

	if dir == Vector2(0, -1) and resultUp.empty():
		pass
	elif dir == Vector2(0, 1) and resultDown.empty():
		pass
	elif dir == Vector2(-1, 0) and resultLeft.empty():
		pass
	elif dir == Vector2(1, 0) and resultRight.empty():
		pass
	else:
		return

	get_node("SamplePlayer").play("box_push")
	moving = true
	direction = dir
	startPos = get_pos()

func body_entered(body):
	if body.get_name() == "player":
		return
	set_pos(startPos)
	if get_pos() == startPos:
		moving = false
