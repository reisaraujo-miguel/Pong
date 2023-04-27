extends Node2D


func new_service():
	if Game.multi_player:
		Game.goto_scene("res://src/Match/MatchPvP.tscn")
	else:
		Game.goto_scene("res://src/Match/MatchPvE.tscn")


func _on_score_area_player_1_scored() -> void:
	Game.serving_player = Game.PLAYER_1
	new_service()


func _on_score_area_player_2_scored() -> void:
	Game.serving_player = Game.PLAYER_2
	new_service()
