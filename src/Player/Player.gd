extends CharacterBody2D

var direction: Vector2
var collision: KinematicCollision2D
var player_up: StringName = "single_player_up"
var player_down: StringName = "single_player_down"

@export var is_player1: bool = true

@onready var speed: int = Game.player_speed


func _ready() -> void:
	global_position.y = DisplayServer.screen_get_size().y / 2.0

	if is_player1:
		Game.player_1_pos = $Marker2D.global_position
	else:
		Game.player_2_pos = $Marker2D.global_position

	if Game.multi_player:
		if is_player1:
			player_up = "player1_up"
			player_down = "player1_down"
		else:
			player_up = "player2_up"
			player_down = "player2_down"


func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed(player_up):
		direction.y = -1
	elif Input.is_action_pressed(player_down):
		direction.y = 1
	else:
		direction.y = 0


func _physics_process(delta: float) -> void:
	collision = move_and_collide(direction * speed * delta)


func _on_audio_trigger_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	%AudioStreamPlayer2D.play()
