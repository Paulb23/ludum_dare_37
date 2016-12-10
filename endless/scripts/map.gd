extends Node2D

var solidTiles = Array()

func is_tile_solid(type):
	return solidTiles.find(type) != -1

func get_tile_type(pos):
	print(get_node("Node2D/TileMap").get_cell((pos.x - 224) / Globals.get("TILE_SIZE"), (pos.y -32) / Globals.get("TILE_SIZE")))
	return get_node("Node2D/TileMap").get_cell((pos.x - 224) / Globals.get("TILE_SIZE"), (pos.y -32) / Globals.get("TILE_SIZE"))

func _ready():
	solidTiles.push_back(1)
	solidTiles.push_back(4)
	solidTiles.push_back(5)