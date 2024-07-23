extends Character

func _init():
	id = "alexrynardyp"
	
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="CunningSkin"
	pickedSkinRColor=Color("ffe07a35")
	pickedSkinGColor=Color("ffe7e7e7")
	pickedSkinBColor=Color("ff512c13")
	npcSkinData={
	"hair": {"r": Color("ff1f1f1f"),"g": Color("ff090909"),"b": Color("ffb8542d"),},
	"ears": {"b": Color("ffffffff"),},
	"arms": {"g": Color("ff070707"),},
	"penis": {"g": Color("ffd2160c"),"b": Color("ff8b0000"),},
	"legs": {"g": Color("ff070707"),},
	}
	
	disableSerialization = true
	
func _getName():
	return "Alex Rynard"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Male fox with a cold stare."

func getSpecies():
	return ["canine"]

func getChatColor():
	return '#FFF60C'

func getThickness() -> int:
	return 70

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxtail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["EngineerClothes", "plainBriefs"]
