extends Character

func _init():
	id = "luxe"
	
	pickedSkin="LuxeSkin"
	pickedSkinRColor=Color("ff171717")
	pickedSkinGColor=Color("ff353535")
	pickedSkinBColor=Color("fff8c610")
	npcSkinData={
	"hair": {"r": Color("ff171717"),"g": Color("ff353535"),"b": Color("fff8c610"),},
	"penis": {"skin": "Weiny","g": Color("ff1e1900"),"b": Color("ffffb800"),},
	}
	
	npcLevel = 50
	npcBasePain = 500
	npcBaseLust = 500
	npcCharacterType = CharacterType.Generic
	
	npcLustInterests = {

	}
	
func _getName():
	return "Luxe Blacktail"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "A wolf with dark fur and a very mean stare."

func getChatColor():
	return "#D8D500"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("manehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 30
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["OfficialClothesRed", "plainBriefs"]
