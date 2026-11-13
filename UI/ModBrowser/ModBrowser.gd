extends Control

onready var http_request = $HTTPRequest
onready var http_request_mod = $HTTPRequestMod
var modEntryScene = preload("res://UI/ModBrowser/ModBrowserEntry.tscn")
onready var modSearch = $VBoxContainer/HBoxContainer/PanelContainer/VBoxContainer/ModSearch
onready var modListScrollContainer = $VBoxContainer/HBoxContainer/PanelContainer/VBoxContainer/ScrollContainer
onready var modList = $"%ModList"
onready var modDescriptionLabel = $"%RichTextLabel"
onready var downloadingContainer = $DownloadingContrainer
onready var messageDialog = $MessageDialog
onready var ai_option_button:OptionButton = $"%AIOptionButton"
onready var preview_downloading_image = $"%PreviewDownloadingImage"
onready var preview_texture_rect = $"%PreviewTextureRect"
onready var full_texture_rect = $"%FullTextureRect"
onready var filter_option_button = $"%FilterOptionButton"
onready var category_option_button = $"%CategoryOptionButton"
onready var download_mods_warning_panel_container = $"%DownloadModsWarningPanelContainer"
onready var download_mods_warning_item_list = $"%DownloadModsWarningItemList"
onready var download_mod_and_reqs_button = $"%DownloadModAndReqsButton"
onready var download_name_label = $"%DownloadNameLabel"
onready var prev_page_button = $"%PrevPageButton"
onready var page_label = $"%PageLabel"
onready var next_page_button = $"%NextPageButton"
var page:int = 0
const MAX_MODS_PER_PAGE:int = 50
onready var page_selector_option_button = $"%PageSelectorOptionButton"
onready var fav_button = $"%FavButton"

onready var back_button = $"%BackButton"
onready var forward_button = $"%ForwardButton"

var idToMod:Dictionary = {} # dict[id, ModEntry]
var nameToMod:Dictionary = {} # dict[name, ModEntry]
var modIDUsedByMods:Dictionary = {} # dict[id, Array[ModEntry]]
var categoryToMods:Dictionary = {} # dict[categoryName, Array[ModEntry]]
var categories:Array = []
var allMods:Array = []
var modCountByAuthor:Dictionary = {}
var pickedModEntry:ModEntry
var visualModEntries:Array = []
var favorites:Dictionary = {} # Dict[mod name string, true]
var favoriteModEntries:Array = [] # Array[ModEntry]

var viewModsByAuthorUriPrefix:String = "view_mods_by:"
const ViewModByIDUriPreview = "select_ID:"
const ViewModByNameUriPreview = "select_NAME:"
var sortType:String = "sort_newest"
var searchQuery:String = ""
var downloadedMods:bool = false

var backQueue:Array
var forwardQueue:Array

const AIFILTER_HIDE:int = 0
const AIFILTER_SHOW:int = 1
const AIFILTER_ONLY:int = 2
var aiFilter:int = AIFILTER_HIDE

var categoryFilter:String = ""

signal closePressed

const FAVORITES_PATH:String = "user://FavMods.json"

func _ready():
	ai_option_button.add_item("Hide AI")
	ai_option_button.add_item("Show AI")
	ai_option_button.add_item("Only AI")
	ai_option_button.select(aiFilter)
	
	filter_option_button.add_item("Newest first")
	filter_option_button.add_item("Oldest first")
	filter_option_button.add_item("Sort by name")
	filter_option_button.select(0)

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
	idToMod.clear()
	nameToMod.clear()
	categoryToMods.clear()
	categories.clear()
	modIDUsedByMods.clear()
	backQueue.clear()
	forwardQueue.clear()
	
	updateCurrentPreview()
	updateBackForward()

func resetModListScroll() -> void:
	modListScrollContainer.set_deferred("scroll_vertical", 0)

