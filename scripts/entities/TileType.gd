extends Resource
class_name TileType

enum Type {
	FOREST,
	MOUNTAIN,
	CARREER,
	FIELD,
	PASTURE,
	DESERT,
	WATER
}

@export var tile_type: Type = Type.FIELD
