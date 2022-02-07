extends Node
class_name ItemBase

var id = "baditem"
var uniqueID = null

func _init():
	pass

func _ready():
	name = id
	if(uniqueID == null):
		uniqueID = "item"+str(GlobalRegistry.generateUniqueID())

func getVisibleName():
	return "Bad item"

func getDescription():
	return "No description provided, please let the developer know"
	
func getVisisbleDescription():
	var text = getDescription()
	var buffs = getBuffs()
	if(buffs.size() > 0):
		for buff in buffs:
			text += "\n" + "[color=#"+buff.getBuffColor().to_html(false)+"]" + buff.getVisibleDescription() + "[/color]"
	return text

func getCombatDescription():
	return getVisisbleDescription()

func getUniqueID():
	assert(uniqueID != null)
	
	return uniqueID

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

func getPossibleActions():
	return [
	]
	
func saveData():
	var data = {}

	return data
	
func loadData(_data):
	pass

func getClothingSlot():
	return null

func getTakeOffScene():
	return "TakeAnyItemOffScene"

func getPutOnScene():
	return "PutOnAnyItemScene"

func getBuffs():
	return []

func buff(buffid, args = []):
	var buff: BuffBase = GlobalRegistry.createBuff(buffid)
	buff.initBuff(args)
	return buff

func getPrice():
	return 0

func getSellPrice():
	return int(getPrice() / 2.0)

func canSell():
	return false
