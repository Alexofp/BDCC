extends Control

onready var filterLine = $HBoxContainer/VBoxContainer/FilterLine
onready var tree = $HBoxContainer/VBoxContainer/Tree
onready var itemList = $HBoxContainer/VBoxContainer2/ItemList

var addedFiles = []

const ignorePaths = {
	"res://.git": true,
	"res://.github": true,
	"res://.import": true,
	"res://AssetsSource": true,
}

func _ready():
	updateTree()
	
func updateTree():
	tree.clear()
	var root = tree.create_item()
	root.set_text(0, "res://")
	tree.set_hide_root(false)
	#var child1 = tree.create_item(root)
	#var _child2 = tree.create_item(root)
	#var subchild1 = tree.create_item(child1)
	#subchild1.set_text(0, "Subchild1")
	var filter = filterLine.text
	
	fillFolder(root, "res://", filter)
	

func _on_Tree_item_selected():
	print(tree.get_selected())

func fillFolder(root:TreeItem, folder, filter):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin(true, false)
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				var full_path = folder.plus_file(file_name)
				if(ignorePaths.has(full_path)):
					file_name = dir.get_next()
					continue
				
				var child1 = tree.create_item(root)
				child1.set_text(0, file_name)
				child1.collapsed = true
				child1.set_metadata(0, full_path)

				#print("Found directory: " + file_name)
				fillFolder(child1, full_path, filter)
				if(child1.get_children() == null):
					root.remove_child(child1)
			else:
				#if(file_name.get_extension() == "gd"):
				var full_path:String = folder.plus_file(file_name)
				if(filter == "" || (filter in full_path)):
					var child1 = tree.create_item(root)
					child1.set_text(0, file_name)
					child1.set_metadata(0, full_path)
			file_name = dir.get_next()
	else:
		printerr("An error occurred when trying to access the path "+folder)


func _on_Button_pressed():
	updateTree()


func _on_FilterLine_text_entered(_new_text):
	updateTree()


func _on_AddFilesButton_pressed():
	var selected = tree.get_selected()
	var metadata = selected.get_metadata(0)
	if(metadata == null):
		return
	var path = metadata
	var dir = Directory.new()
	if(dir.dir_exists(path)):
		print(path)
		addFilesRec(path)
		updateAddedFiles()
		return
	
	var file = File.new()
	if(file.file_exists(path)):
		print(path)
		if(!addedFiles.has(path)):
			addedFiles.append(path)
			updateAddedFiles()
		return
	
	print("NOT FOUND")

func addFilesRec(folder):
	var dir = Directory.new()
	if dir.open(folder) == OK:
		dir.list_dir_begin(true, false)
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				var full_path = folder.plus_file(file_name)
				addFilesRec(full_path)
			else:
				var full_path:String = folder.plus_file(file_name)
				if(!addedFiles.has(full_path)):
					addedFiles.append(full_path)
			file_name = dir.get_next()

func updateAddedFiles():
	itemList.clear()
	for file in addedFiles:
		itemList.add_item(file)


func _on_RemoveFilesButton_pressed():
	for i in itemList.get_selected_items():
		var file = itemList.get_item_text(i)
		
		if(addedFiles.has(file)):
			addedFiles.erase(file)
	updateAddedFiles()


func _on_MakeModButton_pressed():
	var packer = PCKPacker.new()
	packer.pck_start("user://mods/test.pck")
	for file in addedFiles:
		packer.add_file(file, file)
	packer.flush()

