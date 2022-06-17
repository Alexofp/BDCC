extends ItemBase

func _init():
	id = "inmatecollar"

func getVisibleName():
	return "Inmate collar"
	
func getDescription():
	return "Bulky and very uncomofortable collar made out of casted iron. Has a magnetic lock and a constantly blinking red light."

func getClothingSlot():
	return InventorySlot.Neck

func getBuffs():
	return [
		]

func getTakeOffScene():
	return "CollarTuggingScene"

func isRestraint():
	return true

func generateRestraintData():
	restraintData = RestraintUnremovable.new()

func getUnriggedParts(_character):
	return {
		"neck": ["res://Inventory/UnriggedModels/Collar/CollarModel.tscn"],
	}
