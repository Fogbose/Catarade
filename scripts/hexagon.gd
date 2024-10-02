extends Node2D

# Reference to the hexagon type (instance of the HexagonType resource)
var hexagon_type : HexagonType

# Reference to the sprite node
var sprite : Sprite  # Declare the sprite variable without onready

# Assigns the hexagon type and changes the sprite based on the type
# @param type: HexagonType - The type of hexagon to assign
func set_hexagon_type(type: HexagonType):
	# Ensure the provided type is an instance of HexagonType
	if not type is HexagonType:
		push_error("Invalid hexagon type provided: %s" % str(type))
		return
	
	hexagon_type = type
	
	# Initialize the sprite reference after the hexagon is set up
	sprite = $Sprite  # Assign the sprite reference here

	# Change the sprite texture based on the hexagon type
	match hexagon_type.type:
		HexagonType.Type.BRICK:
			sprite.texture = preload("res://assets/sprites/brick.png")
		HexagonType.Type.DESERT:
			sprite.texture = preload("res://assets/sprites/desert.png")
		HexagonType.Type.FIELD:
			sprite.texture = preload("res://assets/sprites/field.png")
		HexagonType.Type.FOREST:
			sprite.texture = preload("res://assets/sprites/forest.png")
		HexagonType.Type.MOUNTAIN:
			sprite.texture = preload("res://assets/sprites/mountain.png")
		HexagonType.Type.PASTURE:
			sprite.texture = preload("res://assets/sprites/pasture.png")
		# Optionally, handle an unknown type
		_:
			push_error("Unknown hexagon type: %d" % hexagon_type.type)

