extends SceneBase

var pickedNPC:String = ""

func _init():
	sceneID = "SoftSlaveryQuickStartScene"

func _run():
	if(state == ""):
		pickedNPC = ""
		playAnimation(StageScene.TFLook, "start")
		saynn("Who do you want to be enslaved by?")
		
		for npcID in GM.main.getDynamicCharacters():
			var theNPC:DynamicCharacter = getCharacter(npcID)
			if(!theNPC || !theNPC.isDynamicCharacter()):
				continue
			addButton(theNPC.getName(), theNPC.getSmallDescriptionWithRelationship(), "pickNPC", [npcID])
		
		addButton("CANCEL", "You changed your mind..", "endthescene")
	
	if(state == "ownerTypeMenu"):
		playAnimation(StageScene.Solo, "stand", {pc=pickedNPC})
		
		saynn("You have picked this character.")
		
		saynn("Now choose what kind of owner do you want them to be.")
		
		addButton("BACK", "You have changed your mind", "")
		for ownerTypeID in GlobalRegistry.getNpcOwnerTypes():
			var theOwnerType:NpcOwnerBase = GlobalRegistry.getNpcOwnerTypeRef(ownerTypeID)
			
			addButton(theOwnerType.getVisibleName(), "Choose this owner type", "startSlavery", [ownerTypeID])
		
	setCharactersEasyList([pickedNPC] if !pickedNPC.empty() else [])
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "pickNPC"):
		pickedNPC = _args[0]
		setState("ownerTypeMenu")
		return
	if(_action == "startSlavery"):
		endScene()
		GM.main.RS.startSpecialRelantionship("SoftSlavery", pickedNPC, [_args[0]])
		runScene("NpcOwnerEventRunnerScene", [pickedNPC, "Intro", ["ambush"]])
		return

		
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["pickedNPC"] = pickedNPC

	return data
	
func loadData(data):
	.loadData(data)
	
	pickedNPC = SAVE.loadVar(data, "pickedNPC", "")
