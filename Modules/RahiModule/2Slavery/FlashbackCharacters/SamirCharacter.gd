extends Character

func _init():
	id = "rahiFather"
	disableSerialization = true
	
func _getName():
	return "Samir Haj'jar"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Rahi's father."

func getSpecies():
	return ["feline"]
	
func getChatColor():
	return '#FF8E5E'
	
func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 30

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("coolhair"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("CasualClothes"))
