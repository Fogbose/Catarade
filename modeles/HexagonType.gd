extends Resource
class_name HexagonType

# Enum to define different hexagon types in the game
enum Type { BRICK, DESERT, FIELD, FOREST, MOUNTAIN, PASTURE }

# Stores the current type of the hexagon (default is FOREST)
var type : int = Type.BRICK

# Sets the hexagon type, ensuring the input is valid
# @param new_type: int - The new type to assign to the hexagon
# @return: HexagonType - Returns the current instance for method chaining
func set_type(new_type : int) -> HexagonType:
	# Ensure the new_type is within the valid range of enum values
	if new_type in Type.values():
		type = new_type
	else:
		push_error("Invalid hexagon type: %d" % new_type)
	return self

# Retrieves the current hexagon type
# @return: int - The current hexagon type
func get_type() -> int:
	return type
