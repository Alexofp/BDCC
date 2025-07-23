extends Character

func _init():
	id = "pspip"
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="CrystalineSkin"
	pickedSkinRColor=Color("ffee795c")
	pickedSkinGColor=Color("ffc74d44")
	pickedSkinBColor=Color("ff512b1d")
	npcSkinData={
	"hair": {"r": Color("ff5a2626"),"g": Color("ff892d2d"),"b": Color("ffc13b3b"),},
	"ears": {"skin": "wolfearstribal","g": Color("fff74b3e"),},
	"penis": {"skin": "equinemottled3","g": Color("ff2f2021"),"b": Color("ffd2452c"),},
	}
	
	
func _getName():
	return "Pip"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "One of the other slaves. A soft-looking stud."

func getSpecies():
	return [Species.Equine]

func getThickness() -> int:
	return 80

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("horsehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("wolfears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = 0
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("equinepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1.2
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("horsetail")
	tail.tailScale = 1.2
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("hoofs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorthair2"))

func getDefaultEquipment():
	if(GM.main.PS && GM.main.PS.id == "MilkCafe"):
		if(!GM.main.PS.isPipCaged()):
			return ["oldcollar"]
	return ["oldcollar", "ChastityCage"]
