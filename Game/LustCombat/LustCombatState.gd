extends Reference
class_name LustCombatState

var character: WeakRef
var inBattle = false
var enemyID = ""

var currentActivities = []

var currentVisibility = 0.0
var currentDanger = 0.0

func processLewdTurn(didSomethingLewd = false):
	if(inBattle):
		return
	var pc = getCharacter()
	if(pc == null):
		return
	
	var population = pc.getLocationPopulation()
	var popSize = population.size()
	
	var exposure = pc.getExposure()
	var ambientVisibility = -RNG.randf_range(0.01, 0.02) # 0.0
	if(didSomethingLewd):
		ambientVisibility = 0.0
	#if(exposure <= 0.0):
	#	ambientVisibility = -0.05
	
	if(popSize > 0):
		ambientVisibility += exposure / 10.0 + currentActivities.size() / 50.0
	else:
		ambientVisibility += exposure / 50.0
		
	currentVisibility += ambientVisibility
	currentVisibility = clamp(currentVisibility, 0.0, 1.0)
	processDanger(didSomethingLewd)
	
func processDanger(didSomethingLewd = false):
	if(currentVisibility >= 1.0 && didSomethingLewd):
		currentDanger += RNG.randf_range(0.15, 0.25)
	else:
		currentDanger -= RNG.randf_range(0.11, 0.4)
	currentDanger = clamp(currentDanger, 0.0, 1.0)

func getVisibility():
	return currentVisibility

func getDanger():
	return currentDanger

func resetDanger():
	currentDanger = 0.0
	currentVisibility = 0.0

func processTime(seconds):
	if(currentVisibility > 0.0):
		currentVisibility -= seconds / 3600.0
		if(currentVisibility < 0.0):
			currentVisibility = 0.0

func getCharacter():
	if(character == null):
		return character
	return character.get_ref()

func setCharacter(newchar):
	character = weakref(newchar)

func setEnemyID(newenemyID):
	enemyID = newenemyID

func getEnemyCharacter():
	if(enemyID == null || enemyID == ""):
		return null
	return GlobalRegistry.getCharacter(enemyID)

static func myactionsorter(a, b):
	if a["priority"] > b["priority"]:
		return true
	return false

func getActionsSorted():
	var actions:Array = getActions()
	
	actions.sort_custom(self, "myactionsorter")
	
	return actions

func getOrgasmActionsSorted():
	var actions:Array = getOrgasmActions()
	
	actions.sort_custom(self, "myactionsorter")
	
	return actions

func getOrgasmActions():
	var result = []
	for actionID in GlobalRegistry.getOrgasmLustActions():
		var action = GlobalRegistry.getLustAction(actionID)
		if(action == null):
			continue
		
		result.append({id=actionID, priority=action.getPriority()})
	return result

func getActions():
	var result = []
	
#	result.append({id="GropeChest"})
#	result.append({id="GropeButt"})
#	result.append({id="RubNipples"})
#	result.append({id="StopAll"})
	for actionID in GlobalRegistry.getDefaultLustActions():
		var action = GlobalRegistry.getLustAction(actionID)
		if(action == null):
			continue
		
		result.append({id=actionID, priority=action.getPriority()})
	
	if(getCharacter() != null):
		var pc = getCharacter()
		var items = pc.getInventory().getAllEquippedItems()
		for itemSlot in items:
			var item:ItemBase = items[itemSlot]
			var newActions = item.getLustActions()
			if(newActions != null):
				for newAction in newActions:
					var action = GlobalRegistry.getLustAction(newAction)
					if(action == null):
						continue
					
					result.append({
						"id": newAction,
						"item": item.getUniqueID(),
						"itemName": item.getVisibleName(),
						"itemState": item.getItemState(),
						"priority": action.getPriority(),
					})
	
	return result
	
func isInBattle():
	return inBattle

func enteredBattle():
	inBattle = true

func exitedBattle():
	inBattle = false
	enemyID = ""
	
	resetState()

func isInPublic():
	if(getCharacter() == null || isInBattle()):
		return true
	var pc = getCharacter()
	if(!pc.has_method("isInSecludedLocation")):
		return true
	return !pc.isInSecludedLocation()

