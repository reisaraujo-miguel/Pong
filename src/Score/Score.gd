extends Control


func _ready() -> void:
	$ReferenceRect/Player1Score.text = str(Game.player_1_score)
	$ReferenceRect/Player2Score.text = str(Game.player_2_score)
