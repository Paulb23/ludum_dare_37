extends KinematicBody2D

var moving = false
var speed = 4

var direction = Vector2(0,0)
var startPos = Vector2(0,0)
var canMove = true
const GRID = 32
var world

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	world = get_parent().get_world_2d().get_direct_space_state()
	pass

func _fixed_process(delta):

	if !moving:
		var resultUp = world.intersect_point(get_pos() + Vector2(0, -GRID))
		var resultDown = world.intersect_point(get_pos() + Vector2(0, GRID))
		var resultLeft = world.intersect_point(get_pos() + Vector2(-GRID, 0))
		var resultRight = world.intersect_point(get_pos() + Vector2(GRID, 0))

		if Input.is_action_pressed("up") and resultUp.empty():
				moving = true
				direction = Vector2(0, -1)
				startPos = get_pos()
		elif Input.is_action_pressed("down") and resultDown.empty():
				moving = true
				direction = Vector2(0, 1)
				startPos = get_pos()
		elif Input.is_action_pressed("left") and resultLeft.empty():
				moving = true
				direction = Vector2(-1, 0)
				startPos = get_pos()
		elif Input.is_action_pressed("right") and resultRight.empty():
				moving = true
				direction = Vector2(1, 0)
				startPos = get_pos()
	else:
		move_to(get_pos() + direction * speed)
		if get_pos() == startPos + Vector2(GRID * direction.x, GRID * direction.y):
			moving = false

		if is_colliding():
			var other = get_collider()
			if other.has_method("push"):
				other.push(direction)

			#move_to(startPos * 1)
			set_pos(startPos)
			if get_pos() == startPos:
				moving = false

func _input(event):
	if event.is_action("reload") and !event.is_pressed() and !event.is_echo():
		get_parent().reload()