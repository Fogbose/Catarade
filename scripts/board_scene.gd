# main.gd
extends Node

var board

func _ready():
	board = $Board
	# Charger une configuration de map spécifique
	var catan_map = preload("res://configuration/catan_base_map.tres")
	board.init_board(catan_map)
