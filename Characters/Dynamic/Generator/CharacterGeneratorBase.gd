extends Reference
class_name CharacterGeneratorBase

func makeBase(idprefix = "dynamicnpc", _args = {}):
	var dynamicCharacter = DynamicCharacter.new()
	if(is_instance_valid(GM.main)):
		dynamicCharacter.id = GM.main.generateCharacterID(idprefix)
	
	if(_args.has(NpcGen.Temporary) && _args[NpcGen.Temporary]):
		dynamicCharacter.temporaryCharacter = true
	
	if(is_instance_valid(GM.main)):
		GM.main.addDynamicCharacter(dynamicCharacter)
	elif(_args.has("addtonode") && _args["addtonode"]):
		_args["addtonode"].add_child(dynamicCharacter)
	return dynamicCharacter

func pickGender(character:DynamicCharacter, _args = {}):
	if(_args.has(NpcGen.HasVagina) && _args[NpcGen.HasVagina]):
		character.npcGeneratedGender = GM.main.getEncounterSettings().generateGenderFromAllowed(NpcGender.getAllWithVagina())
	elif(_args.has(NpcGen.HasPenis) && _args[NpcGen.HasPenis]):
		character.npcGeneratedGender = GM.main.getEncounterSettings().generateGenderFromAllowed(NpcGender.getAllWithPenis())
	elif(_args.has(NpcGen.GenderList)):
		character.npcGeneratedGender = GM.main.getEncounterSettings().generateGenderFromAllowed(_args[NpcGen.GenderList])
	elif(_args.has(NpcGen.Gender)):
		character.npcGeneratedGender = _args[NpcGen.Gender]
	else:
		character.npcGeneratedGender = GM.main.getEncounterSettings().generateGender()

func pickName(character:DynamicCharacter, _args = {}):
	if(_args.has(NpcGen.Name)):
		character.npcName = _args[NpcGen.Name]
	else:
		if(character.getGender() == Gender.Male):
			character.npcName = RNG.randomMaleName()
		else:
			character.npcName = RNG.randomFemaleName()

func pickEquipment(character:DynamicCharacter, _args = {}):
	if(_args.has("editor_noequip") && _args["editor_noequip"]):
		character.npcDefaultEquipment = []
	else:
		character.npcDefaultEquipment = ["CasualClothes", "LaceBra", "LacePanties"]

func pickNonStaticEquipment(_character:DynamicCharacter, _args = {}):
	pass

func pickedSpeciesType(_args = {}):
	return "guard"

func pickSpecies(character:DynamicCharacter, _args = {}):
	if(_args.has(NpcGen.Species)):
		character.npcSpecies = [_args[NpcGen.Species]]
		return
	
	var speciesType = pickedSpeciesType(_args)
	var allSpecies = GlobalRegistry.getAllSpecies()
	var possible = []
	for speciesID in allSpecies:
		var specie = allSpecies[speciesID]
		if(!specie.canBeUsedForNPCType(speciesType)):
			continue
		
		var weight = GM.main.getEncounterSettings().getSpeciesWeight(speciesID)
		if(weight != null && weight > 0.0):
			possible.append([speciesID, weight])
	
	var randomSpecies = RNG.pickWeightedPairs(possible)
	if(randomSpecies == null):
		randomSpecies = Species.Canine
	
	character.npcSpecies = [randomSpecies]

func pickSkinAndColors(character:DynamicCharacter, _args = {}):
	character.applyRandomSkinAndColors()

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
				if((supported in theSpecies) || supported == Species.AnyNPC): # || supported == Species.Any
					hasInSupported = true
					break
				
			for playerSpecie in theSpecies:
				var speciesObject = GlobalRegistry.getSpecies(playerSpecie)
				if(bodypartID in speciesObject.getAllowedBodyparts()):
					hasInAllowed = true
					break
			
			if(hasInSupported || hasInAllowed):
				var weight = bodypart.npcGenerationWeight(character)
				if(weight != null && weight > 0.0):
					possible.append([bodypartID, weight])
					fullWeight += weight

		# Adding the default bodypart of this species into the mix
		for specie in theSpecies:
			var speciesObject = GlobalRegistry.getSpecies(specie)
			var bodypartID = speciesObject.getDefaultForSlotForNpcGender(bodypartSlot, character.npcGeneratedGender)
			var alreadyHasInPossible = false
			for possibleEntry in possible:
				if(possibleEntry[0] == bodypartID):
					alreadyHasInPossible = true
					break
			if(alreadyHasInPossible):
				continue
			if(bodypartID == null):
				possible.append([null, 1.0])
				fullWeight += 1.0
				continue
			var bodypart = GlobalRegistry.getBodypartRef(bodypartID)
			var weight = bodypart.npcGenerationWeight(character)
			if(weight != null && weight > 0.0):
				possible.append([bodypartID, weight])
				fullWeight += weight

		#print(bodypartSlot, " ", possible) # Uncomment for debug
		if(possible.size() > 0):
			if(!RNG.chance(fullWeight * 100.0)):
				continue
			
			var bodypartID = RNG.pickWeightedPairs(possible)
			if(bodypartID != null):
				var bodypart = GlobalRegistry.createBodypart(bodypartID)
				character.giveBodypartUnlessSame(bodypart)
				bodypart.generateDataFor(character)

