extends Character

func _init():
	id = "rahiMineOwner"
	disableSerialization = true
	
func _getName():
	return "Owner"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A human wearing a fancy old suit."

func getSpecies():
	return ["human"]
	
func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 55

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanoldhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("combedbackhair"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("OfficialClothes"))
