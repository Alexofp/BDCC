extends Node

var targetLanguage = "de"
var shouldBeTranslating = false
var manualTranslateButton = false
var shouldTranslateButtons = true

var translators = []
var translatorIDS = ["google", "bing", "papago", "googlebatch"]

var hadToUseFallback = false

func _ready():
	loadFromFile()
	setTargetLanguage(targetLanguage)
	#addTranslator("deepl") # Doesn't work anymore :(
	recreateTranslatorIfNeeded()
	setShouldTranslate(shouldBeTranslating)

func createTranslator(translatorID):
	if(translatorID == "google"):
		return GoogleTranslator.new()
	if(translatorID == "googlebatch"):
		return GoogleBatchTranslator.new()
	if(translatorID == "deepl"):
		return DeepLTranslator.new()
	if(translatorID == "papago"):
		return PapagoTranslate.new()
	if(translatorID == "bing"):
		return MicrosoftTranslator.new()
	return null
	
func setTargetLanguage(tl):
	if(!TranslationLanguage.languageExists(tl)):
		printerr("Bad language "+str(tl))
		return
	
	targetLanguage = tl

func getTargetLanguage():
	return targetLanguage
	
func moveUpTranslator(id):
	if id == 0:
		return
	var modified = translators.pop_at(id)
	translators.insert(id - 1, modified)
	modified = translatorIDS.pop_at(id)
	translatorIDS.insert(id - 1, modified)

func moveDownTranslator(id):
	if id == len(translators) - 1:
		return
	var modified = translators.pop_at(id)
	translators.insert(id + 1, modified)
	modified = translatorIDS.pop_at(id)
	translatorIDS.insert(id + 1, modified)

func addTranslator(translatorID):
	translatorIDS.append(translatorID)
	if(shouldBeTranslating):
		var newTranslator = createTranslator(translatorID)
		if(newTranslator == null):
			return
		add_child(newTranslator)
		translators.append(newTranslator)


func recreateTranslatorIfNeeded():
	if(!shouldBeTranslating && translators.size() > 0):
		for translator in translators:
			translator.queue_free()
		translators.clear()
	
	if(shouldBeTranslating && translators.size() == 0):
		for translatorID in translatorIDS:
			var newTranslator = createTranslator(translatorID)
			if(newTranslator == null):
				continue
			add_child(newTranslator)
			translators.append(newTranslator)

func shouldTranslate():
	return shouldBeTranslating

func setShouldTranslate(newtranslate):
	shouldBeTranslating = newtranslate
	recreateTranslatorIfNeeded()

func shouldHaveManualTranslateButton():
	return manualTranslateButton

func setManualTransalteButton(newb):
	manualTranslateButton = newb

func translate(inputText):
	hadToUseFallback = false
	if(!shouldBeTranslating || translators.size() == 0):
		return inputText
		
	#var hadFails = false
	var usedTranslators = []
	var theResultedArray = []
	var splittedText = splitByNewLinesAndSize(inputText, 4000)
	var amountOfTexts = splittedText.size()
	var _i = 0
	for theText in splittedText:
		var theFinalResult = null
		for translator in translators:
			if(!translator.canTranslate()):
				continue
			if(!usedTranslators.has(translator)):
				usedTranslators.append(translator)
			var theResult = translator.translate(targetLanguage, theText)
			if(theResult is GDScriptFunctionState):
				theResult = yield(theResult, "completed")
			if(theResult == null || !(theResult is Dictionary) || !(theResult.has("success")) || !theResult["success"]):
				continue
			if(translator.id == "googlebatch"):
				hadToUseFallback = true
			theFinalResult = theResult
			#print("Used "+translator.id)
			break

		if(theFinalResult == null):
			for translator in usedTranslators:
				translator.afterTranslate()
			return inputText
		theResultedArray.append(theFinalResult["resultText"])
		
		_i += 1
		if(_i < amountOfTexts):
			yield(get_tree().create_timer(2.0), "timeout")
	
	if(theResultedArray.size() == 0):
		for translator in usedTranslators:
			translator.afterTranslate()
		return inputText
	
	for translator in usedTranslators:
		translator.afterTranslate()
	return join(theResultedArray, "\n")

func splitBySize(inputText:String, maxSize):
	var result = []
	var _i = 0
	var inputLen = inputText.length()
	while(_i < inputLen):
		var toRead = maxSize
		var leftToRead = inputLen - _i
		if(leftToRead < toRead):
			toRead = leftToRead
		
		var newText = inputText.substr(_i, toRead)
		result.append(newText)
		_i += toRead
	return result

func splitByNewLinesAndSize(inputText:String, maxSize):
	var paragraphs = inputText.split("\n")
	
	var result = []
	var currentText = ""
	for par in paragraphs:
		if(currentText != ""):
			currentText += "\n"
		currentText += par
		
		if(currentText.length() > maxSize):
			result.append(currentText)
			currentText = ""
	
	if(currentText != ""):
		result.append(currentText)
	
	return result

static func join(arr: Array, separator: String = "") -> String:
	var output = ""
	for s in arr:
		output += str(s) + separator
	output = output.left( output.length() - separator.length() )
	return output

func saveData():
	return {
		"targetLanguage": targetLanguage,
		"shouldBeTranslating": shouldBeTranslating,
		"manualTranslateButton": manualTranslateButton,
		"shouldTranslateButtons": shouldTranslateButtons,
		"translatorIDS": translatorIDS
	}

func loadData(data):
	targetLanguage = SAVE.loadVar(data, "targetLanguage", "de")
	shouldBeTranslating = SAVE.loadVar(data, "shouldBeTranslating", false)
	manualTranslateButton = SAVE.loadVar(data, "manualTranslateButton", false)
	shouldTranslateButtons = SAVE.loadVar(data, "shouldTranslateButtons", true)
	
	var loadedTranslatorIDS:Array = SAVE.loadVar(data, "translatorIDS", [])
	var defaultList:Array = translatorIDS.duplicate()
	
	var newTranslatorIDS:Array = []
	
	for loadedID in loadedTranslatorIDS:
		if(!defaultList.has(loadedID)): # Skip any translator that we don't have (anymore)
			continue
		newTranslatorIDS.append(loadedID)
	
	for defaultID in defaultList:
		if(newTranslatorIDS.has(defaultID)):
			continue
		newTranslatorIDS.append(defaultID) # Add new translators to the end of the list
	
	translatorIDS = newTranslatorIDS
	
var configFilePath = "user://autotranslation.json"
func saveToFile():
	var saveData = saveData()
	var save_game = File.new()
	save_game.open(configFilePath, File.WRITE)
	
	save_game.store_line(JSON.print(saveData, "\t", true))
	
	save_game.close()

func loadFromFile():
	var save_game = File.new()
	if not save_game.file_exists(configFilePath):
		print("AutoTranslation: No saved options found, default values will be used")
		return
	
	save_game.open(configFilePath, File.READ)
	#var saveData = parse_json(save_game.get_as_text())
	var jsonResult = JSON.parse(save_game.get_as_text())
	if(jsonResult.error != OK):
		Log.printerr("AutoTranslation: Error while loading the options file, the file is not a valid json")
		return
	
	var saveData = jsonResult.result
	loadData(saveData)
	save_game.close()
