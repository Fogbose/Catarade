extends Node2D

enum HexagonType { FOREST, MOUNTAIN, FIELD, PASTURE, DESERT }

var hexagon_type = HexagonType.FOREST

# Variables pour la taille et le placement des hexagones
var hex_radius = 64  # Rayon de l'hexagone (moitié de la taille du sprite)
var hex_scene = preload("res://HexagonScene.tscn")  # Charger la scène de l'hexagone
var grid_height = 5  # Nombre de rangées

# Matrice décrivant les rangées du plateau en nid d'abeille
var grid_data = [
	[null, 3, 5, 3, null],
	[2, 4, 6, 8, null],
	[1, 3, 5, 7, 9],
	[2, 4, 6, 8, null],
	[null, 3, 5, 3, null]
]

func _ready():
	generate_hex_grid()
	center_camera()

# Fonction pour générer la grille hexagonale
func generate_hex_grid():
	for row in range(grid_data.size()):
		for col in range(grid_data[row].size()):
			if grid_data[row][col]:
				var hex_instance = hex_scene.instance()  # Créer une instance de la scène hexagone
				var x_offset = col * hex_radius * sqrt(3)  # Décalage en x (espacement horizontal)
				var y_offset = row * hex_radius * 1.5 # Décalage en y (espacement vertical)
				
				# Pour aligner les colonnes impaires
				if row % 2 != 0:
					x_offset += hex_radius * sqrt(3) / 2

				# Positionner l'hexagone
				hex_instance.position = Vector2(x_offset, y_offset)
				add_child(hex_instance)

# Fonction pour centrer la caméra sur le plateau
func center_camera():
	# Calculer le centre du plateau
	var center_x = (grid_data[0].size() * hex_radius * sqrt(3)) / 2
	var center_y = (grid_data.size() * hex_radius * 1.5) / 2

	# Positionner la caméra
	var camera = $Camera2D
	camera.position = Vector2(center_x, center_y)
