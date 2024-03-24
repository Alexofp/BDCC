extends Reference
class_name ItemState

var item: WeakRef
var removed = false

func isRemoved():
	return removed

func remove():
	removed = true
	updateWearerAppearance()

func getItem():
	if(item == null):
		return null
	return item.get_ref()

func getActions():
	return []

func resetState():
	removed = false

func saveData():
	var data = {
		"removed": removed,
	}

	return data
	
func loadData(_data):
	removed = SAVE.loadVar(_data, "removed", false)

func blocksInventorySlots():
	return []

func coversBodyparts():
	return {}

func coversBodypart(bodypartSlot):
	var covers = coversBodyparts()
	if(covers.has(bodypartSlot)):
		return true
	return false

func getStateText():
	return ""
	
func updateWearerAppearance():
	var theitem = getItem()
	if(theitem != null):
		theitem.updateWearerAppearance()

func canDamage():
	return false

func isDamaged():
	return false

func canRepair():
	return isDamaged()

func receiveDamage():
	return [false]

func repairDamage():
	pass

func getDamageDescription():
	return

func getExtraDescription():
	var damageDescription = getDamageDescription()
	
	var text = []
	
	if(damageDescription != null && damageDescription != ""):
		text.append("[i]"+damageDescription+"[/i]")
	
	return Util.join(text, "\n")

func getHidesParts(_character):
	return null

func getCasualName():
	return null
