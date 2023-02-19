extends Attack

func _init():
	id = "ThrowUsedCondomPCAttack"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	isWeaponAttack = true
	
func getVisibleName(_context = {}):
	return "Throw condom"
	
func getVisibleDesc(_context = {}):
	var item = getItem(_context)
	if(item == null):
		return "error"
	
	return "The effects depend on the contents.\n\n"+item.getVisisbleDescription()
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver)
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver)
	
	var item = getItem(_context)
	
	var texts = [
		"{attacker.name} throws a filled used condom at {receiver.name}! The condom breaks when it hits {receiver.him}, spilling all of its contents!",
	]
	
	var howMuchLustToAdd = 0
	var howMuchPainToAdd = 0
	var howMuchStaminaToAdd = 0
	
	var extraMessages = []
	var fluidByAmount = item.fluids.getFluidAmountByType()
	for fluidID in fluidByAmount:
		var fluidObject:FluidBase = GlobalRegistry.getFluid(fluidID)
		if(fluidObject == null):
			continue
		
		var resultMessage = fluidObject.onGettingHitWith(_receiver, fluidByAmount[fluidID])
		if(resultMessage != null):
			if(resultMessage is String):
				resultMessage = {text=resultMessage}
			
			if(resultMessage.has("text") && resultMessage["text"] != null && resultMessage["text"] != ""):
				extraMessages.append(resultMessage["text"])
			
			if(resultMessage.has("lust")):
				howMuchLustToAdd += int(resultMessage["lust"])
			if(resultMessage.has("pain")):
				howMuchPainToAdd += int(resultMessage["pain"])
			if(resultMessage.has("stamina")):
				howMuchStaminaToAdd += int(resultMessage["stamina"])
				
	
	var extraText = Util.join(extraMessages, "\n\n")
	#_receiver.addEffect(StatusEffect.Stunned, [2])
	item.getFluids().transferTo(_receiver, RNG.randf_range(0.5, 1.0))
	
	var text = RNG.pick(texts)
	if(extraText != ""):
		text += "\n\n"+extraText
	item.destroyMe()
	
	var resultStuff = {
		text = text,
		pain = RNG.randi_range(2, 5) + howMuchPainToAdd,
	}
	if(howMuchLustToAdd != 0):
		resultStuff["lust"] = howMuchLustToAdd
	if(howMuchStaminaToAdd != 0):
		resultStuff["stamina"] = howMuchStaminaToAdd
	
	return resultStuff
	
func _canUse(_attacker, _receiver, _context = {}):
	return itemExists(_context)

func getAttackSoloAnimation():
	return "throw"

func getExperience():
	return [[Skill.CumLover, 10]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 1.0

func getAttackerDamageMultiplierEfficiency(_attacker, _receiver, _damageType) -> float:
	return 0.0

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func combineWeaponAttacks():
	return false
