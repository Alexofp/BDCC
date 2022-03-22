extends "res://Scenes/SceneBase.gd"
var inspectedRestraintID = ""
var actionText = ""
var struggleText = ""

func _init():
	sceneID = "StrugglingScene"

func _initScene(_args = []):
	var allItems = GM.pc.getInventory().getAllEquippedItems()
	for itemSlot in allItems:
		var item: ItemBase = allItems[itemSlot]
		if(item.isRestraint()):
			item.getRestraintData().resetOnNewTry()

func _run():
	if(state == ""):
		var isBlind = GM.pc.isBlindfolded()
		saynn("Pick the restraint you wanna focus on. Keep in mind that some restraints will be harder to remove depending on what you have on. Crying from pain or moaning loudly from an orgasm will probably attract someone")
		
		#addButtonAt(13, "Inspect", "Inspect one of the restraints", "inspect")
		addButtonAt(14, "Give up", "Not worth it", "endthescene")
		
		for item in GM.pc.getInventory().getEquppedRestraints():
			var restraintData: RestraintData = item.getRestraintData()
			
			sayn(item.getVisibleName()+", restraint level: "+restraintData.getVisibleLevel(isBlind))
			#sayn("- Durability: "+restraintData.getVisibleDurability())
			saynn("- Tightness: "+restraintData.getVisibleTightness()+" ("+restraintData.getTightnessPercentString()+")")
			
			if(!restraintData.canStruggle()):
				continue
			
			if(GM.pc.getStamina() > 0):
				addButton(item.getVisibleName(), "Focus on this restraint", "struggleAgainst", [item.getUniqueID()])
			else:
				addDisabledButton(item.getVisibleName(), "You are out of stamina")

		
		#generateActions()
		
#	if(state == "inspect"):
#		saynn("Which one do you wanna inspect")
#
#		for item in GM.pc.getInventory().getEquppedRestraints():
#			addButton(item.getVisibleName(), item.getVisisbleDescription(), "doinspect", [item.getUniqueID()])
#		addButton("Back", "You don't wanna inspect anything", "")
#

	if(state == "struggleAgainst"):
		saynn(struggleText)

		
		addButton("Continue", "Okay", "")
		



func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "struggleAgainst"):
		var item = GM.pc.getInventory().getItemByUniqueID(_args[0])
		var restraintData: RestraintData = item.getRestraintData()
		
		var struggleData = restraintData.doStruggle(GM.pc)
		if(struggleData.has("damage")):
			restraintData.takeDamage(struggleData["damage"])
		if(struggleData.has("lust") && struggleData["lust"] > 0):
			GM.pc.addLust(struggleData["lust"])
			addMessage("You recieved "+str(struggleData["lust"])+" lust")
		if(struggleData.has("pain") && struggleData["pain"] > 0):
			GM.pc.addPain(struggleData["pain"])
			addMessage("You recieved "+str(struggleData["pain"])+" pain")
		if(struggleData.has("stamina") && struggleData["stamina"] != 0):
			var addStamina = -struggleData["stamina"]
			GM.pc.addStamina(addStamina)
			if(addStamina >= 0):
				addMessage("You gained "+str(addStamina)+" stamina")
			else:
				addMessage("You used "+str(-addStamina)+" stamina")
		
		struggleText = struggleData["text"]
		
		if(restraintData.shouldBeRemoved()):
			struggleText += "\n[b]"+restraintData.getRemoveMessage()+"[/b]"
			GM.pc.getInventory().removeEquippedItem(item)
			GM.pc.getInventory().addItem(item)
		
		processStruggleTurn()
	setState(_action)

func processStruggleTurn():
	pass
