extends Node2D

class_name Tile

# Propriétés de la tuile
var type : TileType
var number_token : int = -1  # Token de production
var has_robber : bool = false  # Indique si le voleur est sur la tuile

# Références aux arêtes (bords) et sommets (intersections)
var edges = []  # Bords de la tuile
var vertices = []  # Sommets de la tuile

# Référence au nœud Sprite pour l'affichage visuel
var sprite : Sprite2D  # Le sprite de la tuile

# Initialisation de la tuile avec un type d'hexagone
func init(_type : TileType):
	self.type = _type
	# Assigner la référence du sprite après l'initialisation
	sprite = $TileSprite  # Associe le Sprite2D existant dans la scène
	set_tile_visual()

# Définit les propriétés visuelles de la tuile en fonction de son type
func set_tile_visual():
	# Vérifie que le type est bien une instance de HexagonType
	if !(type is TileType):
		push_error("Invalid hexagon type provided: %s" % str(type))
		return
	
	# Change la texture du sprite en fonction du type d'hexagone
	match type.type:
		TileType.Type.BRICK:
			sprite.texture = preload("res://assets/sprites/hex/brick.png")
		TileType.Type.DESERT:
			sprite.texture = preload("res://assets/sprites/hex/desert.png")
		TileType.Type.FIELD:
			sprite.texture = preload("res://assets/sprites/hex/field.png")
		TileType.Type.FOREST:
			sprite.texture = preload("res://assets/sprites/hex/forest.png")
		TileType.Type.MOUNTAIN:
			sprite.texture = preload("res://assets/sprites/hex/mountain.png")
		TileType.Type.PASTURE:
			sprite.texture = preload("res://assets/sprites/hex/pasture.png")
		TileType.Type.WATER:
			sprite.texture = preload("res://assets/sprites/hex/water.png")
		_:
			push_error("Unknown hexagon type: %d" % type.type)

# Ajouter un bord à la tuile
func add_edge(edge):
	edges.append(edge)

# Ajouter un sommet à la tuile
func add_vertex(vertex):
	vertices.append(vertex)
