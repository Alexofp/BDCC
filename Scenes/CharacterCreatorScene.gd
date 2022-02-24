extends "res://Scenes/SceneBase.gd"

var pickingBodypartType = BodypartSlot.Legs
var pickedFirstSpeciesHybrid = ""

func _init():
	sceneID = "CharacterCreatorScene"

func _run():
	if(state == "" || state == "pickgender"):
		say("Pick your character's gender. This will affect the color of your speech. This can be changed at any point")
		
		addButton("Male", "You're a guy", "setgender", [BaseCharacter.Gender.Male])
		addButton("Female", "You're a girl", "setgender", [BaseCharacter.Gender.Female])
		addButton("Androgynous", "You're something in between", "setgender", [BaseCharacter.Gender.Androgynous])
		addButton("Other", "You're something else", "setgender", [BaseCharacter.Gender.Other])

	if(state == "pickpronouns"):
		say("Pick your character's pronouns. This can be changed at any point")
		addButton("Same as gender", "Use your gender's pronouns", "setpronouns", [null])
		addButton("Male", "He/his", "setpronouns", [BaseCharacter.Gender.Male])
		addButton("Female", "She/her", "setpronouns", [BaseCharacter.Gender.Female])
		addButton("Androgynous", "They/their", "setpronouns", [BaseCharacter.Gender.Androgynous])
		addButton("Other", "It/its", "setpronouns", [BaseCharacter.Gender.Other])
		addButton("back", "Back to picking gender", "pickgender")

	if(state == "pickspecies"):
		GM.pc.playAnimation(TheStage.Standing)
		say("Pick your character's species")
		var allSpecies = GlobalRegistry.getAllPlayableSpecies()
		for speciesID in allSpecies:
			var speciesInfo = GlobalRegistry.getSpecies(speciesID)
			addButton(speciesInfo.getVisibleName(), speciesInfo.getVisibleDescription(), "setspecies", [[speciesID]])
		addButton("Make Hybrid", "Make a custom hybrid", "pickhybrid1")
		addButton("back", "Back to picking pronouns", "pickpronouns")

	if(state == "pickhybrid1"):
		say("Pick your first species")
		
		var allSpecies = GlobalRegistry.getAllPlayableSpecies()
		for speciesID in allSpecies:
			var speciesInfo = GlobalRegistry.getSpecies(speciesID)
			addButton(speciesInfo.getVisibleName(), speciesInfo.getVisibleDescription(), "pick2species", [speciesID])
			
		addButton("back", "Back", "pickspecies")

	if(state == "pick2species"):
		say("Pick your second species")
		
		var allSpecies = GlobalRegistry.getAllPlayableSpecies()
		for speciesID in allSpecies:
			if(pickedFirstSpeciesHybrid == speciesID):
				continue
			
			var speciesInfo = GlobalRegistry.getSpecies(speciesID)
			addButton(speciesInfo.getVisibleName(), speciesInfo.getVisibleDescription(), "setspecies", [[pickedFirstSpeciesHybrid, speciesID]])
		
		addButton("back", "Back", "pickhybrid1")

	if(state == "pickedspecies"):
		say("You are a "+GM.pc.getSpeciesFullName())
		say("\n----\n")
		
		var bodyparts = GM.pc.getBodyparts()
		var allSlots = BodypartSlot.getAll()
		for slot in allSlots:
			var slotName = BodypartSlot.getVisibleName(slot)
			if(!bodyparts.has(slot) || bodyparts[slot] == null):
				say(slotName+": None\n")
				continue
			
			var bodypart = bodyparts[slot]
			say(slotName+": "+bodypart.getName().capitalize())
			var extra = bodypart.getExtraInfoCreation()
			if(extra!=""):
				say(" (" + extra + ")")
			say("\n")
		
		addButton("Confirm", "I like it", "donecreating")
		
		for slot in allSlots:
			var slotName = BodypartSlot.getVisibleName(slot)
			addButton(slotName, "Change this", "pickbodypart", [slot])
			
		# DEBUG testing stuff, feel free to remove
