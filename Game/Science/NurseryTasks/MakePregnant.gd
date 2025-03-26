extends NurseryTaskBase

var charID:String = ""

func _init():
	id = "MakePregnant"

func getName() -> String:
	return "Get "+getCharName(charID)+" pregnant"

func getDescription() -> String:
	return getCharDescription(charID)

func getCompletionString() -> String:
	return ""

func setTaskData(_data:Dictionary):
	charID = _data["charID"]

func generatePossibleTasks() -> Array:
	var result:Array = []
	
	var tries:int = 10
	while(tries > 0 && result.size() < 1):
		tries -= 1
		
		# Inmates are 3x more likely to be picked
		var poolID:String = RNG.pick([CharacterPool.Inmates, CharacterPool.Inmates, CharacterPool.Inmates, CharacterPool.Guards, CharacterPool.Nurses, CharacterPool.Engineers])
		
		var poolChars = GM.main.getDynamicCharacterIDsFromPool(poolID)
		if(poolChars.empty()):
			continue
			
		var randomDynamicCharID:String = RNG.pick(poolChars)
		
		var character:BaseCharacter = GlobalRegistry.getCharacter(randomDynamicCharID)
		if(character == null || character.isPregnant() || !character.hasAnyWomb()):
			continue
		if(tries > 5 && !character.isInHeat()):
			continue
		
		result.append({
			difficulty = DIFFICULTY_HARD if !GM.pc.hasReachablePenis() || RNG.chance(30) else DIFFICULTY_MEDIUM,
			charID = randomDynamicCharID,
			days = RNG.randi_range(5, 7),
		})
		
	return result

func isCompleted() -> bool:
	var character:BaseCharacter = GlobalRegistry.getCharacter(charID)
	if(character != null && character.isPregnant()):
		return true
	return false

func shouldBeCancelled() -> bool:
	var character:BaseCharacter = GlobalRegistry.getCharacter(charID)
	if(character == null):
		return true
	return false

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["charID"] = charID
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	charID = SAVE.loadVar(_data, "charID", "")
