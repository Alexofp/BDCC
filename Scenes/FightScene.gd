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

func _init():
	sceneID = "FightScene"

func _initScene(_args = []):
	enemyID = _args[0]
	enemyCharacter = GlobalRegistry.getCharacter(enemyID)
	enemyCharacter.beforeFightStarted()
	setFightCharacter(enemyID)
	
	if(_args.size() > 1):
		battleName = _args[1]

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
				sayn("Nothing yet")
		
		addAttackButtons(Attack.Category.Lust)
		
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
			
	if(state == "playerMustDodge"):
		var attack: Attack = GlobalRegistry.getAttack(savedAIAttackID)
		
		setEnemyAsAttacker()
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
		addButton("Physical Attack", "Kick em", "physattacks")
		addButton("Lust Attack", "Lewd em", "lustattacks")
		addButton("Special", "Kick em but in a special way", "specialattacks")
		#addButton("Inspect", "Look closer", "inspect")
		if(GM.pc.getInventory().hasRemovableRestraints()):
			addButton("Struggle", "Struggle against your restraints", "struggle")
		else:
			addDisabledButton("Struggle", "You don't have any restraints that you can struggle out of")
		addButton("Wait", "Do nothing", "wait")
		addButton("Inventory", "Use an item fron your inventory", "inventory")
		
		if(GM.pc.hasEffect(StatusEffect.Collapsed)):
			if(GM.pc.canStandUpCombat()):
				addButton("Get up", "spends the whole turn", "getup")
			else:
				addDisabledButton("Get up", "You can't stand up now")
		else:
			addDisabledButton("Get up", "You're already standing")
		
		addButton("Submit", "Give up", "submit")
		
	if(state == "lost" || state == "win"):		
		addButton("Continue", "the battle has ended", "endbattle")

func _react(_action: String, _args):
	if(_action == "struggle"):
		runScene("StrugglingScene", [true], "struggle_scene")
		
	if(_action == "physattacks" || _action == "lustattacks" || _action == "specialattacks" || _action == "selfhumattacks" || _action == "humattacks" || _action == "inventory"):
		setState(_action)
		
	if(_action == "return"):
		setState("fighting")
	
	if(_action == "doattack"):
		setState("fighting")
		beforeTurnChecks()
		
		var attackID = _args[0]
		whatPlayerDid += doPlayerAttack(attackID)
		whatEnemyDid = aiTurn()

		afterTurnChecks()
		return
		
	if(_action == "useitem"):
		beforeTurnChecks()
		
		var item = _args[0]
		whatPlayerDid += item.useInCombatWithBuffs(GM.pc, enemyCharacter)
		whatEnemyDid = aiTurn()

		afterTurnChecks()
		return
	
	if(_action == "getup"):
		beforeTurnChecks()
		
		whatPlayerDid += doPlayerAttack("trygetupattack")
		
		whatEnemyDid = aiTurn()

		afterTurnChecks()
		return
	
	if(_action == "attack"):
		beforeTurnChecks()
		
		whatPlayerDid = "It's your turn to attack\n"
		
		#enemyCharacter.recievePain(10)
		#whatPlayerDid += "\n"+enemyCharacter._getName()+" recieved 10 damage!"
		whatPlayerDid += doPlayerAttack("simplekickattack")
		
		whatEnemyDid = aiTurn()

		afterTurnChecks()
		return
	if(_action == "wait"):
		beforeTurnChecks()
		
		whatPlayerDid = "You decide to wait for a good moment to attack"
		
		whatEnemyDid = aiTurn()
		
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
		whatEnemyDid = GM.ui.processString(attack.doAttack(enemyCharacter, GM.pc))
		savedAIAttackID = ""
		
		GM.pc.setFightingStateNormal()
		
		afterTurnChecks()
		return
	
	if(_action == "submit"):
		setState("lost")
		whatHappened = "You give up the fight willingly and submit to your enemy\n"
		battleState = "lost"
		GM.pc.playAnimation(TheStage.Kneeling)
		return
	
	if(_action == "endbattle"):
		enemyCharacter.afterFightEnded()
		GM.pc.afterFightEnded()
		if(battleEndedHow == ""):
			battleEndedHow = "pain"
		endScene([battleState, battleEndedHow])
		return

func doPlayerAttack(attackID):
	var attack: Attack = GlobalRegistry.getAttack(attackID)
	if(attack == null):
		assert(false, "Bad attack: "+attackID)
	
	setPlayerAsAttacker()
	var text = GM.ui.processString(attack.doAttack(GM.pc, enemyCharacter))
	var attackAnim = attack.getAttackAnimation()
	if(attackAnim != null && attackAnim != ""):
		GM.pc.playAnimation(attackAnim)
	
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
	
	var enemyText = "It's "+enemyCharacter.getName()+"'s turn\n"
	var attackID = getBestAIAttack()
	
	var attack: Attack = GlobalRegistry.getAttack(attackID)
	if(attack == null):
		assert(false, "Bad attack: "+attackID)
		
	if(!attack.canBeDodgedByPlayer(enemyCharacter, GM.pc)):	
		setEnemyAsAttacker()
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
		GM.pc.addLust(addLust)
		addMessage("You recieved "+str(addLust)+" lust")
	if(addPain != 0):
		GM.pc.addPain(addPain)
		addMessage("You recieved "+str(addPain)+" pain")
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
		
		var loot:Dictionary = enemyCharacter.getLoot(battleName)
		if(loot.has("credits")):
			GM.pc.addCredits(loot["credits"])
			addMessage("You looted a chip with "+str(loot["credits"])+" "+Util.multipleOrSingularEnding(loot["credits"], "credit"))
		if(loot.has("items")):
			for item in loot["items"]:
				addMessage("You looted "+item.getAStackName())
				GM.pc.getInventory().addItem(item)

func checkEnd():
	if(GM.pc.getPain() >= GM.pc.painThreshold()):
		whatHappened += "You succumb to pain\n"
		battleState = "lost"
		battleEndedHow = "pain"
		GM.pc.playAnimation(TheStage.GetDefeated)
		return "lost"
	if(enemyCharacter.getPain() >= enemyCharacter.painThreshold()):
		whatHappened += "Enemy is in too much pain to continue\n"
		battleState = "win"
		battleEndedHow = "pain"
		return "win"
	if(GM.pc.getLust() >= GM.pc.lustThreshold()):
		whatHappened += "You're too aroused to continue\n"
		battleState = "lost"
		battleEndedHow = "lust"
		GM.pc.playAnimation(TheStage.GetDefeated)
		return "lost"
	if(enemyCharacter.getLust() >= enemyCharacter.lustThreshold()):
		whatHappened += "Enemy is too aroused to continue\n"
		battleState = "win"
		battleEndedHow = "lust"
		return "win"
	
	return ""

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
		
		whatEnemyDid = aiTurn()

		afterTurnChecks()

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
