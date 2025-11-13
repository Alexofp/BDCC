extends SceneBase

var ownerID:String = ""

func _initScene(_args = []):
	ownerID = _args[0]

func _reactInit():
	addCharacter(ownerID)

func _init():
	sceneID = "NpcOwnerSleepTogetherScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Sleeping, "sleep", {pc=ownerID, npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("{npc.name} orders you to sleep together with {npc.him}.")
		saynn("And so you obey, spending the night on the chest of your owner..")
		addButton("Continue", "See what happens next", "endthescene")

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return ownerID
	return null

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["ownerID"] = ownerID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	ownerID = SAVE.loadVar(data, "ownerID", "")
