extends Control

onready var http_request = $HTTPRequest
onready var http_request_mod = $HTTPRequestMod
var modEntryScene = preload("res://UI/ModBrowser/ModBrowserEntry.tscn")
onready var modList = $VBoxContainer/HBoxContainer/PanelContainer/VBoxContainer/ScrollContainer/ModList
onready var modDescriptionLabel = $VBoxContainer/HBoxContainer/VBoxContainer/PanelContainer2/VBoxContainer/RichTextLabel
onready var downloadingContainer = $DownloadingContrainer
onready var messageDialog = $MessageDialog

var allMods = []
var pickedModEntry:ModEntry
var visualModEntries = []

var sortType = "newest" #newest, oldest, name
var downloadedMods = false

signal closePressed

func _ready():
	pass

func _on_ModBrowser_visibility_changed():
	if(visible && !downloadedMods):
		downloadedMods = true
		
		# 1. Clear out placeholder layout elements instantly
		resetMods()
		
		# 2. Inject your local test mod straight into the active array
		var localModEntry = ModEntry.new()
		localModEntry.name = "★ Local Custom Mod (Injected) ★"
		localModEntry.author = "Localhost"
		localModEntry.description = "Anonymously hosted zip archive loaded from your device via QRServ loopback background connection."
		localModEntry.modversion = "1.0"
		localModEntry.gameversion = "*"
		localModEntry.download = "http://127.0.0.1:8080/mod.zip"
		localModEntry.index = 0
		allMods.append(localModEntry)
		
		# 3. Fetch Alex's full catalog from GitHub
		var error = http_request.request("https://raw.githubusercontent.com/Alexofp/BDCCMods/main/allmods.json")
		if error != OK:
			Log.printerr("[ModBrowser] An error occurred in the HTTP request.")
		
		sortType = "newest"
		
		# 4. Give Godot a brief moment to open the UI containers before rendering cards
		yield(get_tree(), "idle_frame")
		updateModList()

func resetMods():
	pickedModEntry = null
	Util.delete_children(modList)
	allMods.clear()

func updateModList(modsArray = allMods):
	visualModEntries.clear()
	Util.delete_children(modList)
	for modEntry in modsArray:
		var newBrowserEntry = modEntryScene.instance()
		modList.add_child(newBrowserEntry)
		newBrowserEntry.setModEntry(modEntry)
		var _ok = newBrowserEntry.connect("onSelected", self, "onModEntrySelected")
		if(modEntry == pickedModEntry):
			newBrowserEntry.makeActive()
		visualModEntries.append(newBrowserEntry)

func _on_HTTPRequest_request_completed(result, _response_code, _headers, body):
	if result != HTTPRequest.RESULT_SUCCESS:
		Log.printerr("[ModBrowser] Couldn't download mods data from github")
		return
	
	var jsonResult = JSON.parse(body.get_string_from_utf8())
	if(jsonResult.error != OK):
		Log.printerr("[ModBrowser] Couldn't parse json data from github.")
		return
	
	var modsData = jsonResult.result
	
	resetMods()
	
	if(!(modsData is Dictionary)):
		return
	
	if(!modsData.has("mods")):
		return
	
	var modsStuff = modsData["mods"]
	if(!(modsStuff is Array)):
		return
	
	var _i = 0
	var requiredFields = ["name", "author", "download", "description", "modversion", "gameversion"]
	for theModEntry in modsStuff:
		if(!(theModEntry is Dictionary)):
			continue
		
		for requiredField in requiredFields:
			if(!theModEntry.has(requiredField) || !(theModEntry[requiredField] is String)):
				continue
		
		var newModEntry = ModEntry.new()
		newModEntry.name = theModEntry["name"]
		newModEntry.author = theModEntry["author"]
		newModEntry.description = theModEntry["description"]
		newModEntry.modversion = theModEntry["modversion"]
		newModEntry.gameversion = theModEntry["gameversion"]
		newModEntry.download = theModEntry["download"]
		newModEntry.index = _i
		_i += 1
		
		allMods.append(newModEntry)
		
	var already_has_local = false
	for checkingMod in allMods:
		if checkingMod.name == "★ Local Custom Mod (Injected) ★":
			already_has_local = true
			break
			
	if not already_has_local:
		var localModEntry = ModEntry.new()
		localModEntry.name = "★ Local Custom Mod (Injected) ★"
		localModEntry.author = "Localhost"
		localModEntry.description = "Anonymously hosted zip archive loaded from your device via QRServ loopback background connection."
		localModEntry.modversion = "1.0"
		localModEntry.gameversion = "*"
		localModEntry.download = "http://127.0.0.1:8080/mod.zip"
		localModEntry.index = 0 
		allMods.insert(0, localModEntry) 
	
	sortType = "newest"
	allMods.sort_custom(self, "sort_newest")
	updateModList()

func updatePickedModEntry():
	for visualModEntry in visualModEntries:
		if(visualModEntry.storedEntry == pickedModEntry):
			visualModEntry.makeActive()
		else:
			visualModEntry.makeInactive()
	
	if(pickedModEntry == null):
		modDescriptionLabel.bbcode_text = "Select a mod on the left"
	else:
		var text = ""
		text += "Name: "+str(pickedModEntry.name)+"\n"
		text += "Author: "+str(pickedModEntry.author)+"\n"
		text += "Mod version: "+str(pickedModEntry.modversion)+"\n"
		if(!GlobalRegistry.isVersionListHasCompatible(str(pickedModEntry.gameversion))):
			text += "[color=red]Game version: " + str(pickedModEntry.gameversion)+" (You are running version "+GlobalRegistry.getGameVersionString()+")[/color]\n"
		else:
			if(pickedModEntry.gameversion == "*"):
				text += "Game version: Any\n"
			else:
				text += "Game version: " + str(pickedModEntry.gameversion)+"\n"
		text += "Filename: "+str(pickedModEntry.download.get_file())+"\n"
		
		text += "\n"
		text += str(pickedModEntry.description)
		
		modDescriptionLabel.bbcode_text = text

