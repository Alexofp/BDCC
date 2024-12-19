extends Attack

func _init():
	id = "MirriStealthSuit"
	category = Category.Physical
	aiCategory = AICategory.Defensive
	
func getVisibleName(_context = {}):
	return "Stealth suit"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	_attacker.addEffect("MirriRecharge", [3])
	_attacker.addEffect("MirriStealth", [2])
	
	var text = "{attacker.name} activates {attacker.his} stealth suit!"
	
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	if(_attacker.hasEffect("MirriRecharge")):
		return false
	
	return true

func getRequirements():
	return [AttackRequirement.FreeArms]
	
func canBeDodgedByPlayer(_attacker, _receiver):
	return false

#func getAttackSoloAnimation():
#	return ["firepistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 1.0
