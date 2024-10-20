extends Node

# Global variables for storing game configurations
var game_config: GameConfig
var map_config: MapConfig
var rules_config: RulesConfig

# This is called when the game starts, initializing default configurations
func _ready():
	print("DataManager is initialized and ready.")

# Loads a GameConfig resource from a .tres file
func load_game_config(path: String) -> GameConfig:
	var config = ResourceLoader.load(path)
	if config != null and config is GameConfig:
		game_config = config
		print("GameConfig loaded successfully from ", path)
		return config
	else:
		print("Failed to load GameConfig from ", path)
		return null

# Loads a MapConfig resource from a .tres file
func load_map_config(path: String) -> MapConfig:
	var config = ResourceLoader.load(path)
	if config != null and config is MapConfig:
		map_config = config
		print("MapConfig loaded successfully from ", path)
		return config
	else:
		print("Failed to load MapConfig from ", path)
		return null

# Loads a RulesConfig resource from a .tres file
func load_rules_config(path: String) -> RulesConfig:
	var config = ResourceLoader.load(path)
	if config != null and config is RulesConfig:
		rules_config = config
		print("RulesConfig loaded successfully from ", path)
		return config
	else:
		print("Failed to load RulesConfig from ", path)
		return null

# Saves a GameConfig to a .tres file
func save_game_config(path: String) -> void:
	if game_config != null:
		ResourceSaver.save(game_config, path)
		print("GameConfig saved successfully to ", path)
	else:
		print("No GameConfig available to save.")

# Saves a MapConfig to a .tres file
func save_map_config(path: String) -> void:
	if map_config != null:
		ResourceSaver.save(map_config, path)
		print("MapConfig saved successfully to ", path)
	else:
		print("No MapConfig available to save.")

# Saves a RulesConfig to a .tres file
func save_rules_config(path: String) -> void:
	if rules_config != null:
		ResourceSaver.save(rules_config, path)
		print("RulesConfig saved successfully to ", path)
	else:
		print("No RulesConfig available to save.")

# Modify the game configuration and persist changes
func modify_game_config(new_config: Dictionary) -> void:
	if game_config != null:
		for key in new_config.keys():
			if game_config.has_property(key):
				game_config.set(key, new_config[key])
		print("GameConfig modified successfully.")
	else:
		print("No GameConfig loaded to modify.")

# Modify the map configuration and persist changes
func modify_map_config(new_config: Dictionary) -> void:
	if map_config != null:
		for key in new_config.keys():
			if map_config.has_property(key):
				map_config.set(key, new_config[key])
		print("MapConfig modified successfully.")
	else:
		print("No MapConfig loaded to modify.")

# Modify the rules configuration and persist changes
func modify_rules_config(new_config: Dictionary) -> void:
	if rules_config != null:
		for key in new_config.keys():
			if rules_config.has_property(key):
				rules_config.set(key, new_config[key])
		print("RulesConfig modified successfully.")
	else:
		print("No RulesConfig loaded to modify.")
