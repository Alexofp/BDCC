extends ItemState
class_name PantiesState

var pulledDown:bool = false
var casualName:String = "panties"
var canShiftAside:bool = true # unused

var clothesDamaged:bool = false
var canActuallyBeDamaged:bool = false

func getCasualName():
	return casualName

# Left for compatibility
func arePantiesShiftedAside():
	return pulledDown

func arePantiesPulledDown() -> bool:
	return pulledDown

func shiftPantiesAside(_updateAppearance:bool = true):
	pullPantiesDown(_updateAppearance)
	
func pullPantiesDown(_updateAppearance:bool = true):
	pulledDown = true
	removed = false
	if(_updateAppearance):
		updateWearerAppearance()

func getActions():
#	if(canShiftAside):
#		return [
#			#"PantiesMoveAside",
#			"PantiesShakeOff",
#		]
#	else:
	return [
		"PantiesShakeOff",
		"PantiesPullDown",
	]

func resetState():
	.resetState()
	pulledDown = false

func saveData():
	var data = .saveData()
	
	data["pulledDown"] = pulledDown
	data["removed"] = removed
	data["casualName"] = casualName
	data["clothesDamaged"] = clothesDamaged

	return data
	
func loadData(_data):
	.loadData(_data)
	pulledDown = SAVE.loadVar(_data, "pulledDown", false)
	removed = SAVE.loadVar(_data, "removed", false)
	casualName = SAVE.loadVar(_data, "casualName", "panties")
	clothesDamaged = SAVE.loadVar(_data, "clothesDamaged", false)

func getChangeStr() -> String:
	var theRes:String = "r" if removed else "n"
	theRes += "d" if pulledDown else "u"
	return theRes

func coversBodyparts():
	if(removed || pulledDown || clothesDamaged):
		return {}
	
	return {
		BodypartSlot.Vagina: true,
		BodypartSlot.Penis: true,
		BodypartSlot.Anus: true,
		}

func getStateText():
	var text = ""
	if(pulledDown):
		text += casualName.capitalize()+" are pulled down. "
	if(removed):
		text = casualName.capitalize()+" are removed. "
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
