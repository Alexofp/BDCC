extends SceneBase

var enemyID: String = ""
var enemyCharacter: Character

var whatPlayerDid: String = ""
var whatEnemyDid: String = ""
var whatHappened: String = ""
var battleState = ""
var savedAIAttackID = ""

func _initScene(_args = []):
	enemyID = _args[0]
	enemyCharacter = GlobalRegistry.getCharacter(enemyID)
	setFightCharacter(enemyID)

func _run():
	updateFightCharacter()
	if(state == ""):
		say("Well, hi")
		setState("fighting")
	elif(state == "fighting"):
		say("And so the fight continues")
		
	if(state == "lost" || state == "win"):		
		say("The fight has ended")
		
	if(state == "inspecting"):
		say("It's an enemy, wow")
		addButton("Back", "Back to fighting", "return")
	
	if(state == "physattacks"):
		say("Pick the attack to use")
		
		addAttackButtons(Attack.Category.Physical)
		
		addButton("Back", "Back to fighting", "return")
	
	if(state == "lustattacks"):
		say("Pick the attack to use")
		
		addAttackButtons(Attack.Category.Lust)
		addButton("Self-humiliation..", "Opens a submenu", "selfhumattacks")
		addButton("Humiliate..", "Opens a submenu", "humattacks")
		
		addButton("Back", "Back to fighting", "return")
	
	if(state == "selfhumattacks"):
		say("Pick the attack to use")
		
		addAttackButtons(Attack.Category.SelfHumiliation)
		
		addButton("Back", "Back to fighting", "lustattacks")
		
	if(state == "humattacks"):
		say("Pick the attack to use")
		
		addAttackButtons(Attack.Category.Humiliation)
		
		addButton("Back", "Back to fighting", "lustattacks")
	
	if(state == "specialattacks"):
		say("Pick the attack to use")
		
		addAttackButtons(Attack.Category.Special)
		
		addButton("Back", "Back to fighting", "return")
	
	if(state == "playerMustDodge"):
		if(whatPlayerDid != ""):
			say(whatPlayerDid)
			
		if(whatHappened != ""):
			say("\n\n")
			say(whatHappened)
	
	if(state == "" || state == "fighting" || state == "lost" || state == "win"):	
		if(whatPlayerDid != ""):
			say("\n\n")
			say(whatPlayerDid)
			
		if(whatEnemyDid != ""):
			say("\n\n")
			say(whatEnemyDid)
			
		if(whatHappened != ""):
			say("\n\n")
			say(whatHappened)
			
	if(state == "playerMustDodge"):
		say("\n\n")
		var attack: Attack = GlobalRegistry.getAttack(savedAIAttackID)
		
		say(attack.getAnticipationText(enemyCharacter, GM.pc))
		addButton("Do nothing", "You don't counter the attack\nin any way", "dodge_donothing")
		if(GM.pc.getStamina() > 0 && !GM.pc.hasEffect(StatusEffect.Collapsed)):
			addButton("Dodge", "You dodge a physical attack completely\nspending 30 stamina in the process", "dodge_dodge")
		else:
			addDisabledButton("Dodge", "You dodge a physical attack completely\nspending 30 stamina in the process")
		if(GM.pc.getStamina() > 0):
			addButton("Block", "You block 10 physical damage\nwhile spending 10 stamina", "dodge_block")
		else:
			addDisabledButton("Block", "You block 10 physical damage\nwhile spending 10 stamina")
		if(GM.pc.getStamina() > 0):
			addButton("Defocus", "You try to distract yourself from the fight\nblocking 10 lust damage and spending 10 stamina", "dodge_defocus")
		else:
			addDisabledButton("Defocus", "You try to distract yourself from the fight\nblocking 10 lust damage and spending 10 stamina")
		
	if(state == "" || state == "fighting"):		
		addButton("Physical Attack", "Kick em", "physattacks")
		addButton("Lust Attack", "Lewd em", "lustattacks")
		addButton("Special", "Kick em but in a special way", "specialattacks")
		addButton("Inspect", "Look closer", "inspect")
		addButton("Wait", "Do nothing", "wait")
		addDisabledButton("Inventory", "no awo yet")
		
		if(GM.pc.hasEffect(StatusEffect.Collapsed)):
			addButton("Get up", "spends the whole turn", "getup")
		else:
			addDisabledButton("Get up", "You're already standing")
		
		addButton("Submit", "Give up", "submit")
		
	if(state == "lost" || state == "win"):		
		addButton("Continue", "the battle has ended", "endbattle")

