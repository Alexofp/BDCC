extends "res://Scenes/SceneBase.gd"

var npcID = ""

func _init():
	sceneID = "KidnapDynamicNpcScene"

func _initScene(_args = []):
	npcID = _args[0]
	#var npc = GlobalRegistry.getCharacter(npcID)
	
	
func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})

		var npc = GlobalRegistry.getCharacter(npcID)
		saynn("Are you sure you want to kidnap this npc?")
		
		# Check that they have a collar just in case?
		if(npc.getInventory().hasEquippedItemWithTag(ItemTag.AllowsEnslaving)):
			if(getModule("NpcSlaveryModule").hasFreeSpaceToEnslave()):
				addButton("Do it", "Go through with it", "do_kidnap")
			else:
				addDisabledButton("Do it", "You don't have enough space in your cell to store them")
		else:
			addDisabledButton("Do it", "They aren't wearing a collar!")
		addButton("CANCEL", "You changed your mind", "endthescene")
		
	if(state == "do_kidnap"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcAction="hurt", npcBodyState={leashedBy="pc"}})
		
		saynn("You forcibly leash them!")
		
		addButton("Bring to cell", "Store your slave", "bring_cell")
	
	if(state == "bring_cell"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		
		saynn("You bring them to your cell and chain them to the floor.")
		
		addButton("Continue", "Great job", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "do_kidnap"):
		getModule("NpcSlaveryModule").doEnslaveCharacter(npcID)


	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
