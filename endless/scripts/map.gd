extends Node2D

func _ready():
	pass

func level_complete():
	get_parent().open_door()

func level_not_complete():
	get_parent().close_door()