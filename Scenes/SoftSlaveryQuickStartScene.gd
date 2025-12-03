extends SceneBase

var pickedNPC:String = ""
var pickedOwnerType:String = ""
var pickedTraits:Array = []

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
	
	if(state == "pickingTraits"):
		saynn("Pick the traits of your new owner.")
		sayn("Selected traits:")
		var exclusives:Dictionary = {}
		for traitID in pickedTraits:
			var theTraitObj:NpcOwnerTraitBase = GlobalRegistry.getNpcOwnerTrait(traitID)
			if(!theTraitObj):
				continue
			var theExclusive:String = theTraitObj.getTraitExclusiveType()
			if(!theExclusive.empty()):
				exclusives[theExclusive] = true
			sayn(" - "+theTraitObj.getVisibleName()+": "+theTraitObj.getVisibleDescription())
		
		addButton("CONFIRM", "Start the slavery", "startSlaveryTraits")
		for traitID in GlobalRegistry.getNpcOwnerTraits():
			var theTraitObj:NpcOwnerTraitBase = GlobalRegistry.getNpcOwnerTrait(traitID)
			if(!theTraitObj):
				continue
			var theExclusive:String = theTraitObj.getTraitExclusiveType()
			var canAddTrait:bool = true
			if(!theExclusive.empty() && exclusives.has(theExclusive)):
				canAddTrait = false
			var hasThisTrait:bool = pickedTraits.has(traitID)
			
			if(hasThisTrait):
				addButton("-"+theTraitObj.getVisibleName(), theTraitObj.getVisibleDescription(), "toggleTrait", [traitID])
			else:
				if(canAddTrait):
					addButton("+"+theTraitObj.getVisibleName(), theTraitObj.getVisibleDescription(), "toggleTrait", [traitID])
				else:
					addDisabledButton("+"+theTraitObj.getVisibleName(), "(Incompatible with other traits)\n"+theTraitObj.getVisibleDescription())
		
	setCharactersEasyList([pickedNPC] if !pickedNPC.empty() else [])
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "pickNPC"):
		pickedNPC = _args[0]
		setState("ownerTypeMenu")
		return
	if(_action == "toggleTrait"):
		if(pickedTraits.has(_args[0])):
			pickedTraits.erase(_args[0])
		else:
			pickedTraits.append(_args[0])
		return
	if(_action == "startSlaveryTraits"):
		endScene()
		GM.main.RS.startSpecialRelantionship("SoftSlavery", pickedNPC, [pickedOwnerType])
		var theSlavery = GM.main.RS.getSpecialRelationship(pickedNPC)
		if(theSlavery && theSlavery.id=="SoftSlavery" && theSlavery.npcOwner && theSlavery.npcOwner.has_method("addTrait")):
			var theNpcOwner:NpcOwnerBase = theSlavery.npcOwner
			for traitID in pickedTraits:
				theNpcOwner.addTrait(traitID)
		runScene("NpcOwnerEventRunnerScene", [pickedNPC, "Intro", ["ambush"]])
	if(_action == "startSlavery"):
		var theOwnerType:NpcOwnerBase = GlobalRegistry.getNpcOwnerTypeRef(_args[0])
		if(!theOwnerType.debugCanPickTraits()):
			endScene()
			GM.main.RS.startSpecialRelantionship("SoftSlavery", pickedNPC, [_args[0]])
			runScene("NpcOwnerEventRunnerScene", [pickedNPC, "Intro", ["ambush"]])
		else:
			pickedOwnerType = _args[0]
			setState("pickingTraits")
		return

		
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["pickedNPC"] = pickedNPC
	data["pickedOwnerType"] = pickedOwnerType

	return data
	
func loadData(data):
	.loadData(data)
	
	pickedNPC = SAVE.loadVar(data, "pickedNPC", "")
	pickedOwnerType = SAVE.loadVar(data, "pickedOwnerType", "")
	pickedTraits = SAVE.loadVar(data, "pickedTraits", [])
