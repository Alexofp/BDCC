extends Control

onready var filterLine = $HBoxContainer/VBoxContainer/FilterLine
onready var tree = $HBoxContainer/VBoxContainer/Tree
onready var itemList = $HBoxContainer/VBoxContainer2/ItemList
onready var modNameEdit = $HBoxContainer/VBoxContainer2/HBoxContainer/ModNameEdit
onready var exportModeSelector = $HBoxContainer/VBoxContainer2/ExportModeSelector

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
	#print(tree.get_selected())
	pass

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
		Log.printerr("An error occurred when trying to access the path "+folder)


func _on_Button_pressed():
	updateTree()


func _on_FilterLine_text_entered(_new_text):
	updateTree()


func _on_AddFilesButton_pressed():
	var selectedAr = []
	var thingie = tree.get_next_selected(null)
	while(thingie != null):
		selectedAr.append(thingie)
		thingie = tree.get_next_selected(thingie)
	
	#print(selectedAr)
	for stuff in selectedAr:
		addSelected(stuff)
	
func addSelected(selected):
	#var selected = tree.get_selected()
	if(selected == null):
		return
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
	print(exportModeSelector.selected)
	
	#if(exportModeSelector.selected == 0):
	#	useTar()
		
	if(exportModeSelector.selected == 0):
		gatherFiles()
	if(exportModeSelector.selected == 1):
		makePCKFile()

func useTar():
	var modName = "new_mod"
	var editModName = Util.stripBadFilenameCharacters(modNameEdit.text)
	if(editModName != ""):
		modName = editModName
	
	var directory = Directory.new( )
	#directory.remove("user://new_mod")
	var baseNewModFolder = "user://exported_mods/"+modName
	var newModFolder = baseNewModFolder
	var i = 1
	while(directory.dir_exists(newModFolder)):
		i += 1
		newModFolder = baseNewModFolder + str(i)
	directory.make_dir_recursive(newModFolder)
	
	for file in addedFiles:
		if(file.get_extension() == "import"):
			var config = ConfigFile.new()
			var err = config.load(file)
			if err == OK:
				if(config.has_section_key("remap", "path")):
					var importFile:String = config.get_value("remap", "path")
					
					var newPath2:String = importFile.replace("res://",newModFolder+"/")
					directory.make_dir_recursive(newPath2.get_base_dir())
					directory.copy(importFile, newPath2)
					print("Also exported as dependency "+importFile)
					
		var newPath:String = file.replace("res://",newModFolder+"/")
		directory.make_dir_recursive(newPath.get_base_dir())
		directory.copy(file, newPath)
	
	var output = []
	
	#var _ok = OS.execute('tar', ['-a', '-cf', ProjectSettings.globalize_path("user://exported_mods/".plus_file(modName+".zip")), "-C", ProjectSettings.globalize_path(newModFolder), "*", '.import/', '--force-local'], true, output, true)
	var _ok = OS.execute('powershell', ['Compress-Archive', ProjectSettings.globalize_path(newModFolder).plus_file("*"), ProjectSettings.globalize_path("user://exported_mods/".plus_file(modName+".zip"))], true, output, true)
	print(output)
	
	Util.removeDirectory(newModFolder)
	
	if(!(OS.get_name() in ["Android", "iOS", "HTML5"])):
		var _ok2 = OS.shell_open(ProjectSettings.globalize_path("user://exported_mods/"))
	
func gatherFiles():
	var modName = "new_mod"
	var editModName = Util.stripBadFilenameCharacters(modNameEdit.text)
	if(editModName != ""):
		modName = editModName
	
	var directory = Directory.new( )
	#directory.remove("user://new_mod")
	var baseNewModFolder = "user://exported_mods/"+modName
	var newModFolder = baseNewModFolder
	var i = 1
	while(directory.dir_exists(newModFolder)):
		i += 1
		newModFolder = baseNewModFolder + str(i)
	directory.make_dir_recursive(newModFolder)
	
	for file in addedFiles:
		if(file.get_extension() == "import"):
			var config = ConfigFile.new()
			var err = config.load(file)
			if err == OK:
				if(config.has_section_key("remap", "path")):
					var importFile:String = config.get_value("remap", "path")
					
					var newPath2:String = importFile.replace("res://",newModFolder+"/")
					directory.make_dir_recursive(newPath2.get_base_dir())
					directory.copy(importFile, newPath2)
					print("Also exported as dependency "+importFile)
					
		var newPath:String = file.replace("res://",newModFolder+"/")
		directory.make_dir_recursive(newPath.get_base_dir())
		directory.copy(file, newPath)
	
	if(!(OS.get_name() in ["Android", "iOS", "HTML5"])):
		var _ok = OS.shell_open(ProjectSettings.globalize_path(newModFolder))
	
func makePCKFile():
	var directory = Directory.new( )
	directory.make_dir("user://exported_mods")
	
	var modName = "newmod.pck"
	var editModName = Util.stripBadFilenameCharacters(modNameEdit.text)
	if(editModName != ""):
		modName = editModName+".pck"
	
	var packer = PCKPacker.new()
	packer.pck_start("user://exported_mods".plus_file(modName))
	for file in addedFiles:
		if(file.get_extension() == "import"):
			var config = ConfigFile.new()
			var err = config.load(file)
			if err == OK:
				if(config.has_section_key("remap", "path")):
					var importFile = config.get_value("remap", "path")
					packer.add_file(importFile, importFile)
					print("Also exported as dependency "+importFile)
					
		packer.add_file(file, file)
	packer.flush()

	if(!(OS.get_name() in ["Android", "iOS", "HTML5"])):
		var _ok = OS.shell_open(ProjectSettings.globalize_path("user://exported_mods"))


func _on_Tree_multi_selected(_item, _column, _selected):
	if(true):
		return
	var selectedAr = []
	var thingie = tree.get_next_selected(null)
	while(thingie != null):
		selectedAr.append(thingie)
		thingie = tree.get_next_selected(thingie)
	
	print(selectedAr)

	#print("BEGIN ", tree.get_selected(), " END ", tree.get_end())