func updateModList():
	var theMods:Array = allMods
	if(!categoryFilter.empty()):
		if(categoryFilter == "-favs-"):
			theMods = favoriteModEntries
		elif(categoryToMods.has(categoryFilter)):
			theMods = categoryToMods[categoryFilter]
	
	var filteredMods:Array = getSearchQueryFilteredMods(theMods)
	filteredMods = filterModsByAIFilter(filteredMods)
	#filteredMods = filterModsByCategoryFilter(filteredMods)
	visualModEntries.clear()
	
	var theMaxPages:int = int(ceil(float(filteredMods.size()) / float(MAX_MODS_PER_PAGE)))
	if(theMaxPages < 1):
		theMaxPages = 1
	if((page+1) >= theMaxPages):
		page = theMaxPages-1
	
	page_label.text = "Page "+str(page+1)+"/"+str(theMaxPages)
	prev_page_button.disabled = (page <= 0)
	next_page_button.disabled = ((page+1) >= theMaxPages)
	page_selector_option_button.clear()
	for _i in theMaxPages:
		page_selector_option_button.add_item(str(_i+1))
	page_selector_option_button.select(page)
	
	var theAm:int = filteredMods.size()
	Util.delete_children(modList)
	for _i in MAX_MODS_PER_PAGE:
		var _index:int = page*MAX_MODS_PER_PAGE + _i
		if(_index >= theAm):
			break
		var modEntry:ModEntry = filteredMods[_index]
	#for modEntry in filteredMods:
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
		newModEntry.id = readSafeString(theModEntry, "id", "")
		newModEntry.name = readSafeString(theModEntry, "name", "Unknown")
		newModEntry.author = readSafeString(theModEntry, "author", "Unknown")
		newModEntry.authorsData = parseAuthorField(newModEntry.author)
		newModEntry.description = readSafeString(theModEntry, "description", "Missing description")
		newModEntry.modversion = readSafeString(theModEntry, "modversion", "0.0")
		newModEntry.gameversion = readSafeString(theModEntry, "gameversion", "0.0")
		newModEntry.download = readSafeString(theModEntry, "download")
		newModEntry.hasAI = readSafeBool(theModEntry, "ai")
		newModEntry.previewLink = readSafeString(theModEntry, "preview")
		newModEntry.reqs = readSafeArrayOfStrings(theModEntry, "reqs")
		newModEntry.categories = readSafeArrayOfStrings(theModEntry, "categories")
		newModEntry.deleteOnDownload = readSafeArrayOfStrings(theModEntry, "delete")
		newModEntry.index = _i
		
		_i += 1
		
		incrementModCountForAuthors(newModEntry.authorsData)
		allMods.append(newModEntry)
		if(!newModEntry.id.empty()):
			idToMod[newModEntry.id] = newModEntry
		nameToMod[newModEntry.name] = newModEntry
		for theCategory in newModEntry.categories:
			if(!categoryToMods.has(theCategory)):
				categoryToMods[theCategory] = [newModEntry]
				categories.append(theCategory)
			else:
				categoryToMods[theCategory].append(newModEntry)
		if(!newModEntry.reqs.empty()):
			for theReqID in newModEntry.reqs:
				if(!modIDUsedByMods.has(theReqID)):
					modIDUsedByMods[theReqID] = [newModEntry]
				else:
					modIDUsedByMods[theReqID].append(newModEntry)
	
	sortType = "sort_newest"
	sortAll("sort_newest")
	updateModList()
	
	loadFavMods()
	
	category_option_button.clear()
	category_option_button.add_item("All categories")
	category_option_button.add_item("Favorites")
	category_option_button.select(0)
	var _ii:int = 2
	for theCat in categories:
		category_option_button.add_item(theCat)
		if(theCat == categoryFilter):
			category_option_button.select(_ii)
		_ii += 1

func readSafeBool(_entry:Dictionary, _name:String, _def:bool = false) -> bool:
	if(!_entry.has(_name)):
		return _def
	if(!(_entry[_name] is bool)):
		return _def
	return _entry[_name]

func readSafeString(_entry:Dictionary, _name:String, _def:String = "") -> String:
	if(!_entry.has(_name)):
		return _def
	if(!(_entry[_name] is String)):
		return _def
	return _entry[_name]

func readSafeArrayOfStrings(_entry:Dictionary, _name:String, _def:Array = []) -> Array:
	if(!_entry.has(_name)):
		return _def
	if(!(_entry[_name] is Array)):
		return _def
	var theAr:Array = _entry[_name]
	var result:Array = []
	for theThing in theAr:
		if(!(theThing is String)):
			continue
		result.append(theThing)
	return result

