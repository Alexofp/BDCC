extends Reference
class_name AIStrategyBase

var charID: String = ""
var battleName: String = ""
###
var tempLustCombatState = LustCombatState.new()
###

func getCharacter():
	if(charID == null || charID == ""):
		return null
	return GlobalRegistry.getCharacter(charID)

func setCharacterID(newCharID):
	charID = newCharID

func onBattleStart(_enemy):
	###
	tempLustCombatState.setCharacter(self.getCharacter())
	tempLustCombatState.setEnemyID(_enemy.getID())
	tempLustCombatState.enteredBattle()
	Log.print("[LustierCombat] Overrode res://Game/Combat/AIStrategyBase.gd")
	###
	pass

func getBestAttackIDsWeighted(_enemy):
	var character = getCharacter()
	
	var savedAttacks = []
	
	var attacks = character.getAttacks(battleName)
	
	for attackID in attacks:
		var attack: Attack = GlobalRegistry.getAttack(attackID)
		if(!attack):
			continue
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
	
###
func shouldLustCombat(_enemy):
	var lustiness = 30.0 # initial % chance of going horny
	var user = getCharacter()
	var enemyLustFraction = clamp(_enemy.getLustLevel(), 0.0, 1.0)
	var enemyPainFraction = clamp(_enemy.getPainLevel(), 0.0, 1.0)
	var lustFraction = clamp(user.getLustLevel(), 0.0, 1.0)
	var enemyLustThres = _enemy.lustThreshold()
	var lustThres = user.lustThreshold()

	if(user.getDamageMultiplier(DamageType.Lust) < 0):
		lustiness += -20 # if user has a negative multiplier to lust damage, decrease odds of using lust combat
	var _blocked = _enemy.getArmor(DamageType.Lust) # debug
	lustiness += clamp(-1*_enemy.getArmor(DamageType.Lust), -100, 0) # if enemy can block a lot of lust damage, decrease odds
	
	var _immune = (1-(1+user.getRecieveDamageMultiplier(DamageType.Lust)))*100 # debug
	lustiness += clamp((1-(1+user.getRecieveDamageMultiplier(DamageType.Lust)))*100 , -50, 50) # the more the user is strong against lust damage, the higher the odds of using lust combat
	var _vulnerable = _enemy.getRecieveDamageMultiplier(DamageType.Lust)*100 # debug
	lustiness += clamp(_enemy.getRecieveDamageMultiplier(DamageType.Lust)*100, -50, 50) # the more the enemy is weak to lust damage, the higher the odds of using lust combat
	if(lustFraction >= 0.6): # horny mode activate
		lustiness += 40
	if(lustThres >= enemyLustThres): # if user can withstand more total lust than enemy, increase odds
		lustiness += 20
	
	var diff = (enemyLustFraction - lustFraction)*100
	lustiness += clamp(diff, -50, 50)*0.5 # add the difference in lust level to the odds; if enemy lust level is lower than user, it subracts instead
	var _lockIn = 100*(pow(enemyLustFraction, 3) * 4) # debug
	lustiness += 100*(pow(enemyLustFraction, 3) * 4) # as enemy lust increases, increase the odds of lust combat
	if(lustThres - user.getLust() <= 8): # if user is close to cumming, avoid lust combat due to self-damage
		lustiness += -40
	
	var _fixation = -100*(pow(enemyPainFraction, 3) * 2) # debug
	lustiness += -100*(pow(enemyPainFraction, 3) * 2) # as enemy pain increases, lower the odds of lust combat
	var avgPainAttack = 20*(user.getDamageMultiplier(DamageType.Physical)+1) # see if user is one average attack away from winning
	if(enemyPainFraction >= 0.9 || (_enemy.painThreshold() - _enemy.getPain() <= avgPainAttack) ): # if user is very close to winning by pain, don't suddenly switch to lust
		lustiness += -200
	
	lustiness = clamp(lustiness, 0.0, 100.0)
	var LustOrPunch = [["attack", 100.0-lustiness], ["lust", lustiness]]
	Log.print("[LustierCombat] Chance for lust action is "+String(lustiness)+"%") # debug
	# RNG.pickWeightedPairs([["a", 10.0], ["b", 100.0], ["c", 10.0]]) # 'b' will show up 10 times more
	if(RNG.pickWeightedPairs(LustOrPunch) == "lust"):
		return true
	else:
		return false # CHANGE THIS BACK TO FALSE AFTER TESTING
	
