extends "res://Scenes/SceneBase.gd"
var unlockedRestraintID = ""
var actionText = ""
var struggleText = ""
var additionalStruggleText = ""
var canKeepTheRestraint = false
var keptRestraintID = ""
var keyGameTries: int = 3
var keyGameValue: int = 50
var keyText = ""
var fightMode = false
var restraintID = ""
var shouldPlayAnimations = true

#var minigameScene = preload("res://Game/Minigames/Struggling/StrugglingGame.tscn")
var minigameScene = preload("res://Game/Minigames/ClickAtTheRightTime/ClickAtTheRightTime.tscn")

func _init():
	sceneID = "StrugglingScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		fightMode = _args[0]
	if(_args.size() > 1):
		shouldPlayAnimations = _args[1]
	
	var allItems = GM.pc.getInventory().getAllEquippedItems()
	for itemSlot in allItems:
		var item: ItemBase = allItems[itemSlot]
		if(item.isRestraint()):
			item.getRestraintData().resetOnNewTry()

func _run():
	if(state == ""):
		if(shouldPlayAnimations):
			playAnimation(StageScene.Solo, "stand")
		
		var isBlind = GM.pc.isBlindfolded()
		saynn("Pick the restraint you wanna focus on. Keep in mind that some restraints will be harder to remove depending on what you have on. Crying from pain or moaning loudly from an orgasm will probably attract someone")
		
		if(GM.pc.getInventory().hasItemID("restraintkey")):
			addButtonAt(13, "Use key", "Use one of your restraint keys to unlock something", "usekey")
		else:
			addDisabledButtonAt(13, "Use key", "You don't have any restraint keys")
		addButtonAt(14, "Give up", "Stop struggling", "endthescenedidnothing")
		
		for item in GM.pc.getInventory().getEquppedRestraints():
			var restraintData: RestraintData = item.getRestraintData()
			
			sayn(item.getVisibleName()+", restraint level: "+restraintData.getVisibleLevel(isBlind))
			#sayn("- Durability: "+restraintData.getVisibleDurability())
			saynn("- Tightness: "+restraintData.getVisibleTightness()+" ("+restraintData.getTightnessPercentString()+")")
			
			if(!restraintData.canStruggle()):
				continue
			
			if(GM.pc.getStamina() > 0):
				addButton(item.getVisibleName(), "Focus on this restraint", "startStruggleAgainst", [item.getUniqueID()])
			else:
				addDisabledButton(item.getVisibleName(), "You are out of stamina")

		
		#generateActions()
		
	if(state == "usekey"):
		var keyAmount = GM.pc.getInventory().getAmountOf("restraintkey")
		saynn("You have "+str(keyAmount)+" "+Util.multipleOrSingularEnding(keyAmount, "key")+". Each one can unlock one piece of gear.")
		saynn("Which restraint do you wanna unlock.")

		for item in GM.pc.getInventory().getEquppedRestraints():
			var restraintData: RestraintData = item.getRestraintData()
			if(!restraintData.canUnlockWithKey()):
				addDisabledButton(item.getVisibleName(), "This restraint doesn't seem to have a keyhole")
				continue
			addButton(item.getVisibleName(), item.getVisisbleDescription(), "dounlock", [item.getUniqueID()])
		addButton("Back", "You don't wanna unlock anything", "")

	if(state == "keyminigame"):
		saynn("Since you can't use your fingers you have to carefully balance the key between your palms and guide it towards the lock.")
		
		saynn("To succsessfully unlock the restraint you have to guess a number between 1 and 15. You have "+str(keyGameTries)+" "+Util.multipleOrSingularEnding(keyGameTries, "try", "tries")+" left")

		if(keyText != ""):
			saynn(keyText)

		#addTextbox("key_number")
		
		#addButton("Guess", "Try and guess this number", "key_guess")
		for _i in range(1, 16):
			addButton(str(_i), "Try this number", "key_guess", [_i])

	if(state == "keyminigameFailed"):
		saynn("Oops, you dropped the key and it broke. There goes that.")
		
		addButton("Continue", "Heck", "checkifokay")

	if(state == "startStruggleAgainst"):
		var item = GM.pc.getInventory().getItemByUniqueID(restraintID)
		var restraintData: RestraintData = item.getRestraintData()
		
		if(shouldPlayAnimations):
			var animToPlay = restraintData.getResistAnimation()
			if(animToPlay != null && animToPlay != ""):
				playAnimation(StageScene.Solo, animToPlay)
		
		var game = minigameScene.instance()
		GM.ui.addCustomControl("minigame", game)
		game.setDifficulty(restraintData.getLevel())
		game.connect("minigameCompleted", self, "onMinigameCompleted")
		if(GM.pc.hasPerk(Perk.BDSMInstantEscape) && game.has_method("instantEscapePerk")):
			game.instantEscapePerk()
		if(GM.pc.isBlindfolded() && game.has_method("setIsBlindfolded")):
			game.setIsBlindfolded(true)
		if(GM.pc.hasPerk(Perk.BDSMPerfectStreak) && game.has_method("setHasAdvancedPerk")):
			game.setHasAdvancedPerk(true)
		
		addButton("Give up", "Give up the struggle and lose 10 stamina", "giveupstruggle")

	if(state == "struggleAgainst"):
		saynn(struggleText)
		
		if(additionalStruggleText != ""):
			saynn(additionalStruggleText)
		
		if(canKeepTheRestraint):
			saynn("Do you wanna keep it?")
			
			addButton("Keep it", "Keep the restraint in your inventory", "checkifokay")
			addButton("No", "Throw it away", "getridandcheckifokay")
		else:
			addButton("Continue", "Okay", "checkifokay")
		

	if(state == "orgasm"):
		saynn("It's too much, you arch your back and moan loudly as you cum. You were so loud that someone might have heard that. (Temporary text)")
		
		addButton("Continue", "Oh no", "spottedcheck")

	if(state == "notspotted"):
		saynn("Seems like no one saw or heard you. Phew")
		
		if(GM.pc.getPain() >= GM.pc.painThreshold()):
			saynn("But you can't continue, you're in too much pain")
			
			addButton("Continue", "Aw", "endthescene")
		else:
			addButton("Continue", "Good", "")
		
	if(state == "toolusty"):
		saynn("You are too aroused to be able to escape from restraints")
		
		addButton("Continue", "Oh no", "endthescene")#"spottedcheck")
		
	if(state == "toopainful"):
		saynn("It's too painful! You let out a desperate cry. You were so loud that someone might have heard that. (Temporary text)")

		addButton("Continue", "Oh no", "endthescene")
		
	if(state == "unlockedGear"):
		saynn("You successfully unlocked the restraint. The key snaps in half, rendering it useless")
		
		addButton("Continue", "Good", "checkifokay")

