extends Resource

class_name Settlement

@export var location: Vector2
@export var owner: Player

func _init(_location: Vector2, _owner: Player):
	location = _location
	self.owner = _owner
