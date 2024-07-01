extends Control

onready var http_request = $HTTPRequest
onready var http_request_mod = $HTTPRequestMod
var datapackEntryScene = preload("res://Game/Datapacks/UI/DatapackBrowserEntry.tscn")
onready var modList = $VBoxContainer/HBoxContainer/PanelContainer/VBoxContainer/ScrollContainer/ModList
onready var modDescriptionLabel = $VBoxContainer/HBoxContainer/VBoxContainer/PanelContainer2/VBoxContainer/RichTextLabel
onready var downloadingContainer = $DownloadingContrainer
onready var messageDialog = $MessageDialog
onready var http_request_preview = $HTTPRequestPreview
onready var preview_texture_rect = $VBoxContainer/HBoxContainer/VBoxContainer/PanelContainer2/VBoxContainer/PreviewTextureRect
onready var preview_downloading_image = $VBoxContainer/HBoxContainer/VBoxContainer/PanelContainer2/VBoxContainer/PreviewDownloadingImage

var allDatapacks = []
var selectedDatapackIndex:int = -1
var visualModEntries = []

var sortType = "newest" #newest, oldest, name
var downloadedMods = false

var baseUrl = "https://raw.githubusercontent.com/Alexofp/BDCCMods/main/"

signal closePressed

func _ready():
	pass

func getMenu():
	var toCheck = self
	while(toCheck != null):
		if(toCheck.has_method("isDatapackMenu")):
			return toCheck
		toCheck = toCheck.get_parent()
	return null

func showAlert(theText:String):
	var theMenu = getMenu()
	if(theMenu == null):
		printerr("Was unable to show an alert, no menu var is set. Alert text is: "+str(theText))
	else:
		theMenu.showAlert(theText)

func _on_ModBrowser_visibility_changed():
	if(visible && !downloadedMods):
		downloadedMods = true
		var error = http_request.request(baseUrl.plus_file("datapacks.json"))
		if error != OK:
			showAlert("[DatapackBrowser] An error occurred in the HTTP request.")

func resetMods():
	selectedDatapackIndex = -1
	Util.delete_children(modList)
	allDatapacks.clear()

func updateModList():
	visualModEntries.clear()
	Util.delete_children(modList)
	for modEntry in allDatapacks:
		var newBrowserEntry = datapackEntryScene.instance()
		modList.add_child(newBrowserEntry)
		newBrowserEntry.id = modEntry["id"]
		newBrowserEntry.index = modEntry["index"]
		newBrowserEntry.setEntry(modEntry)
		var _ok = newBrowserEntry.connect("onSelected", self, "onModEntrySelected")
		if(modEntry["index"] == selectedDatapackIndex):
			newBrowserEntry.makeActive()
		visualModEntries.append(newBrowserEntry)

func _on_HTTPRequest_request_completed(result, _response_code, _headers, body):
	if result != HTTPRequest.RESULT_SUCCESS:
		showAlert("[DatapackBrowser] Couldn't download mods data from github")
		return
	
	var jsonResult = JSON.parse(body.get_string_from_utf8())
	if(jsonResult.error != OK):
		showAlert("[DatapackBrowser] Couldn't parse json data from github.")
		return
	
	var modsData = jsonResult.result
	
	resetMods()
	
	if(!(modsData is Dictionary)):
		return
	
	if(!modsData.has("datapacks")):
		return
	
	var modsStuff = modsData["datapacks"]
	if(!(modsStuff is Array)):
		return
	
	var _i = 0
	var requiredFields = ["id", "name", "author", "download", "description", "version", "contains", "contains", "filesize"]
	for theModEntry in modsStuff:
		if(!(theModEntry is Dictionary)):
			continue
		
		for requiredField in requiredFields:
			if(!theModEntry.has(requiredField) || !(theModEntry[requiredField] is String)):
				continue
		
		var newDatapackEntry = {}
		newDatapackEntry["id"] = theModEntry["id"]
		newDatapackEntry["name"] = theModEntry["name"]
		newDatapackEntry["author"] = theModEntry["author"]
		newDatapackEntry["version"] = theModEntry["version"]
		newDatapackEntry["description"] = theModEntry["description"]
		newDatapackEntry["contains"] = theModEntry["contains"]
		newDatapackEntry["download"] = theModEntry["download"]
		newDatapackEntry["filesize"] = theModEntry["filesize"]
		if(theModEntry.has("preview")):
			newDatapackEntry["preview"] = theModEntry["preview"]
		else:
			newDatapackEntry["preview"] = null
		newDatapackEntry["index"] = _i
		_i += 1
		
		allDatapacks.append(newDatapackEntry)

	sortType = "newest"
	allDatapacks.sort_custom(self, "sort_newest")
	updateModList()

func getPickedEntry():
	if(selectedDatapackIndex < 0 || selectedDatapackIndex >= allDatapacks.size()):
		return null
	for datapack in allDatapacks:
		if(datapack["index"] == selectedDatapackIndex):
			return datapack
	return null

