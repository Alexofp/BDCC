extends Character

func _init():
	id = "rahi"
	npcHasMenstrualCycle = true
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ffc0705d")
	pickedSkinGColor=Color("ffdf8b78")
	pickedSkinBColor=Color("ffb55945")
	npcSkinData={
	"hair": {"r": Color("ffb05745"),"g": Color("ffb05745"),"b": Color("ff2288ab"),},
	}
	
func _getName():
	return "Rahi"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Wears a general block uniform with number P-12406. She is of medium height, has brown fur and a ponytail. Her naive eyes are blue."

func getSpecies():
	return ["feline"]

func getThickness() -> int:
	return 50

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 3
	giveBodypartUnlessSame(breasts)

func onGivingBirth(_impregnatedEggCells: Array, _newkids: Array):
	.onGivingBirth(_impregnatedEggCells, _newkids)
	
	GM.main.increaseModuleFlag("RahiModule", "Rahi_GaveBirthTimes", 1)

func getBirthWaitTime():
	return 60*60*24*2

func getDefaultEquipment():
	if(GM.main != null && GM.main.getFlag("RahiModule.wearingPortalPanties")):
		return ["inmatecollar", "inmateuniform", "PortalPanties"]
	return ["inmatecollar", "inmateuniform"]