func _react(_action: String, _args):
	if(_action == "inspect"):
		setState("inspecting")
		
	if(_action == "physattacks" || _action == "lustattacks" || _action == "specialattacks" || _action == "selfhumattacks" || _action == "humattacks"):
		setState(_action)
		
	if(_action == "return"):
		setState("fighting")
	
	if(_action == "attack" || _action == "wait" || _action == "getup"):
		beforeTurnChecks()
	
	if(_action == "doattack"):
		setState("fighting")
		beforeTurnChecks()
		
		var attackID = _args[0]
		whatPlayerDid += doPlayerAttack(attackID)
		whatEnemyDid = aiTurn()

		afterTurnChecks()
		return
	
	if(_action == "getup"):
		whatPlayerDid += doPlayerAttack("trygetupattack")
		
		whatEnemyDid = aiTurn()

		afterTurnChecks()
		return
	
	if(_action == "attack"):
		whatPlayerDid = "It's your turn to attack\n"
		
		#enemyCharacter.recievePain(10)
		#whatPlayerDid += "\n"+enemyCharacter._getName()+" recieved 10 damage!"
		whatPlayerDid += doPlayerAttack("simplekickattack")
		
		whatEnemyDid = aiTurn()

		afterTurnChecks()
		return
	if(_action == "wait"):
		whatPlayerDid = "You decide to wait for a good moment to attack"
		
		whatEnemyDid = aiTurn()
		
		afterTurnChecks()
		return
		
	if(_action == "dodge_donothing" || _action == "dodge_dodge" || _action == "dodge_block" || _action == "dodge_defocus"):
		setState("fighting")
		if(_action == "dodge_donothing"):
			whatPlayerDid = "You decide to let the attack happen"
		if(_action == "dodge_dodge"):
			whatPlayerDid = "You focus on enemy's next attack and try to dodge it"
			GM.pc.setFightingStateDodging()
			GM.pc.addStamina(-30)
		if(_action == "dodge_block"):
			whatPlayerDid = "You try to block the next attack"
			GM.pc.setFightingStateBlocking()
			GM.pc.addStamina(-10)
		if(_action == "dodge_defocus"):
			whatPlayerDid = "You try to get distracted"
			GM.pc.setFightingStateDefocusing()
			GM.pc.addStamina(-10)
		
		var attack: Attack = GlobalRegistry.getAttack(savedAIAttackID)
		if(attack == null):
			assert("Bad attack: "+savedAIAttackID)
			
		whatEnemyDid = attack.doAttack(enemyCharacter, GM.pc)
		savedAIAttackID = ""
		
		GM.pc.setFightingStateNormal()
		
		afterTurnChecks()
		return
	
	if(_action == "submit"):
		setState("lost")
		whatHappened = "You give up the fight willingly and submit to your enemy\n"
		battleState = "lost"
		return
	
	if(_action == "endbattle"):
		enemyCharacter.afterFightEnded()
		GM.pc.afterFightEnded()
		endScene(battleState)
		return

func _react_scene_end(_result):
	pass

func doPlayerAttack(attackID):
	var attack: Attack = GlobalRegistry.getAttack(attackID)
	if(attack == null):
		assert("Bad attack: "+attackID)
	
	var text = attack.doAttack(GM.pc, enemyCharacter)
	return text

func getBestAIAttack():
	var attacks = enemyCharacter.getAttacks()
	var attackID = RNG.pick(attacks)
	var attack: Attack = GlobalRegistry.getAttack(attackID)
	if(attack == null):
		assert("Bad attack: "+attackID)
	
	return attackID
	
func aiTurn():
	if(enemyCharacter.getPain() >= enemyCharacter.painThreshold() || enemyCharacter.getLust() >= enemyCharacter.lustThreshold()):
		return ""
	
	var enemyText = "It's enemy's turn\n"
	var attackID = getBestAIAttack()
	
	var attack: Attack = GlobalRegistry.getAttack(attackID)
	if(attack == null):
		assert("Bad attack: "+attackID)
		
	if(!attack.canBeDodgedByPlayer(enemyCharacter, GM.pc)):	
		enemyText += attack.doAttack(enemyCharacter, GM.pc)
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

func afterTurnChecks():
	#GM.pc.processBattleTurn()
	#enemyCharacter.processBattleTurn()
	
	var won = checkEnd()
	if(won == "lost"):
		setState("lost")
	if(won == "win"):
		setState("win")

func checkEnd():
	if(GM.pc.getPain() >= GM.pc.painThreshold()):
		whatHappened += "You succumb to pain\n"
		battleState = "lost"
		return "lost"
	if(enemyCharacter.getPain() >= enemyCharacter.painThreshold()):
		whatHappened += "Enemy is in too much pain to continue\n"
		battleState = "win"
		return "win"
	if(GM.pc.getLust() >= GM.pc.lustThreshold()):
		whatHappened += "You're too aroused to continue\n"
		battleState = "lost"
		return "lost"
	if(enemyCharacter.getLust() >= enemyCharacter.lustThreshold()):
		whatHappened += "Enemy is too aroused to continue\n"
		battleState = "win"
		return "win"
	
	return ""

func addAttackButtons(category):
	var playerAttacks = GM.pc.getAttacks()
	for attackID in playerAttacks:
		var attack: Attack = GlobalRegistry.getAttack(attackID)
		if(attack == null):
			assert("Bad attack: "+attackID)
		if(attack.category != category):
			continue
			
		var desc = attack.getRequirementsColorText(GM.pc, enemyCharacter)
		#if(desc != ""):
		#	desc += "\n"
		desc += attack.getVisibleDesc()
			
		if(attack.canUse(GM.pc, enemyCharacter) && attack.meetsRequirements(GM.pc, enemyCharacter)):
			addButton(attack.getVisibleName(),  desc, "doattack", [attack.id])
		else:
			addDisabledButton(attack.getVisibleName(),  desc)
