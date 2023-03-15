extends Character

func _init():
	id = "rahiAlphaCorpLady"
	disableSerialization = true
	
func _getName():
	return "AlphaCorp Lady"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A tall woman wearing official AlphaCorp clothes."

func getSpecies():
	return ["human"]
	
func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 6
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("OfficialClothes"))
