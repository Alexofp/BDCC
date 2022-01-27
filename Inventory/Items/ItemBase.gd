extends Node
class_name ItemBase

var id = "baditem"

func _init():
	pass

func _ready():
	name = id

func getVisibleName():
	return "Bad item"
	
func getVisisbleDescription():
	return "No description provided, please let the developer know"

func getCombatDescription():
	return getVisisbleDescription()

func canCombine():
	return false
	
func combine(_otherItem):
	pass

func canUseInCombat():
	return false

func useInCombat(_attacker, _reciever):
	return ""

func destroyMe():
	if(is_queued_for_deletion()):
		return
	assert(get_parent() != null)
	
	get_parent().removeItem(self)
	queue_free()
