extends ItemState
class_name SimpleRemoveState

var casualName:String = "uniform"
var revealAnim:String = "ClothingTopOpen"
var checkedInvSlot:String = InventorySlot.Body
var clothesDamaged:bool = false
var canActuallyBeDamaged:bool = false
var blockedSlots:Array = [InventorySlot.UnderwearBottom, InventorySlot.UnderwearTop]
var blockedSlotsWhenDamaged:Array = []
var coveredBodyparts:Dictionary = {
	BodypartSlot.Body: true,
	BodypartSlot.Vagina: true,
	BodypartSlot.Penis: true,
	BodypartSlot.Anus: true,
	BodypartSlot.Breasts: true,
}
var coveredBodypartsWhenDamaged:Dictionary = {
	BodypartSlot.Body: true,
}
var hidesParts:Dictionary = {
	BodypartSlot.Penis: true,
}
var hidesPartsWhenDamaged:Dictionary = {}
var doAppearanceUpdateOnRemove:bool = false

func areShortsPulledDown():
	return removed

func pullDownShorts(_updateAppearance:bool = true):
	pass

func isShirtOpened():
	return removed

func openShirt(_updateAppearance:bool = true):
	pass

func getCasualName():
	return casualName

func getActions():
	return [
		"UniformTakeOffGeneric",
	]

func resetState():
	.resetState()

func saveData():
	var data = .saveData()
	
	data["clothesDamaged"] = clothesDamaged

	return data
	
func loadData(_data):
	.loadData(_data)
	
	clothesDamaged = SAVE.loadVar(_data, "clothesDamaged", false)

func blocksInventorySlots():
	if(!clothesDamaged):
		return blockedSlots
	return blockedSlotsWhenDamaged

func coversBodyparts():
	if(isRemoved()):
		return {}
	
	if(clothesDamaged):
		return coveredBodypartsWhenDamaged
	return coveredBodyparts

func getStateText():
	var text := ""
	return text

func canDamage():
	return canActuallyBeDamaged && !isRemoved()

func isDamaged():
	return clothesDamaged

func getDamageState() -> int:
	if(clothesDamaged):
		return 2
	return 0

func receiveDamage():
	if(!clothesDamaged):
		clothesDamaged = true
		return [true, "Pieces of the fabric got ripped off!"]

	return .receiveDamage()

func canRepair():
	return isDamaged()

func repairDamage():
	clothesDamaged = false

func getDamageDescription():
	if(clothesDamaged):
		return "Pieces of fabric are ripped off"
	return ""

func getHidesParts(_character):
	if(isRemoved()):
		return null
	if(isDamaged()):
		return hidesPartsWhenDamaged
	return hidesParts
