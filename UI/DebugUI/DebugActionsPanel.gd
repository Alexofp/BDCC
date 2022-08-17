extends Control

var debugActionScene = preload("res://UI/DebugUI/DebugActionButton.tscn")
onready var debugActionArgsWindow = $DebugActionArgumentsWindow

func updateActions():
	Util.delete_children($VBoxContainer/VBoxContainer)
	Util.delete_children($VBoxContainer/VBoxContainer2)
	
	if(GM.main == null):
		return
	var currentScene : SceneBase = GM.main.getCurrentScene()
	if(currentScene == null):
		return
	
	#print(currentScene.sceneID)
	var actions = currentScene.getDebugActions()
	if(actions == null || !(actions is Array)):
		return
	
	for action in actions:
		var debugActionObject = debugActionScene.instance()
		
		var _ok = debugActionObject.connect("onActionPressed", self, "onDebugAction")
		$VBoxContainer/VBoxContainer.add_child(debugActionObject)
		debugActionObject.id = action["id"]
		debugActionObject.setText(action["name"])
		debugActionObject.actionName = action["name"]
		if(action.has("args")):
			debugActionObject.args = action["args"]
		debugActionObject.isMain = false
		
	for action in GM.main.getDebugActions():
		var debugActionObject = debugActionScene.instance()
		
		var _ok = debugActionObject.connect("onActionPressed", self, "onDebugAction")
		$VBoxContainer/VBoxContainer2.add_child(debugActionObject)
		debugActionObject.id = action["id"]
		debugActionObject.setText(action["name"])
		debugActionObject.actionName = action["name"]
		if(action.has("args")):
			debugActionObject.args = action["args"]
		debugActionObject.isMain = true
		
func onDebugAction(debugAction):
	#print(debugAction.id)
	
	if(GM.main == null):
		return

	if(debugAction.args == null || debugAction.args.size() == 0):
		_on_DebugActionArgumentsWindow_onDoActionButton(debugAction.id, debugAction.isMain, {})
		#currentScene.doDebugAction(debugAction.id, debugAction.args)
		#GM.main.reRun()
	else:
		debugActionArgsWindow.setData(debugAction.id, debugAction.args, debugAction.isMain, debugAction.actionName)
		debugActionArgsWindow.popup_centered()


func _on_DebugActionsPanel_visibility_changed():
	if(visible):
		updateActions()

func _on_DebugActionArgumentsWindow_onDoActionButton(actionID, isMain, result):
	#print(actionID, " ", result)
	if(isMain):
		if(GM.main == null):
			return
		GM.main.doDebugAction(actionID, result)
		GM.main.reRun()
	else:
		if(GM.main == null):
			return
		var currentScene : SceneBase = GM.main.getCurrentScene()
		if(currentScene == null):
			return
		currentScene.doDebugAction(actionID, result)
		GM.main.reRun()
