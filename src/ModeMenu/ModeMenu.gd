extends Control


func _on_single_player_button_up() -> void:
	var _new_scene: Error = get_tree().change_scene_to_file(
		"res://src/Match/MatchPvE.tscn"
	)


func _on_multi_player_button_up() -> void:
	Game.multi_player = true

	var _new_scene: Error = get_tree().change_scene_to_file(
		"res://src/Match/MatchPvP.tscn"
	)
