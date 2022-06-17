extends Reference
class_name Attack

enum Category {Physical, Lust, Special, Humiliation, SelfHumiliation}
enum AICategory {Unspecified, Offensive, Defensive, Lust, DefensiveLust, DefensivePain}
enum LustTopic {selfUseMe, humYouSlut}

var id = "baseattack"
var category = Category.Physical
var aiCategory = AICategory.Unspecified
var aiScoreMultiplier = 1

func _init():
	pass
	
func getVisibleName():
	return "Bad attack"
	
func getVisibleDesc():
	return "Bad attack, let the developer know"
	
func _doAttack(_attacker, _receiver):
	return "Mew happened"
	
func _canUse(_attacker, _receiver):
	return true
	
	
func doAttack(_attacker, _receiver):
	doRequirements(_attacker, _receiver)
	return _doAttack(_attacker, _receiver)
	
func canUse(_attacker, _receiver):
	return _canUse(_attacker, _receiver) && meetsRequirements(_attacker, _receiver)

func getRequirements():
	return []

func meetsRequirements(_attacker, _receiver):
	var reqs = getRequirements()
	for req in reqs:
		if(!checkRequirement(_attacker, _receiver, req)):
			return false
	
	return true

func checkRequirement(_attacker, _receiver, req):
	var reqtype = req[0]
	if(reqtype == "stamina"):
		if(_attacker.getStamina() < req[1]):
			return false
	if(reqtype == "freearms"):
		if(_attacker.hasEffect(StatusEffect.ArmsBound)):
			return false
	if(reqtype == "freelegs"):
		if(_attacker.hasEffect(StatusEffect.LegsBound)):
			return false
	if(reqtype == "freemouth"):
		if(_attacker.hasEffect(StatusEffect.Gagged)):
			return false
	if(reqtype == "canbite"):
		if(_attacker.isPlayer() && _attacker.isBitingBlocked()):
			return false
	if(reqtype == "coveredincum"):
		if(!_attacker.hasEffect(StatusEffect.CoveredInCum)):
			return false
	if(reqtype == "lustabove"):
		if(_attacker.getLust() < req[1]):
			return false
	if(reqtype == "lustabovepercent"):
		if(_attacker.getLustLevel() < req[1]):
			return false
	if(reqtype == "hasmilk"):
		if(_attacker.getBodypart(BodypartSlot.Breasts).getProducedFluidAmount() < req[1]):
			return false
			
	return true

func doRequirement(_attacker, _receiver, req):
	var reqtype = req[0]
	if(reqtype == "stamina"):
		_attacker.addStamina(-req[1])

func doRequirements(_attacker, _receiver):
	var reqs = getRequirements()
	for req in reqs:
		doRequirement(_attacker, _receiver, req)

func getRequirementText(req):
	var reqtype = req[0]
	if(reqtype == "stamina"):
		return "Uses " + str(req[1]) + " stamina"
	if(reqtype == "freearms"):
		return "Arms must be free"
	if(reqtype == "freelegs"):
		return "Legs must be free"
	if(reqtype == "freemouth"):
		return "Mouth must be free"
	if(reqtype == "canbite"):
		return "Must be able to bite"
	if(reqtype == "coveredincum"):
		return "Must be covered in cum/girlcum"
	if(reqtype == "lustabove"):
		return "Lust must be above "+str(req[1])
	if(reqtype == "lustabovepercent"):
		#return "Lust must be above "+str(int(req[1]*100))+"%"
		return "Lust must be above "+str(int(req[1]*GM.pc.lustThreshold())) +" ("+str(int(req[1]*100))+"%)"
	if(reqtype == "hasmilk"):
		return "Must have at least "+str(Util.roundF(req[1], 1))+"ml of milk stored in breasts"
			
	return "Error: bad requirement:" + reqtype
	
func getRequirementsColorText(_attacker, _receiver):
	var reqs = getRequirements()
	var text = ""
	for req in reqs:
		var reqText = getRequirementText(req)
		var reqCan = checkRequirement(_attacker, _receiver, req)
		if(reqCan):
			text += reqText
		else:
			text += "[color=red]" + reqText + "[/color]"
		text += "\n"
	
	return text

func getRecieverArmorScaling(_damageType) -> float:
	return 1.0

func doDamage(_attacker, _receiver, _damageType, _damage: int, playGetHitAnimation = true):
	var damageMult = _attacker.getDamageMultiplier(_damageType)
	if(_damage < 0):
		damageMult = -damageMult
	
	var damage = _receiver.receiveDamage(_damageType, round(_damage * (1.0 + damageMult)), getRecieverArmorScaling(_damageType))
	
	if(playGetHitAnimation):
		if(_receiver == GM.pc):
			if(GM.pc.isBlocking()):
				GM.main.playAnimation(StageScene.Solo, "block")
			elif(_damageType == DamageType.Physical || _damageType == DamageType.Stamina):
				GM.main.playAnimation(StageScene.Solo, "hurt")
	
	return damage

func canBeDodgedByPlayer(_attacker, _receiver):
	return true

func getAnticipationText(_attacker, _receiver):
	return "You're about to be bonked by "+getVisibleName()

func canSeeAnticipationTextWhenBlind():
	return false

