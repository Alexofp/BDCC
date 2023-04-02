extends Node

var targetLanguage = "de"
var selectedTranslatorID = ""
var shouldBeTranslating = false

var translator:TranslatorBase

func _ready():
	loadFromFile()
	setTargetLanguage(targetLanguage)
	setTranslator("googlebatch")
	setShouldTranslate(shouldBeTranslating)
	
func setTargetLanguage(tl):
	if(!TranslationLanguage.languageExists(tl)):
		printerr("Bad language "+str(tl))
		return
	
	targetLanguage = tl

func getTargetLanguage():
	return targetLanguage

func setTranslator(translatorID):
	if(selectedTranslatorID == translatorID && translator != null):
		return
	
	selectedTranslatorID = translatorID
	recreateTranslatorIfNeeded()

func recreateTranslatorIfNeeded():	
	if(translator != null):
		if(translator.id != selectedTranslatorID || !shouldBeTranslating):
			translator.queue_free()
			translator = null
		elif(translator.id == selectedTranslatorID):
			return
	
	if(!shouldBeTranslating):
		return
	
	# Replace me with something smarter
	#if(selectedTranslatorID == "google"):
	#	translator = GoogleTranslator.new()
	#	add_child(translator)
	if(selectedTranslatorID == "googlebatch"):
		translator = GoogleBatchTranslator.new()
		add_child(translator)
	
	if(translator != null):
		translator.setup()

func shouldTranslate():
	return shouldBeTranslating

func setShouldTranslate(newtranslate):
	shouldBeTranslating = newtranslate
	recreateTranslatorIfNeeded()

func translate(inputText):
	if(translator == null || !shouldBeTranslating):
		return inputText
		
	#var hadFails = false
	var theResultedArray = []
	var splittedText = splitByNewLinesAndSize(inputText, 4000)
	for theText in splittedText:
		var theResult = translator.translate(targetLanguage, theText)
		if(theResult is GDScriptFunctionState):
			theResult = yield(theResult, "completed")
		if(theResult == null || !(theResult is Dictionary) || !(theResult.has("success")) || !theResult["success"]):
			#hadFails = true
			return inputText
			#continue
		
		theResultedArray.append(theResult["resultText"])
	
	if(theResultedArray.size() == 0):
		return inputText
	
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
	}

func loadData(data):
	targetLanguage = SAVE.loadVar(data, "targetLanguage", "de")
	shouldBeTranslating = SAVE.loadVar(data, "shouldBeTranslating", false)
	
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
