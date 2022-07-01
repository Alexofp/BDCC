extends SceneBase

var enemyID: String = ""
var enemyCharacter: BaseCharacter

var whatPlayerDid: String = ""
var whatEnemyDid: String = ""
var whatHappened: String = ""
var battleState = ""
var battleEndedHow = ""
var savedAIAttackID = ""
var battleName = ""
var currentAttackerID = ""
var currentReceiverID = ""
var enemyAIStrategy: AIStrategyBase

func _init():
	sceneID = "FightScene"

func _initScene(_args = []):
	enemyID = _args[0]
	enemyCharacter = GlobalRegistry.getCharacter(enemyID)
	enemyCharacter.beforeFightStarted()
	setFightCharacter(enemyID)
	
	if(_args.size() > 1):
		battleName = _args[1]
		
	enemyAIStrategy = enemyCharacter.getAiStrategy(battleName)
	enemyAIStrategy.onBattleStart(GM.pc)
	
	GM.pc.beforeFightStarted()
	if(GM.pc.getLustCombatState() != null):
		GM.pc.getLustCombatState().setEnemyID(enemyID)

func _run():
	updateFightCharacter()
	if(state == ""):
		saynn(enemyCharacter.getFightIntro(battleName))
		#setState("fighting")
	elif(state == "fighting"):
		#say("And so the fight continues")
		pass
		
	if(state == "lost" || state == "win"):		
		saynn("The fight has ended")
	
	if(state == "physattacks"):
		saynn("Pick the attack to use")
		
		addAttackButtons(Attack.Category.Physical)
		
		addButton("Back", "Back to fighting", "return")
	
	if(state == "lustattacks"):
		saynn("Pick how you wanna tease the enemy")
		
		var enemyLustInterests = enemyCharacter.getLustInterests()
		if(!enemyLustInterests.hasAnyInterests()):
			sayn("You have a feeling that teasing won't have any effect on "+enemyCharacter.getName())
		else:
			var whatPlayerKnows = enemyLustInterests.getPlayerKnowledge()
			
			sayn("What you learned about "+enemyCharacter.getName()+"'s likes/dislikes:")
			if(whatPlayerKnows.size() > 0):
				for topicID in whatPlayerKnows:
					var topic = GlobalRegistry.getLustTopic(topicID)
					sayn("- "+enemyCharacter.getName() + " [color="+Interest.getColorString(whatPlayerKnows[topicID])+"]" + Interest.getVisibleName(whatPlayerKnows[topicID])+"[/color] seeing "+str(topic.getVisibleName(topicID)))
			else:
				sayn("- Nothing yet")
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		addLustActionsButtons(lustCombatState, lustCombatState.getActionsSorted())
		
		setPlayerAsAttacker()
		sayn("")
		for activity in lustCombatState.getAllText():
			sayn(activity)
		#addAttackButtons(Attack.Category.Lust)
		
		addButton("Back", "Back to fighting", "return")
	
	if(state == "specialattacks"):
		saynn("Pick the attack to use")
		
		addAttackButtons(Attack.Category.Special)
		
		addButton("Back", "Back to fighting", "return")
	
	if(state == "inventory"):
		saynn("Pick the item to use")
	
		var playerInventory = GM.pc.getInventory()
		var usableItems = playerInventory.getAllCombatUsableItems()
		
		for item in usableItems:
			var intoxic = item.addsIntoxicationToPC()
			
			if(intoxic <= 0 || GM.pc.canIntoxicateMore(intoxic)):
				addButton(item.getVisibleName(), item.getCombatDescription(), "useitem", [item])
			else:
				addDisabledButton(item.getVisibleName(), "[color=red]Too intoxicated to use this[/color]\n"+item.getCombatDescription())
	
		addButton("Back", "Back to fighting", "return")
	
	if(state == "playerMustDodge"):
		if(whatPlayerDid != ""):
			saynn(whatPlayerDid)
			
		if(whatHappened != ""):
			saynn(whatHappened)
	
	if(state == "" || state == "fighting" || state == "lost" || state == "win"):	
		if(whatPlayerDid != ""):
			saynn(whatPlayerDid)
			
		if(whatEnemyDid != ""):
			saynn(whatEnemyDid)
			
		if(whatHappened != ""):
			saynn(whatHappened)
			
	if(state == "fighting"):
		saynn(enemyCharacter.getFightState(battleName))
		
		saynn(GM.pc.getFightState(battleName))
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		for activity in lustCombatState.getAllText():
			sayn(activity)
			
	if(state == "playerMustDodge"):
		var attack: Attack = GlobalRegistry.getAttack(savedAIAttackID)
		
		setEnemyAsAttacker()
		if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness() && !attack.canSeeAnticipationTextWhenBlind()):
			saynn(GM.ui.processString(attack.canBlindAnticipationText(enemyCharacter, GM.pc)))
		else:
			saynn(GM.ui.processString(attack.getAnticipationText(enemyCharacter, GM.pc)))
		addButton("Do nothing", "You don't counter the attack in any way", "dodge_donothing")
		if(GM.pc.getStamina() > 0 && !GM.pc.hasEffect(StatusEffect.Collapsed)):
			addButton("Dodge", "You dodge a physical attack completely spending 30 stamina in the process", "dodge_dodge")
		else:
			addDisabledButton("Dodge", "You need more stamina for this")
		if(GM.pc.getStamina() > 0):
			if(GM.pc.hasPerk(Perk.CombatBetterBlock)):
				addButton("Block", "You gain 50 additional physical armor against the attack while spending 15 stamina", "dodge_block")
			else:
				addButton("Block", "You gain 20 additional physical armor against the attack while spending 15 stamina", "dodge_block")
		else:
			addDisabledButton("Block", "You need more stamina for this")
		if(GM.pc.getStamina() > 0):
			if(GM.pc.hasPerk(Perk.SexBetterDefocus)):
				addButton("Defocus", "You try to distract yourself from the fight, gaining 100 lust armor and spending 15 stamina", "dodge_defocus")
			else:
				addButton("Defocus", "You try to distract yourself from the fight, gaining 20 lust armor and spending 15 stamina", "dodge_defocus")
		else:
			addDisabledButton("Defocus", "You need more stamina for this")
		
	if(state == "" || state == "fighting"):		
		addButtonWithChecks("Physical Attack", "Show a list of physical attacks that you can do", "physattacks", [], [ButtonChecks.NotStunned])
		addButtonWithChecks("Lust Attack", "Show a list of lewd actions that you can do", "lustattacks", [], [ButtonChecks.NotStunned])
		
		if(pcHasAnyAttacksOfCategory(Attack.Category.Special)):
			addButtonWithChecks("Special", "Show a list of your special moves", "specialattacks", [], [ButtonChecks.NotStunned])
		else:
			addDisabledButton("Special", "You don't know any special moves")
		
		#addButton("Inspect", "Look closer", "inspect")
		if(GM.pc.getInventory().hasRemovableRestraints()):
			addButtonWithChecks("Struggle", "Struggle against your restraints", "struggle", [], [ButtonChecks.NotStunned])
		else:
			addDisabledButton("Struggle", "You don't have any restraints that you can struggle out of")
		addButton("Wait", "Do nothing", "wait")
		
		if(GM.pc.getInventory().getAllCombatUsableItems().size() > 0):
			addButton("Inventory", "Use an item fron your inventory", "inventory")
		else:
			addDisabledButton("Inventory", "You don't have anything you can use in combat")
		
		if(GM.pc.hasEffect(StatusEffect.Collapsed)):
			if(GM.pc.canStandUpCombat()):
				addButtonWithChecks("Get up", "spends the whole turn", "getup", [], [ButtonChecks.NotStunned])
			else:
				addDisabledButton("Get up", "You can't stand up now")
		else:
			addDisabledButton("Get up", "You're already standing")
		
		addButton("Submit", "Give up", "submit")
		
	if(state == "lost" || state == "win"):		
		addButton("Continue", "the battle has ended", "endbattle")
		
	if(state == "lustCombatAboutToCum"):
		saynn(whatPlayerDid)
		
		saynn("You're about to cum..")
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		addLustActionsButtons(lustCombatState, lustCombatState.getOrgasmActionsSorted())
		
	if(state == "lustCombatAfterCame"):
		saynn(whatPlayerDid)
		
		addButton("Continue", "You're not done yet", "")
		addButton("Stop", "That's enough for now..", "endthescene")

