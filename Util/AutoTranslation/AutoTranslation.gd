extends Node

const DEBUG_TRANSLATION := false # Set to true to get debug text printed into the console

signal translator_recreated

var targetLanguage:String = "de"
var shouldBeTranslating:bool = false
var manualTranslateButton:bool = false
var shouldTranslateButtons:bool = true
var shouldKeepBBTags:bool = true

var translators:Array = []
var translatorIDS:Array = ["yandex", "deeplv2", "google", "googlegtx", "googlebatch"] #, "bing", "papago"

var hadToUseFallback:bool = false
var statusText:String = ""

func _ready():
	loadFromFile()
	setTargetLanguage(targetLanguage)
	#addTranslator("deepl") # Doesn't work anymore :(
	recreateTranslatorIfNeeded()
	setShouldTranslate(shouldBeTranslating)
	#call_deferred("doTest")
	
func doTest():
	var theTr := GoogleGTXTranslator.new()
	theTr.translate("fr", "Meow")

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
	if(translatorID == "deeplv2"):
		return DeepLTranslatorV2.new()
	if(translatorID == "yandex"):
		return YandexTranslator.new()
	if(translatorID == "googlegtx"):
		return GoogleGTXTranslator.new()
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
	
	emit_signal("translator_recreated")

func shouldTranslate():
	return shouldBeTranslating

func setShouldTranslate(newtranslate):
	shouldBeTranslating = newtranslate
	recreateTranslatorIfNeeded()

func shouldHaveManualTranslateButton():
	return manualTranslateButton

func setManualTransalteButton(newb):
	manualTranslateButton = newb

func translateDict(_textsByID:Dictionary) -> Dictionary:
	var theBigText:String = ""
	var _idRemap:Dictionary = {}
	var _idIndx:int = 0
	
	for theID in _textsByID:
		var _theGenID:String = "[["+str(_idIndx)+"]]"
		_idIndx += 1
		_idRemap[_theGenID] = theID
		
		var theIDText:String = _textsByID[theID]
		
		if(!theBigText.empty()):
			theBigText += "\n\n"
		theBigText += _theGenID + "\n" + theIDText + "\n" + "[[]]"
	
	var theTranslatedText:String = yield(translate(theBigText), "completed")
	if(theTranslatedText.empty()):
		Log.printerr("Translator failed to translate")
		return _textsByID
	
	var theSplitByLines:Array = theTranslatedText.split("\n")
	var currentID:String = ""
	var savedLines:Array = []
	var result:Dictionary = {}
	for theLine in theSplitByLines:
		if(theLine.begins_with("[[")):
			theLine = theLine.strip_edges()
			if(_idRemap.has(theLine.strip_edges())):
				if(currentID.empty()):
					currentID = _idRemap[theLine]
			elif(theLine == "[[]]"):
				result[currentID] = Util.join(savedLines, "\n")
				currentID = ""
				savedLines.clear()
		elif(!currentID.empty()):
			savedLines.append(theLine)
	
	if(result.size() != _textsByID.size()):
		Log.printerr("Something went wrong during translation")
		for theID in _textsByID:
			if(!result.has(theID)):
				result[theID] = _textsByID[theID]
	
	return result

func translate(inputText:String) -> String:
	if(DEBUG_TRANSLATION):
		print(" == SENT TO TRANSLATOR ==")
		print(inputText)
		print(" == END ==")
	
	statusText = ""
	hadToUseFallback = false
	if(!shouldBeTranslating || translators.size() == 0):
		return inputText
		
	#var hadFails = false
	var usedTranslators = []
	var usedTranslatorsNames:Array = []
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
			var theResult = translator.translateFinal(targetLanguage, theText)
			if(theResult is GDScriptFunctionState):
				theResult = yield(theResult, "completed")
			if(theResult == null || !(theResult is Dictionary) || !(theResult.has("success")) || !theResult["success"]):
				if(DEBUG_TRANSLATION):
					printerr(translator.id+" RETURNED BAD RESULT: "+str(theResult))
				usedTranslatorsNames.append(translator.id+"(err)")
				continue
			if(translator.id == "googlebatch"):
				hadToUseFallback = true
			theFinalResult = theResult
			usedTranslatorsNames.append(translator.id)
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
		
	if(DEBUG_TRANSLATION):
		print(" == USED TRANSLATORS ==")
		for translator in usedTranslators:
			print(translator.id)
		print(" == RECEIVED ==")
		for theLine in theResultedArray:
			print(theLine)
		print(" == END ==")
	
	statusText = Util.join(usedTranslatorsNames, ",")
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
		"translatorIDS": translatorIDS,
		"shouldKeepBBTags": shouldKeepBBTags,
	}

func loadData(data):
	targetLanguage = SAVE.loadVar(data, "targetLanguage", "de")
	shouldBeTranslating = SAVE.loadVar(data, "shouldBeTranslating", false)
	manualTranslateButton = SAVE.loadVar(data, "manualTranslateButton", false)
	shouldTranslateButtons = SAVE.loadVar(data, "shouldTranslateButtons", true)
	shouldKeepBBTags = SAVE.loadVar(data, "shouldKeepBBTags", true)
	
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
