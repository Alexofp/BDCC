extends HBoxContainer

class_name GameUI

var gameParser 	= GameParser.new()
var sayParser 	= SayParser.new()

var current_font_size		= ""
var buttons 				= []
var l_game_panel_hide		= [0]

var currentPage 			= 0
var optionsCurrentID 		= 0
var options 				= {}

var allowed_tabs_to_back	= [0, 1]
var prev_central_tab		= 0
var main_menu_open			= false

#Node's varibles grouped by in which panel where they located and sorted closely same as in editor tree.
onready var central_panel			= $CentrPanel/ContentSwitcher
onready var textOutput				= $CentrPanel/ContentSwitcher/Margin
onready var pad_blocker				= $CentrPanel/MarginContainer/ColorRect
onready var pad						= $CentrPanel/MarginContainer/Pad
onready var options_panel			= $CentrPanel/ContentSwitcher/OptionsScreen
onready var load_panel				= $CentrPanel/ContentSwitcher/LoadGameScreen
onready var mods_panel				= $CentrPanel/ContentSwitcher/ModsMenu
onready var credits_panel			= $CentrPanel/ContentSwitcher/CreditsScreen
onready var debug_panel 			= $CentrPanel/ContentSwitcher/DebugPanel
onready var dev_panel				= $CentrPanel/ContentSwitcher/DevToolsScreen

onready var right_content_panel 	= $RightPanel/MarginContainer/ContentPanel/Scroll/ChangebleContent
onready var player_panel			= $RightPanel/MarginContainer/ContentPanel/Scroll/ChangebleContent/PlayerPanel
onready var gutHubReleaseLabel		= $RightPanel/MarginContainer/ContentPanel/Scroll/ChangebleContent/GithubPanel/GithubInfo
onready var gitHubReleaseButton		= $RightPanel/MarginContainer/ContentPanel/Scroll/ChangebleContent/GithubPanel/ToGihubBt
onready var loadedModsLabel			= $RightPanel/MarginContainer/ContentPanel/Scroll/ChangebleContent/GithubPanel/ScrollContainer/LoadedModsLabel

onready var left_content_panel 		= $LeftPanel/MarginContainer/ContentPanel/Scroll/ChangableContent
onready var donations_label			= $LeftPanel/MarginContainer/ContentPanel/Scroll/ChangableContent/Donations
onready var NPC_stats_panel			= $LeftPanel/MarginContainer/ContentPanel/Scroll/ChangableContent/NPC_panel/CharacterPanel
onready var NPC_list_panel			= $LeftPanel/MarginContainer/ContentPanel/Scroll/ChangableContent/NPC_panel/CharactersPanel
onready var NPC_art_panel			= $LeftPanel/MarginContainer/ContentPanel/Scroll/ChangableContent/NPC_panel/CharactersArtworkPanel
onready var left_game_panel			= $LeftPanel/MarginContainer/ContentPanel/LGamePanel
onready var map_panel				= $LeftPanel/MarginContainer/ContentPanel/LGamePanel/MapAndTimePanel
onready var skills_button			= $LeftPanel/MarginContainer/ContentPanel/LGamePanel/MenusCaller/ToSkillsBt
onready var prevPageButton			= $LeftPanel/MarginContainer/ContentPanel/LGamePanel/Pages/PrevPageBt
onready var nextPageButton			= $LeftPanel/MarginContainer/ContentPanel/LGamePanel/Pages/NextPageBt
onready var debug_button			= $LeftPanel/MarginContainer/ContentPanel/LGamePanel/DebugBt

onready var main_scene_node 		= $MainScene

onready var http_request			= $HTTPRequest
onready var optionTooltip 			= $TooltipLayer/TooltipDisplay

onready var pck_pad_button 			= preload("res://Game/SceneOptionButton.tscn")

signal on_option_button(method, args)
#signal returned_to_main_menu()

func _init():
	GM.ui = self
	
