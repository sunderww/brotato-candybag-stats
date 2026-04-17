extends "res://singletons/run_data.gd"


const SunderWCBSConstants = preload("res://mods-unpacked/SunderW-CandyBagStats/constants.gd")


func _ready():
	init_tracked_items[Keys.item_candy_bag_hash] = {}


func add_dict_tracked_value(player_index: int, tracking_key: int, value: float, key) -> void :
	if not tracked_item_effects[player_index].has(tracking_key):
		print("tracking key %s does not exist" % tracking_key)
		return
	
	if tracked_item_effects[player_index][tracking_key].has(key):
		tracked_item_effects[player_index][tracking_key][key] += value as int
	else:
		tracked_item_effects[player_index][tracking_key][key] = value as int
