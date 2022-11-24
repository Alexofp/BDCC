extends EventBase

func _init():
	id = "GuardCaughtOfflimitsEvent"

func registerTriggers(es):
	es.addTrigger(self, Trigger.CaughtOffLimits)

func react(_triggerID, _args):
	var guardAmount = GM.main.getDynamicCharactersPoolSize(CharacterPool.Guards)
	var chanceToMeetOld = sqrt(float(guardAmount)) * 25.0
	if(getFlag("PreferKnownEncounters")):
		chanceToMeetOld = 100
	
	var idToUse = ""
	
	if(RNG.chance(chanceToMeetOld)):
		var randomGuards = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Guards)
		
		if(randomGuards.size() > 0):
			idToUse = RNG.pick(randomGuards)
		else:
			var newCharacter = GuardGenerator.new().generate()
			GM.main.addDynamicCharacterToPool(newCharacter.id, CharacterPool.Guards)
			idToUse = newCharacter.id
	else:
		var newCharacter = GuardGenerator.new().generate()
		GM.main.addDynamicCharacterToPool(newCharacter.id, CharacterPool.Guards)
		idToUse = newCharacter.id
	
	if(idToUse == null || idToUse == ""):
		return false
		
	runScene("GuardCaughtOfflimitsScene", [idToUse])
	#runScene(RNG.pick([
	#	"MaleGuardCanineOffLimits",
	#	"FemaleGuardFelineOffLimits",
	#	]))
	return true

func getPriority():
	return 10
