extends Control

signal back_button_pressed


func _on_single_player_button_up() -> void:
	Game.multi_player = false

	Game.goto_scene("res://src/Match/MatchPvE.tscn")


func _on_multi_player_button_up() -> void:
	Game.multi_player = true

	Game.goto_scene("res://src/Match/MatchPvP.tscn")


func _on_back_pressed() -> void:
	back_button_pressed.emit()
