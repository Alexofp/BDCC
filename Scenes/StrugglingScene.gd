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
		addButtonAt(14, "Back", "Stop struggling", "endthescenedidnothing")
		
		for item in GM.pc.getInventory().getEquppedRestraints():
			var restraintData: RestraintData = item.getRestraintData()
			
			
			#sayn("- Durability: "+restraintData.getVisibleDurability())
			if(!restraintData.hasSmartLock()):
				sayn(item.getVisibleName()+", restraint level: "+restraintData.getVisibleLevel(isBlind))
				saynn("- Tightness: "+restraintData.getVisibleTightness()+" ("+restraintData.getTightnessPercentString()+")")
			else:
				sayn(item.getVisibleName()+", SMART-LOCKED")
				var smartLock:SmartLockBase = restraintData.getSmartLock()
				var canBeSimplyRemoved = smartLock.canBeSimpleRemoved()
				saynn("- "+smartLock.getName()+": "+smartLock.getUnlockDescription()+(("\nUNLOCKED. Can be removed") if canBeSimplyRemoved else ""))
				if(canBeSimplyRemoved):
					var minigameResult = MinigameResult.new()
					minigameResult.score = 1.0
					minigameResult.instantUnlock = true
					addButton(item.getVisibleName(), "Take off this restraint", "struggleAgainst", [item.getUniqueID(), minigameResult])
				elif(smartLock.id == SmartLock.TightLock):
					addButton(item.getVisibleName(), "See what item you can use to unlock the tight-lock", "tightlock", [item.getUniqueID()])
				continue
			
			if(!restraintData.canStruggleFinal()):
				continue
			
			if(GM.pc.getStamina() > 0):
				addButton(item.getVisibleName(), "Focus on this restraint", "startStruggleAgainst", [item.getUniqueID()])
			else:
				addDisabledButton(item.getVisibleName(), "You are out of stamina")

		
		#generateActions()
		
	if(state == "tightlock"):
		var item:ItemBase = GM.pc.getInventory().getItemByUniqueID(restraintID)
		var restraintData: RestraintData = item.getRestraintData()
		var requiredItemID:String = restraintData.getTightLockRequiredItemID()
		var reqItem:ItemBase = GlobalRegistry.getItemRef(requiredItemID)
		if(reqItem == null):
			saynn("Something went wrong :(")
			addButton("Continue", "Oh well", "endthescene")
		
		saynn("The "+item.getVisibleName()+" that you are wearing has a tight-lock attached to it.")
		
		saynn("To unlock it, you must use this item: "+reqItem.getVisibleName())
		
		saynn("The item will be consumed in the process, the restraint will be destroyed.")
		
		saynn("Which item do you want to use?")
		
		addButton("Cancel", "You changed your mind", "")
		for invitem in GM.pc.getInventory().getItems():
			if(invitem.id == requiredItemID):
				addButton(invitem.getVisibleName(), invitem.getVisibleDescription(), "tightlock_unlockwith", [invitem])
	
	if(state == "tightlock_unlocked"):
		saynn(actionText)
		
		addButton("Continue", "See what happens next", "checkifokay")
		
	if(state == "usekey"):
		var keyAmount = GM.pc.getInventory().getAmountOf("restraintkey")
		saynn("You have "+str(keyAmount)+" "+Util.multipleOrSingularEnding(keyAmount, "key")+". Each one can unlock one piece of gear (Unless it has a smart-lock attached to it).")
		saynn("Which restraint do you wanna unlock.")

		for item in GM.pc.getInventory().getEquppedRestraints():
			var restraintData: RestraintData = item.getRestraintData()
			if(restraintData.hasSmartLock()):
				var smartLock:SmartLockBase = restraintData.getSmartLock()
				
				if(!smartLock.canBeUnlockedWithKeys()):
					addDisabledButton(item.getVisibleName(), "The SmartLock on this restraint can not be unlocked with restraint keys..")
					continue
				
				var howManyKeysToUnlock = smartLock.getKeysAmountToUnlock()
				if(keyAmount >= howManyKeysToUnlock):
					addButton(item.getVisibleName(), "Restraint keys required to unlock: "+str(howManyKeysToUnlock), "dounlock", [item.getUniqueID()])
				else:
					addDisabledButton(item.getVisibleName(), "Restraint keys required to unlock: "+str(howManyKeysToUnlock))
				continue
			
			if(!restraintData.canUnlockWithKey()):
				addDisabledButton(item.getVisibleName(), "This restraint doesn't seem to have a keyhole")
				continue
			addButton(item.getVisibleName(), item.getVisisbleDescription(), "dounlock", [item.getUniqueID()])
		addButton("Back", "You don't wanna unlock anything", "")

	if(state == "keyminigame"):
		saynn("Since you can't use your fingers you have to carefully balance the key between your palms and guide it towards the lock.")
		
		saynn("To successfully unlock the restraint you have to guess a number between 1 and 15. You have "+str(keyGameTries)+" "+Util.multipleOrSingularEnding(keyGameTries, "try", "tries")+" left")

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
		if(OPTIONS.isHardStruggleEnabled()):
			game.setHardStruggleEnabled(true)
		if(GM.pc.hasPerk(Perk.BDSMInstantEscape) && game.has_method("instantEscapePerk")):
			game.instantEscapePerk()
		if(GM.pc.isBlindfolded() && game.has_method("setIsBlindfolded")):
			game.setIsBlindfolded(true)
		if(GM.pc.hasPerk(Perk.BDSMPerfectStreak) && game.has_method("setHasAdvancedPerk")):
			game.setHasAdvancedPerk(true)
		
		game.setDifficulty(restraintData.getLevel())
		game.connect("minigameCompleted", self, "onMinigameCompleted")
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

