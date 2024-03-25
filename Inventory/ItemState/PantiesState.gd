extends ItemState
class_name PantiesState

var shiftedAside = false
var casualName = "panties"
var canShiftAside = true

var clothesDamaged = false
var canActuallyBeDamaged = false

func getCasualName():
	return casualName

func arePantiesShiftedAside():
	return shiftedAside

func shiftPantiesAside():
	shiftedAside = true
	removed = false
	updateWearerAppearance()

func getActions():
	if(canShiftAside):
		return [
			"PantiesMoveAside",
			"PantiesShakeOff",
		]
	else:
		return [
			"PantiesShakeOff",
			"PantiesPullDown",
		]

func resetState():
	.resetState()
	shiftedAside = false

func saveData():
	var data = .saveData()
	
	data["shiftedAside"] = shiftedAside
	data["removed"] = removed
	data["casualName"] = casualName
	data["canShiftAside"] = canShiftAside
	data["clothesDamaged"] = clothesDamaged

	return data
	
func loadData(_data):
	.loadData(_data)
	shiftedAside = SAVE.loadVar(_data, "shiftedAside", false)
	removed = SAVE.loadVar(_data, "removed", false)
	casualName = SAVE.loadVar(_data, "casualName", "panties")
	canShiftAside = SAVE.loadVar(_data, "canShiftAside", true)
	clothesDamaged = SAVE.loadVar(_data, "clothesDamaged", false)

func coversBodyparts():
	if(removed || shiftedAside || clothesDamaged):
		return {}
	
	return {
		BodypartSlot.Vagina: true,
		BodypartSlot.Penis: true,
		BodypartSlot.Anus: true,
		}

func getStateText():
	var text = ""
	if(shiftedAside):
		text += casualName.capitalize()+" are shifted aside. "
	if(removed):
		text = casualName.capitalize()+" are pulled down. "
	return text

func getHidesParts(_character):
	if(isRemoved()):
		return null
	if(arePantiesShiftedAside()):
		return null
	if(isDamaged()):
		return null
	return {
		BodypartSlot.Penis: true,
	}

func getDamageDescription():
	if(clothesDamaged):
		return "Pieces of fabric are ripped off, exposing private bits"
	return ""

func canDamage():
	return !clothesDamaged && canActuallyBeDamaged && !isRemoved()

func isDamaged():
	return clothesDamaged

func receiveDamage():
	if(!clothesDamaged):
		clothesDamaged = true
		return [true, "Huge chunks of the fabric got ripped off, exposing private bits!"]
	
	return .receiveDamage()

func repairDamage():
	clothesDamaged = false