func pickBodyAttributes(character:DynamicCharacter, _args = {}):
	if(character.getGender() == Gender.Male):
		character.npcThickness = RNG.randi_range(0, 60)
		character.npcFeminity = RNG.randi_range(0, 50)
	if(character.getGender() == Gender.Female):
		character.npcThickness = RNG.randi_range(0, 110)
		character.npcFeminity = RNG.randi_range(25, 75)
	if(character.getGender() == Gender.Androgynous):
		character.npcThickness = RNG.randi_range(0, 100)
		character.npcFeminity = RNG.randi_range(50, 100)
	if(character.getGender() == Gender.Other):
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
	var fetishHolder = character.getFetishHolder()
	
	fetishHolder.clear()
	
	for fetishID in GlobalRegistry.getFetishes():
		if(RNG.chance(50)):
			fetishHolder.setFetish(fetishID, RNG.pick([FetishInterest.Dislikes, FetishInterest.SlightlyDislikes, FetishInterest.SlightlyLikes]))
		elif(RNG.chance(5)):
			fetishHolder.setFetish(fetishID, RNG.pick([FetishInterest.Hates, FetishInterest.Loves]))
		else:
			fetishHolder.setFetish(fetishID, FetishInterest.Neutral)
		
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
	var interestWeights = [
		[Interest.Hates, 0.5],
		[Interest.ReallyDislikes, 0.6],
		[Interest.Dislikes, 0.7],
		[Interest.SlightlyDislikes, 0.6],
		[Interest.KindaLikes, 1.0],
		[Interest.Likes, 1.0],
		[Interest.ReallyLikes, 1.0],
		[Interest.Loves, 1.0],
	]
	
	for topicA in GlobalRegistry.getLustTopicObjects():
		var topic: TopicBase = topicA
		var handlesIDs = topic.handles_ids
		for id in handlesIDs:
			var pickedInterest = RNG.pickWeightedPairs(interestWeights)
			
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
	var personality = character.getPersonality()
	
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

func pickSmallDescription(character:DynamicCharacter, _args = {}):
	var thedesc = ""
	thedesc += Util.getSpeciesName(character.npcSpecies)
	thedesc += ". "
	thedesc += NpcGender.getVisibleName(character.npcGeneratedGender)+"."
	
	return thedesc

func pickLevel(character:DynamicCharacter, _args = {}):
	if(_args.has(NpcGen.Level)):
		character.npcLevel = _args[NpcGen.Level]
	else:
		if(GM.pc == null || !is_instance_valid(GM.pc)):
			character.npcLevel = 1
		else:
			character.npcLevel = Util.maxi(GM.pc.getLevel() + RNG.randi_range(-3,3), 0)# Just some random lvl
	character.getSkillsHolder().setLevel(character.npcLevel)

