extends Node

var myProjectSettings

var enabledContent = {}
const optionsFilepath = "user://options.json"
var fetchNewRelease = true
# Pregnancy options
var menstrualCycleLengthDays: int
var eggCellLifespanHours: int
var playerPregnancyTimeDays: int
var npcPregnancyTimeDays: int

var shouldScaleUI: bool = true
var uiScaleMultiplier = 1.0
var requireDoubleTapOnMobile = false
var uiButtonSize:int = 0

var showSpeakerName = true
var fontSize = "normal"
var showShortcuts = true
var showSceneCreator = true

var measurementUnits = "metric"

var debugPanel = false
var showMapArt = false
var developerCommentary = false

var showCharacterArt = true
var showSceneArt = true
var imagePackOrder = []

var rollbackEnabled = false
var rollbackSlots = 5
var rollbackSaveEvery = 1

var showModdedLauncher = false

var jigglePhysicsBreastsEnabled = true
var jigglePhysicsBellyEnabled = true
var jigglePhysicsButtEnabled = true
var jigglePhysicsGlobalModifier = 1.0

var advancedShadersEnabled = true
var chainsEnabled = true

var autosaveEnabled = true

func resetToDefaults():
	fetchNewRelease = true
	menstrualCycleLengthDays = 7
	eggCellLifespanHours = 48
	playerPregnancyTimeDays = 5
	npcPregnancyTimeDays = 5
	shouldScaleUI = true
	uiScaleMultiplier = 1.0
	showSpeakerName = true
	fontSize = "normal"
	showShortcuts = true
	measurementUnits = "metric"
	requireDoubleTapOnMobile = false
	uiButtonSize = 0
	debugPanel = false
	showMapArt = false
	#imagePackOrder = []
	showCharacterArt = true
	showSceneArt = true
	showSceneCreator = true
	rollbackEnabled = false
	rollbackSlots = 5
	rollbackSaveEvery = 1
	showModdedLauncher = false
	developerCommentary = false
	jigglePhysicsBreastsEnabled = true
	jigglePhysicsBellyEnabled = true
	jigglePhysicsButtEnabled = true
	jigglePhysicsGlobalModifier = 1.0
	advancedShadersEnabled = true
	chainsEnabled = true
	autosaveEnabled = true
	
	enabledContent.clear()
	for contentType in ContentType.getAll():
		enabledContent[contentType] = !ContentType.isDisabledByDefault(contentType)
		
	call_deferred("applySettingsEffect")

func _init():
	myProjectSettings = load("res://Game/Options/MyProjectSettings.gd").new()
	myProjectSettings.save()

	resetToDefaults()
	
	loadFromFile()

func isContentEnabled(contentType):
	if(!enabledContent.has(contentType)):
		return !ContentType.isDisabledByDefault(contentType)
	
	return enabledContent[contentType]

func shouldFetchGithubRelease():
	return fetchNewRelease

func getMenstrualCycleLengthDays():
	return menstrualCycleLengthDays

func getEggCellLifespanHours():
	return eggCellLifespanHours
	
func getPlayerPregnancyTimeDays():
	return playerPregnancyTimeDays
	
func getNPCPregnancyTimeDays():
	return npcPregnancyTimeDays

func shouldShowSpeakerName():
	return showSpeakerName

func getFontSize():
	return fontSize

func shouldShowShortcuts():
	return showShortcuts

func getMeasurementUnits():
	return measurementUnits

func shouldRequireDoubleTapOnMobile():
	return requireDoubleTapOnMobile

func getUiButtonSize():
	return uiButtonSize

func isDebugPanelEnabled():
	return debugPanel

func shouldShowCharacterArt():
	return showCharacterArt

func shouldShowSceneArt():
	return showSceneArt

func shouldShowSceneCreator():
	return showSceneCreator

func shouldShowMapArt():
	return showMapArt

func isRollbackEnabled():
	return rollbackEnabled

func getRollbackSlotsAmount():
	return rollbackSlots

func getRollbackSaveEveryXChoices():
	return rollbackSaveEvery

func shouldShowModdedLauncher():
	return showModdedLauncher

func developerCommentaryEnabled():
	return developerCommentary

func isJigglePhysicsBreastsEnabled():
	return jigglePhysicsBreastsEnabled

