extends CharacterBody2D

var direction: Vector2
var collision: KinematicCollision2D

@onready var speed: int = Game.default_speed


func _ready() -> void:
	global_position.y = DisplayServer.screen_get_size().y / 2.0
	Game.oponent_pos = $Marker2D.global_position


func _physics_process(delta: float) -> void:
	if position.y - 10 > Game.ball_pos:
		direction.y = -1
	elif position.y + 10 < Game.ball_pos:
		direction.y = 1

	if Game.oponent_move == true:
		collision = move_and_collide(direction * speed * delta)
