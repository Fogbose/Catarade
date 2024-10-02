# catan_base_map.gd
extends MapConfig

func _init():
	var layout = [
		[null, HexagonType.Type.FOREST, HexagonType.Type.MOUNTAIN, HexagonType.Type.FIELD, null],
		[HexagonType.Type.PASTURE, HexagonType.Type.BRICK, HexagonType.Type.DESERT, HexagonType.Type.FOREST, null],
		[HexagonType.Type.MOUNTAIN, HexagonType.Type.FIELD, HexagonType.Type.PASTURE, HexagonType.Type.BRICK, HexagonType.Type.FOREST],
		[HexagonType.Type.FIELD, HexagonType.Type.BRICK, HexagonType.Type.PASTURE, HexagonType.Type.MOUNTAIN, null],
		[null, HexagonType.Type.FOREST, HexagonType.Type.MOUNTAIN, HexagonType.Type.FIELD, null]
	]
	._init(5, 5, layout)
