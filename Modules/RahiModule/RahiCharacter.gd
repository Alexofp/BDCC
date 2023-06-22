extends Character

func _init():
	id = "rahi"
	npcHasMenstrualCycle = true
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ffaf5a5a")
	pickedSkinGColor=Color("ffc7867c")
	pickedSkinBColor=Color("ff9e5050")
	npcSkinData={
	"hair": {"r": Color("ffab3e3e"),"g": Color("ffaf3131"),"b": Color("ff2288ab"),},
	"penis": {"g": Color("ffd42525"),"b": Color("ffbf1616"),},
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

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("inmatecollar"))
	getInventory().equipItem(GlobalRegistry.createItemNoID("inmateuniform"))
	
	#getInventory().equipItem(GlobalRegistry.createItemNoID("LaceBra"))
	#getInventory().equipItem(GlobalRegistry.createItemNoID("LacePanties"))
