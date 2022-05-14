extends ItemBase


func _init():
	id = "QualityCondom"

func getVisibleName():
	return "Expensive Condom"
	
func getDescription():
	return "Three for the price of two! These ones seem to be made out of a premium material designed to enhance the experience while providing almost 100% protection against breaking"

func getPrice():
	return 2

func canSell():
	return true

func canCombine():
	return true

func getBuyAmount():
	return 3

func getTags():
	return [
		ItemTag.Condom,
		ItemTag.SoldByMedicalVendomat,
	]

func getCondomBreakChance():
	return 1.0
