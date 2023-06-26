extends Character

func _init():
	id = "captain"
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="FerriSkin"
	pickedSkinRColor=Color("ff404040")
	pickedSkinGColor=Color("ff545454")
	pickedSkinBColor=Color("ff545454")
	npcSkinData={
	"hair": {"r": Color("ff252525"),"g": Color("ff252525"),"b": Color("ff001384"),},
	"ears": {"g": Color("ffe3776f"),},
	}
	
func _getName():
	return "Cpt. Wright"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Canine with black fur. Very formal clothing"

func getSpecies():
	return ["canine"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("combedbackhair"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("OfficialClothes"))
