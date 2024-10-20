extends Resource

class_name ResourceBag

@export var wood: int
@export var brick: int
@export var wheat: int
@export var sheep: int
@export var ore: int

func add(resource_type: ResourceType, amount: int):
	match resource_type:
		ResourceType.Type.WOOD:
			wood += amount
		ResourceType.Type.BRICK:
			brick += amount
		ResourceType.Type.WHEAT:
			wheat += amount
		ResourceType.Type.SHEEP:
			sheep += amount
		ResourceType.Type.STONE:
			ore += amount
