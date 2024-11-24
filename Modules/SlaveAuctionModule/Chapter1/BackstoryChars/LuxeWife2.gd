extends Character

func _init():
	id = "luxewife2"
	
	pickedSkin="LuxeSkin"
	pickedSkinRColor=Color("ff171717")
	pickedSkinGColor=Color("ff353535")
	pickedSkinBColor=Color("fff8c610")
	npcSkinData={
	"head": {"skin": "DappledSkin",},
	"hair": {"r": Color("ff2f2f2f"),"g": Color("ffddc502"),"b": Color("ffffbe11"),},
	"penis": {"g": Color("ff222b35"),"b": Color("ffffb800"),},
	"tail": {"skin": "EmptySkin",},
	}
	disableSerialization = true
	
func _getName():
	return "Aisha"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Your wife"

#func getChatColor():
#	return "#E24F4D"

func getSpecies():
	return ["feline"]

func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 2
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("felinepenis")
	penis.lengthCM = 15
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("felinetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("manehair"))

func getDefaultEquipment():
	return [{
		id = "Leotard",
		data = {
			clothesColor = "222222",
			amount = 1,
		},
	}]
