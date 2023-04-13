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
		var error = http_request.request("https://raw.githubusercontent.com/Alexofp/BDCCMods/main/allmods.json")
		if error != OK:
			Log.printerr("[ModBrowser] An error occurred in the HTTP request.")

func resetMods():
	pickedModEntry = null
	Util.delete_children(modList)
	allMods.clear()

func updateModList():
	visualModEntries.clear()
	Util.delete_children(modList)
	for modEntry in allMods:
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
			text += "[color=red]Game version: " + str(pickedModEntry.gameversion)+" (You are running verson "+GlobalRegistry.getGameVersionString()+")[/color]\n"
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
	
	Log.print("Mod downloaded")

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
	var _ok = OS.shell_open(meta)
