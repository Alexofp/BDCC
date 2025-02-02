extends "res://Modules/DrugDenModule/DrugDen/DrugDenEncounterTemplateScene.gd"

func _init():
	sceneID = "DrugDenEncounterInstantFightScene"

func _reactInit():
	npcID = generateJunkieNPCID()
	addCharacter(npcID)
	startFightWithNPC()

func _run():
	encounter_run()
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(encounter_react(_action, _args)):
		return
	
	setState(_action)
