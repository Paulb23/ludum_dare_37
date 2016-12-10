extends Node2D

var col_shape;

func _ready():
	col_shape = get_node("StaticBody2D/CollisionShape2D").get_pos();

func close():
	get_node("AnimationPlayer").play_backwards("open");
	get_node("StaticBody2D/CollisionShape2D").set_pos(col_shape)

func open():
	get_node("AnimationPlayer").play("open");
	get_node("StaticBody2D/CollisionShape2D").set_pos(Vector2(1000, 1000))
