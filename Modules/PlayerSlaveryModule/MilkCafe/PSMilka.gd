extends Character

func _init():
	id = "psmilka"
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="SmuttySkin"
	pickedSkinRColor=Color("ffffacdb")
	pickedSkinGColor=Color("fff04a8c")
	pickedSkinBColor=Color("ffd43e73")
	npcSkinData={
	"head": {"skin": "ArticSkin",},
	"hair": {"r": Color("ff5c0b61"),"g": Color("ffb52929"),"b": Color("ffc43333"),},
	"ears": {"skin": "bulldogradiant",},
	"arms": {"skin": "ArconSkin",},
	"breasts": {"g": Color("ffe66b99"),},
	"tail": {"skin": "ArticSkin",},
	"legs": {"skin": "VerySpiky",},
	}
	
func _getName():
	return "Milka"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "One of the other slaves. A cute-looking doggo."

func getSpecies():
	return [Species.Canine]

func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("caninetail")
	tail.tailScale = 1
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("bulldogears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorthair"))

func getDefaultEquipment():
	return ["oldcollar"]

func updateBodyparts():
	#if(taviModule.hasHorns()):#.hasHorns()):
	#	if(giveBodypartUnlessSame(GlobalRegistry.createBodypart("demonhorns2"))):
	#		paintBodyparts()
	#elif(hasBodypart(BodypartSlot.Horns)):
	#	removeBodypart(BodypartSlot.Horns)
	if(GM.main.PS && GM.main.PS.id == "MilkCafe"):
		var breasts: BodypartBreasts = getBodypart(BodypartSlot.Breasts)
		breasts.size = GM.main.PS.getMilkaBreastSize()
