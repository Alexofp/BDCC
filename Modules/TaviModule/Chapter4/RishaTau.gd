extends Character

func _init():
	id = "rishatau"
	#npcLevel = 5
	#npcBasePain = 150
	#npcBaseLust = 120
	npcCharacterType = CharacterType.Generic
	
	npcHasMenstrualCycle = false
	disableSerialization = true
	
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

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("Leotard"))
