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
