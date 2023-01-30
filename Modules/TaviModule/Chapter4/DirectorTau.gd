extends Character

func _init():
	id = "directortau"
	npcCharacterType = CharacterType.Generic
	
func _getName():
	return "Director"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A male human of older age with a cold piercing gaze."

func getSpecies():
	return ["human"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("coolhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("OfficialClothes"))
