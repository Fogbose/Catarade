# board_generator.gd
extends Node2D

# Configuration de map courante
var current_map : MapConfig

# Distance entre les hexagones
var hexagon_spacing = Vector2(256*sqrt(3) / 2, 256)

# Instance de Board
var board : Board

# Choisir la map à charger
func load_map(map_config: MapConfig):
	current_map = map_config
	current_map.shuffle_tiles()
	
# Générer le plateau en fonction de la map actuelle
func generate_board():
	if current_map == null:
		return
	
	board = Board.new(current_map.num_rows, current_map.num_cols)

	for row in range(current_map.num_rows):
		for col in range(current_map.num_cols):
			var hexagon_scene = preload("res://scenes/HexagonScene.tscn").instance()
			
			var position = Vector2(col * hexagon_spacing.x + (row % 2) * hexagon_spacing.x / 2, row * hexagon_spacing.y * 1.5 / 2)
			hexagon_scene.position = position

			# Récupérer le type d'hexagone défini dans la configuration
			var hexagon_type = current_map.hexagon_layout[row][col]
			if hexagon_type != null:
				hexagon_scene.set_hexagon_type(HexagonType.new().set_type(hexagon_type))
				board.tiles[row][col] = hexagon_type
				add_child(hexagon_scene)
