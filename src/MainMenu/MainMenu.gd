extends Control


func _on_start_btn_button_up() -> void:
	Game.goto_scene("res://src/ModeMenu/ModeMenu.tscn")


func _on_quit_btn_button_up() -> void:
	get_tree().quit()
