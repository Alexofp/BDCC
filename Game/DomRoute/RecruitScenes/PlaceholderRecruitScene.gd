extends RecruitSceneBase

var textWidgetScene = preload("res://UI/TextOutputWidget.tscn")

func _init():
	sceneID = "PlaceholderRecruitScene"

func _run():
	if(state == ""):
		addCharacter(RC.charID)
		playAnimation(StageScene.Duo, "stand", {npc=RC.charID})
		
		saynn("This is a placeholder recruit scene. Continue will end the scene.")
		
		var textEdit = textWidgetScene.instance()
		GM.ui.addCustomControl("textedit", textEdit)
		
		var outputText:Array = []
		outputText.append("Chararacter id: "+str(RC.charID))
		outputText.append("Choices: "+str(RC.choiceIDs))
		outputText.append("Extras: "+str(RC.extras))
		outputText.append("Success: "+str(RC.success))
		outputText.append("Perfect: "+str(RC.perfect))
		
		textEdit.setText("\t"+Util.join(outputText, "\n\t"))
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	setState(_action)
