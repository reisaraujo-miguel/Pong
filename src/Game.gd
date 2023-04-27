extends Node

const player_speed: int = 400
const ball_speed: int = 700
const PLAYER_1: int = 0
const PLAYER_2: int = 1

var oponent_move: bool = false  # if true, the oponent can move. Used for AI Oponents
var serving_player: int = PLAYER_1
var ball_pos: float = 0
var player_1_pos: Vector2 = Vector2.ZERO
var player_2_pos: Vector2 = Vector2.ZERO
var player_1_score: int = 0
var player_2_score: int = 0
var multi_player: bool = false


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
