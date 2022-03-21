extends "res://Scenes/SceneBase.gd"
var inspectedRestraintID = ""
var noiseLevel = 0
var actionText = ""

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
		saynn("Noise level: "+str(noiseLevel))
		
		for item in GM.pc.getInventory().getEquppedRestraints():
			var restraintData: RestraintData = item.getRestraintData()
			
			sayn(item.getVisibleName()+", restraint level: "+restraintData.getVisibleLevel())
			sayn("- Durability: "+restraintData.getVisibleDurability())
			sayn("- Tightness: "+restraintData.getVisibleTightness())
				
		addButtonAt(13, "Inspect", "Inspect one of the restraints", "inspect")
		addButtonAt(14, "Give up", "Not worth it", "endthescene")
		
		generateActions()
		
	if(state == "inspect"):
		saynn("Which one do you wanna inspect")
		
		for item in GM.pc.getInventory().getEquppedRestraints():
			addButton(item.getVisibleName(), item.getVisisbleDescription(), "doinspect", [item.getUniqueID()])
		addButton("Back", "You don't wanna inspect anything", "")
		
	if(state == "inspectBlind"):
		saynn("You try to take a closer look at the restraint but not being able to see makes it impossible to gather any information")
		
		addButton("Continue", "Oh no. I bet I can inspect the blindfold itself though", "")

	if(state == "inspectGood"):
		var item = GM.pc.getInventory().getItemByUniqueID(inspectedRestraintID)
		var restraintData: RestraintData = item.getRestraintData()
		
		saynn("You managed to inspect the "+item.getVisibleName())
		saynn("It's level is "+str(restraintData.getLevel()))
		saynn("It's made out of "+restraintData.getMaterialName()+" material")
		
		addButton("Continue", "Nice", "")
	if(state == "doaction"):
		saynn(actionText)
		
		addButton("Continue", "Nice", "")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "doinspect"):
		inspectedRestraintID = _args[0]
		var item = GM.pc.getInventory().getItemByUniqueID(inspectedRestraintID)
		var restraintData: RestraintData = item.getRestraintData()
		
		if(GM.pc.isBlindfolded() && !restraintData.canInspectWhileBlindfolded()):
			setState("inspectBlind")
		else:
			restraintData.inspect()
			setState("inspectGood")
		processStruggleTurn()
		return
	if(_action == "doaction"):
		var action: RestraintActionBase = _args[0]
		var item = _args[1]
		
		var result = action.doAction(item)
		actionText = result["text"]
		if(result.has("noise")):
			noiseLevel += result["noise"]
	
	setState(_action)

func processStruggleTurn():
	pass

func generateActions():
	
	var allActions = []
	for item in GM.pc.getInventory().getEquppedRestraints():
		var restraintData: RestraintData = item.getRestraintData()
		
		var actions = restraintData.getPossibleActions()
		for action in actions:
			allActions.append([item, action])
		
	allActions.shuffle()
	var maxItems = 3
	var i = 0
	for actionData in allActions:
		var item = actionData[0]
		var action: RestraintActionBase = GlobalRegistry.createRestraintAction(actionData[1])
		
		addButton(action.getVisibleName(item), action.getVisibleDescription(item), "doaction", [action, item])
		i += 1
		if(i >= maxItems):
			break
