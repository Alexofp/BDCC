extends Node

var enabledContent = {}
const optionsFilepath = "user://options.json"
var fetchNewRelease = true
# Pregnancy options
var menstrualCycleLengthDays: int
var eggCellLifespanHours: int
var playerPregnancyTimeDays: int
var npcPregnancyTimeDays: int

func resetToDefaults():
	fetchNewRelease = true
	menstrualCycleLengthDays = 7
	eggCellLifespanHours = 48
	playerPregnancyTimeDays = 5
	npcPregnancyTimeDays = 5
	
	enabledContent.clear()
	for contentType in ContentType.getAll():
		enabledContent[contentType] = !ContentType.isDisabledByDefault(contentType)

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

func getChangeableOptions():
	var settings = [
		{
			"name": "Test category",
			"id": "testCategory",
			"options": [
				{
					"name": "Test option",
					"description": "test description",
					"id": "test_option",
					"type": "checkbox",
					"value": true,
				},
				{
					"name": "Test option 2",
					"description": "mew mew test description",
					"id": "test_option2",
					"type": "list",
					"value": "v1",
					"values": [
						["v0", "Meow meow v0"],
						["v1", "Nya v1"],
						["v2", "Hah v2"],
					],
				},
				{
					"name": "Test option 3",
					"description": "Float test",
					"id": "test_option3",
					"type": "float",
					"value": 0.5,
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
	
	if(categoryID == "enabledContent"):
		enabledContent[optionID] = value
	print("SETTING "+categoryID+":"+optionID+" TO "+str(value))



func saveData():
	var data = {
		"optionsVersion": 1,
		"enabledContent": enabledContent,
		"fetchNewRelease": fetchNewRelease,
		"menstrualCycleLengthDays": menstrualCycleLengthDays,
		"eggCellLifespanHours": eggCellLifespanHours,
		"playerPregnancyTimeDays": playerPregnancyTimeDays,
		"npcPregnancyTimeDays": npcPregnancyTimeDays,
	}
	
	return data

func loadData(data):
	enabledContent = loadVar(data, "enabledContent", {})
	fetchNewRelease = loadVar(data, "fetchNewRelease", true)
	menstrualCycleLengthDays = loadVar(data, "menstrualCycleLengthDays", 7)
	eggCellLifespanHours = loadVar(data, "eggCellLifespanHours", 48)
	playerPregnancyTimeDays = loadVar(data, "playerPregnancyTimeDays", 5)
	npcPregnancyTimeDays = loadVar(data, "npcPregnancyTimeDays", 5)

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
		printerr("Warning: Options file doesn't have key "+key+". Using "+str(nullvalue)+" as default value. File: "+get_stack()[1]["source"]+" Line: "+str(get_stack()[1]["line"]))
		return nullvalue
		
	if(nullvalue != null && typeof(data[key]) != typeof(nullvalue) && !(typeof(data[key]) == TYPE_REAL && typeof(nullvalue) == TYPE_INT)):
		printerr("Warning: value mismatch when loading an options file. Key '"+key+"' has type "+Util.variantTypeToString(typeof(data[key]))+" and default value has type "+Util.variantTypeToString(typeof(nullvalue))+". Is that an error? File: "+get_stack()[1]["source"]+" Line: "+str(get_stack()[1]["line"]))
		
	if(data[key] == null && nullvalue != null):
		printerr("Warning: loaded value is null while the default value isn't. Is that correct? File: "+get_stack()[1]["source"]+" Line: "+str(get_stack()[1]["line"]))
		
	return data[key]
