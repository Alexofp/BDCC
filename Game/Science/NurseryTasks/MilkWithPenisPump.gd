extends NurseryTaskBase

var charID:String = ""

func _init():
	id = "MilkWithPenisPump"

func getName() -> String:
	return "Milk "+getCharName(charID)+" with a penis pump"

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
		if(character == null || !character.hasReachablePenis()):
			continue
		
		result.append({
			difficulty = RNG.pick([DIFFICULTY_HARD, DIFFICULTY_MEDIUM]),
			charID = randomDynamicCharID,
			days = RNG.randi_range(1, 2),
		})
		
	return result

#func isCompleted() -> bool:
#	var character:BaseCharacter = GlobalRegistry.getCharacter(charID)
#	if(character != null && character.isLactating()):
#		return true
#	return false

func handleSexEvent(_event:SexEvent):
	if(_event.getType() == SexEvent.PenisPumpMilked):
		if(_event.getTargetCharID() == charID):
			var howMuch:float = _event.getField("loadSize", 0.0)
			if(howMuch > 0.0):
				completeSelf()

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
