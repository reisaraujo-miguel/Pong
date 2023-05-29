extends Control


func _on_start_btn_button_up() -> void:
	%StartMenu.visible = false
	%ModeMenu.visible = true


func _on_quit_btn_button_up() -> void:
	get_tree().quit()


func _on_settings_pressed() -> void:
	%Menu.visible = false
	%Settings.visible = true


func _on_settings_return_pressed() -> void:
	%Settings.visible = false
	%Menu.visible = true


func _on_mode_menu_back_button_pressed() -> void:
	%ModeMenu.visible = false
	%StartMenu.visible = true


func _on_audio_stream_player_finished() -> void:
	%AudioStreamPlayer.play()