func _react(_action: String, _args):
	if(_action == "struggle"):
		runScene("StrugglingScene", [true], "struggle_scene")
		return
		
	if(_action == "physattacks" || _action == "lustattacks" || _action == "specialattacks" || _action == "selfhumattacks" || _action == "humattacks" || _action == "inventory"):
		setState(_action)
		return
		
	if(_action == "return"):
		setState("fighting")
		return
	
	if(_action == "doattack"):
		setState("fighting")
		beforeTurnChecks()
		
		var attackID = _args[0]
		whatPlayerDid += doPlayerAttack(attackID)
		whatEnemyDid += aiTurn()

		afterTurnChecks()
		return
		
	if(_action == "useitem"):
		beforeTurnChecks()
		
		var item = _args[0]
		whatPlayerDid += item.useInCombatWithBuffs(GM.pc, enemyCharacter)
		whatEnemyDid += aiTurn()

		afterTurnChecks()
		return
	
	if(_action == "getup"):
		beforeTurnChecks()
		
		whatPlayerDid += doPlayerAttack("trygetupattack")
		
		whatEnemyDid += aiTurn()

		afterTurnChecks()
		return
	
	if(_action == "attack"):
		beforeTurnChecks()
		
		whatPlayerDid = "It's your turn to attack\n"
		
		#enemyCharacter.receivePain(10)
		#whatPlayerDid += "\n"+enemyCharacter._getName()+" received 10 damage!"
		whatPlayerDid += doPlayerAttack("simplekickattack")
		
		whatEnemyDid += aiTurn()

		afterTurnChecks()
		return
	if(_action == "wait"):
		beforeTurnChecks()
		
		whatPlayerDid = "You decide to wait for a good moment to attack"
		
		whatEnemyDid += aiTurn()
		
		afterTurnChecks()
		return
		
	if(_action == "dodge_donothing" || _action == "dodge_dodge" || _action == "dodge_block" || _action == "dodge_defocus"):
		setState("fighting")
		whatHappened = ""
		if(_action == "dodge_donothing"):
			whatPlayerDid = "You decide to let the attack happen"
		if(_action == "dodge_dodge"):
			whatPlayerDid = "You focus on enemy's next attack and try to dodge it"
			GM.pc.setFightingStateDodging()
			GM.pc.addStamina(-30)
		if(_action == "dodge_block"):
			whatPlayerDid = "You try to block the next attack"
			GM.pc.setFightingStateBlocking()
			GM.pc.addStamina(-15)
		if(_action == "dodge_defocus"):
			whatPlayerDid = "You try to get distracted"
			GM.pc.setFightingStateDefocusing()
			GM.pc.addStamina(-15)
		
		var attack: Attack = GlobalRegistry.getAttack(savedAIAttackID)
		if(attack == null):
			assert(false, "Bad attack: "+savedAIAttackID)
			
		setEnemyAsAttacker()
		whatEnemyDid += GM.ui.processString(attack.doAttack(enemyCharacter, GM.pc))
		savedAIAttackID = ""
		
		GM.pc.setFightingStateNormal()
		
		afterTurnChecks()
		return
	
	if(_action == "submit"):
		setState("lost")
		whatHappened = "You give up the fight willingly and submit to your enemy\n"
		battleState = "lost"
		GM.main.playAnimation(StageScene.Solo, "kneel")
		return
	
	if(_action == "endbattle"):
		enemyCharacter.afterFightEnded()
		GM.pc.afterFightEnded()
		if(battleEndedHow == ""):
			battleEndedHow = "pain"
		if(battleState == "win"):
			var loot = enemyCharacter.getLoot(battleName)
			if((loot.has("credits") && loot["credits"] > 0) || (loot.has("items") && loot["items"].size() > 0)):
				runScene("LootingScene", [loot], "lootingscene")
			else:
				endScene([battleState, battleEndedHow])
		else:
			endScene([battleState, battleEndedHow])
		return
	
	if(_action == "doLustAction"):
		setState("fighting")
		var actionData = _args[0]
		if(!(actionData["id"] in GlobalRegistry.getOrgasmLustActions())):
			beforeTurnChecks()
		setPlayerAsAttacker()
		
		var lustCombatState:LustCombatState = GM.pc.getLustCombatState()
		
		var result = lustCombatState.doAction(actionData)
		whatPlayerDid = GM.ui.processString(result["text"]).trim_suffix("\n\n")
		if("lust" in result):
			GM.pc.addLust(result["lust"])
		if("pain" in result):
			GM.pc.addPain(result["pain"])
		
		if("lustInterests" in result):
			var actionLustInterests = result["lustInterests"]
			var isTease = false
			if("isTease" in result):
				isTease = true
			
			var maxUnlocks = 1
			if(GM.pc.hasPerk(Perk.SexBetterTease)):
				maxUnlocks = 2
			
			var lustInterests: LustInterests = enemyCharacter.getLustInterests()
			var teaseData = lustInterests.reactLustAction(GM.pc, actionLustInterests, maxUnlocks)
			#var damageMult = teaseData["value"]
			var positiveDamage = teaseData["positiveValue"]
			var negativeDamage = teaseData["negativeValue"]
			var learned = teaseData["learned"]
			#var alreadyKnownTopics = teaseData["alreadyKnownTopics"]
			
			var pcDamageMult = GM.pc.getDamageMultiplier(DamageType.Lust) + 1.0
			var damageBalanceMod = negativeDamage/pcDamageMult + positiveDamage*pcDamageMult
			if(damageBalanceMod > 0.0):
				damageBalanceMod = pow(damageBalanceMod, 0.7)
			if(damageBalanceMod < 0.0):
				damageBalanceMod = -pow(abs(damageBalanceMod), 0.7)
			var theDamage = damageBalanceMod*10.0*RNG.randf_range(0.9, 1.1)
			
			var extraText = ""
			if(isTease && enemyCharacter.getLustLevel() < 0.6 && theDamage > 0.0):
				theDamage *= 1.5
			if(isTease && enemyCharacter.getLustLevel() >= 0.6):
				theDamage *= 1.0
				extraText = "[b]Teasing is not effective, the enemy is too horny![/b] "
			
			var damage = enemyCharacter.receiveDamage(DamageType.Lust, int(round(theDamage)))
			
			whatPlayerDid += "\n\n"
			whatPlayerDid += enemyCharacter.lustDamageReaction(damage, GM.pc)
			whatPlayerDid += "\n"
			whatPlayerDid += extraText + enemyCharacter.getName()+" received [color="+DamageType.getColorString(DamageType.Lust)+"]"+str(damage)+" "+DamageType.getBattleName(DamageType.Lust)+"[/color]"
			
			if(learned.size() > 0):
				whatPlayerDid += "\n[i]You learned more about what "+enemyCharacter.getName()+" likes[/i]"
		
		#processTime(30)
		
		#if("came" in result):
		#	setState("lustCombatAfterCame")
		#	afterTurnChecks()
		#	return
		
		if("lostBattle" in result):
			GM.pc.addLust(GM.pc.lustThreshold())
			afterTurnChecks()
			return
			
		if(GM.pc.getLustLevel() >= 1.0):
			setState("lustCombatAboutToCum")
			#afterTurnChecks()
			return
			
		whatEnemyDid += aiTurn()
			
		afterTurnChecks()
		return
	
	setState(_action)

