extends Node

var curr_song: int = 0
var total_songs: int = 0
var is_legal: bool = false

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
		if (not file.begins_with(".")) and (not file.ends_with(".import")):
			list.append(load(path + file))

		file = dir.get_next()

	dir.list_dir_end()

	total_songs = list.size()
	list.shuffle()
