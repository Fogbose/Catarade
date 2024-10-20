extends Resource

class_name Player

@export var id: int
@export var name: String
@export var color: String
@export var resources: ResourceBag
@export var settlements: Array = []
@export var roads: Array = []
@export var score: int

func add_resource(resource_type: ResourceType, amount: int):
	resources.add(resource_type, amount)

func build_settlement(location: Vector2):
	settlements.append(Settlement.new(location, self))

func build_road(start: Vector2, end: Vector2):
	roads.append(Road.new([start, end], self))
	
