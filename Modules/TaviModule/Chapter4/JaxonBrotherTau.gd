extends Character

func _init():
	id = "jaxonbrothertau"
	npcCharacterType = CharacterType.Generic
	disableSerialization = true
	
	pickedSkin="HumanSkin"
	pickedSkinRColor=Color("ffe8a894")
	pickedSkinGColor=Color("ffd69382")
	pickedSkinBColor=Color("fff3d7ca")
	npcSkinData={
	"hair": {"r": Color("ff1b222e"),"g": Color("ff7994be"),"b": Color("ff606991"),},
	}
	
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

func getDefaultEquipment():
	return ["GuardArmor"]
