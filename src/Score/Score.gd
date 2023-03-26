extends Control


func _ready() -> void:
	$ReferenceRect/Player_Score.text = str(Game.player_score)
	$ReferenceRect/Oponent_Score.text = str(Game.oponent_score)


func _on_score_area_player_scored() -> void:
	$ReferenceRect/Player_Score.text = str(Game.player_score)


func _on_score_area_oponent_scored() -> void:
	$ReferenceRect/Oponent_Score.text = str(Game.oponent_score)