func findModByIDOrName(_idOrName:String) -> ModEntry:
	if(idToMod.has(_idOrName)):
		return idToMod[_idOrName]
	if(nameToMod.has(_idOrName)):
		return nameToMod[_idOrName]
	return null

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
		if(!pickedModEntry.categories.empty()):
			if(pickedModEntry.categories.size() == 1):
				text += "Category: "+str(Util.join(pickedModEntry.categories, ", ")+"\n")
			else:
				text += "Categories: "+str(Util.join(pickedModEntry.categories, ", ")+"\n")
		text += "Filename: "+str(pickedModEntry.download.get_file())+"\n"
		if(!pickedModEntry.reqs.empty()):
			var _i:int = 1
			text += "Mod dependencies:\n"
			for theModID in pickedModEntry.reqs:
				var theFind:ModEntry = findModByIDOrName(theModID)
				if(!theFind):
					text += str(_i)+") Unknown (id="+theModID+")\n"
				else:
					var theReqMod:ModEntry = theFind
					text += str(_i)+") [color=#BBCCFF][url="+ViewModByNameUriPreview+theReqMod.name+"]"+theReqMod.name+"[/url][/color]\n"
				_i += 1
		if(pickedModEntry.hasAI):
			text += "[center][b]Most likely contains AI-created art or code[/b][/center]\n"
		
		text += "\n"
		text += str(pickedModEntry.description)
		
		if(!pickedModEntry.id.empty() && modIDUsedByMods.has(pickedModEntry.id)):
			var _i:int = 1
			text += "\n\nThis mod is a requirement for these mods:\n"
			for theReqMod in modIDUsedByMods[pickedModEntry.id]:
				text += str(_i)+") [color=#BBCCFF][url="+ViewModByNameUriPreview+theReqMod.name+"]"+theReqMod.name+"[/url][/color]\n"
				_i += 1
		
		modDescriptionLabel.bbcode_text = text
	
	download_mod_and_reqs_button.visible = !pickedModEntry.reqs.empty() if pickedModEntry else false
	updateCurrentPreview()
	updateFavButton()

func onModEntrySelected(theModEntry):
	setSelectedEntry(theModEntry)

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

func _on_DownloadModAndReqsButton_pressed():
	if(!pickedModEntry):
		return
	var theMods:Array = []
	
	# Finding ALL of the dependencies (and dependencies of dependencies)
	var toCheck:Array = [pickedModEntry]
	var wereChecked:Dictionary = {}
	while(!toCheck.empty()):
		var theMod:ModEntry = toCheck.front()
		toCheck.pop_front()
		
		if(!theMods.has(theMod)):
			theMods.append(theMod)
		wereChecked[theMod] = true
		
		for theID in theMod.reqs:
			var theReqMod:ModEntry = findModByIDOrName(theID)
			if(!theReqMod):
				continue
			if(wereChecked.has(theReqMod)):
				continue
			toCheck.append(theReqMod)
	
	theMods.invert() # Download the reqs first
	if(prepareDownloadQueue(theMods)):
		startDownloadQueue()

var downloadQueue:Array = [] # [modEntry, modEntry, modEntry, ...]
var toDeleteOnSuccess:Array = []
#var savedGonnaDownload:String
#var shouldKeepOld:bool = false
func _on_DownloadModButton_pressed():
	if(pickedModEntry == null):
		return
	
	#var fileName = pickedModEntry.download.get_file()
	
	#savedGonnaDownload = fileName
	
	if(prepareDownloadQueue([pickedModEntry])):
		startDownloadQueue()
	#doDownloadModActually(fileName)

func prepareDownloadQueue(_queue:Array) -> bool:
	downloadQueue = _queue
	
	var theMods:Array = GlobalRegistry.getRawModList()
	toDeleteOnSuccess.clear()
	
	for theModEntry in downloadQueue:
		checkDeleteOld(theModEntry, theMods)

	if(!toDeleteOnSuccess.empty()):
		download_mods_warning_panel_container.visible = true
		download_mods_warning_item_list.clear()
		for theFullPath in toDeleteOnSuccess:
			download_mods_warning_item_list.add_item(theFullPath.get_file())
		return false
	return true

func checkDeleteOld(theModEntry:ModEntry, theMods:Array):
	if(!theModEntry || theModEntry.deleteOnDownload.empty()):
		return
	var fileName = theModEntry.download.get_file()
	for theFullModPath in theMods:
		var theNameWithExt:String = theFullModPath.get_file()
		if(theNameWithExt.to_lower() == fileName.to_lower()):
			continue # Skip us
		for theDeleteOnDownloadPrefix in theModEntry.deleteOnDownload:
			if(theNameWithExt.begins_with(theDeleteOnDownloadPrefix)):
				toDeleteOnSuccess.append(theFullModPath)
				break

