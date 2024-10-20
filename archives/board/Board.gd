extends Node2D

# This class represents the game board, managing tiles, edges, and vertices.
class_name Board

# Properties
var tiles = []  # 2D array representing the grid of hexagonal tiles (nodes of the graph)
var edges = []  # List of edges (borders between adjacent tiles)
var vertices = []  # List of vertices (intersections between tiles)


# Initializes the game board with a given configuration
# @param config: A configuration object that includes the number of rows, columns, tile layout, and number tokens.
func init_board(config):
	generate_tiles(config)  # Generate and position tiles
	assign_number_tokens(config)  # Assign number tokens to tiles
	connect_edges_and_vertices()  # Connect tiles via edges and vertices

# Generates the tiles and positions them based on the configuration
# @param config: A configuration object containing tile layout and grid dimensions
func generate_tiles(config):
	for row in range(config.num_rows):
		var row_tiles = []
		for col in range(config.num_cols):
			var hex_type = config.tile_layout[row][col]  # Fetch the type of tile
			if hex_type != null:
				var tile = create_tile(hex_type)  # Create and initialize the tile
				row_tiles.append(tile)
				add_child(tile)
				position_tile(tile, row, col)  # Position the tile on the grid
			else:
				row_tiles.append(null)  # Add null for empty tile slots
		tiles.append(row_tiles)

# Creates a new tile and initializes it with the given type
# @param hex_type: The type of the tile to create
# @return: The instantiated and initialized tile
func create_tile(hex_type):
	var tile_scene = preload("res://scenes/TileScene.tscn")
	var tile = tile_scene.instantiate()
	tile.init(hex_type)  # Initialize the tile with its type
	return tile

# Assigns number tokens to the tiles based on the configuration
# @param config: A configuration object containing the number tokens for each tile
func assign_number_tokens(config):
	for row in range(config.num_rows):
		for col in range(config.num_cols):
			var tile = tiles[row][col]
			if tile != null:
				var token_value = config.number_tokens[row][col]
				if token_value != null:
					tile.number_token = token_value  # Assign the number token to the tile

# Positions a tile on the grid based on its row and column
# @param tile: The tile instance to be positioned
# @param row: The row index in the grid
# @param col: The column index in the grid
func position_tile(tile, row, col):
	var hex_radius = 128  # The radius of the hexagon (half of the hexagon width)

	# Calculate the distance between the centers of the hexagons
	var hex_width = hex_radius * sqrt(3)  # Horizontal distance between hex centers
	var hex_height = hex_radius * 1.5     # Vertical distance between hex centers

	# Calculate position and apply offset for odd rows
	var _position = Vector2(col * hex_width, row * hex_height)
	if row % 2 != 0:
		_position.x += hex_width / 2  # Apply horizontal offset for odd rows
	
	tile.position = _position  # Set the position of the tile

# Connects tiles by creating edges and vertices between them
func connect_edges_and_vertices():
	for row in range(tiles.size()):
		for col in range(tiles[row].size()):
			var tile = tiles[row][col]
			if tile != null:
				# Create edges between adjacent tiles
				create_edges(tile, row, col)
				# Create vertices at intersections
				create_vertices(tile, row, col)

# Creates edges between adjacent tiles
# @param tile: The current tile
# @param row: The row index of the tile
# @param col: The column index of the tile
func create_edges(tile, row, col):
	# Directions represent adjacent tiles in a hexagonal grid
	var directions = [
		Vector2(1, -1),   # North-East
		Vector2(1, 0),    # East
		Vector2(1, 1),    # South-East
		Vector2(-1, 1),   # South-West
		Vector2(-1, 0),   # West
		Vector2(-1, -1)   # North-West
	]

	# Loop through each direction and connect the tile with its adjacent tile
	for direction in directions:
		var new_row = row + int(direction.y)
		var new_col = col + int(direction.x)
		if new_row >= 0 and new_row < tiles.size() and new_col >= 0 and new_col < tiles[new_row].size():
			var adjacent_tile = tiles[new_row][new_col]
			if adjacent_tile != null:
				# Create or find the edge between the two adjacent tiles
				var edge = find_or_create_edge(tile, adjacent_tile)
				tile.add_edge(edge)  # Add the edge to the current tile

# Finds or creates an edge between two tiles
# @param tile1: The first tile
# @param tile2: The second tile
# @return: The existing or new edge connecting the two tiles
func find_or_create_edge(tile1, tile2):
	# Check if the edge already exists
	for edge in edges:
		if (edge.tile1 == tile1 and edge.tile2 == tile2) or (edge.tile1 == tile2 and edge.tile2 == tile1):
			return edge  # Return the existing edge
	# If not found, create a new edge
	var new_edge = Edge.new()
	new_edge.init(tile1, tile2)
	edges.append(new_edge)  # Add the new edge to the edges list
	add_child(new_edge)  # Add the edge to the scene
	return new_edge

# Creates vertices (intersections) at the corners of the tiles
# @param tile: The current tile
# @param row: The row index of the tile
# @param col: The column index of the tile
func create_vertices(tile, row, col):
	# Each tile has 6 vertices, check if vertices already exist at those positions
	var vertex_positions = [
		Vector2(0, -1),     # North
		Vector2(1, -1),     # North-East
		Vector2(1, 1),      # South-East
		Vector2(0, 1),      # South
		Vector2(-1, 1),     # South-West
		Vector2(-1, -1)     # North-West
	]

	# Loop through each vertex position and connect to adjacent tiles
	for vertex_position in vertex_positions:
		var new_row = row + int(vertex_position.y)
		var new_col = col + int(vertex_position.x)
		if new_row >= 0 and new_row < tiles.size() and new_col >= 0 and new_col < tiles[new_row].size():
			var adjacent_tile = tiles[new_row][new_col]
			if adjacent_tile != null:
				# Find or create the vertex shared between the current tile and adjacent tile
				var vertex = find_or_create_vertex([tile, adjacent_tile])
				tile.add_vertex(vertex)  # Add the vertex to the current tile
				
				# Update both tiles to share this vertex
				vertex.add_tile(tile)  # Add the current tile to the vertex
				vertex.add_tile(adjacent_tile)  # Add the adjacent tile to the vertex

# Finds or creates a vertex (intersection) shared by adjacent tiles
# @param adjacent_tiles: An array of tiles that share this vertex
# @return: The existing or new vertex
func find_or_create_vertex(adjacent_tiles):
	# Check if the vertex already exists for these adjacent tiles
	for vertex in vertices:
		if vertex.has_tiles(adjacent_tiles):
			return vertex  # Return the existing vertex
	# If not found, create a new vertex
	var new_vertex = Vertex.new()
	new_vertex.init(adjacent_tiles)
	vertices.append(new_vertex)  # Add the new vertex to the vertices list
	add_child(new_vertex)  # Add the vertex to the scene
	return new_vertex
