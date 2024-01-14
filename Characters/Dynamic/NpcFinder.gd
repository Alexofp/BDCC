extends Object
class_name NpcFinder

static func npcSatisfiesCondition(character:BaseCharacter, conInfo):
	var conditionID = conInfo[0]
	
	if(conditionID == NpcCon.Level):
		if(character.getLevel() != conInfo[1]):
			return false
	elif(conditionID == NpcCon.LevelAbove):
		if(character.getLevel() < conInfo[1]):
			return false
	elif(conditionID == NpcCon.LevelBelow):
		if(character.getLevel() > conInfo[1]):
			return false
	elif(conditionID == NpcCon.Gender):
		if(character.getGender() != conInfo[1]):
			return false
	elif(conditionID == NpcCon.NotGender):
		if(character.getGender() == conInfo[1]):
			return false
	elif(conditionID == NpcCon.FlagTrue):
		if(!character.getFlag(conInfo[1], false)):
			return false
	elif(conditionID == NpcCon.FlagFalse):
		if(character.getFlag(conInfo[1], false)):
			return false
	elif(conditionID == NpcCon.FlagAbove):
		if(character.getFlag(conInfo[1], 0) < conInfo[2]):
			return false
	elif(conditionID == NpcCon.FlagBelow):
		if(character.getFlag(conInfo[1], 0) > conInfo[2]):
			return false
	elif(conditionID == NpcCon.FlagEquals):
		if(character.getFlag(conInfo[1]) != conInfo[2]):
			return false
	elif(conditionID == NpcCon.NoChastity):
		if(character.isWearingChastityCage()):
			return false
	elif(conditionID == NpcCon.HasPenis):
		if(!character.hasPenis()):
			return false
	elif(conditionID == NpcCon.CharacterType):
		if(character.getCharacterType() != conInfo[1]):
			return false
	elif(conditionID == NpcCon.AvoidIDs):
		if(conInfo[1] is Array):
			if(character.getID() in conInfo[1]):
				return false
		else:
			if(character.getID() == conInfo[1]):
				return false
	elif(conditionID == NpcCon.Species):
		if(!(conInfo[1] in character.getSpecies())):
			return false
	elif(conditionID == NpcCon.HasVagina):
		if(!character.hasVagina()):
			return false
	elif(conditionID == NpcCon.HasReachableVagina):
		if(!character.hasReachableVagina()):
			return false
	elif(conditionID == NpcCon.HasReachablePenis):
		if(!character.hasReachablePenis()):
			return false
	elif(conditionID == NpcCon.HasReachableAnus):
		if(!character.hasReachableAnus()):
			return false
	return true

static func grabNpcIDFromPool(poolID, _conditions = []):
	if(!(_conditions is Array) || _conditions == null):
		_conditions = []
	
	var characters = GM.main.getDynamicCharacterIDsFromPool(poolID)
	
	if(characters.size() > 0):
		if(_conditions.size() == 0):
			return RNG.pick(characters)
		
		characters.shuffle()
		for characterID in characters:
			var character:BaseCharacter = GlobalRegistry.getCharacter(characterID)
			if(character == null || !character.isDynamicCharacter()):
				continue
			
			var goodNpc = true
			for conInfo in _conditions:
				if(!npcSatisfiesCondition(character, conInfo)):
					goodNpc = false
					break
			
			if(goodNpc):
				return characterID
	
	return null

static func generateNpcForPool(poolID, generator, _args = {}):
	var newCharacter = generator.generate(_args)
	GM.main.addDynamicCharacterToPool(newCharacter.id, poolID)
	return newCharacter.id

static func grabNpcIDFromPoolOrGenerate(poolID, _conditions, generator, _args = {}, preferOld = false):
	var poolSize = GM.main.getDynamicCharactersPoolSize(poolID)
	var chanceToMeetOld = sqrt(float(poolSize)) * 10.0
	if(GM.main.getEncounterSettings().doesPreferKnownEncounters() || preferOld):
		chanceToMeetOld = 100
	
	if(RNG.chance(chanceToMeetOld)):
		var characterID = grabNpcIDFromPool(poolID, _conditions)
		if(characterID == null):
			return generateNpcForPool(poolID, generator, _args)
		return characterID
	else:
		return generateNpcForPool(poolID, generator, _args)