func onMinigameCompleted(result):
	GM.main.pickOption("struggleAgainst", [restraintID, result])
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "endthescenedidnothing"):
		endScene([false])
		return
		
	if(_action == "giveupstruggle"):
		GM.pc.addStamina(-10)
		restraintID = ""
		setState("")
		return
		
	if(_action == "startStruggleAgainst"):
		var item = GM.pc.getInventory().getItemByUniqueID(_args[0])
		var restraintData: RestraintData = item.getRestraintData()
		
		if(!restraintData.shouldDoStruggleMinigame(GM.pc)):
			_action = "struggleAgainst"
		else:
			restraintID = _args[0]

	if(_action == "struggleAgainst"):
		var item = GM.pc.getInventory().getItemByUniqueID(_args[0])
		var restraintData: RestraintData = item.getRestraintData()
		var minigameStatus = 1.0
		var finalMinigameStatus = 1.0
		
		var instantUnlock = false
		if(_args.size() > 1):
			finalMinigameStatus = float(_args[1])
			
			if(float(_args[1]) >= 100.0):
				instantUnlock = true
				finalMinigameStatus = 1.0
			var minigameResult = float(_args[1])
			minigameStatus = pow(minigameResult, 1.5) * 2.0
			if(minigameResult >= 1.0 && GM.pc.hasPerk(Perk.BDSMBetterStruggling)):
				minigameStatus *= 2.0
		
		var damage = 0.0
		var addLust = 0
		var addPain = 0
		var addStamina = 0
		
		var struggleData = restraintData.doStruggle(GM.pc, minigameStatus)
		if(struggleData.has("damage")):
			damage = struggleData["damage"] * minigameStatus
			if(damage > 0.0 && instantUnlock):
				damage = 1.0
		if(struggleData.has("lust") && struggleData["lust"] > 0):
			addLust = struggleData["lust"]
		if(struggleData.has("pain") && struggleData["pain"] > 0):
			addPain = struggleData["pain"]
		if(struggleData.has("stamina") && struggleData["stamina"] != 0):
			addStamina = struggleData["stamina"]
		
		struggleText = struggleData["text"]
		
		if(!fightMode):
			var turnData = GM.pc.processStruggleTurn(true)
			damage += turnData["damage"]
			addLust += turnData["lust"]
			addPain += turnData["pain"]
			addStamina += turnData["stamina"]
			additionalStruggleText = turnData["text"]
			
		if(damage < 1.0):
			var mult = 4
			if(fightMode):
				mult = 5
			# 20 xp for struggling out of a level 5 restraint. 25 xp if you're doing it during combat
			
			GM.pc.addSkillExperience(Skill.BDSM, restraintData.getLevel() * mult)
			
		if(damage != 0.0):
			restraintData.takeDamage(damage)
			addMessage("You made "+str(Util.roundF(damage*100.0, 1))+"% of progress ("+str(Util.roundF(finalMinigameStatus*100.0, 1))+"% efficiency)")
		if(addLust != 0):
			addLust = GM.pc.receiveDamage(DamageType.Lust, addLust)
			addMessage("You received "+str(addLust)+" lust")
		if(addPain != 0):
			addPain = GM.pc.receiveDamage(DamageType.Physical, addPain)
			addMessage("You received "+str(addPain)+" pain")
		if(addStamina != 0):
			GM.pc.addStamina(-addStamina)
			
			if(addStamina < 0):
				addMessage("You gained "+str(-addStamina)+" stamina")
			else:
				addMessage("You used "+str(addStamina)+" stamina")
		
		canKeepTheRestraint = false
		if(restraintData.shouldBeRemoved()):
			struggleText += "\n[b]"+restraintData.getRemoveMessage()+"[/b]"
			restraintData.onStruggleRemoval()
			GM.pc.getInventory().removeEquippedItem(item)
			
			if(!restraintData.alwaysBreaksWhenStruggledOutOf() && (GM.pc.hasPerk(Perk.BDSMCollector) || restraintData.alwaysSavedWhenStruggledOutOf())):
				canKeepTheRestraint = true
			
				GM.pc.getInventory().addItem(item)
				keptRestraintID = item.getUniqueID()
		
		processTime(1*60)
		
	if(_action == "getridandcheckifokay"):
		var item = GM.pc.getInventory().getItemByUniqueID(keptRestraintID)
		if(item != null):
			GM.pc.getInventory().removeItem(item)
		
	if(_action == "checkifokay" || _action == "getridandcheckifokay"):
		if(fightMode):
			endScene()
			return
		
		#if(GM.pc.getLust() >= GM.pc.lustThreshold()):
		#	setState("toolusty")
			#setState("orgasm")
			#GM.pc.orgasmFrom("pc")
		#	return
		#if(GM.pc.getPain() >= GM.pc.painThreshold()):
		#	setState("toopainful")
		#	return
		setState("")
		return
		
	if(_action == "spottedcheck"):
		setState("notspotted")
		return
		
	if(_action == "dounlock"):
		unlockedRestraintID = _args[0]
		var item = GM.pc.getInventory().getItemByUniqueID(unlockedRestraintID)
		var restraintData: RestraintData = item.getRestraintData()
		
		GM.pc.getInventory().removeXOfOrDestroy("restraintkey", 1)
		if(!GM.pc.hasBlockedHands() && !GM.pc.hasBoundArms()):
			if(restraintData == null || restraintData.alwaysBreaksWhenStruggledOutOf()):
				GM.pc.getInventory().removeEquippedItem(item)
			else:
				GM.pc.getInventory().unequipItem(item)
			setState("unlockedGear")
		else:
			keyGameTries = 3
			if(GM.pc.hasPerk(Perk.BDSMBetterKeys)):
				keyGameTries += 2
			keyGameValue = RNG.randi_range(1, 15)
			keyText = ""
			setState("keyminigame")
		return
		
	if(_action == "key_guess"):
		
