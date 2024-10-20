extends Resource

class_name Road

@export var path: Array
@export var owner: Player

func _init(_path: Array, _owner: Player):
	self.path = _path
	self.owner = _owner
