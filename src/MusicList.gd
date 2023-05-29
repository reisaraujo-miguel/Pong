extends Node

var curr_song: int = 0
var total_songs: int = 0
var is_legal: bool = true

var list: Array


func _ready() -> void:
	var path: String

	if is_legal:
		path = "res://assets/sounds/musics/"
	else:
		path = "res://assets/sounds/illegal/"

	var dir: DirAccess = DirAccess.open(path)

	dir.list_dir_begin()

	var file = dir.get_next()
	while file != "":
		# For some reason, after exporting, godot fails to recognize audio files
		# when trying to get their names this way. But it does recognize import
		# files, so this work around is the only way I was able to fix this
		if file.ends_with(".import"):
			file = file.replace(".import", "")
			list.append(load(path + file))

		file = dir.get_next()

	dir.list_dir_end()

	total_songs = list.size()
	list.shuffle()
