extends Control

var SPELLCHECK_URL = 'https://orthographe.reverso.net/api/v1/Spelling'
onready var http_request = $HTTPRequest
onready var mistake_item_list = $VBoxContainer/HBoxContainer/VBoxContainer/MistakeItemList
onready var rich_text_label = $VBoxContainer/HBoxContainer/VBoxContainer/RichTextLabel
onready var text_edit = $VBoxContainer/HBoxContainer/TextEdit

var spellErrors = []
var selectedErrorIndex:int = -1
var originalText:String = ""
var currentText:String = ""

signal onTextSubmit(newText)
signal onCancel

func setTextAndCheck(theText:String):
	text_edit.text = theText
	startSpellCheck(theText)

func startSpellCheck(theText:String):
	originalText = theText
	currentText = theText
	spellErrors = []
	updateSpellErrorsList()
	rich_text_label.text = "Loading.."

	var data = {
		language = "eng",
		getCorrectionDetails = true,
		origin = 'interactive',
		text = theText,
	}
	
	http_request.request(SPELLCHECK_URL, ["Content-Type: application/json"], true, HTTPClient.METHOD_POST, JSON.print(data))
	

func _ready():
	pass
	
func updateSpellErrorsList():
	mistake_item_list.clear()
	
	var _i = 0
	for suggestion in spellErrors:
		mistake_item_list.add_item(suggestion["mistakeText"]+"->"+suggestion["correctedText"])
		_i += 1
	
	if(selectedErrorIndex >= 0 && selectedErrorIndex < spellErrors.size()):
		mistake_item_list.select(selectedErrorIndex)
	updateSelectedSpellError()
	
func updateSelectedSpellError():
	if(selectedErrorIndex < 0 || selectedErrorIndex >= spellErrors.size()):
		rich_text_label.text = ""
		return
	
	var selectedEntry = spellErrors[selectedErrorIndex]
	var text = ""
	text += "Mistake text: '"+str(selectedEntry["mistakeText"])+"'\n"
	text += "Fixed text: '"+str(selectedEntry["correctedText"])+"'\n\n"
	text += "Type: "+str(selectedEntry["type"])+"\n"
	text += ""+str(selectedEntry["shortDesc"])+"\n"
	text += ""+str(selectedEntry["longDesc"])+"\n"
	#text += "StartIndex: "+str(selectedEntry["startIndex"])+"\n"
	#text += "EndIndex: "+str(selectedEntry["endIndex"])+"\n"
	
	rich_text_label.text = text
	
	var startLineCol = textIndexToLineAndCol(selectedEntry["startIndex"])
	var endLineCol = textIndexToLineAndCol(selectedEntry["endIndex"])
	
	text_edit.select(startLineCol[0], startLineCol[1], endLineCol[0], endLineCol[1]+1)
	
func _on_HTTPRequest_request_completed(_result, _response_code, _headers, _body):
	spellErrors = []
	var jsonResult = (JSON.parse(_body.get_string_from_utf8()))
	if(jsonResult.error != OK):
		Log.printerr(jsonResult)
		updateSpellErrorsList()
		rich_text_label.text = "Error.. "+str(_response_code)
		return
	#print(_body.get_string_from_utf8())
	var resultData:Dictionary = jsonResult.result
	
	if(!resultData.has("corrections")):
		Log.printerr("No corrections found")
		updateSpellErrorsList()
		return
	
	var corrID = 0
	var needFields = ["type", "shortDescription", "longDescription", "startIndex", "endIndex", "mistakeText", "suggestions"]
	for correctionEntry in resultData["corrections"]:
		var hasAllFields = true
		for field in needFields:
			if(!correctionEntry.has(field)):
				hasAllFields = false
				break
		if(!hasAllFields):
			continue
		
		for suggestion in correctionEntry["suggestions"]:
			if(!suggestion.has("text")):
				continue
			spellErrors.append({
				groupID = corrID,
				type = correctionEntry["type"],
				shortDesc = correctionEntry["shortDescription"],
				longDesc = correctionEntry["longDescription"],
				startIndex = correctionEntry["startIndex"],
				endIndex = correctionEntry["endIndex"],
				mistakeText = correctionEntry["mistakeText"],
				correctedText = suggestion["text"],
			})
		
		corrID += 1
	updateSpellErrorsList()
	if(spellErrors.size() <= 0):
		rich_text_label.text = "No errors found"
		return

func _on_MistakeItemList_item_selected(index):
	selectedErrorIndex = index
	updateSelectedSpellError()


func _on_RunButton_pressed():
	startSpellCheck(text_edit.text)

func doFixError():
	if(selectedErrorIndex < 0 || selectedErrorIndex >= spellErrors.size()):
		return
	
	var selectedEntry = spellErrors[selectedErrorIndex]
	
	var startIndex = selectedEntry["startIndex"]
	var endIndex = selectedEntry["endIndex"]
	var newText = selectedEntry["correctedText"]
	
	var letterDiff:int = newText.length() - endIndex + startIndex - 1
	#print("DIFF: "+str(letterDiff))
	
	var newCurrentText = ""
	newCurrentText += currentText.substr(0, startIndex)
	newCurrentText += newText
	newCurrentText += currentText.substr(endIndex+1)
	
	currentText = newCurrentText
	text_edit.text = currentText
	
	# Fixing the indecies of the next entries
	for entry in spellErrors:
		if(entry["startIndex"] > startIndex):
			entry["startIndex"] += letterDiff
			entry["endIndex"] += letterDiff
	
	# Filtering out the same fix
	var newSpellErrors = []
	for entry in spellErrors:
		if(entry["groupID"] != selectedEntry["groupID"]):
			newSpellErrors.append(entry)
	spellErrors = newSpellErrors
	
	updateSpellErrorsList()

func _on_ApplyButton_pressed():
	doFixError()

func _on_FixAllButton_pressed():
	while(!spellErrors.empty()):
		selectedErrorIndex = 0
		doFixError()

func textIndexToLineAndCol(index):
	var lines = text_edit.text.split("\n")
	
	var currentLine = 0
	for line in lines:
		var lineLen = line.length()
		if(index < lineLen):
			return [currentLine, index]
		index -= lineLen + 1
		currentLine += 1
	return [0, 0]

func _on_ConfirmButton_pressed():
	emit_signal("onTextSubmit", text_edit.text)

func _on_CancelButton_pressed():
	emit_signal("onCancel")