#		if(GM.pc.hasPenis()):
#			sayn("YOUR {pc.penis} is amazing")
#			sayn("YOUR COCK IS {pc.cockSize} and also {pc.cockDesc}")
#			saynn("You have {pc.aPenis}")
#		sayn("Your {pc.breasts} are pretty good too")
#		saynn("Your breasts are {pc.breastsSize} and they are also {pc.breastsDesc}")
#		if(GM.pc.hasVagina()):
#			saynn("YOU HAVE {pc.aVagina}")
#		if(GM.pc.hasTail()):
#			saynn("YOU HAVE {pc.aTail}")
			
		addButton("Breast size", "Change breast size", "pickbreastsize")
			
		addButton("back", "Back to picking species", "pickspecies")

	if(state == "pickbodypart"):
		say("Choose")
		
		addButton("Back", "go back", "pickedspecies")
		var playerSpecies: Array = GM.pc.getSpecies()
			
		if(!BodypartSlot.isEssential(pickingBodypartType)):
			addButton("Nothing", "remove it", "removebodypart", [pickingBodypartType])
			
		var allbodypartsIDs = GlobalRegistry.getBodypartsIdsBySlot(pickingBodypartType)
		for bodypartID in allbodypartsIDs:
			var bodypart = GlobalRegistry.getBodypart(bodypartID)
			var supportedSpecies = bodypart.getCompatibleSpecies()
			
			for supported in supportedSpecies:
				if(supported in playerSpecies || supported == Species.Any):
					addButton(bodypart.getName(), "change to this", "setbodypart", [bodypart.id])
					break

	if(state == "pickbreastsize"):
		say("Pick your character's breast size")
		addButton("Forever Flat", "Your breasts will never produce milk or increase in size", "setbreasts", [BodypartBreasts.BreastsSize.FOREVER_FLAT])
		addButton("Flat", "Flat breasts", "setbreasts", [BodypartBreasts.BreastsSize.FLAT])
		addButton("A", "A sized breasts", "setbreasts", [BodypartBreasts.BreastsSize.A])
		addButton("B", "B sized breasts", "setbreasts", [BodypartBreasts.BreastsSize.B])
		addButton("C", "C sized breasts", "setbreasts", [BodypartBreasts.BreastsSize.C])
		addButton("D", "D sized breasts", "setbreasts", [BodypartBreasts.BreastsSize.D])
		addButton("back", "Back", "pickedspecies")


func _react(_action: String, _args):
	if(_action == "setgender"):
		GM.pc.setGender(_args[0])
		setState("pickpronouns")
		return
		
	if(_action == "setpronouns"):
		GM.pc.setPronounGender(_args[0])
		setState("pickspecies")
		return
		
	if(_action == "setspecies"):
		GM.pc.setSpecies(_args[0])
		GM.pc.resetBodypartsToDefault()
		setState("pickedspecies")
		return
		
	if(_action == "setbreasts"):
		if(GM.pc.hasBodypart(BodypartSlot.Breasts)):
			var breasts = GM.pc.getBodypart(BodypartSlot.Breasts)
			breasts.size = _args[0]
			GM.pc.updateAppearance()		
		
		setState("pickedspecies")
		return
	
	if(_action == "pickbodypart"):
		pickingBodypartType = _args[0]
	
	if(_action == "removebodypart"):
		var bodypartSlot = _args[0]

		GM.pc.removeBodypart(bodypartSlot)
		
		setState("pickedspecies")
		return
	
	if(_action == "setbodypart"):
		var bodypartID = _args[0]
		var bodypart = GlobalRegistry.getBodypart(bodypartID)
		
		GM.pc.giveBodypart(bodypart)
		
		setState("pickedspecies")
		return
		
	if(_action == "pick2species"):
		pickedFirstSpeciesHybrid = _args[0]
	
	if(_action == "endthescene" || _action == "donecreating"):
		endScene()
		return

	setState(_action)


func saveData():
	var data = .saveData()
	
	data["pickingBodypartType"] = pickingBodypartType
	data["pickedFirstSpeciesHybrid"] = pickedFirstSpeciesHybrid
	
	return data
	
func loadData(data):
	.loadData(data)
	
	pickingBodypartType = SAVE.loadVar(data, "pickingBodypartType", BodypartSlot.Legs)
	pickedFirstSpeciesHybrid = SAVE.loadVar(data, "pickedFirstSpeciesHybrid", "")