func onMinigameCompleted(result:MinigameResult):
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
		
	if(_action == "tightlock"):
		restraintID = _args[0]
		
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
		
		var minigameResult:MinigameResult
		if(_args.size() > 1):
			minigameResult = _args[1]
			
			if(minigameResult.score >= 1.0 && GM.pc.hasPerk(Perk.BDSMBetterStruggling)):
				minigameResult.score *= 2.0
		else:
			minigameResult = MinigameResult.new()
			minigameResult.score = 1.0
		
		var minigameScore:float = minigameResult.score
		var instantUnlock:bool = minigameResult.instantUnlock
		var fatallFail:bool = minigameResult.failedHard
		
		var damage = 0.0
		var addLust = 0
		var addPain = 0
		var addStamina = 0

		var struggleData = restraintData.doStruggle(GM.pc, minigameResult)
		
		if(struggleData.has("damage")):
			damage = struggleData["damage"]
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
			
		# less xp without progression more in combat
		if(!instantUnlock && damage > 0.0 && damage < 1.0):
			var mult = 4
			if fightMode:
				mult = 5
			GM.pc.addSkillExperience(Skill.BDSM, restraintData.getLevel() * mult)
			
		if(fatallFail):
			addMessage("You tried really hard but you completely failed.")
		if(damage < 0.0):
			restraintData.takeDamage(damage)
			addMessage("You lost "+str(Util.roundF(-damage*100.0, 1))+"% of progress")
		if(damage > 0.0):
			restraintData.takeDamage(damage)
			addMessage("You made "+str(Util.roundF(damage*100.0, 1))+"% of progress ("+str(Util.roundF(minigameScore*100.0, 1))+"% efficiency)")
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
		
		var howManyKeysToRemove:int = 1
		if(restraintData.hasSmartLock()):
			howManyKeysToRemove = restraintData.getSmartLock().getKeysAmountToUnlock()
		
		GM.pc.getInventory().removeXOfOrDestroy("restraintkey", howManyKeysToRemove)
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
	
	if(_action == "tightlock_unlockwith"):
		var item = GM.pc.getInventory().getItemByUniqueID(restraintID)
		var restraintData: RestraintData = item.getRestraintData()
		GM.pc.getInventory().removeEquippedItem(item)
		GM.pc.getInventory().removeItem(_args[0])
		actionText = restraintData.getTightLockUnlockMessage()
		setState("tightlock_unlocked")
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

func supportsShowingPawns() -> bool:
	return true
