extends Resource

class_name GameConfig

@export var map_config: MapConfig
@export var rules_config: RulesConfig
@export var players: Array = []
@export var turn: int
@export var status: String

func add_player(player: Player):
	players.append(player)

func remove_player(player_id: int):
	players.erase(player_id)

func next_turn():
	turn = (turn + 1) % players.size()
