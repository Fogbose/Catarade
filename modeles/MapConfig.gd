# map_config.gd
extends Resource
class_name MapConfig

# Taille du plateau
var num_rows : int
var num_cols : int

# Disposition des types d'hexagones (null représente une tuile vide)
var hexagon_layout : Array

# Constructeur pour initialiser la configuration
func _init(rows: int = 0, cols: int = 0, layout: Array = []):
	num_rows = rows
	num_cols = cols
	hexagon_layout = layout
