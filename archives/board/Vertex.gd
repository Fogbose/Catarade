extends Node2D

class_name Vertex

var tiles = []

# Initialisation du sommet avec les tuiles adjacentes
func init(adjacent_tiles):
	tiles = adjacent_tiles

# Ajouter une tuile au sommet
func add_tile(tile):
	if !(tile in tiles) and tiles.size() < 3:
		tiles.append(tile)

# Vérifier si le sommet est déjà associé à un groupe de tuiles donné
func has_tiles(adjacent_tiles):
	for tile in adjacent_tiles:
		if !(tile in tiles):
			return false
	return true
