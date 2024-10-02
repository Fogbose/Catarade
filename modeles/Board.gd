# board.gd
extends Resource
class_name Board

# Dimensions du plateau
var num_rows : int
var num_cols : int

# Liste des tuiles sur le plateau
var tiles : Array = []

# Constructeur pour initialiser le plateau
func _init(rows: int, cols: int):
	num_rows = rows
	num_cols = cols
	tiles.resize(num_rows)
	for i in range(num_rows):
		tiles[i] = []
		tiles[i].resize(num_cols)