func addLustActionsButtons(lustCombatState:LustCombatState, theActions):
	for actionData in theActions:
		var lustAction:LustAction = GlobalRegistry.getLustAction(actionData["id"])
		
		if(!lustAction.shouldShow(lustCombatState, actionData)):
			continue
		var canDo = lustAction.canDo(lustCombatState, actionData)
		var reasonWhyCant = "You can't do this right now"
		if(canDo is Array):
			if(canDo.size() > 1):
				reasonWhyCant = canDo[1]
			canDo = canDo[0]
		
		if(canDo):
			addButton(lustAction.getVisibleName(lustCombatState, actionData), lustAction.getVisibleDescription(lustCombatState, actionData), "doLustAction", [actionData])
		else:
			addDisabledButton(lustAction.getVisibleName(lustCombatState, actionData), reasonWhyCant)
	

func doPlayerAttack(attackID):
	var attack: Attack = GlobalRegistry.getAttack(attackID)
	if(attack == null):
		assert(false, "Bad attack: "+attackID)
	
	setPlayerAsAttacker()
	var text = GM.ui.processString(attack.doAttack(GM.pc, enemyCharacter))
	var attackSoloAnim = attack.getAttackSoloAnimation()
	if(attackSoloAnim != null && attackSoloAnim != ""):
		GM.main.playAnimation(StageScene.Solo, attackSoloAnim)
	
	var expData = attack.getExperience()
	for expAdd in expData:
		GM.pc.addSkillExperience(expAdd[0], expAdd[1])
	
	return text

