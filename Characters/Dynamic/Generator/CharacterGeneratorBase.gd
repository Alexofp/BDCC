extends Reference
class_name CharacterGeneratorBase

func makeBase(idprefix = "npc", _args = {}):
	var dynamicCharacter = DynamicCharacter.new()
	dynamicCharacter.id = GM.main.generateCharacterID(idprefix)
	GM.main.addDynamicCharacter(dynamicCharacter)
	return dynamicCharacter

func pickGender(character:DynamicCharacter, _args = {}):
	var possibleGenders = [
		[Gender.Male, 1.0],
		[Gender.Female, 1.0],
		[Gender.Androgynous, 0.5],
	]
	
	character.npcGender = RNG.pickWeightedPairs(possibleGenders)

func pickName(character:DynamicCharacter, _args = {}):
	if(character.npcGender == Gender.Male):
		character.npcName = RNG.randomMaleName()
	else:
		character.npcName = RNG.randomFemaleName()

func pickEquipment(character:DynamicCharacter, _args = {}):
	character.npcDefaultEquipment = ["CasualClothes", "LaceBra", "LacePanties"]

func pickedSpeciesType(_args = {}):
	return "guard"

func pickSpecies(character:DynamicCharacter, _args = {}):
	var speciesType = pickedSpeciesType(_args)
	var allSpecies = GlobalRegistry.getAllSpecies()
	var possible = []
	for speciesID in allSpecies:
		var specie = allSpecies[speciesID]
		
		var weight = specie.npcGenerationWeight(speciesType)
		if(weight != null && weight > 0.0):
			possible.append([speciesID, weight])
	
	var randomSpecies = RNG.pickWeightedPairs(possible)
	if(randomSpecies == null):
		randomSpecies = Species.Canine
	
	character.npcSpecies = [randomSpecies]

func createBodyparts(character:DynamicCharacter, _args = {}):
	var theSpecies = character.npcSpecies
	for bodypartSlot in BodypartSlot.getAll():
		var possible = []
		var fullWeight = 0.0
		#if(!BodypartSlot.isEssential(bodypartSlot)):
		#	possible.append([null, 1.0])
		
		var allbodypartsIDs = GlobalRegistry.getBodypartsIdsBySlot(bodypartSlot)
		for bodypartID in allbodypartsIDs:
			var bodypart = GlobalRegistry.getBodypartRef(bodypartID)
			var supportedSpecies = bodypart.getCompatibleSpecies()
			
			var hasInSupported = false
			var hasInAllowed = false
			
			for supported in supportedSpecies:
				if(supported in theSpecies): # || supported == Species.Any
					hasInSupported = true
					break
				
			for playerSpecie in theSpecies:
				var speciesObject = GlobalRegistry.getSpecies(playerSpecie)
				if(bodypartID in speciesObject.getAllowedBodyparts()):
					hasInAllowed = true
					break
			
			if(hasInSupported || hasInAllowed || bodypartSlot == BodypartSlot.Hair):
				var weight = bodypart.npcGenerationWeight(character)
				if(weight != null && weight > 0.0):
					possible.append([bodypartID, weight])
					fullWeight += weight

		
		if(possible.size() > 0):
			if(!RNG.chance(fullWeight * 100.0)):
				continue
			
			var bodypartID = RNG.pickWeightedPairs(possible)
			if(bodypartID != null):
				var bodypart = GlobalRegistry.createBodypart(bodypartID)
				bodypart.generateDataFor(character)
				character.giveBodypartUnlessSame(bodypart)
		else:
			for specie in theSpecies:
				var speciesObject = GlobalRegistry.getSpecies(specie)
				var bodypartID = speciesObject.getDefaultForSlot(bodypartSlot, character.npcGender)
				if(bodypartID == null):
					continue
				var bodypart = GlobalRegistry.getBodypartRef(bodypartID)
				var weight = bodypart.npcGenerationWeight(character)
				if(weight != null && weight > 0.0):
					possible.append([bodypartID, weight])
				
			var bodypartID = RNG.pickWeightedPairs(possible)
			if(bodypartID != null):
				var bodypart = GlobalRegistry.createBodypart(bodypartID)
				bodypart.generateDataFor(character)
				character.giveBodypartUnlessSame(bodypart)

