extends "res://main.gd"


const SunderWCBSConstants = preload("res://mods-unpacked/SunderW-CandyBagStats/constants.gd")


func _ready():
	sunderw_candy_bag_effect()

#
## We use _init_half_second_timers because it is currently called at the end
## of _ready, and that's where we want to be.
#func _init_half_second_timers() -> void:
#	sunderw_candy_bag_effect()
#	._init_half_second_timers()


func sunderw_candy_bag_effect() -> void:
	ModLoaderLog.debug("sunderw_candy_bag_effect", SunderWCBSConstants.LOG_NAME)

	for player_index in RunData.get_player_count():
		var effects: Dictionary = RunData.get_player_effects(player_index)
		if effects.has(Keys.generate_hash(SunderWCBSConstants.CANDYBAG_GAIN_EFFECT_NAME)):
			_gain_random_stats(player_index, effects)


func _gain_random_stats(player_index: int, effects: Dictionary) -> void:
	ModLoaderLog.debug("Gaining random stats", SunderWCBSConstants.LOG_NAME)

	# effects for candy bag contains an array (one for each item, in case there are other
	# with the same type of effects).
	var gain_stats = effects[Keys.generate_hash(SunderWCBSConstants.CANDYBAG_GAIN_EFFECT_NAME)]
	
	for gain_stat in gain_stats:
		# gain_stat is a tuple containing (number_of_stats_to_gain, percent_change_to_happen)
		var chance = gain_stat[1]
		if Utils.get_chance_success(float(chance) / 100):
			for _i in range(gain_stat[0]):
				var stat_hash = RunData.get_random_primary_stats()
				RunData.add_stat(stat_hash, 1, player_index)
				RunData.add_dict_tracked_value(player_index, Keys.item_candy_bag_hash, 1, stat_hash)	
