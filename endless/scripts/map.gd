extends Node2D

func _ready():
	pass

func level_complete():
	get_parent().open_door()