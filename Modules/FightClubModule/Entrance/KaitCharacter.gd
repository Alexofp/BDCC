extends Character

func _init():
	id = "kait"
	#npcHasMenstrualCycle = true
	
func _getName():
	return "Kait"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Snow leopard lilac girl"

func getSpecies():
	return ["feline"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
