extends SceneBase

var pickedPoolToShow = ""
var pickedFetishToChange = ""
var pickedPersonalityStat = ""
var pickedGenderToChange = ""
var pickedSpeciesToChange = ""
var pickedGoalIDToChange = ""
var npclistScene = preload("res://UI/NpcList/NpcList.tscn") 

func _init():
	sceneID = "EncountersMenuScene"

func _run():
	if(state == ""):
		var encounterSettings:EncounterSettings = GM.main.getEncounterSettings()
		
		saynn("This is a menu that contains info about your previous encounters.")
		
		var hasSomeoneToForget = false
		sayn("You remember:")
		var encounterPools = GM.main.getDynamicCharactersPools()
		if(encounterPools.size() == 0):
			sayn(" - Nothing, explore to find more characters")
		for encounterPoolID in encounterPools:
			var amount = GM.main.getDynamicCharactersPoolSize(encounterPoolID)
			
			sayn(str(encounterPoolID)+": "+str(amount))
			hasSomeoneToForget = true
		sayn("")
		
		if(encounterSettings.doesPreferKnownEncounters()):
			saynn("You prefer to encounter characters that you already saw.")
		else:
			saynn("You don't mind meeting new characters.")
		
		if(GM.pc.dynamicPersonality):
			saynn("Your personality can dynamically change after sex.")
		else:
			saynn("Your personality will never change after sex.")
		
		sayn("Relative chances for the genders of encountered npcs:")
		for gender in NpcGender.getAll():
			var genderName = NpcGender.getVisibleNameColored(gender)
			var extraInfo = ""
			var genderExlanation = NpcGender.getGenderExplanation(gender)
			if(genderExlanation != null && genderExlanation != ""):
				extraInfo = " ("+str(genderExlanation)+")"
			
			var weight = encounterSettings.getGenderWeight(gender)
			sayn(str(genderName)+": "+str(Util.roundF(weight*100.0, 1))+"%"+extraInfo)
		sayn("")
		
		sayn("Relative chances for the species of encountered npcs:")
		var species = GlobalRegistry.getAllPlayableSpecies()
		for speciesID in species:
			var speciesObject:Species = species[speciesID]
			var speciesName = speciesObject.getVisibleName()
			
			var weight = encounterSettings.getSpeciesWeight(speciesID)
			sayn(str(speciesName)+": "+str(Util.roundF(weight*100.0, 1))+"%")
		sayn("")
		
		sayn("Things that npcs won't do to you:")
		var disabledGoalsNames = []
		var allGoals = GlobalRegistry.getSexGoals()
		for goalID in allGoals:
			if(encounterSettings.isGoalDisabledForSubPC(goalID)):
				var goal: SexGoalBase = GlobalRegistry.getSexGoal(goalID)
				if(goal == null):
					continue
				
				disabledGoalsNames.append(goal.getVisibleName())
		if(disabledGoalsNames.size() == 0):
			saynn("- Nothing is disabled")
		else:
			saynn(Util.humanReadableList(disabledGoalsNames))
		
		addButton("Back", "Close this menu", "endthescene")
		
		if(hasSomeoneToForget):
			addButton("Characters", "Shows any randomly generated characters that you encountered", "npclistmenu")
		else:
			addDisabledButton("Characters", "You haven't met any randomly generated characters")
		
		addButton("Toggle known", "Toggle between meeting only old characters and meeting both old and new", "toggleKnown")
		addButton("Dynamic personality", "Change the way your personality changes after sex", "togglePersonalityChange")
		addButton("My fetishes", "Menu that allows you to see and change your fetishes", "fetishmenu")
		addButton("My personality", "Menu that allows you to see and change your personality", "personalitymenu")
		addButton("Genders", "Pick the chances of the genders of the encountered npcs", "gendersmenu")
		addButton("Species", "Pick the chances of the species of the encountered npcs", "speciesmenu")
		addButton("Restrictions", "Pick what things you don't want to happen to you in sex", "goalsmenu")
		addButton("Goal weights", "Change the weights of sex goals that other characters will persue during sex", "goalweightsmenu")

	if(state == "goalweightsmenu"):
		var encounterSettings:EncounterSettings = GM.main.getEncounterSettings()
		addButton("Back", "Close this menu", "")
		
		sayn("These are the current weights of all sex goals:")
		var allGoals = GlobalRegistry.getSexGoals()
		for goalID in allGoals:
			var goal: SexGoalBase = GlobalRegistry.getSexGoal(goalID)
			if(goal == null):
				continue
			var goalWeight = encounterSettings.getGoalWeight(goalID, goal.getGoalDefaultWeight())
			
			sayn(goal.getVisibleName()+": "+str(Util.roundF(goalWeight*100.0, 1))+"%")
			addButton(goal.getVisibleName(), "Change the weight of this goal", "changegoalweightmenu", [goalID])
		
	if(state == "changegoalweightmenu"):
		var encounterSettings:EncounterSettings = GM.main.getEncounterSettings()
		addButton("Back", "Close this menu", "")
		var pickedGoal = GlobalRegistry.getSexGoal(pickedGoalIDToChange)
		if(pickedGoal != null):
			var goalWeight = encounterSettings.getGoalWeight(pickedGoalIDToChange, pickedGoal.getGoalDefaultWeight())
			saynn("The current weight for '"+pickedGoal.getVisibleName()+"' goal is "+str(Util.roundF(goalWeight*100.0, 1))+"%")
			
			addButton("Default", "Reset the weight to the default value", "changegoalweight", [-1])
			
			var possibleWeights = [0.0, 0.05, 0.1, 0.15, 0.2, 0.3, 0.4, 0.5, 0.7, 0.9, 1.0, 1.2, 1.5, 2.0, 3.0, 5.0]
			for weight in possibleWeights:
				var weightStr = str(Util.roundF(weight*100.0, 1))+"%"
				
				addButton(weightStr, "Set the weight to this value", "changegoalweight", [weight])
			
		
	if(state == "goalsmenu"):
		var encounterSettings:EncounterSettings = GM.main.getEncounterSettings()
		addButton("Back", "Close this menu", "")
		
		sayn("Things that npcs won't do to you:")
		var disabledGoalsNames = []
		var allGoals = GlobalRegistry.getSexGoals()
		for goalID in allGoals:
			var goal: SexGoalBase = GlobalRegistry.getSexGoal(goalID)
			if(goal == null):
				continue
			
			if(encounterSettings.isGoalDisabledForSubPC(goalID)):
				disabledGoalsNames.append(goal.getVisibleName())
				addButton("+"+goal.getVisibleName(), "Enable this", "enablegoalforpc", [goalID])
			else:
				addButton("-"+goal.getVisibleName(), "Disable this", "disablegoalforpc", [goalID])
		if(disabledGoalsNames.size() == 0):
			saynn("- Nothing is disabled")
		else:
			saynn(Util.humanReadableList(disabledGoalsNames))

	if(state == "speciesmenu"):
		var encounterSettings:EncounterSettings = GM.main.getEncounterSettings()
		addButton("Back", "Close this menu", "")
		
		sayn("Relative chances for the species of encountered npcs:")
		var species = GlobalRegistry.getAllPlayableSpecies()
		for speciesID in species:
			var speciesObject:Species = species[speciesID]
			var speciesName = speciesObject.getVisibleName()
			
			var weight = encounterSettings.getSpeciesWeight(speciesID)
			sayn(str(speciesName)+": "+str(Util.roundF(weight*100.0, 1))+"%")
			addButton(speciesName, "Change the chance of this species", "specieschancemenu", [speciesID])
		sayn("")

	if(state == "gendersmenu"):
		var encounterSettings:EncounterSettings = GM.main.getEncounterSettings()
		addButton("Back", "Close this menu", "")
		
		sayn("Relative chances for the genders of encountered npcs:")
		for gender in NpcGender.getAll():
			var genderName = NpcGender.getVisibleNameColored(gender)
			var extraInfo = ""
			var genderExlanation = NpcGender.getGenderExplanation(gender)
			if(genderExlanation != null && genderExlanation != ""):
				extraInfo = " ("+str(genderExlanation)+")"
			
			var weight = encounterSettings.getGenderWeight(gender)
			sayn(str(genderName)+": "+str(Util.roundF(weight*100.0, 1))+"%"+extraInfo)
			addButton(NpcGender.getVisibleName(gender), "Change the chance of this gender", "genderchancemenu", [gender])
		sayn("")

	if(state == "genderchancemenu"):
		var gender = pickedGenderToChange
		var encounterSettings:EncounterSettings = GM.main.getEncounterSettings()
		saynn("The current chance for "+NpcGender.getVisibleNameColored(gender)+" is "+str(Util.roundF(encounterSettings.getGenderWeight(gender)*100.0, 1))+"%")

		addButton("Back", "Go back to the previous menu", "gendersmenu")
		addButton("Default", "Set back to default chance", "setgenderchance", [gender, -1.0])
		for chance in [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]:
			addButton(str(Util.roundF(chance*100.0))+"%", "Pick this chance", "setgenderchance", [gender, chance])

	if(state == "specieschancemenu"):
		var species = pickedSpeciesToChange
		var encounterSettings:EncounterSettings = GM.main.getEncounterSettings()
		var speciesObject:Species = GlobalRegistry.getSpecies(species)
		var speciesName = speciesObject.getVisibleName()
		saynn("The current chance for "+speciesName+" is "+str(Util.roundF(encounterSettings.getSpeciesWeight(species)*100.0, 1))+"%")

		addButton("Back", "Go back to the previous menu", "speciesmenu")
		addButton("Default", "Set back to default chance", "setspecieschance", [species, -1.0])
		for chance in [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.2, 1.5, 2.0, 3.0]:
			addButton(str(Util.roundF(chance*100.0))+"%", "Pick this chance", "setspecieschance", [species, chance])

	if(state == "npclistmenu"):
		var encounterPools = GM.main.getDynamicCharactersPools()

		saynn("Select which occupation the character that you want to look for has.")
		saynn("You can forget any character in the list so they will never show up again. This action can not be undone.")
		saynn("Keep in mind that if this character is pregnant, their pregnancy will be forgotten too. But any kids you had together will stay.")

		addButton("Back", "Go back a level", "") 
		
		for encounterPoolID in encounterPools:
			addButton(str(encounterPoolID), "Pick this occupation", "occupationmenupool", [encounterPoolID])
		
	if(state == "occupationmenupool"):
		var npclist = npclistScene.instance()
		GM.ui.addCustomControl("npclist", npclist)
		var _ok = npclist.connect("onMeetNpcButton", self, "doMeetNpc")
		
		var characterIDS = GM.main.getDynamicCharacterIDsFromPool(pickedPoolToShow)
		for characterID in characterIDS:
			var dynamicCharacter: BaseCharacter  = GlobalRegistry.getCharacter(characterID)
			if(dynamicCharacter == null):
				continue
			var NPCname = dynamicCharacter.getName()
			if(dynamicCharacter.hasEnslaveQuest()):
				NPCname = "(!) "+NPCname
			var gender = NpcGender.getVisibleName(dynamicCharacter.npcGeneratedGender)
			var subbyStat = dynamicCharacter.getPersonality().getStat(PersonalityStat.Subby)
			var sharedKidsAmount = GM.CS.getSharedChildrenAmount("pc", characterID)

			npclist.addRow(NPCname, gender, subbyStat, characterID, pickedPoolToShow, sharedKidsAmount, dynamicCharacter.canForgetCharacter(), dynamicCharacter.canMeetCharacter())
	
		addButton("Back", "Go back a level", "closenpclist")
		
		var encounterPools = GM.main.getDynamicCharactersPools()
		for encounterPoolID in encounterPools:
			addButton(str(encounterPoolID), "Pick this occupation", "occupationmenupool", [encounterPoolID])

	if(state == "fetishmenu"):
		var fetishHolder = GM.pc.getFetishHolder()
		saynn("Having a fetish for something means you will get more lust doing this activity during sex.")
		addButton("Go back", "Go back a menu", "")
		
		sayn("Your fetishes:")
		for fetishID in GlobalRegistry.getFetishes():
			var fetish = GlobalRegistry.getFetish(fetishID)
			var fetishInterest = fetishHolder.getFetishInterest(fetishID)
			var fetishColor = FetishInterest.getColorString(fetishInterest)
			var fetishInterestText = FetishInterest.getVisibleName(fetishInterest)
			
			sayn(fetish.getVisibleName()+": "+"[color="+fetishColor+"]"+fetishInterestText+"[/color]")
			
			addButton(fetish.getVisibleName(), "Change how much you enjoy this fetish", "changefetish", [fetishID])
		
	if(state == "changefetish"):
		var fetishHolder = GM.pc.getFetishHolder()
		var fetish = GlobalRegistry.getFetish(pickedFetishToChange)
		if(fetish != null):
			saynn("Your current value for '"+fetish.getVisibleName()+"' fetish is "+FetishInterest.getVisibleName(fetishHolder.getFetishInterest(pickedFetishToChange)))
			
			saynn("Pick your new value for this fetish")
			
			for fetishInterest in FetishInterest.getAll():
				addButton(FetishInterest.getVisibleName(fetishInterest), "Change to this", "changeinterest", [fetishInterest])
			
			
		addButton("Back", "Don't change anything", "fetishmenu")
		
	if(state == "personalitymenu"):
		var personality: Personality = GM.pc.getPersonality()
		saynn("Your personality has a minor effect on how you react during sex.")
		addButton("Go back", "Go back a menu", "")
		
		sayn("Your personality:")
		for statID in PersonalityStat.getAll():
			var value = personality.getStat(statID)
			var statName = PersonalityStat.getVisibleName(statID)
			var statValue = PersonalityStat.getVisibleDesc(statID, value)
			
			sayn(statName+": "+statValue+" (Raw value is "+str(Util.roundF(value*100.0,1))+"%)")
			addButton(statName, "Change this personality stat", "changepersonality", [statID])
	
	if(state == "changepersonality"):
		var personality: Personality = GM.pc.getPersonality()
		var value = personality.getStat(pickedPersonalityStat)
		var statName = PersonalityStat.getVisibleName(pickedPersonalityStat)
		var statValue = PersonalityStat.getVisibleDesc(pickedPersonalityStat, value)
		
		saynn("Your current raw value for '"+statName+"' personality stat is "+str(Util.roundF(value*100.0,1))+"% (or '"+str(statValue)+"')")
		
		addButton("Done", "Enough changing", "personalitymenu")
		addButton("-15%", "Change the personality stat", "changepersonalitystatby", [-0.15])
		addButton("-5%", "Change the personality stat", "changepersonalitystatby", [-0.05])
		addButton("-1%", "Change the personality stat", "changepersonalitystatby", [-0.01])
		addButton("+1%", "Change the personality stat", "changepersonalitystatby", [0.01])
		addButton("+5%", "Change the personality stat", "changepersonalitystatby", [0.05])
		addButton("+15%", "Change the personality stat", "changepersonalitystatby", [0.15])
		