#BUILD-IN FUNCS
func _ready():
	var shortCutKeys = [
		49, 50, 51, 52, 53,
		81, 87, 69, 82, 84,
		65, 83, 68, 70, 71,
		#90, 88, 67, 86, 66
		]
	
	for code in shortCutKeys:
		var new_bt = pck_pad_button.instance()
		buttons.append(new_bt)
		new_bt.setShortcutPhysicalScancode(code)
		pad.add_child(new_bt)
	
	if(OPTIONS.shouldFetchGithubRelease()):
		getNewRelease()
	else:
		gutHubReleaseLabel.visible = false
		gitHubReleaseButton.visible = false
		
	var loadedMods = GlobalRegistry.getLoadedMods()
	var text = "[center]"
	
	if(loadedMods.size() > 0):
		text += "[b]Loaded mods:[/b]"
		
		for mod in loadedMods:
			text += "\n- "+str(mod)
	else:
		text += "[b]No mods loaded.[/b]"
	
	loadedModsLabel.bbcode_text = text + "[/center]"	
	
	blockPad(false)

func _physics_process(_delta):
	left_game_panel.visible		= !left_content_panel.current_tab in l_game_panel_hide
	debug_button.visible 		= OPTIONS.isDebugPanelEnabled()
	
	#I think you need to make something to remember prev. scene with all info within.
	#If you can, you may even remove InGameMenu and after clicking "Menu" button
	#in minimenu player will be moved right into MainMenu!
	#Now I'm too afraid break someting (or lost info) in-game if I try to just
	#reRuning prev. scene after MainMenuScene.
	#So I'll just hide UI buttons from some UI's if player in main menu.
	
	main_menu_open = is_instance_valid(GM.main) && is_instance_valid(GM.main.getCurrentScene()) && GM.main.getCurrentScene().sceneID == "MainMenu"

#CUSTOM FUNCS
func addButton(text: String, tooltip: String = "", method: String = "", args = []):
	while(options.has(optionsCurrentID)):
		optionsCurrentID += 1
	options[optionsCurrentID] = [true, text, tooltip, method, args]
	updateButtons()

func addButtonAt(place, text: String, tooltip: String = "", method: String = "", args = []):
	options[place] = [true, text, tooltip, method, args]
	updateButtons()

func addCharacterToPanel(id, variant):
	NPC_art_panel.addCharacter(id, variant)
	
func addCustomControl(id, control):
	textOutput.addCustomControl(id, control)
	
func addDisabledButton(text: String, tooltip: String = ""):
	while(options.has(optionsCurrentID)):
		optionsCurrentID += 1
	options[optionsCurrentID] = [false, text, tooltip]
	updateButtons()

func addDisabledButtonAt(place, text: String, tooltip: String = ""):
	options[place] = [false, text, tooltip]
	updateButtons()

func addUITextbox(id):
	textOutput.addUITextbox(id)

func back_to_main_menu():
	#var pad_buttons = pad.get_children()
	clearButtons()
	
	var btn = pck_pad_button.instance()
	
	btn.text = "New Game"
	
func change_content_on_left_panel(tab_index : int):
	change_content_in_panel(left_content_panel, tab_index)

func change_content_on_right_panel(tab_index : int):
	change_content_in_panel(right_content_panel, tab_index)
	
func change_content_in_panel(panel : TabContainer, tab_index : int):
	panel.current_tab = tab_index

func checkPageButtons():
	if(currentPage > 0):
		prevPageButton.disabled = false
	else:
		prevPageButton.disabled = true
	
	var maxpages = get_max_index_button()
	
	if(maxpages > (currentPage+1)):
		nextPageButton.disabled = false
	else:
		nextPageButton.disabled = true

func get_max_index_button():
	var cur_max = 0
	var pages 	= 1
	
	for i in options.keys():
		cur_max = max(cur_max, i)
		
	while cur_max > pad.get_child_count() - 1:
		pages += 1
		cur_max -= pad.get_child_count()
	
	return pages

func clearUItextboxes():
	textOutput.clearUItextboxes()

func clearButtons():
	#for i in buttonsCountPerPage:
	#	buttons[i].queue_free()
	#buttons = []
	options = {}
	optionsCurrentID = 0
	currentPage = 0
	updateButtons()
	_on_option_button_tooltip_end()

func clearText():
	textOutput.clearText()
	
func clearCharactersPanel():
	NPC_art_panel.clear()

func getPlayerStatusEffectsPanel():
	return player_panel.getStatusEffectsPanel()

func getNPCStatusEffectsPanel():
	return NPC_stats_panel.getStatusEffectsPanel()

func getCharactersPanel():
	return NPC_list_panel
	
func getUIdata(id):
	return textOutput.getUIdata(id)

func getCurrentLocationName():
	return map_panel.getLocationName()
	
func getStage3d() -> Stage3D:
	return player_panel.getStage3d()