func startDownloadQueue(_keepOld:bool = false):
	if(downloadQueue.empty()):
		return
	#print(downloadQueue)
	if(_keepOld):
		toDeleteOnSuccess.clear()
	doDownloadModActually()

func onDownloadQueueSuccess():
	for theDeletePath in toDeleteOnSuccess:
		Log.print("Deleting old mod: "+str(theDeletePath))
		Util.removeFile(theDeletePath)

func doDownloadModActually():
	if(downloadQueue.empty()):
		return
	var theModEntry:ModEntry = downloadQueue.front()
	downloadQueue.pop_front()
	
	var fileName = theModEntry.download.get_file()
	
	download_mods_warning_panel_container.visible = false
	downloadingContainer.visible = true
	http_request_mod.download_file = GlobalRegistry.getModsFolder().plus_file(fileName)
	var error = http_request_mod.request(theModEntry.download)
	if error != OK:
		Log.printerr("[ModBrowser] An error occurred in the HTTP request.")
		showMessage("An error occurred in the HTTP request.")
	else:
		Log.print("Downloading mod: "+str(theModEntry.download))
		download_name_label.text = "Downloading ("+str(downloadQueue.size()+1)+" left) "+str(theModEntry.download.get_file())

func _on_HTTPRequestMod_request_completed(result, _response_code, _headers, _body):
	downloadingContainer.visible = false

	if result != HTTPRequest.RESULT_SUCCESS:
		Log.printerr("[ModBrowser] Couldn't download mod")
		showMessage("Couldn't download mod")
		return
	
	Log.print("Mod downloaded")
	
	if(downloadQueue.empty()):
		onDownloadQueueSuccess()
	else:
		doDownloadModActually()

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

func sortAll(_method:String):
	allMods.sort_custom(self, _method)
	for theCat in categoryToMods:
		categoryToMods[theCat].sort_custom(self, _method)
	favoriteModEntries.sort_custom(self, _method)

func _on_SortNameButton_pressed():
	sortType = "sort_name"
	sortAll("sort_name")
	updateModList()


func _on_SortNewestFirstButton_pressed():
	sortType = "sort_newest"
	sortAll("sort_newest")
	updateModList()


func _on_SortOldestFirstButton_pressed():
	sortType = "sort_oldest"
	sortAll("sort_oldest")
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
	if(meta.begins_with(ViewModByIDUriPreview)):
		var theModID:String = meta.trim_prefix(ViewModByIDUriPreview)
		if(!idToMod.has(theModID)):
			return
		setSelectedEntry(idToMod[theModID])
		return
	if(meta.begins_with(ViewModByNameUriPreview)):
		var theModName:String = meta.trim_prefix(ViewModByNameUriPreview)
		if(!nameToMod.has(theModName)):
			return
		setSelectedEntry(nameToMod[theModName])
		return
	var _ok = Util.fixed_shell_open(meta)


func _on_ModSearch_text_changed(new_text:String) -> void:
	var new_text_length = new_text.length()
	if((new_text_length == 0) || (new_text_length > 2)):
		setSearchQuery(new_text)
		updateModList()

func setSearchQuery(newQuery:String) -> void:
	searchQuery = newQuery

func filterModsByAIFilter(_mods:Array) -> Array:
	if(aiFilter == AIFILTER_SHOW):
		return _mods
	var modsFound:Array = []
	if(aiFilter == AIFILTER_HIDE):
		for amod in _mods:
			var theMod:ModEntry = amod
			if(theMod.hasAI):
				continue
			modsFound.append(theMod)
	elif(aiFilter == AIFILTER_ONLY):
		for amod in _mods:
			var theMod:ModEntry = amod
			if(!theMod.hasAI):
				continue
			modsFound.append(theMod)
	return modsFound

# Not needed anymore since we just use the pre-filtered array
func filterModsByCategoryFilter(_mods:Array) -> Array:
	if(categoryFilter.empty()):
		return _mods
	var modsFound:Array = []
	for amod in _mods:
		var theMod:ModEntry = amod
		if(!theMod.categories.has(categoryFilter)):
			continue
		modsFound.append(theMod)
	return modsFound