func resetState():
	currentDanger = 0.0
	stopActivities()
	if(getCharacter() != null):
		var pc = getCharacter()
		var items = pc.getInventory().getAllEquippedItems()
		for itemSlot in items:
			var item:ItemBase = items[itemSlot]
			item.resetLustState()
		pc.updateAppearance()

func isInventorySlotBlocked(invslot):
	if(getCharacter() != null):
		var pc = getCharacter()
		return pc.isInventorySlotBlocked(invslot)
	return false

func startActivity(newActivity):
	if(!currentActivities.has(newActivity)):
		currentActivities.append(newActivity)

func replaceActivity(oldActivity, newActivity):
	if(currentActivities.has(oldActivity)):
		currentActivities.erase(oldActivity)
		
		currentActivities.append(newActivity)

func canStartNewActivity(newActivity):
	if(currentActivities.has(newActivity)):
		return false
	if(currentActivities.size() >= 2):
		return false
		
	return true

func canDoAction():
	return canStartNewActivity("")

func isDoingActivity(newActivity):
	if(currentActivities.has(newActivity)):
		return true
	return false

func canStopActivities():
	if(currentActivities.size() > 0):
		return true
	return false

func stopActivities():
	currentActivities.clear()

func getActivitiesAsText():
	var result = []
	
	# Hardcodding pc here is probably bad but there is high chance this code will never be used for npcs
	for activity in currentActivities:
		if(activity == LustActivity.GropingButt):
			result.append("{pc.name}'s hand is groping {pc.his} butt")
		if(activity == LustActivity.GropingChest):
			result.append("{pc.name}'s hand is groping {pc.his} tits")
		if(activity == LustActivity.SpreadingPussy):
			result.append("{pc.name}'s hand is rubbing {pc.his} pussy")
		if(activity == LustActivity.StrokingCock):
			result.append("{pc.name}'s hand is stroking {pc.his} cock")
		if(activity == LustActivity.ProddingAnal):
			result.append("{pc.name}'s fingers are prodding {pc.his} anal ring")
			
	return result

func getItemStatesAsText():
	var result = []
	if(getCharacter() != null):
		var pc = getCharacter()
		var items = pc.getInventory().getAllEquippedItems()
		for itemSlot in items:
			var item:ItemBase = items[itemSlot]
			var itemState = item.getItemState()
			if(itemState != null):
				var newText = itemState.getStateText()
				if(newText != null && newText != ""):
					result.append(newText)
	
	return result

func getAllText():
	var result = []
	result.append_array(getActivitiesAsText())
	result.append_array(getItemStatesAsText())
	return result

func doAction(actionData):
	var lustAction = GlobalRegistry.getLustAction(actionData["id"])
	
	var result = lustAction.doAction(self, actionData)
	result["lustInterests"] = lustAction.getLustTopics()
	if(lustAction.isTease()):
		result["isTease"] = true
		
	var experienceData = lustAction.getExperience(self, actionData)
	var pc = getCharacter()
	if(experienceData != null && pc != null):
		for expAdd in experienceData:
			pc.addSkillExperience(expAdd[0], expAdd[1])
	
	if(!isInBattle() && isInPublic()):

		currentVisibility += lustAction.getVisibility() * (1.0+pc.getExposure()/2.0)
		currentVisibility = clamp(currentVisibility, 0.0, 1.0)
		processLewdTurn(true)
	
	return result

func saveData():
	return {
		"inBattle": inBattle,
		"enemyID": enemyID,
		"currentActivities": currentActivities,
		"currentVisibility": currentVisibility,
		"currentDanger": currentDanger,
	}

func loadData(data):
	inBattle = SAVE.loadVar(data, "inBattle", false)
	enemyID = SAVE.loadVar(data, "enemyID", "")
	currentActivities = SAVE.loadVar(data, "currentActivities", [])
	currentVisibility = SAVE.loadVar(data, "currentVisibility", 0.0)
	currentDanger = SAVE.loadVar(data, "currentDanger", 0.0)
