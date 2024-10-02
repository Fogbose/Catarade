# catan_base_map.gd
extends MapConfig

func _init():
	var layout = [
		[null, null, HexagonType.Type.WATER, HexagonType.Type.WATER, HexagonType.Type.WATER, HexagonType.Type.WATER, null],
		[null, HexagonType.Type.WATER, HexagonType.Type.FOREST, HexagonType.Type.MOUNTAIN, HexagonType.Type.FIELD, HexagonType.Type.WATER, null],
		[null, HexagonType.Type.WATER, HexagonType.Type.PASTURE, HexagonType.Type.BRICK, HexagonType.Type.DESERT, HexagonType.Type.FOREST, HexagonType.Type.WATER],
		[HexagonType.Type.WATER, HexagonType.Type.MOUNTAIN, HexagonType.Type.FIELD, HexagonType.Type.PASTURE, HexagonType.Type.BRICK, HexagonType.Type.FOREST, HexagonType.Type.WATER],
		[null, HexagonType.Type.WATER, HexagonType.Type.FIELD, HexagonType.Type.BRICK, HexagonType.Type.PASTURE, HexagonType.Type.MOUNTAIN, HexagonType.Type.WATER],
		[null, HexagonType.Type.WATER, HexagonType.Type.FOREST, HexagonType.Type.MOUNTAIN, HexagonType.Type.FIELD, HexagonType.Type.WATER, null],
		[null, null, HexagonType.Type.WATER, HexagonType.Type.WATER, HexagonType.Type.WATER, HexagonType.Type.WATER, null]
	]
	._init(7, 7, layout)
