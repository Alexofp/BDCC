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
	"penis": {"skin": "Weiny","g": Color("ff12cee7"),"b": Color("ff0070ac"),},
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

func updateBodyparts():
	var kidlatModule = GlobalRegistry.getModule("DrugDenModule")
	
	if(kidlatModule.kidlatShouldHaveCock()):
		if(!hasBodypart(BodypartSlot.Penis)):
			var penis = GlobalRegistry.createBodypart("caninepenis")
			penis.lengthCM = 22
			penis.ballsScale = 1
			if(giveBodypartUnlessSame(penis)):
				paintBodyparts()
	else:
		removeBodypart(BodypartSlot.Penis)

func getDefaultEquipment():
	if(GlobalRegistry.getModule("DrugDenModule").isKidlatBound()):
		return ["inmatecollar", "inmatewristcuffs", "inmateanklecuffs", "blindfold"]
	if(GM.main != null && GM.main.getFlag("DrugDenModule.KidlatWearsPortalPanties")):
		return ["inmatecollar", "inmateuniformSexDeviant", "PortalPantiesUnlocked"]
	return ["inmatecollar", "inmateuniformSexDeviant"]
