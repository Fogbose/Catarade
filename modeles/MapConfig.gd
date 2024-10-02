# map_config.gd
extends Resource
class_name MapConfig

var num_rows : int
var num_cols : int
var hexagon_layout : Array  # Layout des types d'hexagones (null ou un type)

func _init(rows: int = 0, cols: int = 0, layout: Array = []):
	num_rows = rows
	num_cols = cols
	hexagon_layout = layout

# Mélanger les tuiles de la carte
func shuffle_tiles():
	randomize()
	
	var flat_tiles = []  # Tableau plat pour stocker les tuiles non nulles
	for row in hexagon_layout:
		for tile in row:
			if tile != null:
				flat_tiles.append(tile)
	
	# Mélanger les tuiles
	flat_tiles.shuffle()

	# Réassigner les tuiles mélangées dans le layout
	var tile_index = 0
	for row in range(num_rows):
		for col in range(num_cols):
			if hexagon_layout[row][col] != null:
				hexagon_layout[row][col] = flat_tiles[tile_index]
				tile_index += 1
