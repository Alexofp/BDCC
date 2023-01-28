extends HBoxContainer

var saveFile = ""
onready var saveNameLabel = $SaveNameLabel
signal onLoadButtonPressed(saveFile)
signal onDeleteButtonPressed(saveFile)
signal onExportButtonPressed(saveFile)
var showLoadButton = true
var isInDeleteMode = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#setDeleteMode(false)

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
		extra = "Couldn't load game info, bad save?"
	else:
		extra = "Name: "+str(gameData["gamename"])+" - Day: "+str(gameData["currentDay"])+" - Credits: "+str(gameData["credits"])
		extra += " - Time: "+str(Util.getTimeStringHHMM(gameData["timeOfDay"]))
		#extra += " - Location: "+str(gameData["location"])
	
	saveNameLabel.bbcode_text = "[b]" + saveFile.get_file() + "[/b] - " + fileModifTimeString + "\n"+extra

func _on_LoadButton_pressed():
	emit_signal("onLoadButtonPressed", saveFile)


func _on_DeleteButton_pressed():
	emit_signal("onDeleteButtonPressed", saveFile)

func updateButtons():
	if(isInDeleteMode):
		$LoadButton.visible = false
		$ExportButton.visible = false
		$DeleteButton.visible = true
	else:
		$DeleteButton.visible = false
		if(showLoadButton):
			$LoadButton.visible = true
			$ExportButton.visible = true
		else:
			$LoadButton.visible = false
			$ExportButton.visible = false

func setDeleteMode(m):
	isInDeleteMode = m
	updateButtons()

func setShowLoadButton(m):
	showLoadButton = m
	updateButtons()

func setPickMode():
	$LoadButton.text = "Pick this save"
	$LoadButton.visible = true
	$ExportButton.visible = false
	$DeleteButton.visible = false

func _on_ExportButton_pressed():
	emit_signal("onExportButtonPressed", saveFile)
