extends CharacterBody2D

var speed
var direction = Vector2()

func _ready():
	speed = Game.default_speed
	global_position.y = 720.0/2.0
	Game.oponent_pos = $Marker2D.global_position	

func _physics_process(delta):
	if position.y - 10 > Game.ball_pos:
		direction.y = -1
	elif position.y + 10 < Game.ball_pos:
		direction.y = 1
	
	if Game.oponent_move == true:
		var _collision = move_and_collide(direction * speed * delta)
