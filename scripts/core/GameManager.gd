extends Node

class_name GameManager

var game_config: GameConfig
var current_player: Player
var players: Array

func _ready():
	game_config = DataManager.load_game_config("res://configurations/default_gameConfig.tres") 
	players = game_config.players

func start_game():
	_initialize_board()
	_set_starting_player()

func _initialize_board():
	var map_config = game_config.map_config
	#var board = Board(map_config.tile_layout, map_config.number_tokens)
	#board.setup_board()

func _set_starting_player():
	current_player = players[0]

func end_turn():
	var current_turn = game_config.turn
	game_config.turn += 1
	current_player = players[game_config.turn % players.size()]
