extends WindowDialog

var actionID
var args
onready var argListContainer = $VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer

var numberArgScene = preload("res://UI/DebugUI/DebugActionArgs/DebugActionArgumentNumber.tscn")
var stringArgScene = preload("res://UI/DebugUI/DebugActionArgs/DebugActionArgumentString.tscn")
var listArgScene = preload("res://UI/DebugUI/DebugActionArgs/DebugActionArgumentList.tscn")
var boolArgScene = preload("res://UI/DebugUI/DebugActionArgs/DebugActionArgumentBool.tscn")
var smartListArgScene = preload("res://UI/DebugUI/DebugActionArgs/DebugActionArgumentSmartList.tscn")

var isMain = false
signal onDoActionButton(actionID, isMain, result)

var storedArgScenes = []

func updateArgs():
	Util.delete_children(argListContainer)
	storedArgScenes.clear()
	
	if(args == null):
		return
	
	for arg in args:
		var newControl = null
		
		if(arg["type"] in ["number", "int"]):
			newControl = numberArgScene.instance()
		if(arg["type"] in ["string", "text"]):
			newControl = stringArgScene.instance()
		if(arg["type"] in ["list"]):
			newControl = listArgScene.instance()
		if(arg["type"] in ["bool", "checkbox"]):
			newControl = boolArgScene.instance()
		if(arg["type"] in ["smartlist"]):
			newControl = smartListArgScene.instance()
		
		if(newControl != null):
			argListContainer.add_child(newControl)
			newControl.id = arg["id"]
			newControl.setArgs(arg)
			storedArgScenes.append(newControl)

func setData(newaction, newargs, newisMain, actionName = "Some action"):
	actionID = newaction
	args = newargs
	isMain = newisMain
	$VBoxContainer/ScrollContainer/VBoxContainer/Label.text = actionName
	updateArgs()


func _on_DoActionButton_pressed():
	var result = {}
	for storedArgScene in storedArgScenes:
		result[storedArgScene.id] = storedArgScene.getResult()
	
	emit_signal("onDoActionButton", actionID, isMain, result)
	visible = false
