extends Attack

func _init():
	id = "HypnoTriggerStun"
	category = Category.Special
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Trigger: Naptime"
	
func getVisibleDesc(_context = {}):
	return "Use their posthypnotic suggestion to trigger a short-lived blackout."
	
func _doAttack(_attacker, _receiver, _context = {}):
	var texts = [
		"{attacker.name} snaps {attacker.his} fingers, triggering {receiver.nameS} hypnotic command."
	]
	var text = RNG.pick(texts)
	
	if(_receiver.addEffect(StatusEffect.Stunned, [RNG.randi_range(1,2)])):
		text += "\n[b]{receiver.name} is briefly too disoriented to act![/b]"
	
	_receiver.addEffect(StatusEffect.PosthypnoticTriggerUsedUp)
	
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_attacker.hasBlockedHands()):
		return false
		
	if(_receiver.statusEffects.has(StatusEffect.ImplantedPosthypnoticTrigger) && !_receiver.statusEffects.has(StatusEffect.PosthypnoticTriggerUsedUp)):
		return true
		
	return false

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} raises {attacker.his} hand, fingers poised to snap."

func getAttackSoloAnimation():
	return "throw"

func getRequirements():
	return [AttackRequirement.FreeHands, AttackRequirement.CanTalk]

func getExperience():
	return [[Skill.Hypnosis, 10]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.0
