extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "SlaveryWalkiesGrabScene"

func _run():
	if(state == ""):
		addCharacter(npcID)
		
		saynn("What are you planning to do with {npc.name}?")
		
		addButton("Wander around", "Leash your slave and wander around the station with them", "do_wander")
		addDisabledButton("Walkies", "Your slave doesn't have high enough pet skill")
		addDisabledButton("Pimping", "Your slave doesn't have high enough slut skill")
		addButton("Cancel", "Never mind", "endthescene")
		
	if(state == "do_wander"):
		GM.pc.setLocation("hall_mainentrance")
		aimCameraAndSetLocName("hall_mainentrance")
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		
		saynn("You leash your slave and bring {npc.him} out into the main hall.")
		
		addButton("Continue", "See what happens next", "start_wander")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "start_wander"):
		runScene("SlaveryWalkiesScene", [npcID])
		endScene()
		return
	
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
