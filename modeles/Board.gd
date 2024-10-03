# board.gd
extends Node2D

class_name Board

var tiles = []  # Grille des tuiles (nœuds du graphe)
var edges = []  # Arêtes (bords entre tuiles)
var vertices = []  # Sommets (intersections entre tuiles)

# Initialisation du plateau avec une configuration donnée
func init_board(config):
	# Génération des tuiles
	for row in range(config.num_rows):
		var row_tiles = []
		for col in range(config.num_cols):
			var hex_type = config.tile_layout[row][col]
			if hex_type != null:
				var tile_scene = preload("res://scenes/TileScene.tscn")
				var tile = tile_scene.instantiate()
				tile.init(hex_type)
				row_tiles.append(tile)
				add_child(tile)
				position_tile(tile, row, col)

				# Ajout des numéros de production aux tuiles
				var token_value = config.number_tokens[row][col]
				if token_value != null:
					tile.number_token = token_value
			else:
				row_tiles.append(null)
		tiles.append(row_tiles)

	# Connecter les tuiles par les arêtes et les sommets
	connect_edges_and_vertices()

# Positionnement des tuiles sur la grille
func position_tile(tile, row, col):
	var hex_radius = 128  # Rayon d'un hexagone (moitié de la largeur de l'hexagone)
	
	# Calcul de la distance entre les centres des hexagones
	var hex_width = hex_radius * sqrt(3)  # Distance entre les centres horizontalement
	var hex_height = hex_radius * 1.5     # Distance verticale entre les centres

	# Positionnement avec décalage des colonnes sur les rangs impairs
	var _position = Vector2(col * hex_width, row * hex_height)
	if row % 2 != 0:
		_position.x += hex_width / 2  # Décalage horizontal pour les rangs impairs
	
	tile.position = _position

# Connecter les arêtes et les sommets
func connect_edges_and_vertices():
	for row in range(tiles.size()):
		for col in range(tiles[row].size()):
			var tile = tiles[row][col]
			if tile != null:
				# Créer les arêtes entre les tuiles adjacentes
				create_edges(tile, row, col)
				# Créer les sommets aux intersections
				create_vertices(tile, row, col)

# Création des arêtes entre tuiles adjacentes
func create_edges(tile, row, col):
	var directions = [
		Vector2(1, -1),    # Nord-Est
		Vector2(1, 0),    # Est
		Vector2(1, 1),     # Sud-Est
		Vector2(-1, 1),    # Sud-Ouest
		Vector2(-1, 0),     # Ouest
		Vector2(-1, -1)     # Nord-Ouest
	]

	# Parcours des directions pour connecter les tuiles adjacentes
	for direction in directions:
		var new_row = row + int(direction.y)
		var new_col = col + int(direction.x)
		if new_row >= 0 and new_row < tiles.size() and new_col >= 0 and new_col < tiles[new_row].size():
			var adjacent_tile = tiles[new_row][new_col]
			if adjacent_tile != null:
				# Vérifier si l'arête existe déjà
				var edge = find_or_create_edge(tile, adjacent_tile)
				tile.add_edge(edge)

# Trouver ou créer une arête entre deux tuiles
func find_or_create_edge(tile1, tile2):
	for edge in edges:
		if (edge.tile1 == tile1 and edge.tile2 == tile2) or (edge.tile1 == tile2 and edge.tile2 == tile1):
			return edge  # L'arête existe déjà
	var new_edge = Edge.new()
	new_edge.init(tile1, tile2)
	edges.append(new_edge)
	add_child(new_edge)
	return new_edge

# Création des sommets aux intersections
func create_vertices(tile, row, col):
	# Chaque tuile a 6 sommets, on vérifie si les sommets existent déjà ou pas
	var vertex_positions = [
		Vector2(0, -1),     # Nord
		Vector2(1, -1),     # Nord-Est
		Vector2(1, 1),      # Sud-Est
		Vector2(0, 1),      # Sud
		Vector2(-1, 1),     # Sud-Ouest
		Vector2(-1, -1)      # Nord-Ouest
	]

	for vertex_position in vertex_positions:
		var new_row = row + int(vertex_position.y)
		var new_col = col + int(vertex_position.x)
		if new_row >= 0 and new_row < tiles.size() and new_col >= 0 and new_col < tiles[new_row].size():
			var adjacent_tile = tiles[new_row][new_col]
			if adjacent_tile != null:
				# Si le sommet n'existe pas, créer un nouveau
				var vertex = find_or_create_vertex([tile, adjacent_tile])
				tile.add_vertex(vertex)
				
				 # Mise à jour des tuiles associées
				vertex.add_tile(tile)  # Ajout de la tuile courante au sommet
				vertex.add_tile(adjacent_tile)  # Ajout de la tuile adjacente

# Trouver ou créer un sommet (intersection)
func find_or_create_vertex(adjacent_tiles):
	# Vérification de l'existence d'un sommet connectant les tuiles adjacentes
	for vertex in vertices:
		if vertex.has_tiles(adjacent_tiles):
			return vertex  # Le sommet existe déjà avec ces tuiles

	# Si le sommet n'existe pas, en créer un nouveau
	var new_vertex = Vertex.new()
	new_vertex.init(adjacent_tiles)
	vertices.append(new_vertex)
	add_child(new_vertex)
	return new_vertex
