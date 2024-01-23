extends "res://Scenes/SceneBase.gd"

var pickingBodypartType = BodypartSlot.Legs
var pickedFirstSpeciesHybrid = ""
var pickedAttribID = ""
var bodyPickedAttribID = ""
var debugMode = false

var colorPickerScene = preload("res://UI/ColorPickerWidget.tscn")

func _initScene(_args = []):
	if(_args.size() > 0 && _args[0]):
		debugMode = true
		state = "pickedspecies"

func _init():
	sceneID = "CharacterCreatorScene"

func _run():
	if(state == "" || state == "pickgender"):
		say("Pick your character's gender. This will affect the color of your speech and how others will treat you. This can be changed at any point")
		
		addButton("Male", "You're a guy", "setgender", [Gender.Male])
		addButton("Female", "You're a girl", "setgender", [Gender.Female])
		addButton("Androgynous", "Somewhere in between", "setgender", [Gender.Androgynous])
		addButton("Other", "Something else", "setgender", [Gender.Other])

	if(state == "pickpronouns"):
		say("Pick your character's pronouns. This can be changed at any point")
		addButton("Same as gender", "Use your gender's pronouns", "setpronouns", [null])
		addButton("Male", "He/his", "setpronouns", [Gender.Male])
		addButton("Female", "She/her", "setpronouns", [Gender.Female])
		addButton("Androgynous", "They/their", "setpronouns", [Gender.Androgynous])
		addButton("Other", "It/its", "setpronouns", [Gender.Other])
		addButton("back", "Back to picking gender", "pickgender")

	if(state == "pickspecies"):
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
		playAnimation(StageScene.Solo, "stand", {bodyState={naked=true,hard=true}})
		
		if(debugMode):
			saynn("[b]Scene is running in debug mode, no bodypart restrictions are applied[/b]")
		
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
			say(slotName+": "+bodypart.getCharacterCreatorName().capitalize())
			#var extra = bodypart.getExtraInfoCreation()
			#if(extra!=""):
			#	say(" (" + extra + ")")
			say("\n")
			for curAttrib in bodypart.getAttributesText():
				sayn(" - "+curAttrib[0]+": "+str(curAttrib[1]))
				
			#say("\n")
		say("\n")
		sayn("Body attributes:")
		for curAttrib in GM.pc.getAttributesText():
			sayn(curAttrib[0]+": "+str(curAttrib[1]))
			

		addButton("Confirm", "I like it", "donecreating")
		
		for slot in allSlots:
			var slotName = BodypartSlot.getVisibleName(slot)
			addButton(slotName, "Change this bodypart", "pickbodypart", [slot])
			
		addButton("Body attributes", "Change your femininity, thickness and so", "bodyAttributes")
			
		# DEBUG testing stuff, feel free to remove
		if(true):
			sayn("\nEXAMPLE DESCRIPTION:")
			if(GM.pc.hasPenis()):
				sayn("your dick is {pc.cockSize} and also {pc.cockDesc}")
				saynn("You have {pc.aPenis}")
			sayn("You have {pc.breasts}")
			saynn("Your breasts are {pc.breastsSize} and they are also {pc.breastsDesc}")
			if(GM.pc.hasVagina()):
				saynn("You have {pc.aVagina}")
			if(GM.pc.hasTail()):
				saynn("You have {pc.aTail}")
			saynn("Your body shape is {pc.thick}, you look {pc.feminine}")
			
		
		if(!debugMode):
			addButton("back", "Back to picking species", "pickspecies")
		else:
			addButton("Change species", "! This will override all the bodyparts !", "pickspecies")
		
	if(state == "pickbodypart"):
		saynn("Choose the bodypart or change the attributes of the current one")
		
		addButton("Back", "go back", "pickedspecies")
		
		if(GM.pc.hasBodypart(pickingBodypartType)):
			var bodypart = GM.pc.getBodypart(pickingBodypartType)
			
			sayn("Currently selected: "+bodypart.getCharacterCreatorName())
			for curAttrib in bodypart.getAttributesText():
				sayn(curAttrib[0]+": "+str(curAttrib[1]))
			
			var attribOptions = bodypart.getPickableAttributes()
			if(attribOptions.size() > 0):
				addButton("Change current", "Change the attributes of the current bodypart instead of creating a new one", "bodypartAttributes")
			
			
		
		var playerSpecies: Array = GM.pc.getSpecies()
			
		if(!BodypartSlot.isEssential(pickingBodypartType)):
			addButton("Nothing", "remove it", "removebodypart", [pickingBodypartType])
			
		var allbodypartsIDs = GlobalRegistry.getBodypartsIdsBySlot(pickingBodypartType)
		for bodypartID in allbodypartsIDs:
			var bodypart = GlobalRegistry.getBodypartRef(bodypartID)
			var supportedSpecies = bodypart.getCompatibleSpecies()
			
			var hasInSupported = false || debugMode
			var hasInAllowed = false
			
			for supported in supportedSpecies:
				if((supported in playerSpecies) || (supported in [Species.Any, Species.AnyNPC])):
					hasInSupported = true
					break
				
			for playerSpecie in playerSpecies:
				var speciesObject = GlobalRegistry.getSpecies(playerSpecie)
				if(bodypartID in speciesObject.getAllowedBodyparts()):
					hasInAllowed = true
					break
			
			if(hasInSupported || hasInAllowed):
				addButton(bodypart.getCharacterCreatorName(), bodypart.getCharacterCreatorDesc(), "setbodypart", [bodypart.id])

	if(state == "bodypartAttributes"):
		playAnimation(StageScene.Solo, "stand", {bodyState={naked=true,hard=true}})
		
		var bodypart = GM.pc.getBodypart(pickingBodypartType)
		var attributes = bodypart.getPickableAttributes()
		
		saynn("Change the attributes of "+bodypart.getCharacterCreatorName())
		for curAttrib in bodypart.getAttributesText():
			sayn(curAttrib[0]+": "+str(curAttrib[1]))
		
		addButton("Done", "You're done changing attributes", "pickedspecies")
		
		for attributeID in attributes:
			var attribute = attributes[attributeID]
			addButton(attribute["textButton"], attribute["buttonDesc"], "attributeMenu", [attributeID])

	if(state == "attributeMenu"):
		var bodypart = GM.pc.getBodypart(pickingBodypartType)
		var attributes = bodypart.getPickableAttributes()
		var currentAttribute = attributes[pickedAttribID]
		
		saynn(currentAttribute["text"])
		if(currentAttribute.has("type")):
			var attribType = currentAttribute["type"]
			if(attribType == "color"):
				var colorPicker = colorPickerScene.instance()
				GM.ui.addCustomControl("colorpicker", colorPicker)
				if(currentAttribute.has("currentColor") && currentAttribute["currentColor"] != null):
					colorPicker.setCurrentColor(currentAttribute["currentColor"])
		
		for option in currentAttribute["options"]:
			addButton(option[1], option[2], "setAttribute", [option[0]])
		
		addButton("Back", "Go back a menu", "bodypartAttributes")
	
	if(state == "bodyAttributes"):
		var attributes = GM.pc.getPickableAttributes()
		
		saynn("Pick what do you wanna change about your body")
		for curAttrib in GM.pc.getAttributesText():
			sayn(curAttrib[0]+": "+str(curAttrib[1]))
		
		addButton("Done", "You're done changing attributes", "pickedspecies")
		addButton("Skin/Colors", "Change how you look", "startskinmenu")
		
		for attributeID in attributes:
			var attribute = attributes[attributeID]
			addButton(attribute["textButton"], attribute["buttonDesc"], "bodyAttributeMenu", [attributeID])

		var bodyparts = GM.pc.getBodyparts()
		var allSlots = BodypartSlot.getAll()
		for slot in allSlots:
			var bodypart = bodyparts[slot]
			if(bodypart == null):
				continue
			var bodypartAttributes = bodypart.getPickableAttributes()
			if(bodypartAttributes.size() == 0):
				continue
			addButton(bodypart.getCharacterCreatorName().capitalize()+" attributes", "Change the attributes of this bodypart", "openBodypartAttributes", [slot])
			

	if(state == "bodyAttributeMenu"):
		var attributes = GM.pc.getPickableAttributes()
		var currentAttribute = attributes[bodyPickedAttribID]
		
		saynn(currentAttribute["text"])
		if(currentAttribute.has("type")):
			var attribType = currentAttribute["type"]
			if(attribType == "color"):
				var colorPicker = colorPickerScene.instance()
				GM.ui.addCustomControl("colorpicker", colorPicker)
				if(currentAttribute.has("currentColor")):
					colorPicker.setCurrentColor(currentAttribute["currentColor"])
		
		for option in currentAttribute["options"]:
			addButton(option[1], option[2], "bodySetAttribute", [option[0]])
		
		
		addButton("Back", "Go back a menu", "bodyAttributes")

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
		
	if(_action == "attributeMenu"):
		if(_args.size() > 0):
			pickedAttribID = _args[0]
	
	if(_action == "setAttribute"):
		var pickedValue = _args[0]
		var bodypart = GM.pc.getBodypart(pickingBodypartType)
		var attributes = bodypart.getPickableAttributes()
		var currentAttribute = attributes[pickedAttribID]
		
		if(currentAttribute.has("type") && currentAttribute["type"] == "color" && pickedValue == 1):
			var colorPicker = GM.ui.getCustomControl("colorpicker")
			bodypart.applyAttribute(pickedAttribID, colorPicker.getCurrentColor())
		else:
			bodypart.applyAttribute(pickedAttribID, pickedValue)
		
		#bodypart.applyAttribute(pickedAttribID, pickedValue)
		GM.pc.updateAppearance()
		setState("bodypartAttributes")
		return
	
	if(_action == "bodyAttributeMenu"):
		if(_args.size() > 0):
			bodyPickedAttribID = _args[0]
	
	if(_action == "bodySetAttribute"):
		var pickedValue = _args[0]
		var attributes = GM.pc.getPickableAttributes()
		var currentAttribute = attributes[bodyPickedAttribID]
		
		if(currentAttribute.has("type") && currentAttribute["type"] == "color" && pickedValue == 1):
			var colorPicker = GM.ui.getCustomControl("colorpicker")
			GM.pc.applyAttribute(bodyPickedAttribID, colorPicker.getCurrentColor())
		else:
			GM.pc.applyAttribute(bodyPickedAttribID, pickedValue)
		GM.pc.updateAppearance()
		setState("bodyAttributes")
		return
	
	if(_action == "openBodypartAttributes"):
		if(_args.size() > 0):
			pickingBodypartType = _args[0]
			
		setState("bodypartAttributes")
		return
	
	if(_action == "pickbodypart"):
		if(_args.size() > 0):
			pickingBodypartType = _args[0]
	
	if(_action == "removebodypart"):
		var bodypartSlot = _args[0]

		GM.pc.removeBodypart(bodypartSlot)
		
		setState("pickedspecies")
		return
	
	if(_action == "setbodypart"):
		var bodypartID = _args[0]
		var bodypart = GlobalRegistry.createBodypart(bodypartID)
		
		GM.pc.giveBodypart(bodypart)
		
		var pickableOptions = bodypart.getPickableAttributes()
		if(pickableOptions.size() == 0):
			setState("pickedspecies")
		else:
			setState("bodypartAttributes")
		
		
		return
		
	if(_action == "pick2species"):
		pickedFirstSpeciesHybrid = _args[0]
	
	if(_action == "endthescene" || _action == "donecreating"):
		endScene()
		return
	
	if(_action == "startskinmenu"):
		runScene("ChangeSkinScene")
		return

	setState(_action)


func saveData():
	var data = .saveData()
	
	data["pickingBodypartType"] = pickingBodypartType
	data["pickedFirstSpeciesHybrid"] = pickedFirstSpeciesHybrid
	data["pickedAttribID"] = pickedAttribID
	data["bodyPickedAttribID"] = bodyPickedAttribID
	data["debugMode"] = debugMode
	
	return data
	
func loadData(data):
	.loadData(data)
	
	pickingBodypartType = SAVE.loadVar(data, "pickingBodypartType", BodypartSlot.Legs)
	pickedFirstSpeciesHybrid = SAVE.loadVar(data, "pickedFirstSpeciesHybrid", "")
	pickedAttribID = SAVE.loadVar(data, "pickedAttribID", "")
	bodyPickedAttribID = SAVE.loadVar(data, "bodyPickedAttribID", "")
	debugMode = SAVE.loadVar(data, "debugMode", false)
