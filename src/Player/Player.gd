extends CharacterBody2D

var speed
var direction = Vector2()

func _ready():
	speed = Game.default_speed
	global_position.y = 720.0/2.0
	Game.player_pos = $Marker2D.global_position

func _input(_event):
	if Input.is_action_pressed("player_up"):
		direction.y = -1
	elif Input.is_action_pressed("player_down"):
		direction.y = 1
	else:
		direction.y = 0

func _physics_process(delta):
	var _collision = move_and_collide(direction * speed * delta)
