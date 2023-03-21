extends Area2D

signal player_scored
signal oponent_scored

func _on_Score_Area_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, local_shape_index: int) -> void:
	if local_shape_index == 0: #PlayerArea
		Game.oponent_score += 1
		emit_signal("oponent_scored")
	elif local_shape_index == 1: #OponentArea
		Game.player_score += 1
		emit_signal("player_scored")
