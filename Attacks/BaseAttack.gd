extends Node
class_name Attack

enum Category {Physical, Lust, Special}

var id = "baseattack"
var category = Category.Physical

func _init():
	pass
	
func getVisibleName():
	return "Bad attack"
	
func getVisibleDesc():
	return "Bad attack, let the developer know"
	
func _doAttack(_attacker, _reciever):
	return "Mew happened"
	
func _canUse(_attacker, _reciever):
	return true
	
	
func doAttack(_attacker, _reciever):
	doRequirements(_attacker, _reciever)
	return _doAttack(_attacker, _reciever)
	
func canUse(_attacker, _reciever):
	return _canUse(_attacker, _reciever)

func getRequirements():
	return []

func meetsRequirements(_attacker, _reciever):
	var reqs = getRequirements()
	for req in reqs:
		if(!checkRequirement(_attacker, _reciever, req)):
			return false
	
	return true

func checkRequirement(_attacker, _reciever, req):
	var reqtype = req[0]
	if(reqtype == "stamina"):
		if(_attacker.getStamina() < req[1]):
			return false
	if(reqtype == "freearms"):
		if(_attacker.hasEffect(StatusEffect.ArmsBound)):
			return false
	if(reqtype == "freelegs"):
		if(_attacker.hasEffect(StatusEffect.LegsBound)):
			return false
	if(reqtype == "freemouth"):
		if(_attacker.hasEffect(StatusEffect.Gagged)):
			return false
			
	return true

func doRequirement(_attacker, _reciever, req):
	var reqtype = req[0]
	if(reqtype == "stamina"):
		_attacker.addStamina(-req[1])

func doRequirements(_attacker, _reciever):
	var reqs = getRequirements()
	for req in reqs:
		doRequirement(_attacker, _reciever, req)

func getRequirementText(req):
	var reqtype = req[0]
	if(reqtype == "stamina"):
		return "Uses " + str(req[1]) + " stamina"
	if(reqtype == "freearms"):
		return "Arms must be free"
	if(reqtype == "freelegs"):
		return "Legs must be free"
	if(reqtype == "freemouth"):
		return "Mouth must be free"
			
	return "Error: bad requirement:" + reqtype
	
func getRequirementsColorText(_attacker, _reciever):
	var reqs = getRequirements()
	var text = ""
	for req in reqs:
		var reqText = getRequirementText(req)
		var reqCan = checkRequirement(_attacker, _reciever, req)
		if(reqCan):
			text += reqText
		else:
			text += "-> " + reqText + ""
		text += "\n"
	
	return text

func doDamage(_attacker, _reciever, _damageType, _damage: int):
	var damageMult = _attacker.getDamageMultiplier(_damageType)
	
	var damage = _reciever.recieveDamage(_damageType, _damage * damageMult)
	return damage

func canBeDodgedByPlayer(_attacker, _reciever):
	return true

func getAnticipationText(_attacker, _reciever):
	return "You're about to be bonked by "+getVisibleName()