func pickStats(character:DynamicCharacter, _args = {}):
	var statDistributionTypes = [
		["tank", 10.0],
		["luster", 10.0],
		["balanced", 5.0],
		["weak", 5.0],
	]
	
	var pickedType = RNG.pickWeightedPairs(statDistributionTypes)
	var level = Util.maxi(0, character.npcLevel)
	
	character.npcBaseLust = 100
	character.npcBasePain = 100
	character.npcBaseStamina = 100
	
	if(pickedType == "tank"):
		character.npcBasePain = 70 + pow(level, 0.6) * 10 + RNG.randi_range(0, level*2)
		character.npcBaseLust = 50 + pow(level, 0.5) * 3
		character.npcBaseStamina = RNG.randi_range(7, 12)*10 + pow(level, 0.3) * 3
	if(pickedType == "luster"):
		character.npcBaseLust = 70 + pow(level, 0.6) * 10 + RNG.randi_range(0, level*2)
		character.npcBasePain = 50 + pow(level, 0.5) * 3 + RNG.randi_range(0, level)
		character.npcBaseStamina = RNG.randi_range(7, 12)*10 + pow(level, 0.25) * 5
	if(pickedType == "balanced"):
		character.npcBaseLust = 60 + pow(level, 0.5) * 10 + RNG.randi_range(0, level*2)
		character.npcBasePain = 60 + pow(level, 0.5) * 10 + RNG.randi_range(0, level*2)
		character.npcBaseStamina = RNG.randi_range(5, 12)*10 + pow(level, 0.5) * 10
	if(pickedType == "weak"):
		character.npcBaseLust = 50 + pow(level, 0.3) * 10 + RNG.randi_range(0, level*2)
		character.npcBasePain = 50 + pow(level, 0.3) * 10 + RNG.randi_range(0, level*2)
		character.npcBaseStamina = RNG.randi_range(5, 7)*10 + pow(level, 0.5) * 10

	character.npcBasePain = int(round(character.npcBasePain/5)*5)
	character.npcBaseLust = int(round(character.npcBaseLust/5)*5)
	character.npcBaseStamina = int(round(character.npcBaseStamina/5)*5)

func resetStats(character:DynamicCharacter, _args = {}):
	character.addStamina( character.getMaxStamina() )

func applyArgs(_character:DynamicCharacter, _args = {}):
	if(_args.has(NpcGen.PersonalityStat)):
		var stats = _args[NpcGen.PersonalityStat]
		# Possible: { NpcGen.PersonalityStat: [PersonalityStat.Mean, 1.0] }
		# Or: { NpcGen.PersonalityStat: [[PersonalityStat.Mean, 1.0], [PersonalityStat.Subby, 1.0]] }
		var personality = _character.getPersonality()
		
		if(!Util.isArrayOfArrays(stats)):
			stats = [stats]
		for statToChange in stats:
			personality.setStat(statToChange[0], statToChange[1])
			
	if(_args.has(NpcGen.Fetish)):
		var fetishes = _args[NpcGen.Fetish]
		var fetishHolder = _character.getFetishHolder()
		
		if(!Util.isArrayOfArrays(fetishes)):
			fetishes = [fetishes]
		for fetishToChange in fetishes:
			fetishHolder.setFetish(fetishToChange[0], fetishToChange[1])
		
	if(_args.has(NpcGen.Flag)):
		var flagsToAdd = _args[NpcGen.Flag]
		
		if(!Util.isArrayOfArrays(flagsToAdd)):
			flagsToAdd = [flagsToAdd]
		for flagToChange in flagsToAdd:
			_character.setFlag(flagToChange[0], flagToChange[1])
		
func pickCharacterType(character:DynamicCharacter, _args = {}):
	character.npcCharacterType = CharacterType.Generic
		
func getRandomItemIDByTag(itemTag):
	var itemIDs = GlobalRegistry.getItemIDsByTag(itemTag)
	if(itemIDs == null || itemIDs.size() == 0):
		return null
	
	var weights = []
	for itemID in itemIDs:
		var itemRef:ItemBase = GlobalRegistry.getItemRef(itemID)
		
		weights.append(itemRef.getItemWeightForNpcGeneration())
	
	return RNG.pickWeighted(itemIDs, weights)
		
func generate(_args = {}):
	var character = makeBase("dynamicnpc", _args)
	# If the function relies on something, it must be below the function that generates that something!
	pickCharacterType(character, _args)
	pickGender(character, _args)
	pickBodyAttributes(character, _args) # Relies on gender
	pickName(character, _args) # Relies on gender
	pickSpecies(character, _args) # Relies on character type
	pickSkinAndColors(character, _args) # Relies on species
	pickLevel(character, _args)
	pickStats(character, _args) # Relies on level
	pickArchetypes(character, _args)
	createBodyparts(character, _args) # Relies on gender and species
	pickAttacks(character, _args)
	pickFetishes(character, _args) # Relies on bodyparts
	pickLustInterests(character, _args)
	pickPersonality(character, _args)
	applyArgs(character, _args) # Relies on fetishes and personality
	pickEquipment(character, _args) # Relies on character type
	character.npcSmallDescription = pickSmallDescription(character, _args)
	
	character.resetEquipment()
	resetStats(character, _args)
	pickNonStaticEquipment(character, _args)
	
	# Letting the species object tweak the character
	for species in character.getSpecies():
		var speciesObject = GlobalRegistry.getSpecies(species)
		if(speciesObject != null):
			speciesObject.onDynamicNpcCreation(character, _args)
	
	character.updateNonBattleEffects()
	return character
