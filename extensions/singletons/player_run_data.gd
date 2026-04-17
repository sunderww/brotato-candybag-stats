extends "res://singletons/player_run_data.gd"


const SunderWCBSConstants = preload("res://mods-unpacked/SunderW-CandyBagStats/constants.gd")


static func init_effects() -> Dictionary:
	var effects := .init_effects()
	
	effects[Keys.generate_hash(SunderWCBSConstants.CANDYBAG_GAIN_EFFECT_NAME)] = []
	
	return effects
