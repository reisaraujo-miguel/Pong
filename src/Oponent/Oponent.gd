extends CharacterBody2D

var direction: Vector2
var collision: KinematicCollision2D

@onready var speed: int = Game.player_speed


func _ready() -> void:
	global_position.y = DisplayServer.screen_get_size().y / 2.0
	Game.player_2_pos = $Marker2D.global_position

	%AudioStreamPlayer2D.volume_db = Game.sfx_volume


func _physics_process(delta: float) -> void:
	if position.y - 10 > Game.ball_pos:
		direction.y = -1
	elif position.y + 10 < Game.ball_pos:
		direction.y = 1

	if Game.oponent_move == true:
		collision = move_and_collide(direction * speed * delta)


func _on_audio_trigger_body_shape_entered(
	_body_rid: RID,
	_body: Node2D,
	_body_shape_index: int,
	_local_shape_index: int
) -> void:
	%AudioStreamPlayer2D.play()


func _on_pause_menu_sfx_volume_changed() -> void:
	%AudioStreamPlayer2D.volume_db = Game.sfx_volume
