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
	var cumDamage = int(cumAmount / 100.0)
	if(cumDamage >= 30): # It's a nerf but the maximum is still uncapped technically..
		return 5 + 30 + int((cumAmount - 3000.0)/200.0)
	return 5 + cumDamage
	
func getVisibleDesc(_context = {}):
	return "Smack them with your cock for "+scaledDmgRangeStr(DamageType.Physical, 5, calculateDamageFor(GM.pc))+" damage. Uses 10 stamina\n\nMaximum damage scales based on the amount of cum in your balls.\n\nBrings you 5 pain too since slapping people with your cock is painful"
	
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
	
	if(maxDamage >= 20 && RNG.chance(10) && _receiver.addEffect(StatusEffect.Collapsed)):
		text += "\n[b]{receiver.name} loses {receiver.his} balance and collapses onto the floor[/b]."
		
	if(maxDamage >= 30 && RNG.chance(5) && _receiver.addEffect(StatusEffect.Stunned, [1])):
		text += "\n[b][color=red]CRITICAL SLAP![/color] {receiver.name} got stunned because of the weight of that thing![/b]."
	
	return {
		text = text,
		pain = RNG.randi_range(5, maxDamage),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getRequirements():
	return [[AttackRequirement.Stamina, 10], [AttackRequirement.HasReachablePenis]]

#func getAnticipationText(_attacker, _receiver):
#	return "{attacker.name} lunges forward and tries to kick you"

#func getAttackSoloAnimation():
#	return "shove"

func getExperience():
	return [[Skill.Breeder, 10]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 3.0