func getSearchQueryFilteredMods(_mods:Array) -> Array:
	if(searchQuery.empty()):
		return _mods
	var modsFound:Array = []
	var searchQueryLower:String = searchQuery.to_lower()
	var searchQuerySpecial:String = ""
	var isExactAuthorSearch:bool = searchQuery.begins_with("\"@") && searchQuery.ends_with("\"")
	var isSubstringAuthorSearch:bool = searchQuery.begins_with("@")
	if(isExactAuthorSearch):
		searchQuerySpecial = searchQuery.trim_prefix("\"@").trim_suffix("\"")
	elif(isSubstringAuthorSearch):
		searchQuerySpecial = searchQueryLower.trim_prefix("@")

	for amod in _mods:
		var mod:ModEntry = amod
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
	
func _on_AIOptionButton_item_selected(index:int):
	aiFilter = index
	updateModList()

func updateCurrentPreview():
	if(!pickedModEntry || pickedModEntry.previewLink.empty()):
		setPreviewLink("")
		return
	setPreviewLink(pickedModEntry.previewLink)
	
onready var http_request_preview = $HTTPRequestPreview
var previewCache:Dictionary # dict[link, texture2d]
func setPreviewLink(_link:String):
	if(_link.empty()):
		preview_downloading_image.visible = false
		preview_texture_rect.visible = false
		return
	if(previewCache.has(_link)):
		preview_downloading_image.visible = false
		preview_texture_rect.visible = true
		preview_texture_rect.texture = previewCache[_link]
		return
	if(!currentDownloadLink.empty()):
		http_request_preview.cancel_request()
	currentDownloadLink = _link
	http_request_preview.request(currentDownloadLink)
	preview_downloading_image.visible = true
	preview_texture_rect.visible = false

var currentDownloadLink:String = ""
func _on_HTTPRequestPreview_request_completed(result, _response_code, _headers, body):
	var theLink:String = currentDownloadLink
	currentDownloadLink = ""
	if result != HTTPRequest.RESULT_SUCCESS:
		Log.printerr("Mod browser failed to download a preview image")
		return
	
	var theExt:String = theLink.get_extension()
	
	var image = Image.new()
	if(theExt.to_lower() == "png"):
		var error = image.load_png_from_buffer(body)
		if error != OK:
			Log.printerr("Mod browser failed to load up a preview image (not a png?)")
			#return
	elif(theExt.to_lower() in ["jpg", "jpeg"]):
		var error = image.load_jpg_from_buffer(body)
		if error != OK:
			Log.printerr("Mod browser failed to load up a preview image (not a jpg?)")
			#return
	#else:
	#	return
	
	var texture := ImageTexture.new()
	texture.create_from_image(image)
	preview_texture_rect.texture = texture
	previewCache[theLink] = texture
	preview_texture_rect.visible = true
	preview_downloading_image.visible = false
	updateCurrentPreview()

func _on_CloseFullButton_pressed():
	full_texture_rect.visible = false

func _on_OpenFullButton_pressed():
	full_texture_rect.texture = preview_texture_rect.texture
	full_texture_rect.visible = true

func _on_FilterOptionButton_item_selected(_index:int):
	if(_index == 0):
		_on_SortNewestFirstButton_pressed()
	elif(_index == 1):
		_on_SortOldestFirstButton_pressed()
	elif(_index == 2):
		_on_SortNameButton_pressed()

func _on_CategoryOptionButton_item_selected(_index:int):
	if(_index <= 0 || (_index-2)>=categories.size()):
		categoryFilter = ""
	elif(_index == 1):
		categoryFilter = "-favs-"
	else:
		categoryFilter = categories[_index-2] # Zero index = All categories
	updateModList()

func _on_DownloadCancelButton_pressed():
	toDeleteOnSuccess.clear()
	download_mods_warning_panel_container.visible = false

func _on_DownloadAnywayButton_pressed():
	startDownloadQueue()
	#doDownloadModActually(savedGonnaDownload)

func _on_DownloadNoDeleteButton_pressed():
	startDownloadQueue(true)
	#doDownloadModActually(savedGonnaDownload, true)

func _on_PrevPageButton_pressed():
	page -= 1
	if(page < 0):
		page = 0
	updateModList()

func _on_NextPageButton_pressed():
	page += 1
	updateModList()

func _on_PageSelectorOptionButton_item_selected(index:int):
	page = index
	updateModList()

func _on_BackButton_pressed():
	goBack()

