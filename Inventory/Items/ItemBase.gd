extends Node
class_name ItemBase

var id = "baditem"
var uniqueID = null
var amount = 1

func _init():
	pass

func _ready():
	name = id
	if(uniqueID == null):
		uniqueID = "item"+str(GlobalRegistry.generateUniqueID())

func getVisibleName():
	return "Bad item"

func getStackName():
	if(amount > 1):
		return ""+str(amount)+"x"+getVisibleName()
	else:
		return getVisibleName()

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
	
func tryCombine(_otherItem):
	amount += _otherItem.amount
	return true

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

func removeXOrDestroy(remamount):
	amount -= remamount
	
	if(amount <= 0):
		destroyMe()

func setAmount(newamount):
	if(newamount > 1):
		assert(canCombine())
	amount = newamount

func getPossibleActions():
	return [
	]
	
func saveData():
	var data = {}
	
	data["amount"] = amount

	return data
	
func loadData(_data):
	amount = SAVE.loadVar(_data, "amount", 1)

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

func getStackPrice():
	return int(getPrice() * amount)

func getStackSellPrice():
	return int(getSellPrice() * amount)

func canSell():
	return false

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your "+getVisibleName().to_lower()
	else:
		return "take off your "+getVisibleName().to_lower()

func getTakingOffVerb(withS):
	if(withS):
		return "takes off"
	else:
		return "take off"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your "+getVisibleName().to_lower()
	else:
		return "put on your "+getVisibleName().to_lower()

func getPuttingOnVerb(withS):
	if(withS):
		return "puts on"
	else:
		return "put on"
