# main.gd
extends Node

var board_generator

func _ready():
	board_generator = $BoardGenerator
	# Charger une configuration de map spécifique
	var catan_map = preload("res://assets/maps/catan_base_map.gd").new()
	board_generator.load_map(catan_map)
	board_generator.generate_board()