func isJigglePhysicsBellyEnabled():
	return jigglePhysicsBellyEnabled
	
func isJigglePhysicsButtEnabled():
	return jigglePhysicsButtEnabled

func getJigglePhysicsGlobalModifier():
	return jigglePhysicsGlobalModifier

func shouldUseAdvancedShaders():
	return advancedShadersEnabled

func shouldAutosave():
	return autosaveEnabled

func shouldSpawnChains():
	return chainsEnabled

func getChangeableOptions():
	var settings = [
		{
			"name": "Modding",
			"id": "modding",
			"options": [
				{
					"name": "Enable Modded BDCC Launcher",
					"description": "Restart the game to see it. Allows you to manage your mods and download new ones",
					"id": "showModdedLauncher",
					"type": "checkbox",
					"value": showModdedLauncher,
				},
			],
		},
		{
			"name": "Pregnancy settings",
			"id": "pregnancy",
			"options": [
				{
					"name": "Menstrual cycle length (days)",
					"description": "How long is the female menstrual cycle. Females can only get pregnant after they ovulate once per cycle. Realistic value is 30. Default value is 7",
					"id": "menstrualCycleLengthDays",
					"type": "int",
					"value": menstrualCycleLengthDays,
				},
				{
					"name": "Egg cell lifespan (hours)",
					"description": "How long egg cells live after ovulation. Realistic value is 18. Default value is 48",
					"id": "eggCellLifespanHours",
					"type": "int",
					"value": eggCellLifespanHours,
				},
				{
					"name": "Player pregnancy length (days)",
					"description": "How many days must pass until the player is ready to give birth. Realistic value is 270 for humans. Realistic value for felines is 30. Default value is 5",
					"id": "playerPregnancyTimeDays",
					"type": "int",
					"value": playerPregnancyTimeDays,
				},
				{
					"name": "NPC pregnancy length (days)",
					"description": "How many days pass before non-playable characters give birth. Realistic value is 270 for humans. Realistic value for felines is 30. Default value is 5",
					"id": "npcPregnancyTimeDays",
					"type": "int",
					"value": npcPregnancyTimeDays,
				},
			]
		},
		{
			"name": "Render (Restart game after changing these)",
			"id": "render",
			"options": [
				{
					"name": "Renderer",
					"description": "GLES3 = Fancy, GLES2 = More support",
					"id": "renderer",
					"type": "list",
					"value": ProjectSettings.get_setting("rendering/quality/driver/driver_name"),
					"values": [
						["GLES3", "GLES3"],
						["GLES2", "GLES2"],
					]
				},
				{
					"name": "Force Software Skinning",
					"description": "Turn this on if the player doll is displayed incorrectly. Might lower performance.",
					"id": "softwareSkinning",
					"type": "checkbox",
					"value": ProjectSettings.get_setting("rendering/quality/skinning/force_software_skinning"),
				},
				{
					"name": "Skin shaders",
					"description": "Turn this off if your game is lagging/crashing. Will disable all skins.",
					"id": "advancedShadersEnabled",
					"type": "checkbox",
					"value": advancedShadersEnabled,
				}
			]
		},
		{
			"name": "Jiggle physics",
			"id": "jigglephysics",
			"options": [
				{
					"name": "Breasts jiggle physics",
					"description": "Should the boobs bounce?",
					"id": "jigglePhysicsBreastsEnabled",
					"type": "checkbox",
					"value": jigglePhysicsBreastsEnabled,
				},
				{
					"name": "Belly jiggle physics",
					"description": "Should the belly bounce?",
					"id": "jigglePhysicsBellyEnabled",
					"type": "checkbox",
					"value": jigglePhysicsBellyEnabled,
				},
				{
					"name": "Butt jiggle physics",
					"description": "Should the butt bounce?",
					"id": "jigglePhysicsButtEnabled",
					"type": "checkbox",
					"value": jigglePhysicsButtEnabled,
				},
				{
					"name": "Jiggle physics modifier",
					"description": "How bouncy should everything be",
					"id": "jigglePhysicsGlobalModifier",
					"type": "list",
					"value": jigglePhysicsGlobalModifier,
					"values": [
						[0.1, "10%"],
						[0.25, "25%"],
						[0.5, "50%"],
						[0.6, "60%"],
						[0.7, "70%"],
						[0.8, "80%"],
						[0.9, "90%"],
						[1.0, "100%"],
						[1.10, "110%"],
						[1.2, "120%"],
						[1.35, "135%"],
						[1.5, "150%"],
						[2.0, "200%"],
					],
				},
			]
		},
		{
			"name": "Saves",
			"id": "saves",
			"options": [
				{
					"name": "Autosave after sleep",
					"description": "Should the game save automatically when you sleep",
					"id": "autosaveEnabled",
					"type": "checkbox",
					"value": autosaveEnabled,
				}
			],
		},
		{
			"name": "Other",
			"id": "other",
			"options": [
				{
					"name": "Fetch latest release",
					"description": "Should the game load latest update info from github when starting the game",
					"id": "fetchLatestRelease",
					"type": "checkbox",
					"value": fetchNewRelease,
				},
				{
					"name": "UI scaling",
					"description": "Should the game scale the ui for different resolutions. Disable if text is blurry.",
					"id": "shouldScaleUI",
					"type": "checkbox",
					"value": shouldScaleUI,
				},
				{
					"name": "UI scale multiplier",
					"description": "Be careful when changing this value.",
					"id": "uiScaleMultiplier",
					"type": "list",
					"value": uiScaleMultiplier,
					"values": [
						[0.5, "50%"],
						[0.6, "60%"],
						[0.7, "70%"],
						[0.8, "80%"],
						[0.9, "90%"],
						[1.0, "100%"],
						[1.05, "105%"],
						[1.10, "110%"],
						[1.15, "115%"],
						[1.2, "120%"],
						[1.25, "125%"],
						[1.35, "135%"],
						[1.5, "150%"],
					],
				},
				{
					"name": "Show speaker name",
					"description": "Adds a name of the speaker before the speech",
					"id": "showSpeakerName",
					"type": "checkbox",
					"value": showSpeakerName,
				},
				{
					"name": "Output font size",
					"description": "Font size for the scene text output",
					"id": "fontSize",
					"type": "list",
					"value": fontSize,
					"values": [
						["small", "Small"],
						["normal", "Normal"],
						["big", "Big"],
					],
				},
				{
					"name": "Show shortcuts",
					"description": "Show the shortcut key on the button",
					"id": "showShortcuts",
					"type": "checkbox",
					"value": showShortcuts,
				},
				{
					"name": "Button size",
					"description": "Changes the size of the buttons inside the main game screen",
					"id": "uiButtonSize",
					"type": "list",
					"value": uiButtonSize,
					"values": [
						[0, "Default"],
						[1, "Slightly bigger"],
						[2, "Big"],
						[3, "Very big"],
					],
				},
				{
					"name": "Double-tap to pick option (mobile)",
					"description": "First tap shows the description, second tap picks the option. Works only with touchscreens",
					"id": "requireDoubleTapOnMobile",
					"type": "checkbox",
					"value": requireDoubleTapOnMobile,
				},
				{
					"name": "Measurement units",
					"description": "Choose how to display length values",
					"id": "measurementUnits",
					"type": "list",
					"value": measurementUnits,
					"values": [
						["metric", "Metric (cm)"],
						["imperial", "Imperial (in)"],
						["metricimperial", "Metric and Imperial"],
					],
				},
				{
					"name": "Show character art",
					"description": "Show panel with character art instead of small one",
					"id": "showCharacterArt",
					"type": "checkbox",
					"value": showCharacterArt,
				},
				{
					"name": "Show scene art",
					"description": "Display the art associated with the current scene (if available)",
					"id": "showSceneArt",
					"type": "checkbox",
					"value": showSceneArt,
				},
				{
					"name": "Image packs",
					"description": "Choose artist priority",
					"id": "imagePackOrder",
					"type": "prioritylist",
					"imagePacks": true,
					"value": "",
					"values": imagePackOrder,
				},
				{
					"name": "Show scene creator",
					"description": "Displays a 'scene by' text with the author's name under the minimap",
					"id": "showSceneCreator",
					"type": "checkbox",
					"value": showSceneCreator,
				},
				{
					"name": "Developer commentary",
					"description": "Enables developer commentary for scenes that support it",
					"id": "developerCommentary",
					"type": "checkbox",
					"value": developerCommentary,
				},
				{
					"name": "Visible chains",
					"description": "Visible chains when your character is cuffed/leashed. Disabling might improve perfomance.",
					"id": "chainsEnabled",
					"type": "checkbox",
					"value": chainsEnabled,
				},
#				{
#					"name": "Show map art (WIP)",
#					"description": "(WORK IN PROGRESS) Shows props and walls on the minimap when supported",
#					"id": "showMapArt",
#					"type": "checkbox",
#					"value": showMapArt,
#				},
			],
		},
		{
			"name": "Rollback settings (Experimental)",
			"id": "rollback",
			"options": [
				{
					"name": "Rollback enabled",
					"description": "If checked you will be able to rollback the game's state, undoing any choices that the player made. Might use a lot of memory. Disable if the game is too laggy",
					"id": "rollbackEnabled",
					"type": "checkbox",
					"value": rollbackEnabled,
				},
				{
					"name": "Rollback history size",
					"description": "How many actions you wanna be able to undo",
					"id": "rollbackSlots",
					"type": "int",
					"value": rollbackSlots,
				},
				{
					"name": "Make snapshot every X choices",
					"description": "How often do you wanna save the rollback state. 1 = every choice",
					"id": "rollbackSaveEvery",
					"type": "int",
					"value": rollbackSaveEvery,
				},
			]
		},
		{
			"name": "Debug",
			"id": "debug",
			"options": [
				{
					"name": "Debug/Cheats panel",
					"description": "Adds a button that shows the debug panel",
					"id": "debugPanel",
					"type": "checkbox",
					"value": debugPanel,
				},
			]
		},
	]
	
	var contentSettings = []
	for contentType in ContentType.getAll():
		contentSettings.append({
			"name": ContentType.getVisibleName(contentType),
			"description": ContentType.getDescription(contentType),
			"id": contentType,
			"type": "checkbox",
			"value": isContentEnabled(contentType),
		})
	settings.append({
		"name": "Enabled Fetish Content",
		"id": "enabledContent",
		"options": contentSettings,
	})
	
	return settings

