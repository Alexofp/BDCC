extends Control
class_name GameUI

signal on_option_button(method, args)
var buttons: Array = []
const buttonsCountPerPage: int = 15
var optionButtonScene: PackedScene = preload("res://Game/SceneOptionButton.tscn")
onready var optionButtonsContainer = $HBoxContainer/VBoxContainer2/GridContainer
var currentPage = 0
var options: Dictionary = {}
var optionsCurrentID = 0
var buttonsNeedUpdating = false
onready var nextPageButton = $HBoxContainer/Panel2/MarginContainer/VBoxContainer/HBoxContainer/NextPageButton
onready var prevPageButton = $HBoxContainer/Panel2/MarginContainer/VBoxContainer/HBoxContainer/PrevPageButton
onready var optionTooltip = $CanvasLayer/TooltipDisplay
onready var textOutput = $HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer/RichTextLabel
onready var mapAndTimePanel = $HBoxContainer/Panel2/MarginContainer/VBoxContainer/MapAndTimePanel
onready var characterPanel = $HBoxContainer/Panel2/MarginContainer/VBoxContainer/CharacterPanel
onready var playerPanel = $HBoxContainer/Panel/MarginContainer/PlayerPanel
onready var charactersPanel = $HBoxContainer/Panel2/MarginContainer/VBoxContainer/CharactersPanel
onready var scrollPanel = $HBoxContainer/VBoxContainer2/ScrollContainer
onready var mainGameScreen = $HBoxContainer/VBoxContainer2
onready var ingameMenuScreen = $HBoxContainer/InGameMenu
onready var skillsScreen = $HBoxContainer/SkillsUI
onready var skillsButton = $HBoxContainer/Panel2/MarginContainer/VBoxContainer/HBoxContainer3/SkillsButton
var uiTextboxScene = preload("res://UI/UITextbox.tscn")
onready var textcontainer = $HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer
var textboxes: Dictionary = {}
var gameParser: GameParser
var sayParser: SayParser

func _exit_tree():
	GM.ui = null

# Called when the node enters the scene tree for the first time.
func _ready():
	GM.ui = self
	
	gameParser = GameParser.new()
	sayParser = SayParser.new()
	
	for n in buttonsCountPerPage:
		var newbutton = optionButtonScene.instance()
		buttons.append(newbutton)
		optionButtonsContainer.add_child(newbutton)
		
	updateButtons()
	
	if(OS.has_touchscreen_ui_hint()):
		textOutput.selection_enabled = false
		
func say(text: String):
	textOutput.bbcode_text += gameParser.executeString(sayParser.processString(text))

func clearText():
	#textOutput.scroll_to_line(1)
	scrollPanel.set_v_scroll(0)
	textOutput.bbcode_text = ""
		
		
func clearButtons():
	#for i in buttonsCountPerPage:
	#	buttons[i].queue_free()
	#buttons = []
	options = {}
	optionsCurrentID = 0
	currentPage = 0
	updateButtons()
	_on_option_button_tooltip_end()
		
func addButtonAt(place, text: String, tooltip: String = "", method: String = "", args = []):
	options[place] = [true, text, tooltip, method, args]
	queueUpdate()
	
func addDisabledButtonAt(place, text: String, tooltip: String = ""):
	options[place] = [false, text, tooltip]
	queueUpdate()
		
func addButton(text: String, tooltip: String = "", method: String = "", args = []):
	while(options.has(optionsCurrentID)):
		optionsCurrentID += 1
	options[optionsCurrentID] = [true, text, tooltip, method, args]
	queueUpdate()
	
func addDisabledButton(text: String, tooltip: String = ""):
	while(options.has(optionsCurrentID)):
		optionsCurrentID += 1
	options[optionsCurrentID] = [false, text, tooltip]
	queueUpdate()

func queueUpdate():
	buttonsNeedUpdating = true
	yield(get_tree(), "idle_frame")
	if(!buttonsNeedUpdating):
		return
	buttonsNeedUpdating = false
	updateButtons()

func updateButtons():
	checkPageButtons()
	
	for i in buttonsCountPerPage:
		var button:Button = buttons[i]
		button.disabled = true
		button.text = ""
		if(button.is_connected("pressed", self, "_on_option_button")):
			button.disconnect("pressed", self, "_on_option_button")
		if(button.is_connected("mouse_entered", self, "_on_option_button_tooltip")):
			button.disconnect("mouse_entered", self, "_on_option_button_tooltip")
		if(button.is_connected("mouse_exited", self, "_on_option_button_tooltip_end")):
			button.disconnect("mouse_exited", self, "_on_option_button_tooltip_end")
	
	for i in buttonsCountPerPage:
		var index = currentPage * buttonsCountPerPage + i
		if(index < 0):
			break
		if(!options.has(index)):
			continue
			
		var option = options[index]
		var button:Button = buttons[i]
		button.text = option[1]
		button.disabled = !option[0]
		#button.set_meta("game_option", index)
		var _some = button.connect("pressed", self, "_on_option_button", [index])
		var _some2 = button.connect("mouse_entered", self, "_on_option_button_tooltip", [index])
		var _some3 = button.connect("mouse_exited", self, "_on_option_button_tooltip_end")
		
