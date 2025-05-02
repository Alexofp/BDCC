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

func shouldPersueGoalOverride(_pawn, _goalID:String) -> bool:
	#if(_goalID == InteractionGoal.Eat): # EVERYONE will get hungry
	#	return true
	return false

# Can be used to influence pawns to do certain things more often
func getProcessedGoalScore(_pawn, _goalID:String, theScore:float, _isKeepScore:bool) -> float:
	#if(_goalID == InteractionGoal.Hangout): # Pawns will hangout twice as much
	#	return theScore * 2.0
	#if(_goalID == InteractionGoal.Eat): # EVERYONE will get hungry
	#	return theScore * 5.0
	return theScore

# If this returns true, the pawn will do the _taskID global task even if it doesn't satisfy other conditions (not the right character type)
func canDoTaskOverride(_pawn, _taskID:String, _task) -> bool:
	#if(_taskID == "Prostitution"): # EVERYONE will do prostitution
	#	return true
	return false

# How likely that this pawn will do prostitution
func calculateSlutScore(_pawn) -> float:
	var result:float = 0.0
	if(_pawn.isPlayer()):
		return 1.0
	
	#if(!_pawn.isInmate()):
	#	return 0.0
	
	var subbyness:float = _pawn.scorePersonality({PersonalityStat.Subby:1.0})
	if(subbyness <= -0.25):
		return 0.0
	
	var sexFetish:float = _pawn.scoreFetishMax({Fetish.AnalSexReceiving:1.0, Fetish.VaginalSexReceiving:1.0, Fetish.Tribadism: 1.0})
	if(sexFetish > 0.0):
		result += sexFetish
	
	var oralFetish:float = _pawn.scoreFetishMax({Fetish.OralSexGiving:1.0, Fetish.RimmingGiving:1.0})
	if(oralFetish > 0.0):
		result += oralFetish * 0.5
	
	result *= (1.0 + max(subbyness, 0.0)/2.9)
	
	if(_pawn.isLilac()):
		result *= 1.5
	if(_pawn.isHighSecInmate()):
		result -= 0.25
		result *= 0.5
	
	result /= 2.0
	
	return clamp(result, 0.0, 1.0)
