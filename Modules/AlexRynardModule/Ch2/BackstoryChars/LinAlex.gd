extends Character

func _init():
	id = "lin_alex"
	
	pickedSkin="WildSkin"
	pickedSkinRColor=Color("ffc3671c")
	pickedSkinGColor=Color("ffffc898")
	pickedSkinBColor=Color("ff97431c")
	npcSkinData={
	"hair": {"r": Color("ff000000"),"g": Color("ff152054"),"b": Color("ff1e2d70"),},
	"tail": {"skin": "TaviSkin",},
	}
	
	npcCharacterType = CharacterType.Generic
	disableSerialization = true
	
func _getName():
	return "Lin"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Alex's colleague, a young foxy."

func getSpecies():
	return ["canine"]
	
func getThickness() -> int:
	return 75

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 4
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ferrihair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxtail"))

func getDefaultEquipment():
	return ["EngineerClothes", "LaceBra", "LacePanties"]