func getNewRelease():
	var error = http_request.request("https://api.github.com/repos/Alexofp/BDCC/releases")
	if error != OK:
		Log.printerr("[MainMenu] An error occurred in the HTTP request.")
		gutHubReleaseLabel.text = "Latest github release: Error"

func loadingSavefileFinished():
	player_panel.loadingSavefileFinished()

func makeSkillsButtonFlash():
	skills_button.text = "[!]Skills"

func onTimePassed(_secondsPassed):
	map_panel.onTimePassed(_secondsPassed)

func processString(strText: String):
	return gameParser.executeString(sayParser.processString(strText))
	
func say(text : String):
	textOutput.add_text(processString(text))
	
func setLocationName(locname: String):
	map_panel.setLocationName(locname)

func setSceneCreator(sceneCreator):
	map_panel.setSceneCreator(sceneCreator)

func setNPC_stats_panelVisible(vis: bool):
	NPC_stats_panel.visible = vis

func setCharacterData(character: Character):
	if(!is_instance_valid(character)):
		NPC_stats_panel.visible = false
		return
	
	NPC_stats_panel.visible = true
	NPC_stats_panel.updateFromCharacter(character)
	
func setCharactersPanelVisible(vis):
	if(OPTIONS.shouldShowCharacterArt()):
		NPC_list_panel.visible = false
		NPC_art_panel.visible = vis
	else:
		NPC_list_panel.visible = vis
		NPC_art_panel.visible = false	

func showSaveFolderLoc():
	load_panel.showSaveFolder()
	
func callImportSave():
	load_panel.importSaveFile()
	
func callDelSaveMode():
	load_panel.switchDeleteMode()
	
func callSaveOptions():
	options_panel.onCloseSave()
	
func callResetOptions():
	options_panel.resetToDefalut()
	
func callResetRenderOptions():
	options_panel.resetRender()

func trimLineEndings():
	textOutput.trimLineEndings()
	
func updateButtons():
	checkPageButtons()
	
	for i in pad.get_child_count():
		var button:Button = buttons[i]
		button.disabled = true
		button.text = ""
		if(button.is_connected("pressedActually", self, "_on_option_button")):
			button.disconnect("pressedActually", self, "_on_option_button")
		if(button.is_connected("mouse_entered", self, "_on_option_button_tooltip")):
			button.disconnect("mouse_entered", self, "_on_option_button_tooltip")
		if(button.is_connected("mouse_exited", self, "_on_option_button_tooltip_end")):
			button.disconnect("mouse_exited", self, "_on_option_button_tooltip_end")
		
	for i in pad.get_child_count():
		var index = currentPage * pad.get_child_count() + i
		
		if(!options.has(index)):
			continue
			
		var option = options[index]
		var button:Button = buttons[i]
		button.text = option[1]
		button.disabled = !option[0]
		#button.set_meta("game_option", index)
		var _some 	= button.connect("pressedActually", self, "_on_option_button", [index])
		var _some2 	= button.connect("mouse_entered", self, "_on_option_button_tooltip", [index])
		var _some3 	= button.connect("mouse_exited", self, "_on_option_button_tooltip_end")

func updateCharacterInPanel():
	NPC_art_panel.updateMainCharacter()
	
func updateGithubRelisesPanel(result, body):
	if result != HTTPRequest.RESULT_SUCCESS:
		Log.printerr("[MainMenu] Couldn't get the latest release from github")
		gutHubReleaseLabel.text = "Latest github release: Error"
		return
	
	var jsonResult = JSON.parse(body.get_string_from_utf8())
	if(jsonResult.error != OK):
		Log.printerr("[MainMenu] Couldn't parse json data from github.")
		gutHubReleaseLabel.text = "Latest github release: Error"
		return
	
	var releasesData = jsonResult.result

	if(!(releasesData is Array)):
		Log.printerr("[MainMenu] Bad data from github")
		gutHubReleaseLabel.text = "Latest github release: Error"
		return
		
	for release in releasesData:
		var requiredFields = ["published_at", "name", "tag_name"]
		for req in requiredFields:
			if(!release.has(req)):
				continue
		
		var time = Util.ISO8601DateToDatetime(release["published_at"])
		
		gutHubReleaseLabel.text = "Latest github release: "+release["tag_name"]
		if(time != null):
			gutHubReleaseLabel.text += "\n" + Util.datetimeToRFC113(time)
		
		gutHubReleaseLabel.text += "\n\nYour current version: "+GlobalRegistry.getGameVersionString()
		return
	gutHubReleaseLabel.text = "Latest github release: Nothing found"