#		var textboxText = getTextboxData("key_number")
#		if(textboxText == "" || !textboxText.is_valid_integer()):
#			keyText = ""
#			setState("keyminigame")
#			return
		
		var number = _args[0]#int(textboxText)
		if(number == keyGameValue):
			var item = GM.pc.getInventory().getItemByUniqueID(unlockedRestraintID)
			var restraintData: RestraintData = item.getRestraintData()
			if(restraintData == null || restraintData.alwaysBreaksWhenStruggledOutOf()):
				GM.pc.getInventory().removeEquippedItem(item)
			else:
				GM.pc.getInventory().unequipItem(item)
			setState("unlockedGear")
			return
		
		var diff = abs(number - keyGameValue)
		if(number > keyGameValue):
			if(diff >= 8):
				keyText = str(number)+" is not even close. You almost dropped the key right there"
			elif(diff >= 5):
				keyText = str(number)+" is way too much"
			elif(diff >= 3):
				keyText = str(number)+" is too much"
			elif(diff >= 2):
				keyText = str(number)+" is too much but you feel that you're pretty close"
			else:
				keyText = str(number)+" is very close."
		if(number < keyGameValue):
			if(diff >= 8):
				keyText = str(number)+" is not even close. You almost dropped the key right there"
			elif(diff >= 5):
				keyText = str(number)+" is way too little"
			elif(diff >= 3):
				keyText = str(number)+" is too little"
			elif(diff >= 2):
				keyText = str(number)+" is too little but you feel that you're pretty close"
			else:
				keyText = str(number)+" is very close."
		
		keyGameTries -= 1
		if(keyGameTries <= 0):
			setState("keyminigameFailed")
		else:
			setState("keyminigame")
		return
		
	setState(_action)

