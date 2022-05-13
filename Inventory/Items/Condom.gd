extends ItemBase


func _init():
	id = "Condom"

func getVisibleName():
	return "Condom"
	
func getDescription():
	return "Gets sold as a pack of 10! Good against unwanted pregnancies, most of the time.\n\nSmall text on the package says that every tenth one is replaced with a balloon for all your entertaiment needs."

func getPrice():
	return 1

func canSell():
	return true

func canCombine():
	return true

func getBuyAmount():
	return 10

func getTags():
	return [ItemTag.Condom]

func getCondomBreakChance():
	return 20.0
