extends Control

var debugActionScene = preload("res://UI/DebugUI/DebugActionButton.tscn")

func updateActions():
	Util.delete_children($VBoxContainer/VBoxContainer)
	
	if(GM.main == null):
		return
	var currentScene : SceneBase = GM.main.getCurrentScene()
	if(currentScene == null):
		return
	
	print(currentScene.sceneID)
	var actions = currentScene.getDebugActions()
	if(actions == null || !(actions is Array)):
		return
	
	for action in actions:
		var debugActionObject = debugActionScene.instance()
		
		var _ok = debugActionObject.connect("onActionPressed", self, "onDebugAction")
		$VBoxContainer/VBoxContainer.add_child(debugActionObject)
		debugActionObject.id = action["id"]
		debugActionObject.setText(action["name"])
		if(action.has("args")):
			debugActionObject.args = action["args"]
		
func onDebugAction(debugAction):
	print(debugAction.id)
	
	if(GM.main == null):
		return
	var currentScene : SceneBase = GM.main.getCurrentScene()
	if(currentScene == null):
		return

	currentScene.doDebugAction(debugAction.id, debugAction.args)
	GM.main.reRun()

func _on_DebugActionsPanel_visibility_changed():
	if(visible):
		updateActions()