func doMeetNpc(ID, occupation):
	var room = GM.world.getRoomByID(GM.pc.getLocation())
	match occupation:
		"Inmates": 
			if(WorldPopulation.Inmates in GM.pc.getLocationPopulation()):
				if(GM.ES.triggerReact(Trigger.MeetDynamicNPC, [ID]) || GM.ES.triggerReact(Trigger.TalkingToDynamicNPC, [ID])):
					pass
				else:
					GM.main.runScene("InmateExposureForcedSexScene", [ID])
				endScene([true])
				GM.main.runCurrentScene()
			else:
				GM.ui.getCustomControl("npclist").sendPopupMessage("There are no inmates in this location.\nTry looking elsewhere")
		"Guards":
			if(WorldPopulation.Guards in GM.pc.getLocationPopulation()):
				if(GM.ES.triggerReact(Trigger.MeetDynamicNPC, [ID]) || GM.ES.triggerReact(Trigger.TalkingToDynamicNPC, [ID])):
					pass
				else:
					GM.main.runScene("GuardCaughtOfflimitsScene", [ID])
				endScene([true])
				GM.main.runCurrentScene()
			else:
				GM.ui.getCustomControl("npclist").sendPopupMessage("There are no guards in this location.\nTry searching at the security checkpoint or near greenhouses")
		"Engineers":
			if(room.loctag_EngineersEncounter || room.getCachedFloorID() in ["MiningFloor"]):
				if(GM.ES.triggerReact(Trigger.MeetDynamicNPC, [ID]) || GM.ES.triggerReact(Trigger.TalkingToDynamicNPC, [ID])):
					pass
				else:
					GM.main.runScene("EngineerCaughtOfflimitsScene", [ID])
				endScene([true])
				GM.main.runCurrentScene()
			else:
				GM.ui.getCustomControl("npclist").sendPopupMessage("There are no engineers in this location.\nTry searching in the engineering bay")
		"Nurses":
			if(room.loctag_MentalWard || room.getCachedFloorID() in ["Medical"]):
				if(GM.ES.triggerReact(Trigger.MeetDynamicNPC, [ID]) || GM.ES.triggerReact(Trigger.TalkingToDynamicNPC, [ID])):
					pass
				else:
					GM.main.runScene("NurseCaughtOfflimitsScene", [ID])
				endScene([true])
				GM.main.runCurrentScene()
			else:
				GM.ui.getCustomControl("npclist").sendPopupMessage("There are no nurses in this location.\nTry searching in the restricted area of the medical ward")
		_:
			if(GM.ES.triggerReact(Trigger.MeetDynamicNPC, [ID])):
				pass
			else:
				Log.error("Exception: unknown occupation detected, please update")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "enablegoalforpc"):
		GM.main.getEncounterSettings().enableGoalForSubPC(_args[0])
		return
	
	if(_action == "disablegoalforpc"):
		GM.main.getEncounterSettings().disableGoalForSubPC(_args[0])
		return
	
	if(_action == "changefetish"):
		pickedFetishToChange = _args[0]
	
	if(_action == "changepersonality"):
		pickedPersonalityStat = _args[0]
	
	if(_action == "changepersonalitystatby"):
		var personality: Personality = GM.pc.getPersonality()
		personality.addStat(pickedPersonalityStat, _args[0])
		return
	
	if(_action == "changeinterest"):
		var fetishHolder = GM.pc.getFetishHolder()
		var fetish = GlobalRegistry.getFetish(pickedFetishToChange)
		if(fetish != null):
			fetishHolder.setFetish(pickedFetishToChange, _args[0])
		setState("fetishmenu")
		return
	
	if(_action == "toggleKnown"):
		GM.main.getEncounterSettings().togglePreferKnownEcnounters()
		return
	
	if(_action == "togglePersonalityChange"):
		GM.pc.dynamicPersonality = !GM.pc.dynamicPersonality
		return 
	
	if(_action == "occupationmenupool"):
		pickedPoolToShow = _args[0]
	
	if(_action == "genderchancemenu"):
		pickedGenderToChange = _args[0]
	
	if(_action == "specieschancemenu"):
		pickedSpeciesToChange = _args[0]
		
	if(_action == "changegoalweightmenu"):
		pickedGoalIDToChange = _args[0]
	
	if(_action == "setgenderchance"):
		GM.main.getEncounterSettings().setGenderWeight(_args[0], _args[1])
		
		setState("gendersmenu")
		return	
		
	if(_action == "setspecieschance"):
		GM.main.getEncounterSettings().setSpeciesWeight(_args[0], _args[1])
		
		setState("speciesmenu")
		return
		
	if(_action == "changegoalweight"):
		if(_args[0] < 0):
			GM.main.getEncounterSettings().resetGoalWeight(pickedGoalIDToChange)
		else:
			GM.main.getEncounterSettings().setGoalWeight(pickedGoalIDToChange, _args[0])
		setState("goalweightsmenu")
		return
		
	if(_action == "closenpclist"):
		setState("")
		GM.ui.clearCharactersPanel()
		GM.main.playAnimation(StageScene.Solo, "stand")
		return
		
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["pickedPoolToShow"] = pickedPoolToShow
	data["pickedFetishToChange"] = pickedFetishToChange
	data["pickedPersonalityStat"] = pickedPersonalityStat
	data["pickedGenderToChange"] = pickedGenderToChange
	data["pickedSpeciesToChange"] = pickedSpeciesToChange
	data["pickedGoalIDToChange"] = pickedGoalIDToChange

	return data
	
func loadData(data):
	.loadData(data)
	
	pickedPoolToShow = SAVE.loadVar(data, "pickedPoolToShow", "")
	pickedFetishToChange = SAVE.loadVar(data, "pickedFetishToChange", "")
	pickedPersonalityStat = SAVE.loadVar(data, "pickedPersonalityStat", "")
	pickedGenderToChange = SAVE.loadVar(data, "pickedGenderToChange", "")
	pickedSpeciesToChange = SAVE.loadVar(data, "pickedSpeciesToChange", "")
	pickedGoalIDToChange = SAVE.loadVar(data, "pickedGoalIDToChange", "")
