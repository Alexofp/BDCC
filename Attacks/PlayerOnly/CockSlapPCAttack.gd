extends Attack

func _init():
	id = "CockSlapPCAttack"
	category = Category.Special
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Cock slap"
	
func calculateDamageFor(character):
	if(!character.hasPenis()):
		return 5
	
	var penis = character.getBodypart(BodypartSlot.Penis)
	var cumProduction = penis.getFluidProduction()
	if(cumProduction == null):
		return 5
	
	var cumAmount = cumProduction.getFluidAmount()
	var cumDamage = int(pow(max(0.0, cumAmount), 0.7)*0.11) # ~30 at 3000 ml
	return 5 + cumDamage
	
func getVisibleDesc(_context = {}):
	return "Smack them with your cock for "+scaledDmgRangeStr(DamageType.Physical, 5, calculateDamageFor(GM.pc))+" damage. Wastes 20% of stored cum.\n\nMaximum damage scales based on the amount of cum in your balls.\n\nBrings you 5 pain too since slapping people with your cock is painful"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver, "cockslap")
	
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver, "cockslap")
	
	var maxDamage = calculateDamageFor(_attacker)
	var texts = [
		"{attacker.name} whips out {attacker.his} {attacker.penis} and cockslaps {receiver.name} with it!"
	]
	var text = RNG.pick(texts)
	
	_attacker.addPain(5)
	
	if(RNG.chance(min(20.0,maxDamage / 2.0)) && _receiver.addEffect(StatusEffect.Collapsed)):
		text += "\n[b]{receiver.name} loses {receiver.his} balance and collapses onto the floor[/b]."
		
	if(RNG.chance(min(7.0, sqrt(maxDamage))) && _receiver.addEffect(StatusEffect.Stunned, [1])):
		text += "\n[b][color=red]CRITICAL SLAP![/color] {receiver.name} got stunned because of the weight of that thing![/b]"
	
	var lustInterests:LustInterests = _receiver.getLustInterests()
	var likesBigCock = lustInterests.getTopicValue(InterestTopic.BigCock, _attacker)
	var likesAverageCock = lustInterests.getTopicValue(InterestTopic.AverageCock, _attacker)
	var likesSmallCock = lustInterests.getTopicValue(InterestTopic.SmallCock, _attacker)
	var smallestValue = min(likesBigCock, min(likesAverageCock, likesSmallCock))
	var biggestValue = max(likesBigCock, max(likesAverageCock, likesSmallCock))

	var biggestAbsoluteValue = smallestValue
	if(abs(biggestValue) >= abs(smallestValue)):
		biggestAbsoluteValue = biggestValue
	
	var addLust = 0
	if(biggestAbsoluteValue >= 0.5):
		text += "\n{receiver.name} liked the sight."
		addLust = int(ceil(abs(biggestAbsoluteValue) * 10.0))
		
		if(RNG.chance(30 * biggestAbsoluteValue) && _receiver.addEffect(StatusEffect.Weakness)):
			text += "\n{receiver.name} got weak for {attacker.yourHis} cock!"
	elif(biggestAbsoluteValue <= 0.5):
		text += "\n{receiver.name} didn't like the sight."
		addLust = -int(ceil(abs(biggestAbsoluteValue) * 10.0))

	if(_attacker.hasBodypart(BodypartSlot.Penis)):
		var penis = _attacker.getBodypart(BodypartSlot.Penis)
		var cumProduction = penis.getFluidProduction()
		if(cumProduction != null):
			cumProduction.drain(0.2)

	return {
		text = text,
		pain = RNG.randi_range(5, maxDamage),
		lust = addLust,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getRequirements():
	return [[AttackRequirement.HasReachablePenis]]

#func getAnticipationText(_attacker, _receiver):
#	return "{attacker.name} lunges forward and tries to kick you"

#func getAttackSoloAnimation():
#	return "shove"

func getExperience():
	return [[Skill.Breeder, 10]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 3.0
