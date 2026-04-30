extends RecruitSceneBase

func _init():
	sceneID = "PlaceholderRecruitScene"

func _run():
	if(state == ""):
		addCharacter(RC.charID)
		playAnimation(StageScene.Duo, "stand", {npc=RC.charID})
		
		saynn("This is a placeholder recruit scene. Continue will end the scene.")
		
		sayn("Chararacter id: "+str(RC.charID))
		sayn("Choices: "+str(RC.choiceIDs))
		sayn("Extras: "+str(RC.extras))
		sayn("Success: "+str(RC.success))
		sayn("Perfect: "+str(RC.perfect))
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	setState(_action)
