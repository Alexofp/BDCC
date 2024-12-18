extends Reference
class_name PawnTypeBase

var id:String = "error"

func getDistributionWeight() -> float:
	return 1.0

func getSpawnLocations(_character) -> Array:
	return ["main_punishment_spot"]

func getCharacterPool() -> String: # Could be any string
	return "" # CharacterPool.Inmates

func getCharacterGenerator():
	return null # InmateGenerator.new()

func shouldSpawnPawns() -> bool:
	return true

func generateCharacterID() -> String:
	if(GM.main.getEncounterSettings().doesPreferKnownEncounters()):
		return ""
	
	var generator = getCharacterGenerator()
	var pool = getCharacterPool()
	
	if(generator == null || pool == ""):
		return ""
	
	return NpcFinder.generateNpcForPool(pool, generator)

func characterIDCanBePicked(_theCharID:String) -> bool:
	if(GM.main.IS.wasCharIDUsedToday(_theCharID)):
		return false
	if(GM.main.IS.hasPawn(_theCharID)):
		return false
	if(GM.main.characterIsVisible(_theCharID)):
		return false
	var character = GlobalRegistry.getCharacter(_theCharID)
	if(character.shouldBeExcludedFromEncounters()):
		return false
	
	return true

func tryPickCharacterID() -> String:
	var pool = getCharacterPool()
	if(pool == ""):
		return ""
	
	var chanceMeetOld = NpcFinder.chanceToMeetOldNPC(pool)
	if(!RNG.chance(chanceMeetOld)):
		return ""
	
	var possibleCharIds:Array = GM.main.getDynamicCharacterIDsFromPool(pool)
	if(possibleCharIds.size() <= 0):
		""
	
	var tryCount:int = 10
	while(tryCount > 0):
		tryCount -= 1
		
		var randomCharID:String = RNG.pick(possibleCharIds)
		if(characterIDCanBePicked(randomCharID)):
			return randomCharID
			
	return ""




func onPawnSpawned(_pawn):
	pass

func onPawnDeleted(_pawn):
	pass

func customCheckAlonePawnInteraction(_pawn) -> bool:
	return false

func onPawnMeetWith(_pawn, _otherPawn, _otherPawnMoved:bool) -> bool:
	return GM.main.IS.checkOnMeetInteractions(_pawn, _otherPawn, _otherPawnMoved)

func shouldPawnInterruptOtherPawns(_pawn) -> bool:
	return true

func customProcessTimeForPawn(_pawn, _seconds:int) -> bool:
	return false

func getCustomPawnColor(_pawn):
	return null #Color.pink
