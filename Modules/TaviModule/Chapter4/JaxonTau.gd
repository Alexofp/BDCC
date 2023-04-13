extends Character

func _init():
	id = "jaxontau"
	npcCharacterType = CharacterType.Generic
	disableSerialization = true
	
func _getName():
	return "Jaxon"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "One of the guards of the research space station 'Exodus'"

func getSpecies():
	return ["human"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorthair"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("GuardArmor"))