func applyOption(categoryID, optionID, value):
	if(categoryID == "jigglephysics"):
		if(optionID == "jigglePhysicsBreastsEnabled"):
			jigglePhysicsBreastsEnabled = value
		if(optionID == "jigglePhysicsBellyEnabled"):
			jigglePhysicsBellyEnabled = value
		if(optionID == "jigglePhysicsButtEnabled"):
			jigglePhysicsButtEnabled = value
		if(optionID == "jigglePhysicsGlobalModifier"):
			jigglePhysicsGlobalModifier = value

	if(categoryID == "saves"):
		if(optionID == "autosaveEnabled"):
			autosaveEnabled = value

	if(categoryID == "modding"):
		if(optionID == "showModdedLauncher"):
			showModdedLauncher = value
			if(showModdedLauncher):
				var _ok = OS.request_permissions()
	
	if(categoryID == "pregnancy"):
		if(optionID == "menstrualCycleLengthDays"):
			menstrualCycleLengthDays = value
		if(optionID == "eggCellLifespanHours"):
			eggCellLifespanHours = value
		if(optionID == "playerPregnancyTimeDays"):
			playerPregnancyTimeDays = value
		if(optionID == "npcPregnancyTimeDays"):
			npcPregnancyTimeDays = value
	
	if(categoryID == "other"):
		if(optionID == "fetchLatestRelease"):
			fetchNewRelease = value
		if(optionID == "shouldScaleUI"):
			shouldScaleUI = value
			
			applySettingsEffect()
		if(optionID == "uiScaleMultiplier"):
			uiScaleMultiplier = value
			
			applySettingsEffect()
		if(optionID == "showSpeakerName"):
			showSpeakerName = value
		if(optionID == "fontSize"):
			fontSize = value
		if(optionID == "showShortcuts"):
			showShortcuts = value
		if(optionID == "measurementUnits"):
			measurementUnits = value
		if(optionID == "requireDoubleTapOnMobile"):
			requireDoubleTapOnMobile = value
		if(optionID == "uiButtonSize"):
			uiButtonSize = value
		if(optionID == "showCharacterArt"):
			showCharacterArt = value
		if(optionID == "showSceneArt"):
			showSceneArt = value
		if(optionID == "showSceneCreator"):
			showSceneCreator = value
		if(optionID == "showMapArt"):
			showMapArt = value
		if(optionID == "developerCommentary"):
			developerCommentary = value
		if(optionID == "chainsEnabled"):
			chainsEnabled = value
		
	if(categoryID == "render"):
		if(optionID == "renderer"):
			myProjectSettings.setDriverName(value)
			myProjectSettings.save()
		if(optionID == "softwareSkinning"):
			myProjectSettings.setForceSoftwareSkinning(value)
			myProjectSettings.save()
		if(optionID == "advancedShadersEnabled"):
			advancedShadersEnabled = value
			
	if(categoryID == "debug"):
		if(optionID == "debugPanel"):
			debugPanel = value
	
	if(categoryID == "rollback"):
		if(optionID == "rollbackEnabled"):
			rollbackEnabled = value
		if(optionID == "rollbackSlots"):
			rollbackSlots = Util.maxi(value, 1)
		if(optionID == "rollbackSaveEvery"):
			rollbackSaveEvery = Util.maxi(value, 1)
			
	if(categoryID == "enabledContent"):
		enabledContent[optionID] = value
	print("SETTING "+categoryID+":"+optionID+" TO "+str(value))

