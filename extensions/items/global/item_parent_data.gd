extends "res://items/global/item_parent_data.gd"


func _get_tracking_text(player_index: int) -> String:
	if player_index != RunData.DUMMY_PLAYER_INDEX \
		and RunData.tracked_item_effects[player_index].has(my_id_hash) \
		and tracking_text != "[EMPTY]":

		var item_effect = RunData.tracked_item_effects[player_index][my_id_hash]
		if item_effect is Dictionary:
			# We assume it's always for stats
			return _stat_tracking_text(tracking_text, item_effect)

	return ._get_tracking_text(player_index)


func _stat_tracking_text(tracking_text: String, effect: Dictionary) -> String:
	var color: String = "\n[color=#" + Utils.SECONDARY_FONT_COLOR.to_html() + "]"
	var text = Text.text(tracking_text.to_upper(), [_stat_tracking_params(effect)])
	return color + text + "[/color]"


func _stat_tracking_params(effect: Dictionary) -> String:
	var text: String = ""
	var sum: int = 0
	
	for key in effect:
		var value = effect[key]
		if value != 0:
			sum += value
			var value_text = Text.get_formatted_number(value)
			var stat: StatData = ItemService.get_stat(key)
			if stat:
				var stat_name = tr(stat.stat_name.to_upper())
				text += "\n  %s   %s : %s" % [_get_icon(key), stat_name, value_text]
	
	if sum == 0:
		return "None"
	
	var result = "%d%s" % [sum, text]
	return result
