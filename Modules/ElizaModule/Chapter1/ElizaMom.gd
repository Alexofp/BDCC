extends Character

func _init():
	id = "elizaMom"
	npcCharacterType = CharacterType.Generic
	
	pickedSkin="LuxeSkin"
	pickedSkinRColor=Color("ffedc68f")
	pickedSkinGColor=Color("fffff1e2")
	pickedSkinBColor=Color("ffc84977")
	npcSkinData={
	"head": {"skin": "TaviSkin",},
	"hair": {"r": Color("ffa76762"),"g": Color("ffff0054"),"b": Color("ffff5bd6"),},
	"ears": {"g": Color("ffff727d"),"b": Color("ffcbcbcb"),},
	}
	
	npcHasMenstrualCycle = true
	
func _getName():
	return "Scarlet Quinn"

func getGender():
	return Gender.Female
	
func getChatColor():
	return "#F26AB5"
	
func getSmallDescription() -> String:
	return "An elegant feline with pastel yellow fur and some small purple marks sprinkled around. Has deep eyes of a mature woman. Wears a lab coat"

func getSpecies():
	return ["feline"]

func getThickness() -> int:
	return 130

func getFemininity() -> int:
	return 100

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("bunhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 7
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	var tail = GlobalRegistry.createBodypart("felinetail")
	tail.tailScale = 1.2
	giveBodypartUnlessSame(tail)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["LabcoatOutfitAlt", "LaceBra", "LacePanties"]
