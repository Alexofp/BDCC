extends ItemBase

var prisonerNumber = ""
var inmateType = InmateType.General

func _init():
	id = "inmateuniform"

func getVisibleName():
	return InmateType.getOfficialName(inmateType).capitalize() + " inmate uniform"
	
func setPrisonerNumber(newnumber):
	prisonerNumber = newnumber
	
func setInmateType(newtype):
	inmateType = newtype
	
func getDescription():
	var text = "A short sleeved shirt and some shorts, both are made out of black cloth with "+InmateType.getColorName(inmateType)+" trim."

	if(prisonerNumber != null && prisonerNumber != ""):
		text += " The shirt has a prisoner number attached to it that says \""+prisonerNumber+"\""
	
	return text

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		]

func getTags():
	return [
		ItemTag.GeneralInmateUniform,
		]

func saveData():
	var data = .saveData()
	
	data["prisonerNumber"] = prisonerNumber
	data["inmateType"] = inmateType
	
	return data
	
func loadData(data):
	.loadData(data)
	
	prisonerNumber = SAVE.loadVar(data, "prisonerNumber", "")
	inmateType = SAVE.loadVar(data, "inmateType", InmateType.General)

func getTakingOffStringLong(withS):
	if(withS):
		return "takes off your inmate shirt and pulls down the shorts"
	else:
		return "take off your inmate shirt and pull down the shorts"

func getPuttingOnStringLong(withS):
	if(withS):
		return "puts on your inmate shirt and the shorts"
	else:
		return "put on your inmate shirt and the shorts"

func generateItemState():
	itemState = ShirtAndShortsState.new()
	itemState.canActuallyBeDamaged = true # Is hack because there are many clothes that use this state already and don't support damaging..

func getRiggedParts(_character):
	if(itemState.isRemoved()):
		return null
	if(inmateType == InmateType.SexDeviant):
		if(itemState.isSuperDamaged()):
			return {
				"clothing": "res://Inventory/RiggedModels/InmateUniform/damaged/LilacInmateUniformSuperDamaged.tscn",
			}
		if(itemState.isDamaged()):
			return {
				"clothing": "res://Inventory/RiggedModels/InmateUniform/damaged/LilacInmateUniformDamaged.tscn",
			}
		if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Inventory/RiggedModels/InmateUniform/damaged/LilacInmateUniformHalfDamaged.tscn",
			}
		return {
			"clothing": "res://Inventory/RiggedModels/InmateUniform/LilacInmateUniform.tscn",
		}
	elif(inmateType == InmateType.HighSec):
		if(itemState.isSuperDamaged()):
			return {
				"clothing": "res://Inventory/RiggedModels/InmateUniform/damaged/RedInmateUniformSuperDamaged.tscn",
			}
		if(itemState.isDamaged()):
			return {
				"clothing": "res://Inventory/RiggedModels/InmateUniform/damaged/RedInmateUniformDamaged.tscn",
			}
		if(itemState.isHalfDamaged()):
			return {
				"clothing": "res://Inventory/RiggedModels/InmateUniform/damaged/RedInmateUniformHalfDamaged.tscn",
			}
		return {
			"clothing": "res://Inventory/RiggedModels/InmateUniform/RedInmateUniform.tscn",
		}
	
	if(itemState.isSuperDamaged()):
		return {
			"clothing": "res://Inventory/RiggedModels/InmateUniform/damaged/OrangeInmateUniformSuperDamaged.tscn",
		}
	if(itemState.isDamaged()):
		return {
			"clothing": "res://Inventory/RiggedModels/InmateUniform/damaged/OrangeInmateUniformDamaged.tscn",
		}
	if(itemState.isHalfDamaged()):
		return {
			"clothing": "res://Inventory/RiggedModels/InmateUniform/damaged/OrangeInmateUniformHalfDamaged.tscn",
		}
	return {
		"clothing": "res://Inventory/RiggedModels/InmateUniform/OrangeInmateUniform.tscn",
	}

func getInventoryImage():
	if(inmateType == InmateType.SexDeviant):
		return "res://Images/Items/equipment/shirtlilac.png"
	if(inmateType == InmateType.HighSec):
		return "res://Images/Items/equipment/shirtred.png"
	return "res://Images/Items/equipment/shirtorange.png"