func prepareToGame():
	showGameScreen()
	change_content_on_left_panel(1)
	change_content_on_right_panel(1)
	
func returnToTitle():
	showTitle()
	hidePad(false)
	change_content_on_left_panel(0)
	change_content_on_right_panel(0)

func removeCharacterFromPanel(id):
	NPC_art_panel.removeCharacter(id)

func hidePad(vis : bool):
	pad.visible = !vis

#Covers your pad under glass to prevent clicking)))
func blockPad(yes = true):
	if yes:
		pad_blocker.mouse_filter 				= Control.MOUSE_FILTER_STOP
		pad_blocker.mouse_default_cursor_shape 	= Control.CURSOR_FORBIDDEN
		pad_blocker.modulate.a					= 0.2
	else:
		pad_blocker.mouse_filter 				= Control.MOUSE_FILTER_IGNORE
		pad_blocker.mouse_default_cursor_shape 	= Control.CURSOR_ARROW
		pad_blocker.modulate.a					= 0.0

func rememberPrevScreen():
	if central_panel.current_tab in allowed_tabs_to_back:
		prev_central_tab = central_panel.current_tab

func backToPreviusScreen():
	central_panel.current_tab = prev_central_tab

func showTitle():
	central_panel.current_tab = 0
	
func showGameScreen():
	central_panel.current_tab = 1
	hidePad(false)
	
func showOptionsScreen():
	central_panel.current_tab = 5
	
func showCreditsScreen():
	central_panel.current_tab = 6
	
func showModsMenuScreen():
	central_panel.current_tab = 7
	
func showLoadGameScreen():
	central_panel.current_tab = 8

func showDevToolsScreen(undermenu_index = -1):
	central_panel.current_tab = 9
	
	match undermenu_index:
		0, 1, 2, 3:
			dev_panel.current_tab = undermenu_index

func showhidePauseMenu():
	if central_panel.current_tab != 2:
		rememberPrevScreen()
		central_panel.current_tab = 2
		hidePad(true)
	else:
		backToPreviusScreen()
		hidePad(false)

func showhideSkillsScreen():
	skills_button.text = "Skills"
	
	if (central_panel.current_tab != 3):
		rememberPrevScreen()
		central_panel.current_tab = 3
		hidePad(true)
	else:
		backToPreviusScreen()
		hidePad(false)

func showhideDebugMenu():
	if (central_panel.current_tab != 4):
		rememberPrevScreen()
		central_panel.current_tab = 4
		hidePad(true)
	else:
		backToPreviusScreen()
		hidePad(false)
		
func showDeliteAllModsPopup():
	mods_panel.showRMpopup()
	
func showImportModsPopup():
	mods_panel.importMod()

func _on_ToPauseBt_pressed():
	showhidePauseMenu()

func _on_ToSkillsBt_pressed():
	showhideSkillsScreen()
		
func _on_DebugBt_pressed():
	showhideDebugMenu()

#SIGNAL FUNCS
func _on_option_button(index):
	var option = options[index]
	emit_signal("on_option_button", option[3], option[4])

func _on_option_button_tooltip(index):
	var option = options[index]
	optionTooltip.set_is_active(true)
	optionTooltip.set_text(option[1], option[2])

func _on_option_button_tooltip_end():
	optionTooltip.set_is_active(false)

func _on_PrevPageBt_pressed():
	currentPage -= 1
	updateButtons()

func _on_NextPageBt_pressed():
	currentPage += 1
	updateButtons()

func _on_QSaveBt_pressed():
	SAVE.makeQuickSave()

func _on_QLoadBt_pressed():
	SAVE.loadQuickSave()

func _on_Player_animation_changed(newanim):
	player_panel.on_player_animationchange(newanim)

func _on_Player_bodypart_changed():
	player_panel.on_player_bodypartchange()

func _on_Player_stat_changed():
	player_panel.on_player_statchange()

func _on_SkillsUI_onClosePressed():
	showhideSkillsScreen()

func _on_InGameMenu_onResumeButtonPressed():
	showhidePauseMenu()

func _on_ToGihubBt_pressed():
	var _ok = OS.shell_open("https://github.com/Alexofp/BDCC/releases")

func _on_HTTPRequest_request_completed(result, _response_code, _headers, body):
	updateGithubRelisesPanel(result, body)
