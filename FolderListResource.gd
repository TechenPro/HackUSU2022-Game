extends Resource
class_name FolderListResource

export(String) onready var FolderPath setget set_folder_path

var all_resources = []

func set_folder_path(value):
	FolderPath = value
	load_all_resources()
	
func load_all_resources() -> void:
	var folder = Directory.new()
	if FolderPath and folder.open(FolderPath) == OK:
		folder.list_dir_begin()
		
		var file_name = folder.get_next()
		while file_name != "":
			if not folder.current_is_dir() and file_name.find(".gd") == -1:
				all_resources.push_back(load(FolderPath.plus_file(file_name)))
			file_name = folder.get_next()
		folder.list_dir_end()
	else:
		print("There was an error accessing the folder.")
		
func find_index_of(resource: Resource) -> int:
	return all_resources.find(resource)
