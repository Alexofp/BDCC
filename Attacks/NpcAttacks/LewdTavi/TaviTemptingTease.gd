extends Attack

func _init():
	id = "TaviTemptingTease"
	category = Category.Lust
	aiCategory = AICategory.Lust
	
func getVisibleName(_context = {}):
	return "Tempting Tease"
	
func getVisibleDesc(_context = {}):
	return "Shouldn't see this"
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(RNG.chance(50)):
		if(checkMissed(_attacker, _receiver, DamageType.Physical)):
			return genericMissMessage(_attacker, _receiver, "scratch")
		
		if(checkDodged(_attacker, _receiver, DamageType.Physical)):
			return genericDodgeMessage(_attacker, _receiver, "scratch")
		
		var text = "{attacker.name}'s seductive display distracts {receiver.name}, leaving an opening for {attacker.him} to land a swift attack."
			
		return {
			text = text,
			lust = RNG.randi_range(5, 10),
			pain = RNG.randi_range(30, 40),
		}
	else:
		var text = "{attacker.name}'s seductive display distracts {receiver.name}, allowing {attacker.him} to rub {attacker.his} body on {receiver.name}."
			
		return {
			text = text,
			lust = RNG.randi_range(30, 40),
		}
	
func _canUse(_attacker, _receiver, _context = {}):
	return true

func getAnticipationText(_attacker, _receiver):
	var text = "{attacker.name} smirks and takes a provocative pose, enticing {receiver.name} with {attacker.his} alluring body. You can only guess what {attacker.he} will do next.."

	return text

func getRequirements():
	return [AttackRequirement.FreeArms]
