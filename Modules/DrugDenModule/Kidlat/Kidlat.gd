extends Character

func _init():
	id = "kidlat"
	npcHasMenstrualCycle = true
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="KidlatSkin"
	pickedSkinRColor=Color("ff323137")
	pickedSkinGColor=Color("ff12cee7")
	pickedSkinBColor=Color("ff135d6f")
	npcSkinData={
	"hair": {"r": Color("ff1a1823"),"g": Color("ff494ea0"),"b": Color("ff13d9da"),},
	"ears": {"b": Color("ff7113ed"),},
	}
	
func _getName():
	return "Kidlat"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A cute feline with a striking neon-like fur pattern."

func getSpecies():
	return ["feline"]

func getChatColor():
	return '#13d9da'

func getThickness() -> int:
	return 75

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("kidlathair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 4
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("fluffyfelinetail")
	tail.tailScale = 0.8
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformSexDeviant"]
