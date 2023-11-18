extends StatusEffectBase

var progress = 0.0

func _init():
	id = StatusEffect.SexEngineHypnovisor
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 48
	
func shouldApplyTo(_npc):
	if(GM.main != null && GM.main.supportsSexEngine()):
		if(_npc.getInventory().hasSlotEquipped(InventorySlot.Eyes) && _npc.getInventory().getEquippedItem(InventorySlot.Eyes).hasTag(ItemTag.Hypnovisor)):
			return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Hypnotized"

func getEffectDesc():

	var text = "You are being hypnotized!"
	if(progress >= 1.0):
		text = "You got hypnotized!"
	text += "\nProgress: "+str(Util.roundF(progress*100.0, 1))+"%"
	if(progress >= 1.0):
		text += "\nYou can no longer resist it.."
	elif(progress >= 0.5):
		text += "\nYou really want to give in.."
	elif(progress >= 0.25):
		text += "\nYou find it hard to control your thoughts.."
	return text

func getEffectImage():
	if(progress >= 1.0):
		return "res://Images/StatusEffects/hypnosis.png"
	return "res://Images/StatusEffects/hypnosissmall.png"

func getIconColor():
	if(progress < 1.0):
		return IconColorRed
	return IconColorBrightPurple

func combine(_args = []):
	pass

func getBuffs():
	if(progress >= 1.0):
		return [
			buff(Buff.ForcedObedienceBuff, [100.0])
		]
	elif(progress >= 0.25):
		return [
			buff(Buff.ForcedObedienceBuff, [round((progress - 0.25)/0.75*50.0)])
		]
	
	return []

func saveData():
	return {
		"progress": progress,
	}
	
func loadData(_data):
	progress = SAVE.loadVar(_data, "progress", 0.0)

func processSexTurnContex(_contex = {}):
	progress += RNG.randf_range(0.02, 0.05)
	progress = clamp(progress, 0.0, 1.0)
