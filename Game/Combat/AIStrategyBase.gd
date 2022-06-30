extends Reference
class_name AIStrategyBase

var charID: String = ""

func getCharacter():
	if(charID == null || charID == ""):
		return null
	return GlobalRegistry.getCharacter(charID)

func setCharacterID(newCharID):
	charID = newCharID

func onBattleStart(_enemy):
	pass

func getBestAttackIDWeighted(_enemy):
	var character = getCharacter()
	
	var savedAttacks = []
	
	var attacks = character.getAttacks()
	
	for attackID in attacks:
		var attack: Attack = GlobalRegistry.getAttack(attackID)
		if(attack == null):
			assert(false, "Bad attack: "+attackID)
		if(!attack.canDoWhileStunned() && character.hasEffect(StatusEffect.Stunned)):
			continue
			
		if(attack.canUse(character, _enemy)):
			savedAttacks.append([attackID, attack.getAIScore(character, _enemy)])
	
	if(savedAttacks.size() == 0):
		printerr("Error: Couldn't find any possible attacks for the enemy")
		return "blunderAttack"
	
	return RNG.pickWeightedPairs(savedAttacks)

func getNextAttackID(_enemy):
	return "blunderAttack"

func getNextAttackFinal(_enemy):
	var character = getCharacter()
	
	var attackID = getNextAttackID(_enemy)
	var attack: Attack = GlobalRegistry.getAttack(attackID)
	if(attack == null):
		return "blunderAttack"
	if(!attack.canUse(character, _enemy)):
		return "blunderAttack"
	
	return attackID

func turnPassed(_enemy):
	pass

func saveData():
	return {
		#"charID": charID,
	}
	
func loadData(_data):
	#charID = SAVE.loadVar(data, "charID", "")
	pass