func pickBodyAttributes(character:DynamicCharacter, _args = {}):
	if(character.npcGender == Gender.Male):
		character.npcThickness = RNG.randi_range(0, 60)
		character.npcFeminity = RNG.randi_range(0, 50)
	if(character.npcGender == Gender.Female):
		character.npcThickness = RNG.randi_range(0, 110)
		character.npcFeminity = RNG.randi_range(25, 75)
	if(character.npcGender == Gender.Androgynous):
		character.npcThickness = RNG.randi_range(0, 100)
		character.npcFeminity = RNG.randi_range(50, 100)
	if(character.npcGender == Gender.Other):
		character.npcThickness = RNG.randi_range(0, 100)
		character.npcFeminity = RNG.randi_range(0, 100)

func pickArchetypes(character:DynamicCharacter, _args = {}):
	var possible = CharacterArchetype.getAll()
	
	var picked = []
	
	var amount = RNG.randi_range(2, 4)
	for _i in range(amount):
		picked.append(RNG.pick(possible))
	character.npcArchetypes = picked
	print(picked)

func pickFetishes(character:DynamicCharacter, _args = {}):
	var fetishHolder:FetishHolder = character.getFetishHolder()
	
	fetishHolder.clear()
	
	for fetishID in GlobalRegistry.getFetishes():
		if(RNG.chance(50)):
			fetishHolder.setFetish(fetishID, RNG.pick([FetishInterest.Dislikes, FetishInterest.SlightlyDislikes, FetishInterest.SlightlyLikes]))
		elif(RNG.chance(5)):
			fetishHolder.setFetish(fetishID, RNG.pick([FetishInterest.Hates, FetishInterest.Loves]))
		
	for archetype in character.npcArchetypes:
		var fetishes = CharacterArchetype.getFetishes(archetype)
		for fetishID in fetishes:
			var maxInterest = fetishes[fetishID]
			var maxInterestNumber = FetishInterest.interestToNumber(maxInterest)
			if(maxInterestNumber > 0):
				fetishHolder.addFetish(fetishID, FetishInterest.numberToInterest(RNG.randi_range(1, maxInterestNumber)))
			elif(maxInterestNumber < -1):
				fetishHolder.addFetish(fetishID, FetishInterest.numberToInterest(-RNG.randi_range(1, -maxInterestNumber)))
	
	fetishHolder.removeImpossibleFetishes()

func pickLustInterests(character:DynamicCharacter, _args = {}):
	for topicA in GlobalRegistry.getLustTopicObjects():
		var topic: TopicBase = topicA
		var handlesIDs = topic.handles_ids
		for id in handlesIDs:
			var pickedInterest = RNG.pick(Interest.getAll())
			
			if(pickedInterest != Interest.Neutral):
				character.getLustInterests().addInterest(id, pickedInterest)

func getAttacks():
	return ["stunbatonAttack", "trygetupattack"]

func getPossibleAttacks():
	return ["HeatGrenade", "DoubleCuffPC", "CuffPCHands", "ForceGagPC", "ForceMuzzlePC", "stunbatonOverchargeAttack", "simplekickattack", "biteattack", "shoveattack"]
	
func pickAttacks(character:DynamicCharacter, _args = {}):
	var baseAttacks = getAttacks()
	for possibleAttack in getPossibleAttacks():
		if(RNG.chance(50)):
			baseAttacks.append(possibleAttack)
	character.npcAttacks = baseAttacks

func pickPersonality(character:DynamicCharacter, _args = {}):
	var personality:Personality = character.getPersonality()
	
	personality.clear()
	for statID in PersonalityStat.getAll():
		personality.setStat(statID, RNG.randf_range(-0.3, 0.3))
		if(RNG.chance(5)):
			personality.setStat(statID, RNG.randf_range(-0.3, 0.3)*5.0)
	
	for archetype in character.npcArchetypes:
		var personalityChanges = CharacterArchetype.getPersonalityChanges(archetype)
		for personalityStat in personalityChanges:
			var howMuchMax = personalityChanges[personalityStat]
			
			if(howMuchMax > 0.0):
				personality.addStat(personalityStat, RNG.randf_range(0.0, howMuchMax))
			elif(howMuchMax < 0.0):
				personality.addStat(personalityStat, -RNG.randf_range(0.0, -howMuchMax))

func generate(_args = {}):
	var character = makeBase("npc", _args)
	pickGender(character, _args)
	pickBodyAttributes(character, _args)
	pickName(character, _args)
	pickSpecies(character, _args)
	createBodyparts(character, _args)
	pickArchetypes(character, _args)
	pickFetishes(character, _args)
	pickLustInterests(character, _args)
	pickAttacks(character, _args)
	pickPersonality(character, _args)
	pickEquipment(character, _args)
	
	character.resetEquipment()
	return character