func _on_option_button(index):
	var option = options[index]
	#print("hello ",index, option)
	emit_signal("on_option_button", option[3], option[4])
	
func _on_option_button_tooltip(index):
	var option = options[index]
	optionTooltip.set_is_active(true)
	optionTooltip.set_text(option[1], option[2])

func _on_option_button_tooltip_end():
	optionTooltip.set_is_active(false)


func checkPageButtons():
	if(currentPage > 0):
		prevPageButton.disabled = false
	else:
		prevPageButton.disabled = true
	
	var maxpages = ceil(float(options.size())/float(buttonsCountPerPage))
	if(maxpages > (currentPage+1)):
		nextPageButton.disabled = false
	else:
		nextPageButton.disabled = true

func _on_NextPageButton_pressed():
	currentPage += 1
	updateButtons()

func _on_PrevPageButton_pressed():
	currentPage -= 1
	if(currentPage < 0):
		currentPage = 0
		return
	updateButtons()

func setLocationName(locname: String):
	mapAndTimePanel.setLocationName(locname)

func setCharacterPanelVisible(vis: bool):
	characterPanel.visible = vis

func setCharacterData(character: Character):
	if(character == null):
		characterPanel.visible = false
		return
	
	characterPanel.visible = true
	characterPanel.updateFromCharacter(character)

func getPlayerStatusEffectsPanel():
	return playerPanel.getStatusEffectsPanel()

func getNPCStatusEffectsPanel():
	return characterPanel.getStatusEffectsPanel()

func getCharactersPanel():
	return charactersPanel

func setCharactersPanelVisible(vis):
	charactersPanel.visible = vis

func addUITextbox(id):
	assert(!textboxes.has(id), "Trying to add a textbox with the same id. Id is "+id)
	
	var uitextbox = uiTextboxScene.instance()
	uitextbox.id = id
	textcontainer.add_child(uitextbox)
	uitextbox.grab_focus()
	textboxes[id] = uitextbox
	
func addCustomControl(id, control):
	assert(!textboxes.has(id), "Trying to add a control with the same id. Id is "+id)

	#var uitextbox = uiTextboxScene.instance()
	#uitextbox.id = id
	textcontainer.add_child(control)
	textboxes[id] = control

func getUIdata(id):
	assert(textboxes.has(id), "Trying to get info from bad id. Id is "+id)
	return textboxes[id].getData()

func clearUItextboxes():
	for id in textboxes.keys():
		var textbox = textboxes[id]
		textcontainer.remove_child(textbox)
		textbox.queue_free()
	textboxes = {}

func loadingSavefileFinished():
	playerPanel.loadingSavefileFinished()

func _on_SaveButton_pressed():
	SAVE.makeQuickSave()

func _on_LoadButton_pressed():
	SAVE.loadQuickSave()
	
func trimLineEndings():
	textOutput.bbcode_text = textOutput.bbcode_text.trim_suffix("\n")

func onTimePassed(_secondsPassed):
	mapAndTimePanel.onTimePassed(_secondsPassed)

func processString(strText: String):
	return gameParser.executeString(sayParser.processString(strText))

func hideAllScreens():
	mainGameScreen.visible = false
	ingameMenuScreen.visible = false
	skillsScreen.visible = false

func _on_MenuButton_pressed():
	if(!ingameMenuScreen.visible):
		hideAllScreens()
		ingameMenuScreen.visible = true
	else:
		hideAllScreens()
		mainGameScreen.visible = true

func showGameScreen():
	hideAllScreens()
	mainGameScreen.visible = true

func getCurrentLocationName():
	return mapAndTimePanel.getLocationName()


func _on_SkillsButton_pressed():
	skillsButton.text = "Skills"
	if(!skillsScreen.visible):
		hideAllScreens()
		skillsScreen.visible = true
	else:
		hideAllScreens()
		mainGameScreen.visible = true

func makeSkillsButtonFlash():
	skillsButton.text = "[!]Skills"


func _on_Player_animation_changed(newanim):
	playerPanel.on_player_animationchange(newanim)

func _on_Player_bodypart_changed():
	playerPanel.on_player_bodypartchange()

func _on_Player_stat_changed():
	playerPanel.on_player_statchange()

func getStage3d() -> Stage3D:
	return playerPanel.getStage3d()
