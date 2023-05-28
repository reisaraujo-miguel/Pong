extends Node

var curr_song: int = 0;
var total_songs: int = 0;

var list: Array

func _ready() -> void:
	var dir: DirAccess = DirAccess.open("res://assets/sounds/musics/")
	dir.list_dir_begin()

	var file = dir.get_next()
	while file != "":
		if (not file.begins_with(".")) and (not file.ends_with(".import")):
			list.append(load("res://assets/sounds/musics/" + file))

		file = dir.get_next()

	dir.list_dir_end()

	total_songs = list.size()
	list.shuffle()
