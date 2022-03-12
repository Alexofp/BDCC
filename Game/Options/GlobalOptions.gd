extends Node

var enabledContent = {}
const optionsFilepath = "user://options.json"

func _init():

	resetToDefaults()
	
	loadFromFile()

func isContentEnabled(contentType):
	if(!enabledContent.has(contentType)):
		return !ContentType.isDisabledByDefault(contentType)
	
	return enabledContent[contentType]

func getChangeableOptions():
	var settings = [
		{
			"name": "Test category",
			"id": "testCategory",
			"options": [
				{
					"name": "Test option",
					"id": "test_option",
					"type": "checkbox",
					"value": true,
				},
				{
					"name": "Test option 2",
					"id": "test_option2",
					"type": "list",
					"value": "v1",
					"values": [
						["v0", "Meow meow v0"],
						["v1", "Nya v1"],
						["v2", "Hah v2"],
					],
				},
			],
		}
	]
	
	var contentSettings = []
	for contentType in ContentType.getAll():
		contentSettings.append({
			"name": ContentType.getVisibleName(contentType),
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
	if(categoryID == "enabledContent"):
		enabledContent[optionID] = value
	print("SETTING "+categoryID+":"+optionID+" TO "+str(value))

func resetToDefaults():
	enabledContent.clear()
	for contentType in ContentType.getAll():
		enabledContent[contentType] = !ContentType.isDisabledByDefault(contentType)

func saveData():
	var data = {
		"optionsVersion": 1,
		"enabledContent": enabledContent,
	}
	
	return data

func loadData(data):
	enabledContent = loadVar(data, "enabledContent", {})

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
		printerr("Warning: Save doesn't have key "+key+". Using "+str(nullvalue)+" as default value. File: "+get_stack()[1]["source"]+" Line: "+str(get_stack()[1]["line"]))
		return nullvalue
		
	if(nullvalue != null && typeof(data[key]) != typeof(nullvalue) && !(typeof(data[key]) == TYPE_REAL && typeof(nullvalue) == TYPE_INT)):
		printerr("Warning: value mismatch when loading a save. Key '"+key+"' has type "+Util.variantTypeToString(typeof(data[key]))+" and default value has type "+Util.variantTypeToString(typeof(nullvalue))+". Is that an error? File: "+get_stack()[1]["source"]+" Line: "+str(get_stack()[1]["line"]))
		
	if(data[key] == null && nullvalue != null):
		printerr("Warning: loaded value is null while the default value isn't. Is that correct? File: "+get_stack()[1]["source"]+" Line: "+str(get_stack()[1]["line"]))
		
	return data[key]