func applySettingsEffect():
	if(shouldScaleUI):
		get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D,SceneTree.STRETCH_ASPECT_EXPAND,Vector2(1280,720), uiScaleMultiplier)
	else:
		get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_DISABLED,SceneTree.STRETCH_ASPECT_EXPAND,Vector2(1280,720))

func saveData():
	var data = {
		"optionsVersion": 1,
		"enabledContent": enabledContent,
		"fetchNewRelease": fetchNewRelease,
		"menstrualCycleLengthDays": menstrualCycleLengthDays,
		"eggCellLifespanHours": eggCellLifespanHours,
		"playerPregnancyTimeDays": playerPregnancyTimeDays,
		"npcPregnancyTimeDays": npcPregnancyTimeDays,
		"shouldScaleUI": shouldScaleUI,
		"uiScaleMultiplier": uiScaleMultiplier,
		"uiButtonSize": uiButtonSize,
		"showSpeakerName": showSpeakerName,
		"fontSize": fontSize,
		"showShortcuts": showShortcuts,
		"measurementUnits": measurementUnits,
		"requireDoubleTapOnMobile": requireDoubleTapOnMobile,
		"debugPanel": debugPanel,
		"imagePackOrder": imagePackOrder,
		"showCharacterArt": showCharacterArt,
		"showSceneArt": showSceneArt,
		"showSceneCreator": showSceneCreator,
		"showMapArt": showMapArt,
		"rollbackEnabled": rollbackEnabled,
		"rollbackSlots": rollbackSlots,
		"rollbackSaveEvery": rollbackSaveEvery,
		"showModdedLauncher": showModdedLauncher,
		"developerCommentary": developerCommentary,
		"jigglePhysicsBreastsEnabled": jigglePhysicsBreastsEnabled,
		"jigglePhysicsBellyEnabled": jigglePhysicsBellyEnabled,
		"jigglePhysicsButtEnabled": jigglePhysicsButtEnabled,
		"jigglePhysicsGlobalModifier": jigglePhysicsGlobalModifier,
		"advancedShadersEnabled": advancedShadersEnabled,
		"chainsEnabled": chainsEnabled,
		"autosaveEnabled": autosaveEnabled,
	}
	
	return data

