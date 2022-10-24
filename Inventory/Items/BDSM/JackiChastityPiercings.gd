extends ItemBase

func _init():
	id = "JackiChastityPiercings"

func getVisibleName():
	return "Chastity Piercings"
	
func getA():
	return "a"
	
func getDescription():
	return "Piercings that stich the pussy up"

func getClothingSlot():
	return InventorySlot.Vagina

func getBuffs():
	return [
		buff(Buff.ChastityVaginaBuff),
		]

func getPrice():
	return 0

func canSell():
	return false

func getTags():
	return [ItemTag.BDSMRestraint]

func isImportant():
	return true

func generateRestraintData():
	restraintData = RestraintUnremovable.new()

func getRiggedParts(_character):
	# Change this somehow to support exposedBodyparts in 3d scenes
	if(_character.isBodypartCovered(BodypartSlot.Vagina)):
		return null
	return {
		"chastity_piercings": "res://Inventory/RiggedModels/ChastityPiercings/ChastityPiercings.tscn",
	}
