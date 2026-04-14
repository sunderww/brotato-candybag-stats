extends Node


func _init():
	ModLoaderLog.info("Init", SunderWCBSConstants.LOG_NAME)
	install_script_extensions()


func _ready():
	var candy_bag_effect: DoubleValueEffect = load("res://items/all/candy_bag/candy_bag_effect_0.tres")
	candy_bag_effect.key = SunderWCBSConstants.CANDYBAG_GAIN_EFFECT_NAME
	ModLoaderLog.info("Changed candy bag effect_0 key", SunderWCBSConstants.LOG_NAME)


func install_script_extensions():
	ModLoaderMod.install_script_extension("res://mods-unpacked/SunderW-CandyBagStats/extensions/main.gd")
	ModLoaderMod.install_script_extension("res://mods-unpacked/SunderW-CandyBagStats/extensions/singletons/run_data.gd")
	ModLoaderMod.install_script_extension("res://mods-unpacked/SunderW-CandyBagStats/extensions/singletons/player_run_data.gd")
	ModLoaderMod.install_script_extension("res://mods-unpacked/SunderW-CandyBagStats/extensions/items/global/item_parent_data.gd")
