extends ItemBase
class_name HK_Glasses

func _init():
	id = "VionGlasses"

func getVisibleName():
	return "Glasses"
	
func getDescription():
	return "A pair of antique glasses. Who even needs these anymore?"

func getClothingSlot():
	return InventorySlot.Eyes
	
func getPossibleActions():
	return []
	
func getTakeOffScene():
	return "TakeAnyItemOffScene"

func getPrice():
	return 0

func canSell():
	return true

func getTags():
	return []

func isRestraint():
	return false

func getUnriggedParts(_character):
	return {
		"blindfold": ["res://Modules/HypnokinkModule/Items/Glasses/GlassesModel.tscn"]
		}
