extends Resource

class_name MapConfig

@export var num_rows: int
@export var num_cols: int
@export var tile_layout: Array
@export var number_tokens: Array

func shuffle_tiles():
	randomize()
	
	var flat_tiles = []
	for row in tile_layout:
		for tile in row:
			if tile != null and tile != TileType.Type.WATER:
				flat_tiles.append(tile)
	
	flat_tiles.shuffle()

	var tile_index = 0
	for row in range(num_rows):
		for col in range(num_cols):
			if tile_layout[row][col] != null and tile_layout[row][col] != TileType.Type.WATER:
				tile_layout[row][col] = flat_tiles[tile_index]
				tile_index += 1
				
