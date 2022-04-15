extends ItemBase


func _init():
	id = "LatexStraitjacket"

func getVisibleName():
	return "Latex Straitjacket"

func getDescription():
	return "A very fashionable straitjacket with included chastity belt and holes for breasts"

func getClothingSlot():
	return InventorySlot.Body

func getBuffs():
	return [
		buff(Buff.BlockedHandsBuff),
		buff(Buff.RestrainedArmsBuff),
		]

func getTags():
	return [ItemTag.BDSMRestraint]

func isRestraint():
	return true

func coversBodyparts():
	return [BodypartSlot.Body, BodypartSlot.Vagina, BodypartSlot.Penis, BodypartSlot.Anus]

func generateRestraintData():
	restraintData = RestraintRopeHarness.new()
	restraintData.setLevel(5)
