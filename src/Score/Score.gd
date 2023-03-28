extends Control


func _ready() -> void:
	$ReferenceRect/Player_Score.text = str(Game.player_1_score)
	$ReferenceRect/Oponent_Score.text = str(Game.player_2_score)
