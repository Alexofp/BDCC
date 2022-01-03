extends SceneBase

var enemyID: String = ""
var enemyCharacter: Character

var whatPlayerDid: String = ""
var whatEnemyDid: String = ""
var whatHappened: String = ""
var battleState = ""

func _initScene(_args = []):
	enemyID = _args[0]
	enemyCharacter = GlobalRegistry.getCharacter(enemyID)
	setCharacter(enemyID)

func _run():
	updateCharacter()
	if(state == ""):
		say("Well, hi")
		
	if(state == "fighting"):
		say("And so the fight continues")
		
	if(state == "lost" || state == "win"):		
		say("The fight has ended")
		
	if(whatPlayerDid != ""):
		say("\n\n")
		say(whatPlayerDid)
		whatPlayerDid = ""
		
	if(whatEnemyDid != ""):
		say("\n\n")
		say(whatEnemyDid)
		whatEnemyDid = ""
		
	if(whatHappened != ""):
		say("\n\n")
		say(whatHappened)
		whatHappened = ""
		
	if(state == "" || state == "fighting"):		
		addButton("Attack!", "Kick em", "attack")
		addButton("Wait", "Do nothing", "wait")
		addDisabledButton("bark", "no awo")
		
	if(state == "lost" || state == "win"):		
		addButton("Continue", "the battle has ended", "endbattle")

func _react(_action: String, _args):
	if(state == "" || state == "fighting"):
		beforeTurnChecks()
	
	if(_action == "attack"):
		whatPlayerDid = "It's your turn to attack\n"
		
		#enemyCharacter.recievePain(10)
		#whatPlayerDid += "\n"+enemyCharacter._getName()+" recieved 10 damage!"
		whatPlayerDid += doPlayerAttack("simplekickattack")
		
		whatEnemyDid = aiTurn()

		setState("fighting")
		afterTurnChecks()
		return
	if(_action == "wait"):
		whatPlayerDid = "You decide to wait for a good moment to attack"
		
		whatEnemyDid = aiTurn()
		
		setState("fighting")
		afterTurnChecks()
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

func doAIBestAttack(_attacks, _smartness = 1.0):
	var attackID = RNGTools.pick(_attacks)
	var attack: Attack = GlobalRegistry.getAttack(attackID)
	if(attack == null):
		assert("Bad attack: "+attackID)
	
	var text = attack.doAttack(enemyCharacter, GM.pc)
	
	return text
	
func aiTurn():
	var enemyText = "It's enemy's turn\n"
	enemyText += doAIBestAttack(enemyCharacter.getAttacks())
	
	return enemyText

func beforeTurnChecks():
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
	
	return ""
