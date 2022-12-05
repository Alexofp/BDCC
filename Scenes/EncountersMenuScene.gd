extends SceneBase

var pickedPoolToForget = ""
var pickedFetishToChange = ""
var pickedPersonalityStat = ""

func _init():
	sceneID = "EncountersMenuScene"

func _run():
	if(state == ""):
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
		
		if(getFlag("PreferKnownEncounters")):
			saynn("You prefer to encounter characters that you already saw.")
		else:
			saynn("You don't mind meeting new characters.")
		
		if(GM.pc.dynamicPersonality):
			saynn("Your personality can dynamically change after sex.")
		else:
			saynn("Your personality will never change after sex.")
		
		addButton("Back", "Close this menu", "endthescene")
		
		if(hasSomeoneToForget):
			addButton("Forget", "Pick which character you wanna forget", "forgetmenu")
		else:
			addDisabledButton("Forget", "You haven't met anyone that you can forget")
		
		addButton("Toggle known", "Toggle between meeting only old characters and meeting both old and new", "toggleKnown")
		addButton("Dynamic personality", "Change the way your personality changes after sex", "togglePersonalityChange")
		addButton("My fetishes", "Menu that allows you to see and change your fetishes", "fetishmenu")
		addButton("My personality", "Menu that allows you to see and change your personality", "personalitymenu")
		
		

	if(state == "forgetmenu"):
		var encounterPools = GM.main.getDynamicCharactersPools()

		saynn("Select which occupation the character that you wanna forget has.")

		addButton("Back", "Go back a level", "")

		for encounterPoolID in encounterPools:
			addButton(str(encounterPoolID), "Pick this occupation", "forgetmenupool", [encounterPoolID])
		
		
	if(state == "forgetmenupool"):
		saynn("Pick who do you wanna forget. They will never show up again. This action can not be undone.")
		
		saynn("Keep in mind that if this character is pregnant, their pregnancy will be forgotten too. But any kids you had together will stay.")
		
		addButton("Back", "Go back a level", "forgetmenu")
		
		var characterIDS = GM.main.getDynamicCharacterIDsFromPool(pickedPoolToForget)
		for characterID in characterIDS:
			var dynamicCharacter:DynamicCharacter = GlobalRegistry.getCharacter(characterID)
			if(dynamicCharacter == null):
				continue
				
			var desc = dynamicCharacter.getSmallDescription()
			if(desc == null):
				desc = ""
			
			var kidsAmount = GM.CS.getChildrenAmountOf(characterID)
			if(kidsAmount > 0):
				if(desc != ""):
					desc += "\n"
				desc += dynamicCharacter.getName()+" has "+str(kidsAmount)+" "+Util.multipleOrSingularEnding(kidsAmount, "kid")+"."
			
			var sharedKidsAmount = GM.CS.getSharedChildrenAmount("pc", characterID)
			if(sharedKidsAmount > 0):
				if(sharedKidsAmount == kidsAmount):
					desc += " All of them are from you."
				else:
					desc += " "+str(sharedKidsAmount)+" of them are from you."
			
			addButton(dynamicCharacter.getName(), desc, "forget", [dynamicCharacter.getID()])
	
	if(state == "fetishmenu"):
		var fetishHolder: FetishHolder = GM.pc.getFetishHolder()
		saynn("Having a fetish for something means you will get more lust doing this activity during sex.")
		addButton("Go back", "Go back a menu", "")
		
		sayn("Your fetishes:")
		for fetishID in GlobalRegistry.getFetishes():
			var fetish:FetishBase = GlobalRegistry.getFetish(fetishID)
			var fetishInterest = fetishHolder.getFetishInterest(fetishID)
			var fetishColor = FetishInterest.getColorString(fetishInterest)
			var fetishInterestText = FetishInterest.getVisibleName(fetishInterest)
			
			sayn(fetish.getVisibleName()+": "+"[color="+fetishColor+"]"+fetishInterestText+"[/color]")
			
			addButton(fetish.getVisibleName(), "Change how much you enjoy this fetish", "changefetish", [fetishID])
		
	if(state == "changefetish"):
		var fetishHolder: FetishHolder = GM.pc.getFetishHolder()
		var fetish:FetishBase = GlobalRegistry.getFetish(pickedFetishToChange)
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
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
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
		var fetishHolder: FetishHolder = GM.pc.getFetishHolder()
		var fetish:FetishBase = GlobalRegistry.getFetish(pickedFetishToChange)
		if(fetish != null):
			fetishHolder.setFetish(pickedFetishToChange, _args[0])
		setState("fetishmenu")
		return
	
	if(_action == "toggleKnown"):
		setFlag("PreferKnownEncounters", !getFlag("PreferKnownEncounters", false))
		return
	
	if(_action == "togglePersonalityChange"):
		GM.pc.dynamicPersonality = !GM.pc.dynamicPersonality
		return 
	
	if(_action == "forgetmenupool"):
		pickedPoolToForget = _args[0]
	
	if(_action == "forget"):
		var dynamicCharacter:DynamicCharacter = GlobalRegistry.getCharacter(_args[0])
		addMessage("You forgot about "+str(dynamicCharacter.getName()))
		
		GM.main.removeDynamicCharacter(_args[0])
		setState("forgetmenupool")
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["pickedPoolToForget"] = pickedPoolToForget
	data["pickedFetishToChange"] = pickedFetishToChange
	data["pickedPersonalityStat"] = pickedPersonalityStat

	return data
	
func loadData(data):
	.loadData(data)
	
	pickedPoolToForget = SAVE.loadVar(data, "pickedPoolToForget", "")
	pickedFetishToChange = SAVE.loadVar(data, "pickedFetishToChange", "")
	pickedPersonalityStat = SAVE.loadVar(data, "pickedPersonalityStat", "")
