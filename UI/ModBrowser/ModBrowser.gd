extends Control

onready var http_request = $HTTPRequest
onready var http_request_mod = $HTTPRequestMod
var modEntryScene = preload("res://UI/ModBrowser/ModBrowserEntry.tscn")
onready var modSearch = $VBoxContainer/HBoxContainer/PanelContainer/VBoxContainer/ModSearch
onready var modListScrollContainer = $VBoxContainer/HBoxContainer/PanelContainer/VBoxContainer/ScrollContainer
onready var modList = $VBoxContainer/HBoxContainer/PanelContainer/VBoxContainer/ScrollContainer/ModList
onready var modDescriptionLabel = $VBoxContainer/HBoxContainer/VBoxContainer/PanelContainer2/VBoxContainer/RichTextLabel
onready var downloadingContainer = $DownloadingContrainer
onready var messageDialog = $MessageDialog

var allMods:Array = []
var modCountByAuthor:Dictionary = {}
var pickedModEntry:ModEntry
var visualModEntries:Array = []

var viewModsByAuthorUriPrefix:String = "view_mods_by:"
var sortType:String = "newest" #newest, oldest, name
var searchQuery:String = ""
var downloadedMods:bool = false

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
	modCountByAuthor.clear()

func resetModListScroll() -> void:
	modListScrollContainer.set_deferred("scroll_vertical", 0)

func updateModList():
	var filteredMods:Array = getSearchQueryFilteredMods()
	visualModEntries.clear()
	Util.delete_children(modList)
	for modEntry in filteredMods:
		var newBrowserEntry = modEntryScene.instance()
		modList.add_child(newBrowserEntry)
		newBrowserEntry.setModEntry(modEntry)
		var _ok = newBrowserEntry.connect("onSelected", self, "onModEntrySelected")
		if(modEntry == pickedModEntry):
			newBrowserEntry.makeActive()
		visualModEntries.append(newBrowserEntry)
	resetModListScroll()

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
		newModEntry.authorsData = parseAuthorField(newModEntry.author)
		newModEntry.description = theModEntry["description"]
		newModEntry.modversion = theModEntry["modversion"]
		newModEntry.gameversion = theModEntry["gameversion"]
		newModEntry.download = theModEntry["download"]
		newModEntry.index = _i
		_i += 1
		
		incrementModCountForAuthors(newModEntry.authorsData)
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
		var linkedAuthors:Dictionary = getLinkedAuthors(pickedModEntry.authorsData)
		var text = ""
		text += "Name: "+str(pickedModEntry.name)+"\n"
		text += "Author"+("s" if(linkedAuthors.isMultiple) else "")+": "+linkedAuthors.bbcode+"\n"
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

func incrementModCountForAuthors(authorsData) -> void:
	for authorName in authorsData.authors:
		var authorNameLower:String = authorName.to_lower()
		if(modCountByAuthor.has(authorNameLower)):
			modCountByAuthor[authorNameLower] += 1
		else:
			modCountByAuthor[authorNameLower] = 1

func parseAuthorField(authorField:String) -> Dictionary:
	var authors:Array = []
	var preferredSeparator:String = ", "
	if(", " in authorField):
		authors = authorField.split(", ")
		preferredSeparator = ", "
	elif(" & " in authorField):
		authors = authorField.split(" & ")
		preferredSeparator = " & "
	elif(" / " in authorField):
		authors = authorField.split(" / ")
		preferredSeparator = " / "
	else:
		authors.append(authorField)
	return {
		authors = authors,
		preferredSeparator = preferredSeparator,
	}

func getLinkedAuthors(authorsData:Dictionary) -> Dictionary:
	var bbcode:String = ""
	for authorName in authorsData.authors:
		var authorNameLower:String = authorName.to_lower()
		var authorModCount:int = modCountByAuthor[authorNameLower] if(modCountByAuthor.has(authorNameLower)) else 1
		if(bbcode != ""):
			bbcode += authorsData.preferredSeparator
		bbcode += authorName+" [color=#BBCCFF][url="+viewModsByAuthorUriPrefix+authorName+"]("+str(authorModCount)+" mod"+("s" if(authorModCount >= 2) else "")+")[/url][/color]"
	return {
		isMultiple = (authorsData.authors.size() > 1),
		bbcode = bbcode,
	}

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
	if(meta.begins_with(viewModsByAuthorUriPrefix)):
		var exactAuthorSearchQuery:String = "\"@"+meta.trim_prefix(viewModsByAuthorUriPrefix)+"\""
		# moves caret to the end as opposed to using modSearch.text = "...
		modSearch.clear()
		modSearch.append_at_cursor(exactAuthorSearchQuery)
		setSearchQuery(exactAuthorSearchQuery)
		updateModList()
		return
	var _ok = Util.fixed_shell_open(meta)


func _on_ModSearch_text_changed(new_text:String) -> void:
	var new_text_length = new_text.length()
	if((new_text_length == 0) || (new_text_length > 2)):
		setSearchQuery(new_text)
		updateModList()

func setSearchQuery(newQuery:String) -> void:
	searchQuery = newQuery

func getSearchQueryFilteredMods() -> Array:
	if(searchQuery.empty()):
		return allMods
	var modsFound:Array = []
	var searchQueryLower:String = searchQuery.to_lower()
	var searchQuerySpecial:String = ""
	var isExactAuthorSearch:bool = searchQuery.begins_with("\"@") && searchQuery.ends_with("\"")
	var isSubstringAuthorSearch:bool = searchQuery.begins_with("@")
	if(isExactAuthorSearch):
		searchQuerySpecial = searchQuery.trim_prefix("\"@").trim_suffix("\"")
	elif(isSubstringAuthorSearch):
		searchQuerySpecial = searchQueryLower.trim_prefix("@")

	for mod in allMods:
		if(isExactAuthorSearch):
			for authorName in mod.authorsData.authors:
				if(searchQuerySpecial == authorName):
					modsFound.append(mod)
					break
		elif(isSubstringAuthorSearch):
			if mod.author.to_lower().find(searchQuerySpecial) != -1:
				modsFound.append(mod)
		else:
			if searchQueryLower in mod.name.to_lower():
				modsFound.append(mod)
	return modsFound
	
