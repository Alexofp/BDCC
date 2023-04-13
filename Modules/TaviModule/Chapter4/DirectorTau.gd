extends Character

func _init():
	id = "directortau"
	npcCharacterType = CharacterType.Generic
	disableSerialization = true
	
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

func getChatColor():
	return '#BABAD6'

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanoldhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("combedbackhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("OfficialClothes"))
