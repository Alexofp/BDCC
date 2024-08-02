extends Reference
class_name AIStrategyBase

var charID: String = ""
var battleName: String = ""

func getCharacter():
	if(charID == null || charID == ""):
		return null
	return GlobalRegistry.getCharacter(charID)

func setCharacterID(newCharID):
	charID = newCharID

func onBattleStart(_enemy):
	pass

func getBestAttackIDsWeighted(_enemy):
	var character = getCharacter()
	
	var savedAttacks = []
	
	var attacks = character.getAttacks(battleName)
	
	for attackID in attacks:
		var attack: Attack = GlobalRegistry.getAttack(attackID)
		if(attack == null):
			assert(false, "Bad attack: "+attackID)
		if(!attack.canDoWhileStunned() && character.hasEffect(StatusEffect.Stunned)):
			continue
			
		if(attack.canUse(character, _enemy)):
			savedAttacks.append([["attack", attackID], attack.getAIScore(character, _enemy)])
	
	if(savedAttacks.size() == 0):
		Log.printerr("Error: Couldn't find any possible attacks for the enemy")
		return [[["attack", "blunderAttack"], 0.0]]
	
	return savedAttacks#RNG.pickWeightedPairs(savedAttacks)

func getNextAttacksWeighted(_enemy):
	return [[["attack", "blunderAttack"], 0.0]]

func getNextAttackFinal(_enemy):
	var character = getCharacter()
	
	var attackID = RNG.pickWeightedPairs(getNextAttacksWeighted(_enemy))
	var attack: Attack = GlobalRegistry.getAttack(attackID)
	if(attack == null):
		return "blunderAttack"
	if(!attack.canUse(character, _enemy)):
		return "blunderAttack"
	
	return attackID

func shouldStruggleOutOfRestraints():
	var character = getCharacter()
	if(!character.getInventory().hasRemovableRestraintsNoLockedSmartlocks()):
		return false
	
	return true

func calculateStrugglingActions():
	var result = []
	var character = getCharacter()
	for item in character.getInventory().getEquppedRestraints():
		var restraintData: RestraintData = item.getRestraintData()
		
		if(restraintData == null || !restraintData.canStruggleFinal()):
			continue
		
		#print(item.getVisibleName(), " ", restraintData.calculateAIScore(character))
		result.append([["struggle", item], restraintData.calculateAIScore(character)])
	return result

func shouldSurrender(_enemy):
	var character = getCharacter()
	if(!shouldStruggleOutOfRestraints()):
		return [false]

	if(!character.hasBoundArms() || !character.hasBoundLegs() || !character.isBitingBlocked()):
		return [false]
	
	if(character.getStamina() > 0):
		return [false]
	else:
		return [true, "unable to resist the restraints"]

func getNextAction(_enemy):
	var character = getCharacter()
	
	var surrenderData = shouldSurrender(_enemy)
	if(surrenderData[0]):
		return {
			action = "surrender",
			reason = surrenderData[1],
		}
		
	if(character.hasEffect(StatusEffect.Stunned)):
		return {
			action = "stunned",
		}
	
	var possibleActions:Array = getNextAttacksWeighted(_enemy)
	
	if(shouldStruggleOutOfRestraints() && character.getStamina() > 0):
		possibleActions.append_array(calculateStrugglingActions())
		
	var selectedAction = RNG.pickWeightedPairs(possibleActions)
	
	if(selectedAction != null):
		if(selectedAction[0] == "struggle"):
			return {
				action = "struggle",
				item = selectedAction[1],
			}
			
		if(selectedAction[0] == "attack"):
			return {
				action = "attack",
				attackID = selectedAction[1]
			}
	
	return {
		action = "wait",
	}

func getNextActionFinal(_enemy):
	var nextAction = getNextAction(_enemy)
	if(!nextAction.has("action")):
		nextAction["action"] = "wait"
		
	return nextAction

func turnPassed(_enemy):
	pass

func saveData():
	return {
		#"charID": charID,
	}
	
func loadData(_data):
	#charID = SAVE.loadVar(data, "charID", "")
	pass
