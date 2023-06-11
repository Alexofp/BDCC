extends Attack

func _init():
	id = "AvyDrugHeal"
	category = Category.Physical
	aiCategory = AICategory.DefensivePain
	aiScoreMultiplier = 0.3
	
func getVisibleName(_context = {}):
	return "Drug heal"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var text = "{attacker.name}'s eyes glow bright red as {attacker.he} taps into the drug's power, resulting in {attacker.him} getting stronger."
	
	_attacker.addPain(-50)
	_attacker.addStamina(50)
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

#func getAttackSoloAnimation():
#	return "punch"

func getRequirements():
	return [AttackRequirement.CanSee] # Dis is the weakness

func canBeDodgedByPlayer(_attacker, _receiver):
	return false

func getAIScore(_attacker, _receiver):
	if(_attacker.getInventory().getEquippedItemsWithTag(ItemTag.BDSMRestraint).size() > 2):
		return 1.0
	else:
		return .getAIScore(_attacker, _receiver)
