extends Node2D

var game_scene: NodePath
var is_paused: bool = false


func _ready() -> void:
	if Game.multi_player:
		game_scene = "res://src/Match/MatchPvP.tscn"
	else:
		game_scene = "res://src/Match/MatchPvE.tscn"


func new_service():
	Game.goto_scene(game_scene)


func _on_score_area_player_1_scored() -> void:
	Game.serving_player = Game.PLAYER_1
	new_service()


func _on_score_area_player_2_scored() -> void:
	Game.serving_player = Game.PLAYER_2
	new_service()


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("restart_match"):
		Game.reset_stats()
		new_service()  # in this case will work as reset
	elif Input.is_action_just_pressed("pause"):
		is_paused = not is_paused
		%PauseLabel.visible = is_paused
		get_tree().paused = is_paused
