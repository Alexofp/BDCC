extends ItemBase

func _init():
	id = "SocketCrotchCover"

func getVisibleName():
	return "Crotch Cover"
	
func getDescription():
	return "A cool crotch cover that somehow holds on its own"

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
#
#func getTags():
#	return [ItemTag.BDSMRestraint]
#
#func isImportant():
#	return true
#
#func generateRestraintData():
#	restraintData = RestraintUnremovable.new()

func getRiggedParts(_character):
	return {
		"chastity_piercings": "res://Inventory/RiggedModels/SocketArmor/SocketCrotchCover.tscn",
	}

func shouldBeVisibleOnDoll(_character, _doll):
	if(!_character.isBodypartCovered(BodypartSlot.Vagina) || _doll.isForcedExposed(BodypartSlot.Vagina)):
		return true
	return false
#
#func getInventoryImage():
#	return "res://Images/Items/bdsm/chastitypiercing.png"
