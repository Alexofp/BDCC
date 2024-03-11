extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _reactInit():
	GM.pc.addEffect(StatusEffect.Yoga)

func _init():
	sceneID = "ActionSlaverySubMassageToPC"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Massage, "back", {pc=npcID, npc="pc"})
		
		saynn("Your submissive gives you a great back massage.")
		
		addButton("Continue", "See what happens next", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
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
