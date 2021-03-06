extends Node

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

var showSpeakerName = false
var fontSize = "normal"
var showShortcuts = true

var measurementUnits = "metric"

func resetToDefaults():
	fetchNewRelease = true
	menstrualCycleLengthDays = 7
	eggCellLifespanHours = 48
	playerPregnancyTimeDays = 5
	npcPregnancyTimeDays = 5
	shouldScaleUI = true
	uiScaleMultiplier = 1.0
	showSpeakerName = false
	fontSize = "normal"
	showShortcuts = true
	measurementUnits = "metric"
	
	enabledContent.clear()
	for contentType in ContentType.getAll():
		enabledContent[contentType] = !ContentType.isDisabledByDefault(contentType)
		
	call_deferred("applySettingsEffect")

func _init():

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

func getChangeableOptions():
	var settings = [
#		{
#			"name": "Test category",
#			"id": "testCategory",
#			"options": [
#				{
#					"name": "Test option",
#					"description": "test description",
#					"id": "test_option",
#					"type": "checkbox",
#					"value": true,
#				},
#				{
#					"name": "Test option 2",
#					"description": "mew mew test description",
#					"id": "test_option2",
#					"type": "list",
#					"value": "v1",
#					"values": [
#						["v0", "Meow meow v0"],
#						["v1", "Nya v1"],
#						["v2", "Hah v2"],
#					],
#				},
#				{
#					"name": "Test option 3",
#					"description": "Float test",
#					"id": "test_option3",
#					"type": "float",
#					"value": 0.5,
#				},
#			],
#		},
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
			],
		}
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
		"showSpeakerName": showSpeakerName,
		"fontSize": fontSize,
		"showShortcuts": showShortcuts,
		"measurementUnits": measurementUnits,
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
	showSpeakerName = loadVar(data, "showSpeakerName", false)
	fontSize = loadVar(data, "fontSize", "normal")
	showShortcuts = loadVar(data, "showShortcuts", true)
	measurementUnits = loadVar(data, "measurementUnits", "metric")

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
		printerr("GlobalOptions: Error while loading the options file, the file is not a valid json")
		return
	
	var saveData = jsonResult.result
	loadData(saveData)
	save_game.close()

func loadVar(data: Dictionary, key, nullvalue = null):
	if(!data.has(key)):
		printerr("Warning: Options file doesn't have key "+key+". Using "+str(nullvalue)+" as default value. File: "+Util.getStackFunction())
		return nullvalue
		
	if(nullvalue != null && typeof(data[key]) != typeof(nullvalue) && !(typeof(data[key]) == TYPE_REAL && typeof(nullvalue) == TYPE_INT)):
		printerr("Warning: value mismatch when loading an options file. Key '"+key+"' has type "+Util.variantTypeToString(typeof(data[key]))+" and default value has type "+Util.variantTypeToString(typeof(nullvalue))+". Is that an error? "+Util.getStackFunction())
		
	if(data[key] == null && nullvalue != null):
		printerr("Warning: loaded value is null while the default value isn't. Is that correct? "+Util.getStackFunction())
		
	return data[key]