func resolveCustomCharacterName(_charID):
	if(_charID == "user"):
		return "pc"

func saveData():
	var data = .saveData()
	
	data["unlockedRestraintID"] = unlockedRestraintID
	data["actionText"] = actionText
	data["struggleText"] = struggleText
	data["additionalStruggleText"] = additionalStruggleText
	data["canKeepTheRestraint"] = canKeepTheRestraint
	data["keptRestraintID"] = keptRestraintID
	data["keyGameTries"] = keyGameTries
	data["keyGameValue"] = keyGameValue
	data["keyText"] = keyText
	data["fightMode"] = fightMode
	data["restraintID"] = restraintID
	data["shouldPlayAnimations"] = shouldPlayAnimations
	
	return data
	
func loadData(data):
	.loadData(data)
	
	unlockedRestraintID = SAVE.loadVar(data, "unlockedRestraintID", "")
	actionText = SAVE.loadVar(data, "actionText", "")
	struggleText = SAVE.loadVar(data, "struggleText", "")
	additionalStruggleText = SAVE.loadVar(data, "additionalStruggleText", "")
	canKeepTheRestraint = SAVE.loadVar(data, "canKeepTheRestraint", false)
	keptRestraintID = SAVE.loadVar(data, "keptRestraintID", "")
	keyGameTries = SAVE.loadVar(data, "keyGameTries", 3)
	keyGameValue = SAVE.loadVar(data, "keyGameValue", 7)
	keyText = SAVE.loadVar(data, "keyText", "")
	fightMode = SAVE.loadVar(data, "fightMode", false)
	restraintID = SAVE.loadVar(data, "restraintID", "")
	shouldPlayAnimations = SAVE.loadVar(data, "shouldPlayAnimations", true)
