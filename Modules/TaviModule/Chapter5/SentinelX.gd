extends Character

func _init():
	id = "sentinelx"
	npcLevel = 25
	npcBasePain = 250
	npcBaseLust = 500
	npcBaseStamina = 200
	npcCharacterType = CharacterType.Guard
	
	pickedSkin="HumanSkin"
	pickedSkinRColor=Color("ff080808")
	pickedSkinGColor=Color("ff363636")
	pickedSkinBColor=Color("ff678def")
	npcSkinData={
	"hair": {"r": Color("ff21253e"),"g": Color("ff4143a8"),"b": Color("ff000000"),},
	"penis": {"r": Color("ff242424"),"g": Color("ff070707"),"b": Color("ff01b2f9"),},
	}
	
	npcLustInterests = {
	}
	
func _getName():
	return "Sentinel-X"

func getGender():
	return Gender.Other
	
func getPronounGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Experimental android guard. Its body features a completely black shiny protective layer that goes over its rigid frame."

func getSpecies():
	return [Species.Canine]

func _getAttacks():
	return ["SentinelHeatGrenade", "SentinelLatexBarrage", "SentinelLatexStrike", "SentinelLatexSlam", "SentinelLatexRegeneration", "trygetupattack"]

#func getFightIntro(_battleName):
#	return "The guard holds his weapon tightly and waits for you to do the first move.\n\n"+formatSay("You know it’s only gonna end one way for you.")

func getThickness() -> int:
	return 80

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 25
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))

func getDefaultEquipment():
	return []

func getFluidType(_fluidSource):
	return "BlackGoo"