func canBlindAnticipationText(_attacker, _receiver):
	return "{attacker.name} is about to do something but you can't tell what"

func getAIScore(_attacker, _receiver):
	if(aiCategory == AICategory.Unspecified):
		return 1.0 * aiScoreMultiplier
		
	# we want the enemy to have high pain
	if(aiCategory == AICategory.Offensive):
		var enemyHealthFraction = _receiver.getPainLevel()
		enemyHealthFraction = clamp(enemyHealthFraction, 0.0, 1.0)
		
		var score = 1.0 + pow(enemyHealthFraction, 3) * 2
		return score * aiScoreMultiplier
		
	# we want us to have low health
	if(aiCategory == AICategory.DefensivePain):
		var healthFraction = _attacker.getPainLevel()
		healthFraction = clamp(healthFraction, 0.0, 1.0)
		
		var score = 0.0 + pow(healthFraction, 3) * 4
		return score * aiScoreMultiplier
		
	# we want us to have low lust
	if(aiCategory == AICategory.DefensiveLust):
		var lustFraction = _attacker.getLustLevel()
		lustFraction = clamp(lustFraction, 0.0, 1.0)
		
		var score = 0.0 + pow(lustFraction, 3) * 4
		return score * aiScoreMultiplier
		
	# we want us to have low pain and lust
	if(aiCategory == AICategory.Defensive):
		var lustFraction = _attacker.getLustLevel()
		lustFraction = clamp(lustFraction, 0.0, 1.0)
		var healthFraction = _attacker.getPainLevel()
		healthFraction = clamp(healthFraction, 0.0, 1.0)
		
		var dangerFraction = max(lustFraction, healthFraction)
		
		var score = 0.0 + pow(dangerFraction, 3) * 4
		return score * aiScoreMultiplier
		
	# we want the enemy to have high lust
	if(aiCategory == AICategory.Lust):
		var enemyLustFraction = _receiver.getLustLevel()
		enemyLustFraction = clamp(enemyLustFraction, 0.0, 1.0)
		
		var score = 1.0 + pow(enemyLustFraction, 3) * 2
		
		# if we're lusty we will prioritise lust attacks
		var lustFraction = _attacker.getLustLevel()
		lustFraction = clamp(lustFraction, 0.0, 1.0)
		if(lustFraction > 0.6):
			score += 0.5
		
		return score * aiScoreMultiplier
		
	return 0.0

func checkMissed(_attacker, _receiver, _damageType, customAccuracyMult = 1.0, minChangeToHit = 0.0):
	if(_receiver.hasEffect(StatusEffect.Collapsed)):
		return false
	
	var chanceToHit = (1.0 + _attacker.getAttackAccuracy()) * customAccuracyMult
	chanceToHit = max(chanceToHit, minChangeToHit)
	if(!RNG.chance(100.0 * chanceToHit)):
		return true
	return false

func checkDodged(_attacker, _receiver, _damageType, customDodgeMult = 1, minChangeToDodge = 0.0, playDodgeAnimation = true):
	var dodgeChance = _receiver.getDodgeChance() * customDodgeMult
	
	dodgeChance = max(dodgeChance, minChangeToDodge)
	if(RNG.chance(100.0 * dodgeChance)):
		if(playDodgeAnimation):
			if(_receiver == GM.pc):
				GM.main.playAnimation(StageScene.Solo, "dodge")
		
		return true
		
	return false

func getAttackSoloAnimation():
	return ""

func scaledDmgStr(_damageType, _damage: int):
	var damageMult = GM.pc.getDamageMultiplier(_damageType)
	
	var damage = round(_damage * (1.0 + damageMult))
	
	return str(damage)

func scaledDmgRangeStr(_damageType, min_damage: int, max_damage: int):
	var damageMult = GM.pc.getDamageMultiplier(_damageType)
	
	var damage1 = round(min_damage * (1.0 + damageMult))
	var damage2 = round(max_damage * (1.0 + damageMult))
	
	return str(damage1)+"-"+str(damage2)

func receiverDamageMessage(damageType, howMuch):
	var damageColor = DamageType.getColor(damageType)
	var damageColorString = "#"+damageColor.to_html(false)
	
	return "{receiver.name} received [color="+damageColorString+"]"+str(howMuch)+" "+DamageType.getBattleName(damageType)+"[/color]"

func receiverDamageMessageList(damages: Array):
	var result = "{receiver.name} received "
	
	var resList = []
	for damageData in damages:
		var damageType = damageData[0]
		var howMuch = damageData[1]
		var damageColor = DamageType.getColor(damageType)
		var damageColorString = "#"+damageColor.to_html(false)
		
		resList.append("[color="+damageColorString+"]"+str(howMuch)+" "+DamageType.getBattleName(damageType)+"[/color]")
		
	return result + Util.humanReadableList(resList)

func getExperience():
	return []

func genericMissMessage(_attacker, _receiver):
	return RNG.pick([
		"{attacker.name} missed!",
		"{attacker.name} missed {attacker.his} attack!",
		])
	
func genericDodgeMessage(_attacker, _receiver):
	return RNG.pick([
		"{receiver.name} managed to dodge the attack.",
		"{receiver.name} managed to dodge the attack at the last second.",
		"{receiver.name} managed to avoid being hit.",
		"{receiver.name} dodged masterfully.",
	])
