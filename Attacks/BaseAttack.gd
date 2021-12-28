extends Node
class_name Attack

var id = "baseattack"

func _init():
	pass
	
func _doAttack(_attacker, _reciever):
	return "Mew happened"
	
func _canUse(_attacker, _reciever):
	return true
	
	
func doAttack(_attacker, _reciever):
	return _doAttack(_attacker, _reciever)
	
func canUse(_attacker, _reciever):
	return _canUse(_attacker, _reciever)
