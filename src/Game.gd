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
var current_scene: Node = null


func _ready() -> void:
	randomize()

	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("fullscreen"):
		if get_window().mode == Window.MODE_WINDOWED:
			if OS.get_name() == "Windows":
				get_window().mode = (Window.MODE_EXCLUSIVE_FULLSCREEN)
			else:
				get_window().mode = (Window.MODE_FULLSCREEN)
		else:
			get_window().mode = (Window.MODE_WINDOWED)

	if Input.is_action_just_pressed("main_menu"):
		goto_scene("res://src/MainMenu/MainMenu.tscn")


func goto_scene(path: NodePath):
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path: NodePath):
	# It is now safe to remove the current scene
	current_scene.free()

	# Load the new scene.
	var s: Resource = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
