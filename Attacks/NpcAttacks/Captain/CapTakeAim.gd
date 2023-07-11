extends Attack

func _init():
	id = "CapTakeAim"
	category = Category.Physical
	aiCategory = AICategory.Offensive
	aiScoreMultiplier = 0.7
	
func getVisibleName(_context = {}):
	return "Take Aim"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "{attacker.name} prepares for the next attack."
	text += "\n\n"
	text += "[say=attacker]"+RNG.pick(["Can't hide from me. I control Everything.", "My aim is always steady.", "How can you not understand? I own you.", "I built this prison with my own tears and blood!"])+"[/say]"
	
	_attacker.addEffect(StatusEffect.PrimedAttack, [100])
	
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_attacker.hasEffect(StatusEffect.PrimedAttack)):
		return false
	
	return true

func getAnticipationText(_attacker, _receiver):
	return "{attacker.name} meows." 

func getAttackSoloAnimation():
	return "holdpistol"

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands]

func canBeDodgedByPlayer(_attacker, _receiver):
	return false
