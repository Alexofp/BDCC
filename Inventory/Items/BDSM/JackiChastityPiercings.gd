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
	return {
		"chastity_piercings": "res://Inventory/RiggedModels/ChastityPiercings/ChastityPiercings.tscn",
	}

func shouldBeVisibleOnDoll(_character, _doll):
	if(!_character.isBodypartCovered(BodypartSlot.Vagina) || _doll.isForcedExposed(BodypartSlot.Vagina)):
		return true
	return false

func getInventoryImage():
	return "res://Images/Items/bdsm/chastitypiercing.png"