func updatePickedModEntry():
	for visualModEntry in visualModEntries:
		if(visualModEntry["index"] == selectedDatapackIndex):
			visualModEntry.makeActive()
		else:
			visualModEntry.makeInactive()
	
	if(selectedDatapackIndex  < 0):
		modDescriptionLabel.bbcode_text = "Select a datapack on the left"
	else:
		var pickedModEntry = getPickedEntry()
		var text = ""
		text += "ID: "+str(pickedModEntry["id"])+"\n"
		text += "Name: "+str(pickedModEntry["name"])+"\n"
		text += "Author: "+str(pickedModEntry["author"])+"\n"
		text += "Version: "+str(pickedModEntry["version"])+"\n"
		text += "Filesize: "+ String.humanize_size(pickedModEntry["filesize"])+"\n"
		text += ""+str(pickedModEntry["contains"])+"\n"
		#text += "Mod version: "+str(pickedModEntry.modversion)+"\n"
		#if(!GlobalRegistry.isVersionListHasCompatible(str(pickedModEntry.gameversion))):
		#	text += "[color=red]Game version: " + str(pickedModEntry.gameversion)+" (You are running verson "+GlobalRegistry.getGameVersionString()+")[/color]\n"
		#else:
		#	if(pickedModEntry.gameversion == "*"):
		#		text += "Game version: Any\n"
		#	else:
		#		text += "Game version: " + str(pickedModEntry.gameversion)+"\n"
		#text += "Filename: "+str(pickedModEntry.download.get_file())+"\n"
		
		text += "\n"
		text += str(pickedModEntry["description"])
		
		modDescriptionLabel.bbcode_text = text

func onModEntrySelected(theModEntry):
	selectedDatapackIndex = theModEntry["index"]
	#pickedModEntry = theModEntry
	
	if(theModEntry.has("preview") && theModEntry["preview"] != null):
		if(cachedPreviewTextures.has(str(selectedDatapackIndex))):
			preview_texture_rect.texture = cachedPreviewTextures[str(selectedDatapackIndex)]
			preview_texture_rect.visible = true
			preview_downloading_image.visible = false
		else:
			preview_texture_rect.texture = null
			preview_texture_rect.visible = false
			startDownloadingPreview(selectedDatapackIndex, baseUrl.plus_file(theModEntry["preview"]))
			preview_downloading_image.visible = true
	else:
		preview_texture_rect.texture = null
		preview_texture_rect.visible = false
		preview_downloading_image.visible = false
	
	updatePickedModEntry()
	
	


func _on_DownloadModButton_pressed():
	if(selectedDatapackIndex < 0):
		return
	
	var pickedModEntry = getPickedEntry()
	var fileName = pickedModEntry["download"].get_file()
	
	downloadingContainer.visible = true
	http_request_mod.download_file = GlobalRegistry.getDatapacksFolder().plus_file(fileName)
	var error = http_request_mod.request(baseUrl.plus_file(pickedModEntry["download"]))
	if error != OK:
		showAlert("[DatapackBrowser] An error occurred in the HTTP request.")
	else:
		Log.print("Downloading datapack: "+str(pickedModEntry.download))


func _on_HTTPRequestMod_request_completed(result, _response_code, _headers, _body):
	downloadingContainer.visible = false

	if result != HTTPRequest.RESULT_SUCCESS:
		showAlert("[DatapackBrowser] Couldn't download datapack. Sorry")
		return
	
	Log.print("Datapack downloaded")

func showMessage(text):
	messageDialog.dialog_text = text
	messageDialog.show()


static func sort_name(a, b):
	if a["name"] < b["name"]:
		return true
	return false

static func sort_newest(a, b):
	if a["index"] > b["index"]:
		return true
	return false

static func sort_oldest(a, b):
	if a["index"] < b["index"]:
		return true
	return false

func _on_SortNameButton_pressed():
	sortType = "name"
	allDatapacks.sort_custom(self, "sort_name")
	updateModList()


func _on_SortNewestFirstButton_pressed():
	sortType = "newest"
	allDatapacks.sort_custom(self, "sort_newest")
	updateModList()


func _on_SortOldestFirstButton_pressed():
	sortType = "oldest"
	allDatapacks.sort_custom(self, "sort_oldest")
	updateModList()

func _on_CloseButton_pressed():
	emit_signal("closePressed")


func _on_RichTextLabel_meta_clicked(meta):
	var _ok = OS.shell_open(meta)


var cachedPreviewTextures = {}
var isDownloadingPreviewIndex = -1
var isDownloadingPreview = false
var isDownloadingPNG = true
func startDownloadingPreview(index, url:String):
	if(isDownloadingPreview):
		http_request_preview.cancel_request()
	#print(url)
	isDownloadingPreviewIndex = index
	isDownloadingPreview = true
	if(url.get_file().get_extension().to_lower() in ["jpg", "jpeg"]):
		isDownloadingPNG = false
	else:
		isDownloadingPNG = true
	var error = http_request_preview.request(url)
	if error != OK:
		Log.printerr("Datapack browser failed to start loading a preview image")
		return

func _on_HTTPRequestPreview_request_completed(result, _response_code, _headers, body):
	isDownloadingPreview = false
	if result != HTTPRequest.RESULT_SUCCESS:
		Log.printerr("Datapack browser failed to download a preview image")
		return
	
	var image = Image.new()
	if(isDownloadingPNG):
		var error = image.load_png_from_buffer(body)
		if error != OK:
			Log.printerr("Datapack browser failed to load up a preview image (not a png?)")
			return
	else:
		var error = image.load_jpg_from_buffer(body)
		if error != OK:
			Log.printerr("Datapack browser failed to load up a preview image (not a jpg?)")
			return
	
	var texture := ImageTexture.new()
	texture.create_from_image(image)
	preview_texture_rect.texture = texture
	cachedPreviewTextures[str(isDownloadingPreviewIndex)] = texture
	preview_texture_rect.visible = true
	preview_downloading_image.visible = false


func _on_OpenFullButton_pressed():
	$FullTextureRect.texture = $VBoxContainer/HBoxContainer/VBoxContainer/PanelContainer2/VBoxContainer/PreviewTextureRect.texture
	$FullTextureRect.visible = true

func _on_CloseFullButton_pressed():
	$FullTextureRect.texture = null
	$FullTextureRect.visible = false
