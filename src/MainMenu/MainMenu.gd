extends Control


func _on_start_btn_button_up() -> void:
	var _new_scene: Error = get_tree().change_scene_to_file(
		"res://src/ModeMenu/ModeMenu.tscn"
	)


func _on_quit_btn_button_up() -> void:
	get_tree().quit()
