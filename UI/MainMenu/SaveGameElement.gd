extends HBoxContainer

var saveFile = ""
onready var saveNameLabel = $SaveNameLabel
signal onLoadButtonPressed(saveFile)
signal onDeleteButtonPressed(saveFile)
signal onExportButtonPressed(saveFile)
var showLoadButton = true
var isInDeleteMode = false

func getSavePath():
	return saveFile

func setSaveFile(path):
	var file = File.new()
	var fileModifTime = file.get_modified_time(path)
	
	if(fileModifTime is String):
		assert(false)
	
	var fileModifTimeDict = OS.get_datetime_from_unix_time(fileModifTime)
	var fileModifTimeString = Util.datetimeToRFC113(fileModifTimeDict)
	
	saveFile = path
	
	var gameData = SAVE.loadGameInformationFromSave(path)
	var extra = ""
	
	if(gameData == null):
		extra = "Couldn't load game info!.. Bad save?.."
	else:
		extra = "Name: "+str(gameData["gamename"])+" - Day: "+str(gameData["currentDay"])+" - Credits: "+str(gameData["credits"])
		extra += " - Time: "+str(Util.getTimeStringHHMM(gameData["timeOfDay"]))
		#extra += " - Location: "+str(gameData["location"])
	
	saveNameLabel.bbcode_text = "[b]" + saveFile.get_file() + "[/b] - " + fileModifTimeString + "\n"+extra

func _on_LoadButton_pressed():
	emit_signal("onLoadButtonPressed", saveFile)

func _on_DeleteButton_pressed():
	emit_signal("onDeleteButtonPressed", saveFile)
	queue_free() #Keep it simple!!! If you havn't any steps what can revert action, free node!

func updateButtons():
	$LoadButton.visible = !isInDeleteMode && showLoadButton #Erm... Why in old func you was needed this second var?
	$ExportButton.visible = !isInDeleteMode && showLoadButton #Better leave logic here...
	$DeleteButton.visible = isInDeleteMode

func setDeleteMode(m):
	isInDeleteMode = m
	updateButtons()

func setShowLoadButton(m):
	showLoadButton = m
	updateButtons()

func _on_ExportButton_pressed():
	emit_signal("onExportButtonPressed", saveFile)
