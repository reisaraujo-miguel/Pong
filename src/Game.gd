extends Node

var oponent_move: bool = false
var ball_initial_pos: String = "player"
var ball_pos: float = 0
var player_pos: Vector2 = Vector2.ZERO
var oponent_pos: Vector2 = Vector2.ZERO
var player_score: int = 0
var oponent_score: int = 0
var default_speed: int = 400
var ball_speed: int = 700


func _ready() -> void:
	randomize()


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("fullscreen"):
		if get_window().mode == Window.MODE_WINDOWED:
			if OS.get_name() == "Windows":
				get_window().mode = (Window.MODE_EXCLUSIVE_FULLSCREEN)
			else:
				get_window().mode = (Window.MODE_FULLSCREEN)
		else:
			get_window().mode = (Window.MODE_WINDOWED)
