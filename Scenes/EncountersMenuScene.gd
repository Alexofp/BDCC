extends SceneBase

var pickedPoolToForget = ""

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
		
		if(hasSomeoneToForget):
			addButton("Forget", "Pick which character you wanna forget", "forgetmenu")
		else:
			addDisabledButton("Forget", "You haven't met anyone that you can forget")
		
		addButton("Toggle known", "Toggle between meeting only old characters and meeting both old and new", "toggleKnown")
		
		addButton("Back", "Close this menu", "endthescene")

	if(state == "forgetmenu"):
		var encounterPools = GM.main.getDynamicCharactersPools()

		saynn("Select which occupation the character that you wanna forget has.")

		for encounterPoolID in encounterPools:
			addButton(str(encounterPoolID), "Pick this occupation", "forgetmenupool", [encounterPoolID])
		
		addButton("Back", "Go back a level", "")
		
	if(state == "forgetmenupool"):
		saynn("Pick who do you wanna forget. They will never show up again. This action can not be undone.")
		
		saynn("Keep in mind that if this character is pregnant, their pregnancy will be forgotten too. But any kids you had together will stay.")
		
		addButton("Back", "Go back a level", "forgetmenu")
		
		var characterIDS = GM.main.getDynamicCharacterIDsFromPool(pickedPoolToForget)
		for characterID in characterIDS:
			var dynamicCharacter:DynamicCharacter = GlobalRegistry.getCharacter(characterID)
			if(dynamicCharacter == null):
				continue
			
			addButton(dynamicCharacter.getName(), dynamicCharacter.getSmallDescription(), "forget", [dynamicCharacter.getID()])

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "toggleKnown"):
		setFlag("PreferKnownEncounters", !getFlag("PreferKnownEncounters", false))
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

	return data
	
func loadData(data):
	.loadData(data)
	
	pickedPoolToForget = SAVE.loadVar(data, "pickedPoolToForget", "")
