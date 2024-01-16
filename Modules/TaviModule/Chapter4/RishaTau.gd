extends Character

func _init():
	id = "rishatau"
	#npcLevel = 5
	#npcBasePain = 150
	#npcBaseLust = 120
	npcCharacterType = CharacterType.Generic
	
	npcHasMenstrualCycle = false
	disableSerialization = true
	
	pickedSkin="FerriSkin"
	pickedSkinRColor=Color("ff007e91")
	pickedSkinGColor=Color("ffd0e4e3")
	pickedSkinBColor=Color("ff000000")
	npcSkinData={
	"hair": {"r": Color("ff003e6f"),"g": Color("ff113c5e"),"b": Color("ff00335c"),},
	"ears": {"g": Color("ffff5858"),},
	"penis": {"g": Color("ffc31919"),"b": Color("ffd0501e"),},
	}
	
func _getName():
	return "Risha"

func getGender():
	return Gender.Androgynous
	
func getPronounGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A very tall and strong lynx with cyan fur."

func getSpecies():
	return ["feline"]

func getThickness() -> int:
	return 110

func getFemininity() -> int:
	return 70

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("overeyehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("lynxears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 8
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("felinepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorttail"))

func getDefaultEquipment():
	return ["Leotard"]
