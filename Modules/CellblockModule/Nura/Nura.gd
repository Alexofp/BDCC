extends Character

func _init():
	id = "nura"
	
	npcCharacterType = CharacterType.Nurse
	
func _getName():
	return "Nur-A"

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "A feature-less android."

func getSpecies():
	return ["human"]

func getThickness() -> int:
	return 30

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("androidhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 2
	giveBodypartUnlessSame(breasts)

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("AndroidSuit"))
