extends Node2D

@onready var board: Node2D = $Board

const MAP_CONFIG_PATH = "res://Config/catan_base_map.tres"

func _ready():
	initialize_board(MAP_CONFIG_PATH)

func initialize_board(config_path: String):
	var config_resource = ResourceLoader.load(config_path)
	if config_resource:
		board.init_board(config_resource)
	else:
		print("Failed to load configuration resource")
