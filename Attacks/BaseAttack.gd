extends Reference
class_name Attack

enum Category {Physical, Lust, Special, Humiliation, SelfHumiliation}
enum AICategory {Unspecified, Offensive, Defensive, Lust, DefensiveLust, DefensivePain}
enum LustTopic {selfUseMe, humYouSlut}

var id = "baseattack"
var category = Category.Physical
var aiCategory = AICategory.Unspecified
var aiScoreMultiplier = 1

var isWeaponAttack = false # true means the damage will be affected by the melee damage buffs
var isPlayerAttack = false
var attackPriority = 0

func _init():
	pass
	
func getVisibleName(_context = {}):
	return "Bad attack"
	
func getVisibleDesc(_context = {}):
	return "Bad attack, let the developer know"
	
func _doAttack(_attacker, _receiver, _context = {}):
	return {
		text = "Bad attack happened, let the developer know",
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true
	
	
func doAttack(_attacker, _receiver, _context = {}):
	doRequirements(_attacker, _receiver)
	var result = _doAttack(_attacker, _receiver, _context)
	if(result is String):
		result = {text="!OLD STYLE!"+result}
	elif(!result.has("text")):
		result["text"] = "!No attack text provided!"
	
	result["attackerAnimation"] = getAttackSoloAnimation()
	result["receiverAnimation"] = getAttackHitReactAnimation(_attacker, _receiver, result)
	
	if(result.has("pain")):
		result["pain"] = calcDamage(_attacker, _receiver, DamageType.Physical, result["pain"])
		var origDamage = result["pain"]
		result["pain"] = _receiver.receiveDamage(DamageType.Physical, result["pain"], getRecieverArmorScaling(_attacker, _receiver, DamageType.Physical))
		result["text"] += " "+receiverDamageMessageShort(DamageType.Physical, result["pain"], origDamage)
	if(result.has("lust")):
		result["lust"] = calcDamage(_attacker, _receiver, DamageType.Lust, result["lust"])
		var origDamage = result["lust"]
		result["lust"] = _receiver.receiveDamage(DamageType.Lust, result["lust"], getRecieverArmorScaling(_attacker, _receiver, DamageType.Lust))
		result["text"] += " "+receiverDamageMessageShort(DamageType.Lust, result["lust"], origDamage)
	if(result.has("stamina")):
		result["stamina"] = calcDamage(_attacker, _receiver, DamageType.Stamina, result["stamina"])
		var origDamage = result["stamina"]
		result["stamina"] = _receiver.receiveDamage(DamageType.Stamina, result["stamina"], getRecieverArmorScaling(_attacker, _receiver, DamageType.Stamina))
		result["text"] += " "+receiverDamageMessageShort(DamageType.Stamina, result["stamina"], origDamage)
	
	return result
	
func canUse(_attacker, _receiver, _context = {}):
	return _canUse(_attacker, _receiver, _context) && meetsRequirements(_attacker, _receiver)

func getRequirements():
	return []

func meetsRequirements(_attacker, _receiver):
	var reqs = getRequirements()
	for req in reqs:
		if(req is String):
			req = [req]
		if(!checkRequirement(_attacker, _receiver, req)):
			return false
	
	return true

func checkRequirement(_attacker, _receiver, req):
	var reqtype = req[0]
	if(reqtype == AttackRequirement.Stamina):
		if(_attacker.getStamina() < req[1]):
			return false
	if(reqtype == AttackRequirement.FreeArms):
		if(_attacker.hasBoundArms()):
			return false
	if(reqtype == AttackRequirement.FreeHands):
		if(_attacker.hasBlockedHands()):
			return false
	if(reqtype == AttackRequirement.FreeLegs):
		if(_attacker.hasBoundLegs()):
			return false
	if(reqtype == AttackRequirement.CanTalk):
		if(_attacker.isGagged()):
			return false
	if(reqtype == AttackRequirement.CanBite):
		if(_attacker.isBitingBlocked()):
			return false
	if(reqtype == AttackRequirement.CanSee):
		if(_attacker.isBlindfolded()):
			return false
	if(reqtype == AttackRequirement.CoveredInCum):
		if(!_attacker.hasEffect(StatusEffect.CoveredInCum)):
			return false
	if(reqtype == AttackRequirement.LustAbove):
		if(_attacker.getLust() < req[1]):
			return false
	if(reqtype == AttackRequirement.LustAbovePercent):
		if(_attacker.getLustLevel() < req[1]):
			return false
	if(reqtype == AttackRequirement.HasMilk):
		if(_attacker.getBodypart(BodypartSlot.Breasts).getProducedFluidAmount() < req[1]):
			return false
	if(reqtype == AttackRequirement.HasReachablePenis):
		if(!_attacker.hasReachablePenis()):
			return false
			
	return true

func doRequirement(_attacker, _receiver, req):
	var reqtype = req[0]
	if(reqtype == AttackRequirement.Stamina):
		_attacker.addStamina(-req[1])

func doRequirements(_attacker, _receiver):
	var reqs = getRequirements()
	for req in reqs:
		if(req is String):
			req = [req]
		doRequirement(_attacker, _receiver, req)

func getRequirementText(req):
	var reqtype = req[0]
	if(reqtype == AttackRequirement.Stamina):
		return "Uses " + str(req[1]) + " stamina"
	if(reqtype == AttackRequirement.FreeArms):
		return "Arms must be free"
	if(reqtype == AttackRequirement.FreeHands):
		return "Hands must be free"
	if(reqtype == AttackRequirement.FreeLegs):
		return "Legs must be free"
	if(reqtype == AttackRequirement.CanTalk):
		return "Mouth must be free"
	if(reqtype == AttackRequirement.CanBite):
		return "Must be able to bite"
	if(reqtype == AttackRequirement.CanSee):
		return "Must be able to see"
	if(reqtype == AttackRequirement.CoveredInCum):
		return "Must be covered in cum/girlcum"
	if(reqtype == AttackRequirement.LustAbove):
		return "Lust must be above "+str(req[1])
	if(reqtype == AttackRequirement.LustAbovePercent):
		#return "Lust must be above "+str(int(req[1]*100))+"%"
		return "Lust must be above "+str(int(req[1]*GM.pc.lustThreshold())) +" ("+str(int(req[1]*100))+"%)"
	if(reqtype == AttackRequirement.HasMilk):
		return "Must have at least "+str(Util.roundF(req[1], 1))+"ml of milk stored in breasts"
	if(reqtype == AttackRequirement.HasReachablePenis):
		return "Needs a reachable penis"
			
	return "Error: bad requirement:" + reqtype
	
func getRequirementsColorText(_attacker, _receiver):
	var reqs = getRequirements()
	var text = ""
	for req in reqs:
		if(req is String):
			req = [req]
		
		var reqText = getRequirementText(req)
		var reqCan = checkRequirement(_attacker, _receiver, req)
		if(reqCan):
			text += reqText
		else:
			text += "[color=red]" + reqText + "[/color]"
		text += "\n"
	
	return text

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 1.0

func getAttackerDamageMultiplierEfficiency(_attacker, _receiver, _damageType) -> float:
	return 1.0

func calcDamage(_attacker, _receiver, _damageType, _damage: int) -> int:
	var damageMult = _attacker.getDamageMultiplier(_damageType) * getAttackerDamageMultiplierEfficiency(_attacker, _receiver, _damageType)
	if(isWeaponAttack):
		damageMult += GM.pc.getCustomAttribute(BuffAttribute.MeleeWeaponsDamage)
	if(_damage < 0):
		damageMult = -damageMult
		
	return int(round(_damage * (1.0 + damageMult)))

func doDamage(_attacker, _receiver, _damageType, _damage: int, _playGetHitAnimation = true):
	var damageMult = _attacker.getDamageMultiplier(_damageType) * getAttackerDamageMultiplierEfficiency(_attacker, _receiver, _damageType)
	if(isWeaponAttack):
		damageMult += GM.pc.getCustomAttribute(BuffAttribute.MeleeWeaponsDamage)
	if(_damage < 0):
		damageMult = -damageMult
	
	var damage = _receiver.receiveDamage(_damageType, round(_damage * (1.0 + damageMult)), getRecieverArmorScaling(_attacker, _receiver, _damageType))
	
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

func checkDodged(_attacker, _receiver, _damageType, customDodgeMult = 1, minChangeToDodge = 0.0, _playDodgeAnimation = true):
	var dodgeChance = _receiver.getDodgeChance() * customDodgeMult
	
	dodgeChance = max(dodgeChance, minChangeToDodge)
	if(RNG.chance(100.0 * dodgeChance)):
		return true
		
	return false

func getAttackSoloAnimation():
	return ""
	
func getAttackHitReactAnimation(_attacker, _receiver, _result):
	if(_receiver.isBlocking()):
		return "block"
	elif(_receiver.isDodging() || (_result.has("dodged") && _result["dodged"])):
		return "dodge"
	elif(_result.has("pain") && _result["pain"] > 0):
		return "hurt"
	else:
		return ""

func scaledDmgStr(_damageType, _damage: int):
	var damageMult = GM.pc.getDamageMultiplier(_damageType)
	if(isWeaponAttack):
		damageMult += GM.pc.getCustomAttribute(BuffAttribute.MeleeWeaponsDamage)
	
	var damage = round(_damage * (1.0 + damageMult))
	
	return str(damage)

func scaledDmgRangeStr(_damageType, min_damage: int, max_damage: int):
	var damageMult = GM.pc.getDamageMultiplier(_damageType)
	if(isWeaponAttack):
		damageMult += GM.pc.getCustomAttribute(BuffAttribute.MeleeWeaponsDamage)
	
	var damage1 = round(min_damage * (1.0 + damageMult))
	var damage2 = round(max_damage * (1.0 + damageMult))
	
	return str(damage1)+"-"+str(damage2)

func receiverDamageMessage(damageType, howMuch):
	var damageColor = DamageType.getColor(damageType)
	var damageColorString = "#"+damageColor.to_html(false)
	
	return "{receiver.name} received [color="+damageColorString+"]"+str(howMuch)+" "+DamageType.getBattleName(damageType)+"[/color]."

func receiverDamageMessageShort(damageType, howMuch, origDamage = 0):
	var damageColor = DamageType.getColor(damageType)
	var damageColorString = "#"+damageColor.to_html(false)
	
	var stringHowMuch = str(howMuch)
	if(howMuch > 0):
		stringHowMuch = "+" + stringHowMuch
	
		if(howMuch < origDamage):
			var stringDamageDif = str(origDamage - howMuch)
			
			return "[color="+damageColorString+"]("+stringHowMuch+" "+DamageType.getBattleName(damageType)+", "+stringDamageDif+" blocked)[/color]"
	
	return "[color="+damageColorString+"]("+stringHowMuch+" "+DamageType.getBattleName(damageType)+")[/color]"


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

func genericMissMessage(_attacker, _receiver, _optionalVerb = "attack"):
	var randomText = RNG.pick([
		"{attacker.name} tried to "+_optionalVerb+" {receiver.name} but missed!",
		"{attacker.name} missed {attacker.his} attack!",
		])
	
	return {
		text = randomText,
		missed = true,
	}
	
func genericDodgeMessage(_attacker, _receiver, _optionalVerb = "attack"):
	var randomText = RNG.pick([
		"{receiver.name} managed to dodge the "+_optionalVerb+".",
		"{receiver.name} managed to dodge the "+_optionalVerb+" at the last second.",
		"{receiver.name} managed to avoid being hit.",
		"{receiver.name} dodged the "+_optionalVerb+" masterfully.",
	])
	
	return {
		text = randomText,
		dodged = true,
	}

func canDoWhileStunned():
	return false

func getItem(_context) -> ItemBase:
	if("itemID" in _context):
		var item = GlobalRegistry.getCharacter(_context["charID"]).getInventory().getItemByUniqueID(_context["itemID"])
		if(item == null):
			return null
		return item
	return null

func itemExists(_context):
	if("itemID" in _context):
		var item = GlobalRegistry.getCharacter(_context["charID"]).getInventory().getItemByUniqueID(_context["itemID"])
		if(item == null):
			return false
		return true
	return false

func combineWeaponAttacks():
	return true

func canBeUsedByPlayer():
	return isPlayerAttack
