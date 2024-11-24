extends Character

func _init():
	id = "luxewife"
	
	pickedSkin="DappledSkin"
	pickedSkinRColor=Color("ff141414")
	pickedSkinGColor=Color("ff393939")
	pickedSkinBColor=Color("ff385578")
	npcSkinData={
	"hair": {"r": Color("ff3f6798"),"g": Color("ff294262"),"b": Color("ff769fd1"),},
	"ears": {"b": Color("ffafafaf"),},
	"penis": {"skin": "Gradientfeline","g": Color("ff222b35"),"b": Color("ff2b78d6"),},
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
	breasts.size = 3
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
