extends Resource

class_name MapConfig

# Propriétés de configuration de la carte
@export var num_rows: int
@export var num_cols: int
@export var tile_layout: Array
@export var number_tokens: Array

# Mélanger les tuiles de la carte
func shuffle_tiles():
	randomize()
	
	var flat_tiles = []  # Tableau plat pour stocker les tuiles non nulles
	for row in tile_layout:
		for tile in row:
			if tile != null and tile != TileType.Type.WATER:
				flat_tiles.append(tile)
	
	# Mélanger les tuiles
	flat_tiles.shuffle()

	# S'assurer que le nombre de tuiles correspond avant réassignation
	var tile_index = 0
	for row in range(num_rows):
		for col in range(num_cols):
			if tile_layout[row][col] != null and tile_layout[row][col] != TileType.Type.WATER:
				tile_layout[row][col] = flat_tiles[tile_index]
				tile_index += 1
