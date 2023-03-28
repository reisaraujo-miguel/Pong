extends CharacterBody2D

var direction: Vector2
var angle_list: Array = [50, 40, 30, -30, -40, -50]
var angle_index: int
var collision: KinematicCollision2D

@onready var speed: int = Game.ball_speed


func _ready() -> void:
	if Game.serving_player == Game.PLAYER_1:
		global_position = Game.player_1_pos
		direction.x = 1
	else:
		global_position = Game.player_2_pos
		direction.x = -1

	angle_index = randi() % 6
	direction = direction.rotated(deg_to_rad(angle_list[angle_index]))
	#direction = direction.rotated(deg_to_rad(30))


func _physics_process(delta: float) -> void:
	collision = move_and_collide(direction * speed * delta)
	Game.ball_pos = position.y

	if global_position.x > 1280.0 / 4.0 and direction.x > 0:
		Game.oponent_move = true
	elif global_position.x < (1280.0 / 4.0) * 3 and direction.x < 0:
		Game.oponent_move = false

	if collision:
		direction = direction.bounce(collision.get_normal())


func _on_up_body_entered(body: Node2D) -> void:
	if body == self:
		angle_index = randi() % 2

		if Game.oponent_move:
			direction = Vector2(-1, 0).rotated(
				deg_to_rad(angle_list[angle_index])
			)
			print("oponent up")
		else:
			direction = Vector2(1, 0).rotated(
				deg_to_rad(angle_list[angle_index + 3])
			)


func _on_down_body_entered(body: Node2D) -> void:
	if body == self:
		angle_index = randi() % 2

		if Game.oponent_move:
			print("oponent down")
			direction = Vector2(-1, 0).rotated(
				deg_to_rad(angle_list[angle_index + 4])
			)
		else:
			direction = Vector2(1, 0).rotated(
				deg_to_rad(angle_list[angle_index])
			)
