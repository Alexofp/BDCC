extends NurseryTaskBase

var charID:String = ""
var curAmount:float = 0.0

func _init():
	id = "MilkWithBreastPump"

func getName() -> String:
	return "Milk "+getCharName(charID)+" with a breast pump"

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
		if(character == null || !character.hasNonFlatBreasts()):
			continue
		if(tries > 5 && !character.isLactating()):
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
	if(_event.getType() == SexEvent.BreastsPumpMilked):
		if(_event.getTargetCharID() == charID):
			var howMuch:float = _event.getField("loadSize", 0.0)
			if(howMuch <= 10.0):
				howMuch = 10.0
			curAmount += howMuch
			if(curAmount >= 200.0):
				completeSelf()

func shouldBeCancelled() -> bool:
	var character:BaseCharacter = GlobalRegistry.getCharacter(charID)
	if(character == null):
		return true
	return false

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["charID"] = charID
	data["curAmount"] = curAmount
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	charID = SAVE.loadVar(_data, "charID", "")
	curAmount = SAVE.loadVar(_data, "curAmount", 0.0)
