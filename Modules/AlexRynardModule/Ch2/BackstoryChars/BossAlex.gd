extends Character

func _init():
	id = "boss_alex"
	
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="VerySpiky"
	pickedSkinRColor=Color("ffc78006")
	pickedSkinGColor=Color("ff3d1717")
	pickedSkinBColor=Color("ff904141")
	npcSkinData={
	"hair": {"r": Color("ff361840"),"g": Color("ff8b2d2d"),"b": Color("ff090909"),},
	"ears": {"b": Color("ffffffff"),},
	"arms": {"g": Color("ff070707"),},
	"legs": {"g": Color("ff070707"),},
	}
	
	disableSerialization = true
	
func _getName():
	return "Boss"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Alex's boss."

func getSpecies():
	return ["canine"]

func getChatColor():
	return '#947CFF'

func getThickness() -> int:
	return 80

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("simplehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxtail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["OfficialClothes"]
