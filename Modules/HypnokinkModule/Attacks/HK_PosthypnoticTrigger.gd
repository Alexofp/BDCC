extends Attack

func _init():
	id = HK_Attack.PostHypnoticTrigger
	category = Category.Special
	aiCategory = AICategory.Offensive
	
func getVisibleName(_context = {}):
	return "Use hypnotic trigger"
	
func getVisibleDesc(_context = {}):
	return "Use your previously planted posthypnotic trigger. Will briefly stun the opponent and increase their lust."
	
func _doAttack(_attacker, _receiver, _context = {}):
	var texts = [
		"{attacker.name} snaps {attacker.his} fingers, triggering {receiver.nameS} hypnotic command."
	]
	var text = RNG.pick(texts)
	
	if(_receiver.addEffect(StatusEffect.Stunned, [1])):
		text += "\n[b]{receiver.name} is briefly stunned![/b]"
	
	_receiver.addEffect(HK_StatusEffect.PosthypnoticTriggerUsedUp)
	
	return {
		text = text,
		lust = RNG.randi_range(15, 30),
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_attacker.hasBlockedHands()):
		return false
		
	if(_receiver.hasEffect(HK_StatusEffect.ImplantedPosthypnoticTrigger) and !_receiver.hasEffect(HK_StatusEffect.PosthypnoticTriggerUsedUp)):
		return true
		
	return false

func getRequirements():
	return []

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} raises {attacker.his} hand, fingers poised to snap."

func getAttackSoloAnimation():
	return "shove"

func getExperience():
	return [[HK_Skill.HypnosisSkill, 10]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 0.0
