extends ItemState
class_name BraState

var pulledUp = false
var casualName = "bra"

var clothesDamaged = false
var canActuallyBeDamaged = false

func getCasualName():
	return casualName

func isBraPulledUp():
	return pulledUp

func pullBraUp():
	pulledUp = true
	removed = false
	updateWearerAppearance()

func getActions():
	return [
		"BraPullUp",
		"BraShakeOff",
	]

func resetState():
	.resetState()
	pulledUp = false

func saveData():
	var data = .saveData()
	
	data["pulledUp"] = pulledUp
	data["removed"] = removed
	data["casualName"] = casualName
	data["clothesDamaged"] = clothesDamaged

	return data
	
func loadData(_data):
	.loadData(_data)
	pulledUp = SAVE.loadVar(_data, "pulledUp", false)
	removed = SAVE.loadVar(_data, "removed", false)
	casualName = SAVE.loadVar(_data, "casualName", "bra")
	clothesDamaged = SAVE.loadVar(_data, "clothesDamaged", false)

func coversBodyparts():
	if(removed || pulledUp || clothesDamaged):
		return {}
	
	return {
		BodypartSlot.Breasts: true,
		}

func getStateText():
	var text = ""
	if(pulledUp):
		text += casualName.capitalize()+" is pulled up. "
	if(removed):
		text = casualName.capitalize()+" is removed. "
	return text

func getDamageDescription():
	if(clothesDamaged):
		return "Pieces of fabric are ripped off, exposing nipples"
	return ""

func canDamage():
	return !clothesDamaged && canActuallyBeDamaged && !isRemoved()

func isDamaged():
	return clothesDamaged

func receiveDamage():
	if(!clothesDamaged):
		clothesDamaged = true
		return [true, "Huge chunks of the fabric got ripped off, exposing the nipples!"]
	
	return .receiveDamage()

func repairDamage():
	clothesDamaged = false