func getBestAIAttack():
	var savedAttacks = []
	var savedAttacksWeights = []
	
	var attacks = enemyCharacter.getAttacks()
	
	for attackID in attacks:
		var attack: Attack = GlobalRegistry.getAttack(attackID)
		if(attack == null):
			assert(false, "Bad attack: "+attackID)
		if(attack.canUse(enemyCharacter, GM.pc)):
			savedAttacks.append(attackID)
			savedAttacksWeights.append(attack.getAIScore(enemyCharacter, GM.pc))
	
	if(savedAttacks.size() == 0):
		print("Error: Couldn't find any possible attacks for the enemy")
		return "blunderAttack"
	
	return RNG.pickWeighted(savedAttacks, savedAttacksWeights)
	
func aiTurn():
	if(enemyCharacter.getPain() >= enemyCharacter.painThreshold() || enemyCharacter.getLust() >= enemyCharacter.lustThreshold()):
		return ""
	
	setEnemyAsAttacker()
	var enemyText = "It's "+enemyCharacter.getName()+"'s turn\n"
	if(enemyAIStrategy != null):
		var strategyText = enemyAIStrategy.turnPassed(GM.pc)
		if(strategyText != null && strategyText != ""):
			enemyText += GM.ui.processString(strategyText) + "\n\n"
	
	var attackID: String = ""
	var attack: Attack
	if(enemyAIStrategy != null):
		attackID = enemyAIStrategy.getNextAttackFinal(GM.pc)
		attack = GlobalRegistry.getAttack(attackID)
	if(attack == null):
		printerr("Bad attack "+str(attackID))
		attackID = "blunderAttack"
		attack = GlobalRegistry.getAttack(attackID)
		
	if(!attack.canBeDodgedByPlayer(enemyCharacter, GM.pc)):	
		enemyText += GM.ui.processString(attack.doAttack(enemyCharacter, GM.pc))
	else:
		savedAIAttackID = attackID
		setState("playerMustDodge")
	
	return enemyText

