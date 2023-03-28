extends CharacterBody2D

var direction: Vector2
var collision: KinematicCollision2D

@onready var speed: int = Game.player_speed


func _ready() -> void:
	global_position.y = DisplayServer.screen_get_size().y / 2.0
	Game.player_1_pos = $Marker2D.global_position


func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("player_up"):
		direction.y = -1
	elif Input.is_action_pressed("player_down"):
		direction.y = 1
	else:
		direction.y = 0


func _physics_process(delta: float) -> void:
	collision = move_and_collide(direction * speed * delta)