func getLustAttacks(_enemy):
	var result = []
	var total = 0
	var list = tempLustCombatState.getActions()
	
	for actionData in list:
		var theId = "Npc"+actionData["id"]
		if(GlobalRegistry.getLustAction(theId)): # will evaluate false if the NPC version of the lust action does not exist
			var _action = GlobalRegistry.getLustAction(theId)
			if(_action.canDo(tempLustCombatState, actionData) && _action.shouldShow(tempLustCombatState, actionData)):
				# something something calculate action damage and apply weights, normal weight is 1.0
				var thedmg = calcTeaseDamageLikePlayer(theId, _enemy)
				total += thedmg
				result.append([["lust", theId], thedmg]) # handle attack weights later
	var mean = (total / result.size()) + max((getCharacter().getLustLevel()*10), _enemy.getLustLevel()*10) # think of the mean as the 'target' damage value, it should increase as things get lustier
	for each in result:
		# math happening - highest weighted actions are those that deal close to the average lust damage (roughly 15 before modifiers), however this will increase as stated above
		var _sig = 1 # how strongly it is weighted towards the average, default is 1, smaller is more weighted (more likely to entirely ignore powerful and weak moves)
		var _dist = abs(each[1]-mean)/mean
		var _normal = 1/sqrt(2*PI*pow(_sig, 2))*exp((pow(_dist, 2))/(-2*pow(_sig, 2))) # the gaussian probability distribution function
		each[1] = 1.0+_normal # thus the 'best' move is the average, but with a small chance to get either a powerful move or a weak move
		each[1] = each[1] + GlobalRegistry.getLustAction(each[0][1]).getPriority() 
	return result
	

# use this to estimate damage output of a lust action
func calcTeaseDamageLikePlayer(_theId, _enemy):
	var theDamage = 0
	var actionLustInterests = GlobalRegistry.getLustAction(_theId).getLustTopics()
	var lustInterests:LustInterests = _enemy.getLustInterests()

	var teaseData = lustInterests.reactLustAction(getCharacter(), actionLustInterests)
	#var damageMult = teaseData["value"]
	var positiveDamage = teaseData["positiveValue"]
	var negativeDamage = teaseData["negativeValue"]

	var DamageMult = getCharacter().getDamageMultiplier(DamageType.Lust) + 1.0
	var damageBalanceMod = negativeDamage/DamageMult + positiveDamage*DamageMult
	if(damageBalanceMod > 0.0):
		damageBalanceMod = pow(damageBalanceMod, 0.7)
	if(damageBalanceMod < 0.0):
		damageBalanceMod = -pow(abs(damageBalanceMod), 0.7)
	theDamage = damageBalanceMod*10.0 # remove random, want this to be deterministic

	theDamage *= 2.0 # adjust for tuning damage
		
	return theDamage
###

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
	###
	if(shouldLustCombat(_enemy)): # replace attacks with lust attack equivalents
		var keepActions = []
		for Action in possibleActions:
			var attack:Attack = GlobalRegistry.getAttack(Action[0][1])
			if(not attack.aiCategory == 1 || not attack.category == 0):
				keepActions.append(Action) # remove all offensive attacks, we're in horny mode
		possibleActions = keepActions
		possibleActions.append_array(getLustAttacks(_enemy))
	###
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
		###
		if(selectedAction[0] == "lust"):
			return {
				action = "lust",
				attackID = selectedAction[1]
			}
		###
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

###
func saveData():
	return {
		#"charID": charID,
		"tempLustCombatState": tempLustCombatState,
	}
	
func loadData(_data):
	#charID = SAVE.loadVar(data, "charID", "")
	tempLustCombatState = SAVE.loadVar(_data, "tempLustCombatState", "")
	pass
###
