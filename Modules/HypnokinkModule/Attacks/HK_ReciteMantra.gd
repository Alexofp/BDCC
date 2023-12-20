extends Attack

func _init():
	id = "ReciteMantra"
	category = Category.Special
	aiCategory = AICategory.Unspecified
	
func getVisibleName(_context = {}):
	return "Recite Mantra"
	
func getVisibleDesc(_context = {}):
	var amount = HypnokinkUtil.getSuggestibleStacks(GM.pc) / 2
	return "Recite a short mantra to regain "+str(round(amount * 0.65))+" to "+str(round(amount))+" stamina. Amount scales with how hypnotized you currently are."
	
func _doAttack(_attacker, _receiver, _context = {}):
	var texts = [
		"{attacker.name} recites a short, relaxing mantra.",
		"{attacker.name} mutters a short, relaxing mantra.",
		"{attacker.name} whispers a short, relaxing mantra.",
	]
	var text = RNG.pick(texts)
	
	var amount = HypnokinkUtil.getSuggestibleStacks(_attacker) / 2
	amount = RNG.randi_range(amount * 0.65, amount)
	
	text += "\n[b]{attacker.name} is revitalised! (+"+str(amount)+" stamina)[/b]"
		
	_attacker.addStamina(amount)
	_attacker.addEffect(StatusEffect.MantraUsed)
	
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return !_attacker.hasEffect(StatusEffect.MantraUsed)

func getRequirements():
	return [AttackRequirement.CanTalk]

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} closes {attacker.his} eyes."

#func getAttackSoloAnimation():
#	return "shove"

func getExperience():
	return [[Skill.Hypnosis, 5]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.0
