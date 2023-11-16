extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "ChangeHaircutScene"

func _run():
	if(state == ""):
		if(!GM.pc.isBlindfolded()):
			saynn("You look at yourself in the mirror. There is a comb, scissors and a few others things around that you can use to change how your hair looks.")
		else:
			saynn("You try to look at yourself in the mirror but then you realize that you can't see anything. Awkward. You feel around and fine a comb, scissors and a few others things around that you can use to change how your hair looks.")
		
		addButton("Leave", "You don't wanna change your hair", "endthescene")
		addButton("Change Haircut", "Change your haircut", "changehaircutmenu")
		addButton("Change Skin!", "Change your skin and colors", "changeskin")


	if(state == "changehaircutmenu"):
		saynn("Pick the haircut that you want")

	if(state == "changehair"):
		saynn("You humm as you work on your hair, using the instant hair grower and scissors to shape the way your hair looks")

	if(state == "changehaircutmenu" || state == "changehair"):
		addButton("Leave", "Job well done", "endthescene")
	
		for bodypartID in GlobalRegistry.getBodypartsIdsBySlot(BodypartSlot.Hair):
			var bodypart:Bodypart = GlobalRegistry.getBodypartRef(bodypartID)
			
			addButton(bodypart.getName(), "Change your hair to this one", "changehair", [bodypartID])


		

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "changeskin"):
		runScene("ChangeSkinScene")
		endScene()
		return
	
	if(_action == "changehair"):
		var bodypart = GlobalRegistry.createBodypart(_args[0])
		if(bodypart != null):
			GM.pc.giveBodypartUnlessSame(bodypart)
	
	setState(_action)
