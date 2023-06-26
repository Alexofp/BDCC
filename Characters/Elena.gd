extends Character

func _init():
	id = "elena"
	
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="HumanSkin"
	pickedSkinRColor=Color("ffff89a6")
	pickedSkinGColor=Color("ffbd57fd")
	pickedSkinBColor=Color("ff2ce9ff")
	npcSkinData={
	"hair": {"r": Color("ffb2a0da"),"g": Color("ffb776a9"),"b": Color("ffb776a9"),},
	}
	
func _getName():
	return "E.L.E.N.A."
	#Experimental Learning and Evolving Neural Algorithm

func getGender():
	return Gender.Other
	
func getSmallDescription() -> String:
	return "A hologram of a cute girl."

func getSpecies():
	return ["human"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("overeyehair2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanears"))

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("AndroidSuit"))
