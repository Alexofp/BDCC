extends Character

func _init():
	id = "jaxonbrothertau"
	npcCharacterType = CharacterType.Generic
	disableSerialization = true
	
func _getName():
	return "Guard"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "One of the guards of the research space station 'Exodus'. Jaxon's brother"

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
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("GuardArmor"))
