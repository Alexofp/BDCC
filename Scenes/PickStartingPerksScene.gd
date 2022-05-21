extends "res://Scenes/SceneBase.gd"

var pickedPerksIds = []

func _init():
	sceneID = "PickStartingPerksScene"

func _run():
	if(state == ""):
		saynn("Pick the perks you wanna start with. Be careful, you can only pick starting perks once. You can pick more than one or none at all.")
		
		sayn("Picked perks:")
		for perkID in pickedPerksIds:
			var perk: PerkBase = GlobalRegistry.getPerk(perkID)
			sayn("[b]"+perk.getVisibleName()+"[/b]: "+perk.getVisibleDescription())
		if(pickedPerksIds.size() == 0):
			sayn("[b]- None picked[/b]")
		
		for perkID in GlobalRegistry.getPerksIDsBySkill(Skill.Start):
			var perk: PerkBase = GlobalRegistry.getPerk(perkID)
			
			if(perkID in pickedPerksIds):
				addDisabledButton(perk.getVisibleName(), "[Already picked it] "+perk.getVisibleDescription())
			else:
				addButton(perk.getVisibleName(), perk.getVisibleDescription(), "pickperk", [perkID])
				
		addButton("Clear all", "Remove all picked perks", "clearall")
		addButton("Confirm", "You wanna select these perks", "endthescene")
				
func _react(_action: String, _args):
	if(_action == "clearall"):
		pickedPerksIds.clear()
		setState("")
		return
	
	if(_action == "pickperk"):
		pickedPerksIds.append(_args[0])
		setState("")
		return
	
	if(_action == "endthescene"):
		for perkID in pickedPerksIds:
			var perk: PerkBase = GlobalRegistry.getPerk(perkID)
			if(perk == null):
				continue
			GM.pc.getSkillsHolder().addPerk(perkID)
		
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["pickedPerksIds"] = pickedPerksIds
	
	return data
	
func loadData(data):
	.loadData(data)
	
	pickedPerksIds = SAVE.loadVar(data, "pickedPerksIds", [])
