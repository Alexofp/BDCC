extends Reference
class_name CharacterGeneratorBase

static func makeBase(idprefix = "npc"):
	var dynamicCharacter = DynamicCharacter.new()
	dynamicCharacter.id = GM.main.generateCharacterID(idprefix)
	GM.main.addDynamicCharacter(dynamicCharacter)
	return dynamicCharacter

static func pickGender(character:DynamicCharacter):
	character.npcGender = RNG.pick([Gender.Male, Gender.Female])

static func pickName(character:DynamicCharacter):
	if(character.npcGender == Gender.Male):
		character.npcName = RNG.randomMaleName()
	else:
		character.npcName = RNG.randomFemaleName()

static func pickEquipment(character:DynamicCharacter):
	character.npcDefaultEquipment = ["ballgag", "CasualClothes", "LaceBra", "LacePanties"]

static func pickedSpeciesType():
	return "guard"

static func pickSpecies(character:DynamicCharacter):
	var speciesType = pickedSpeciesType()
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

static func createBodyparts(character:DynamicCharacter):
	var theSpecies = character.npcSpecies
	for bodypartSlot in BodypartSlot.getAll():
		var possible = []
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
		
		if(possible.size() > 0):
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

	

static func generate(_args = {}):
	var character = makeBase()
	pickGender(character)
	pickName(character)
	pickEquipment(character)
	pickSpecies(character)
	createBodyparts(character)
	character.resetEquipment()
	
	return character
