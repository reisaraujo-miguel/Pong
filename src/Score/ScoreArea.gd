extends Area2D

signal player_1_scored
signal player_2_scored

const PLAYER_1_AREA_IDX: int = 0
const PLAYER_2_AREA_IDX: int = 1


func _on_Score_Area_body_shape_entered(
	_body_rid: RID,
	_body: Node2D,
	_body_shape_index: int,
	local_shape_index: int
) -> void:
	%Scored.play()
	await %Scored.finished

	if local_shape_index == PLAYER_1_AREA_IDX:
		Game.player_2_score += 1
		emit_signal("player_2_scored")
	elif local_shape_index == PLAYER_2_AREA_IDX:
		Game.player_1_score += 1
		emit_signal("player_1_scored")