func beforeTurnChecks():
	whatPlayerDid = ""
	whatEnemyDid = ""
	whatHappened = ""
	
	GM.pc.processBattleTurn()
	enemyCharacter.processBattleTurn()
	
	var turnData = GM.pc.processStruggleTurn()
	#var damage = turnData["damage"]
	var addLust = turnData["lust"]
	var addPain = turnData["pain"]
	var addStamina = turnData["stamina"]
	var additionalStruggleText = turnData["text"]
	
	#if(damage != 0.0):
	#	restraintData.takeDamage(damage)
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
	
	whatHappened += additionalStruggleText
	
	if(state == ""):
		setState("fighting")

func afterTurnChecks():
	#GM.pc.processBattleTurn()
	#enemyCharacter.processBattleTurn()
	GM.pc.updateNonBattleEffects()
	
	var won = checkEnd()
	if(won == "lost"):
		setState("lost")
	if(won == "win"):
		setState("win")

func checkEnd():
	if(enemyCharacter.getPain() >= enemyCharacter.painThreshold()):
		whatHappened += "Enemy is in too much pain to continue\n"
		battleState = "win"
		battleEndedHow = "pain"
		return "win"
	if(enemyCharacter.getLust() >= enemyCharacter.lustThreshold()):
		whatHappened += "Enemy is too aroused to continue\n"
		battleState = "win"
		battleEndedHow = "lust"
		return "win"
	if(GM.pc.getPain() >= GM.pc.painThreshold()):
		whatHappened += "You succumb to pain\n"
		battleState = "lost"
		battleEndedHow = "pain"
		GM.main.playAnimation(StageScene.Solo, "defeat")
		return "lost"
	if(GM.pc.getLust() >= GM.pc.lustThreshold()):
		whatHappened += "You're too aroused to continue\n"
		battleState = "lost"
		battleEndedHow = "lust"
		GM.main.playAnimation(StageScene.Solo, "defeat")
		return "lost"
	
	return ""

