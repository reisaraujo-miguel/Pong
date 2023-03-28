extends Node2D


func new_service():
	var _new_scene: Error = get_tree().reload_current_scene()


func _on_score_area_player_1_scored() -> void:
	Game.serving_player = Game.PLAYER_1
	new_service()


func _on_score_area_player_2_scored() -> void:
	Game.serving_player = Game.PLAYER_2
	new_service()