func onModEntrySelected(theModEntry):
	pickedModEntry = theModEntry
	updatePickedModEntry()

func _on_DownloadModButton_pressed():
	if(pickedModEntry == null):
		return
	
	var fileName = pickedModEntry.download.get_file()
	
	downloadingContainer.visible = true
	http_request_mod.download_file = GlobalRegistry.getModsFolder().plus_file(fileName)
	var error = http_request_mod.request(pickedModEntry.download)
	if error != OK:
		Log.printerr("[ModBrowser] An error occurred in the HTTP request.")
		showMessage("An error occurred in the HTTP request.")
	else:
		Log.print("Downloading mod: "+str(pickedModEntry.download))

func _on_HTTPRequestMod_request_completed(result, _response_code, _headers, _body):
	downloadingContainer.visible = false

	if result != HTTPRequest.RESULT_SUCCESS:
		Log.printerr("[ModBrowser] Couldn't download mod")
		showMessage("Couldn't download mod")
		return
	
	Log.print("Mod downloaded successfully.")

	# --- ULTIMATE ANY-JSON AUTO-RENAMER ---
	if pickedModEntry != null and pickedModEntry.download.get_file() == "mod.zip":
		var modsFolder = GlobalRegistry.getModsFolder()
		var currentPath = modsFolder.plus_file("mod.zip")
		
		var dir = Directory.new()
		if dir.file_exists(currentPath):
			var detected_name = ""
			
			# Mount the zip file into Godot's temporary memory
			if ProjectSettings.load_resource_pack(currentPath):
				var search_dir = Directory.new()
				
				# Open the temporary root folder where the zip files are loaded
				if search_dir.open("res://") == OK:
					search_dir.list_dir_begin(true, true) # Skip hidden system files
					var file_name = search_dir.get_next()
					
					# Scan EVERY file inside the zip until we find one ending in .json
					while file_name != "":
						if not search_dir.current_is_dir() and file_name.get_extension().to_lower() == "json":
							# WE FOUND IT! Whether it's looter.json, getting.json, or mod.json
							var file = File.new()
							if file.open("res://".plus_file(file_name), File.READ) == OK:
								var json_text = file.get_as_text()
								file.close()
								
								var json_parsed = JSON.parse(json_text)
								if json_parsed.error == OK and json_parsed.result is Dictionary:
									var mod_metadata = json_parsed.result
									if mod_metadata.has("name"):
										detected_name = str(mod_metadata["name"]).strip_edges()
									elif mod_metadata.has("id"):
										detected_name = str(mod_metadata["id"]).strip_edges()
							break # Stop looking since we found our JSON file!
						file_name = search_dir.get_next()
					search_dir.list_dir_end()
			
			# Clean and rename the file based on what we read inside that random JSON file
			if detected_name != "":
				var illegal_chars = ["/", "\\", "?", "%", "*", ":", "|", '"', "<", ">"]
				for ch in illegal_chars:
					detected_name = detected_name.replace(ch, "")
				
				var newPath = modsFolder.plus_file(detected_name + ".zip")
				
				if dir.file_exists(newPath):
					dir.remove(newPath)
				
				var rename_error = dir.rename(currentPath, newPath)
				if rename_error == OK:
					Log.print("[ModBrowser] Dynamic Renamer Success: " + detected_name + ".zip")
				else:
					Log.printerr("[ModBrowser] Rename failed. OS Error: " + str(rename_error))
			else:
				Log.printerr("[ModBrowser] Failed to find or parse any valid .json configuration file.")

func showMessage(text):
	messageDialog.dialog_text = text
	messageDialog.show()

static func sort_name(a, b):
	if a.name < b.name:
		return true
	return false

static func sort_newest(a, b):
	if a.index > b.index:
		return true
	return false

static func sort_oldest(a, b):
	if a.index < b.index:
		return true
	return false

func _on_SortNameButton_pressed():
	sortType = "name"
	allMods.sort_custom(self, "sort_name")
	updateModList()

func _on_SortNewestFirstButton_pressed():
	sortType = "newest"
	allMods.sort_custom(self, "sort_newest")
	updateModList()

func _on_SortOldestFirstButton_pressed():
	sortType = "oldest"
	allMods.sort_custom(self, "sort_oldest")
	updateModList()

func _on_CloseButton_pressed():
	emit_signal("closePressed")

func _on_RichTextLabel_meta_clicked(meta):
	var _ok = Util.fixed_shell_open(meta)

func _on_ModSearch_text_changed(new_text: String):
	if new_text.length() > 2:
		var modsFound = []
		for mod in allMods:
			if new_text.begins_with("@"):
				if mod.author.to_lower().find(new_text.to_lower().trim_prefix("@")) != -1:
					modsFound.append(mod)
			else:
				if new_text.to_lower() in mod.name.to_lower():
					modsFound.append(mod)
		updateModList(modsFound)
	if new_text.length() == 0:
		updateModList()