extends "res://Modules/DrugDenModule/DrugDen/DrugDenEncounterTemplateScene.gd"

func _init():
	sceneID = "DrugDenEncounterInstantLossScene"

func _initScene(_args = []):
	if(_args.size() == 0):
		npcID = generateJunkieNPCID()
	else:
		npcID = _args[0]
	addCharacter(npcID)
	#playAnimation(StageScene.Duo, "stand", {npc=npcID})
	setState("lost_encounter")

func _run():
	encounter_run()
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(encounter_react(_action, _args)):
		return
	
	setState(_action)
