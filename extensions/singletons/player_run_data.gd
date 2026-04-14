extends "res://singletons/player_run_data.gd"


static func init_effects() -> Dictionary:
	var effects := .init_effects()
	
	effects[Keys.generate_hash(SunderWCBSConstants.CANDYBAG_GAIN_EFFECT_NAME)] = []
	
	return effects
