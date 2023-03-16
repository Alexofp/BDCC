extends Character

func _init():
	id = "rahiRabi"
	disableSerialization = true
	
func _getName():
	return "Rabi Haj'jar"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Rahi's twin brother."

func getSpecies():
	return ["feline"]
	
func getChatColor():
	return '#FF8E5E'
	
func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 10

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("simplehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("CasualClothes"))