func loadData(data):
	enabledContent = loadVar(data, "enabledContent", {})
	fetchNewRelease = loadVar(data, "fetchNewRelease", true)
	menstrualCycleLengthDays = loadVar(data, "menstrualCycleLengthDays", 7)
	eggCellLifespanHours = loadVar(data, "eggCellLifespanHours", 48)
	playerPregnancyTimeDays = loadVar(data, "playerPregnancyTimeDays", 5)
	npcPregnancyTimeDays = loadVar(data, "npcPregnancyTimeDays", 5)
	shouldScaleUI = loadVar(data, "shouldScaleUI", true)
	uiScaleMultiplier = loadVar(data, "uiScaleMultiplier", 1.0)
	uiButtonSize = loadVar(data, "uiButtonSize", 0)
	showSpeakerName = loadVar(data, "showSpeakerName", true)
	fontSize = loadVar(data, "fontSize", "normal")
	showShortcuts = loadVar(data, "showShortcuts", true)
	measurementUnits = loadVar(data, "measurementUnits", "metric")
	requireDoubleTapOnMobile = loadVar(data, "requireDoubleTapOnMobile", false)
	debugPanel = loadVar(data, "debugPanel", false)
	imagePackOrder = loadVar(data, "imagePackOrder", [])
	showCharacterArt = loadVar(data, "showCharacterArt", true)
	showSceneArt = loadVar(data, "showSceneArt", true)
	showSceneCreator = loadVar(data, "showSceneCreator", true)
	showMapArt = loadVar(data, "showMapArt", false)
	rollbackEnabled = loadVar(data, "rollbackEnabled", false)
	rollbackSlots = loadVar(data, "rollbackSlots", 5)
	rollbackSaveEvery = loadVar(data, "rollbackSaveEvery", 1)
	showModdedLauncher = loadVar(data, "showModdedLauncher", false)
	developerCommentary = loadVar(data, "developerCommentary", false)
	jigglePhysicsBreastsEnabled = loadVar(data, "jigglePhysicsBreastsEnabled", true)
	jigglePhysicsBellyEnabled = loadVar(data, "jigglePhysicsBellyEnabled", true)
	jigglePhysicsButtEnabled = loadVar(data, "jigglePhysicsButtEnabled", true)
	jigglePhysicsGlobalModifier = loadVar(data, "jigglePhysicsGlobalModifier", 1.0)
	advancedShadersEnabled = loadVar(data, "advancedShadersEnabled", true)
	chainsEnabled = loadVar(data, "chainsEnabled", true)
	autosaveEnabled = loadVar(data, "autosaveEnabled", true)

