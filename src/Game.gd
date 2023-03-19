extends Node

var oponent_move = false
var ball_initial_pos = "player"
var ball_pos = 0
var player_pos = 0
var oponent_pos = 0
var player_score = 0
var oponent_score = 0
var default_speed = 400
var ball_speed = 700


func _input(_event):
	if Input.is_action_just_pressed("fullscreen"):
		get_window().mode = Window.MODE_EXCLUSIVE_FULLSCREEN if (!((get_window().mode == Window.MODE_EXCLUSIVE_FULLSCREEN) or (get_window().mode == Window.MODE_FULLSCREEN))) else Window.MODE_WINDOWED