func pcHasAnyAttacksOfCategory(category):
	var playerAttacks = GM.pc.getAttacks()
	for attackID in playerAttacks:
		var attack: Attack = GlobalRegistry.getAttack(attackID)
		if(attack == null):
			assert(false, "Bad attack: "+attackID)
		if(attack.category == category):
			return true
	return false
	

func addAttackButtons(category):
	var playerAttacks = GM.pc.getAttacks()
	for attackID in playerAttacks:
		var attack: Attack = GlobalRegistry.getAttack(attackID)
		if(attack == null):
			assert(false, "Bad attack: "+attackID)
		if(attack.category != category):
			continue
			
		var desc = attack.getRequirementsColorText(GM.pc, enemyCharacter)
		#if(desc != ""):
		#	desc += "\n"
		desc += attack.getVisibleDesc()
			
		if(attack.canUse(GM.pc, enemyCharacter)):
			addButton(attack.getVisibleName(),  desc, "doattack", [attack.id])
		else:
			addDisabledButton(attack.getVisibleName(),  desc)

func setPlayerAsAttacker():
	currentAttackerID = "pc"
	currentReceiverID = enemyID

func setEnemyAsAttacker():
	currentAttackerID = enemyID
	currentReceiverID = "pc"

func resolveCustomCharacterName(_charID):
	if(_charID == "attacker" && currentAttackerID != ""):
		return currentAttackerID
	if(_charID in ["receiver", "reciever"] && currentReceiverID != ""):
		return currentReceiverID
	
	return null

func _react_scene_end(_tag, _result):
	if(_tag == "struggle_scene"):
		setState("fighting")
		beforeTurnChecks()
		
		whatEnemyDid += aiTurn()

		afterTurnChecks()
	if(_tag == "lootingscene"):
		endScene([battleState, battleEndedHow])

func supportsBattleTurns():
	return true

func saveData():
	var data = .saveData()
	
	data["enemyID"] = enemyID
	data["whatPlayerDid"] = whatPlayerDid
	data["whatEnemyDid"] = whatEnemyDid
	data["whatHappened"] = whatHappened
	data["battleState"] = battleState
	data["battleEndedHow"] = battleEndedHow
	data["savedAIAttackID"] = savedAIAttackID
	data["battleName"] = battleName
	data["currentAttackerID"] = currentAttackerID
	data["currentReceiverID"] = currentReceiverID
	
	if(enemyAIStrategy != null):
		data["enemyStrategyData"] = enemyAIStrategy.saveData()
	
	return data
	
func loadData(data):
	.loadData(data)
	
	enemyID = SAVE.loadVar(data, "enemyID", "")
	whatPlayerDid = SAVE.loadVar(data, "whatPlayerDid", "")
	whatEnemyDid = SAVE.loadVar(data, "whatEnemyDid", "")
	whatHappened = SAVE.loadVar(data, "whatHappened", "")
	battleState = SAVE.loadVar(data, "battleState", "")
	battleEndedHow = SAVE.loadVar(data, "battleEndedHow", "")
	savedAIAttackID = SAVE.loadVar(data, "savedAIAttackID", "")
	enemyCharacter = GlobalRegistry.getCharacter(enemyID)
	setFightCharacter(enemyID)
	battleName = SAVE.loadVar(data, "battleName", "")
	currentAttackerID = SAVE.loadVar(data, "currentAttackerID", "")
	currentReceiverID = SAVE.loadVar(data, "currentReceiverID", "")
	
	enemyAIStrategy = enemyCharacter.getAiStrategy(battleName)
	enemyAIStrategy.setCharacterID(enemyID)
	enemyAIStrategy.loadData(SAVE.loadVar(data, "enemyStrategyData", {}))
