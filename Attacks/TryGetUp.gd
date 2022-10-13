extends Attack

func _init():
	id = "trygetupattack"
	category = Category.Physical
	
func getVisibleName(_context = {}):
	return "Try to get up"
	
func getVisibleDesc(_context = {}):
	return "You shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	var success = false
	if(RNG.chance(70) || _attacker.hasPerk(Perk.CombatBetterGetUp)):
		_attacker.removeEffect(StatusEffect.Collapsed)
		success = true
	
	var text
	if(success):
		text = "{attacker.name} wastes {attacker.his} turn but [b]{attacker.he} manages to get up[/b]"
	else:
		text = "{attacker.name} tries to get up [b]but fails to do so[/b] in time"
	
	return {
		text = text,
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return _attacker.hasEffect(StatusEffect.Collapsed) && _attacker.canStandUpCombat()

func canBeDodgedByPlayer(_attacker, _receiver):
	return false

func getAIScore(_attacker, _receiver):
	if(_attacker.hasEffect(StatusEffect.Collapsed)):
		return 5.0
	return 0.0
