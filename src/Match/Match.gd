extends Node2D

var game_scene: NodePath
var is_paused: bool = false


func _ready() -> void:
	%HitWall.volume_db = Game.sfx_volume
	%Scored.volume_db = Game.sfx_volume
	%Music.volume_db = Game.music_volume

	if Game.multi_player:
		game_scene = "res://src/Match/MatchPvP.tscn"
	else:
		game_scene = "res://src/Match/MatchPvE.tscn"

	%Music.stream = MusicList.list[MusicList.curr_song % MusicList.total_songs]
	MusicList.curr_song += 1

	%Music.play()


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
		%PauseMenu.visible = is_paused
		get_tree().paused = is_paused


func _on_pause_menu_music_volume_changed() -> void:
	%Music.volume_db = Game.music_volume


func _on_pause_menu_sfx_volume_changed() -> void:
	%HitWall.volume_db = Game.sfx_volume
	%Scored.volume_db = Game.sfx_volume


func _on_pause_menu_return_pressed() -> void:
	is_paused = not is_paused
	%PauseMenu.visible = is_paused
	get_tree().paused = is_paused


func _on_pause_menu_main_menu_pressed() -> void:
	get_tree().paused = false
	Game.goto_scene("res://src/MainMenu/MainMenu.tscn")