func saveToFile():
	var saveData = saveData()
	var save_game = File.new()
	save_game.open(optionsFilepath, File.WRITE)
	
	save_game.store_line(JSON.print(saveData, "\t", true))
	
	save_game.close()

func loadFromFile():
	var save_game = File.new()
	if not save_game.file_exists(optionsFilepath):
		print("GlobalOptions: No saved options found, default values will be used")
		return
	
	save_game.open(optionsFilepath, File.READ)
	#var saveData = parse_json(save_game.get_as_text())
	var jsonResult = JSON.parse(save_game.get_as_text())
	if(jsonResult.error != OK):
		Log.printerr("GlobalOptions: Error while loading the options file, the file is not a valid json")
		return
	
	var saveData = jsonResult.result
	loadData(saveData)
	save_game.close()

func loadVar(data: Dictionary, key, nullvalue = null):
	if(!data.has(key)):
		Log.printerr("Warning: Options file doesn't have key "+key+". Using "+str(nullvalue)+" as default value. File: "+Util.getStackFunction())
		return nullvalue
		
	if(nullvalue != null && typeof(data[key]) != typeof(nullvalue) && !(typeof(data[key]) == TYPE_REAL && typeof(nullvalue) == TYPE_INT)):
		Log.printerr("Warning: value mismatch when loading an options file. Key '"+key+"' has type "+Util.variantTypeToString(typeof(data[key]))+" and default value has type "+Util.variantTypeToString(typeof(nullvalue))+". Is that an error? "+Util.getStackFunction())
		
	if(data[key] == null && nullvalue != null):
		Log.printerr("Warning: loaded value is null while the default value isn't. Is that correct? "+Util.getStackFunction())
		
	return data[key]

func resetRenderSettings():
	myProjectSettings.resetToDefault()

func checkImagePackOrder(imagePacks):
	var newImagePackOrder = []
	
	for imagePackID in imagePackOrder:
		if (imagePacks.has(imagePackID)):
			newImagePackOrder.append(imagePackID)
	
	for imagePackID in imagePacks:
		if(!newImagePackOrder.has(imagePackID)):
			newImagePackOrder.push_front(imagePackID)
	
	imagePackOrder = newImagePackOrder
	print("checkImagePackOrder DONE ",imagePackOrder)

func getImagePackOrder():
	return imagePackOrder