func _on_ForwardButton_pressed():
	goForward()

func updateBackForward():
	back_button.disabled = backQueue.empty()
	forward_button.disabled = forwardQueue.empty()

func pushBack(_mod:ModEntry, clearForward:bool = true):
	if(backQueue.empty() || backQueue.back() != _mod):
		backQueue.append(_mod)
		if(clearForward):
			forwardQueue.clear()
	updateBackForward()

func setSelectedEntry(_modEntry:ModEntry, _addOldToBackQueue:bool = true):
	if(_addOldToBackQueue && pickedModEntry):
		pushBack(pickedModEntry)
	pickedModEntry = _modEntry
	updatePickedModEntry()

func goBack():
	if(backQueue.empty()):
		return
	if(pickedModEntry):
		forwardQueue.append(pickedModEntry)
	setSelectedEntry(backQueue.back(), false)
	backQueue.pop_back()
	updateBackForward()

func goForward():
	if(forwardQueue.empty()):
		return
	if(pickedModEntry):
		backQueue.append(pickedModEntry)
	setSelectedEntry(forwardQueue.back(), false)
	forwardQueue.pop_back()
	updateBackForward()

func _on_FavButton_pressed():
	toggleCurrentFavStatus()

func saveFavMods():
	Util.writeFile(FAVORITES_PATH, JSON.print(favorites.keys(), "\t"))

func loadFavMods():
	favorites.clear()
	favoriteModEntries.clear()
	
	var theText:String = Util.readFile(FAVORITES_PATH)
	if(theText.empty()):
		return
	
	var theJson:JSONParseResult = JSON.parse(theText)
	if(!theJson || theJson.error != OK):
		return
	var theRes = theJson.result
	
	if(!(theRes is Array)):
		return
	
	for theModName in theRes:
		if(!(theModName is String)):
			continue
		favorites[theModName] = true
		if(idToMod.has(theModName)):
			var theModEntry:ModEntry = idToMod[theModName]
			favoriteModEntries.append(theModEntry)
		elif(nameToMod.has(theModName)):
			var theModEntry:ModEntry = nameToMod[theModName]
			favoriteModEntries.append(theModEntry)
	
	favoriteModEntries.sort_custom(self, sortType)

const FAV_COLOR:Color = Color.red
func updateFavButton():
	if(!pickedModEntry || !hasAsFav(pickedModEntry)):
		fav_button.remove_color_override("font_color")
		fav_button.remove_color_override("icon_color_pressed")
		fav_button.remove_color_override("font_color_disabled")
		fav_button.remove_color_override("font_color_focus")
		fav_button.remove_color_override("font_color_hover_pressed")
		return
	fav_button.add_color_override("font_color", FAV_COLOR)
	fav_button.add_color_override("icon_color_pressed", FAV_COLOR)
	fav_button.add_color_override("font_color_disabled", FAV_COLOR)
	fav_button.add_color_override("font_color_focus", FAV_COLOR)
	fav_button.add_color_override("font_color_hover_pressed", FAV_COLOR)

func addCurrentToFavs():
	if(!pickedModEntry):
		return
	if(hasAsFav(pickedModEntry)):
		return
	var theIdOrName:String = (pickedModEntry.name if pickedModEntry.id.empty() else pickedModEntry.id)
	favorites[theIdOrName] = true
	favoriteModEntries.append(pickedModEntry)
	favoriteModEntries.sort_custom(self, sortType)
	if(categoryFilter == "-favs-"):
		updateModList()
	updateFavButton()
	saveFavMods()

func removeCurrentFromFavs():
	if(!pickedModEntry):
		return
	if(!hasAsFav(pickedModEntry)):
		return
	favorites.erase(pickedModEntry.id)
	favorites.erase(pickedModEntry.name)
	favoriteModEntries.erase(pickedModEntry)
	# No need to sort
	if(categoryFilter == "-favs-"):
		updateModList()
	updateFavButton()
	saveFavMods()

func toggleCurrentFavStatus():
	if(!pickedModEntry):
		return
	if(hasAsFav(pickedModEntry)):
		removeCurrentFromFavs()
	else:
		addCurrentToFavs()

func hasAsFav(_modEntry:ModEntry) -> bool:
	if((!_modEntry.id.empty() && favorites.has(_modEntry.id)) || favorites.has(_modEntry.name)):
		return true
	return false
