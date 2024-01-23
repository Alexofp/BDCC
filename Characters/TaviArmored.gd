extends Character

func _init():
	id = "taviArmored"
	
	npcLevel = 35
	npcBasePain = 150
	npcBaseLust = 150
	npcCharacterType = CharacterType.Inmate
	npcArmor = {
		DamageType.Physical: 50,
	}
	
	pickedSkin="TaviSkin"
	pickedSkinRColor=Color("ff57197c")
	pickedSkinGColor=Color("fffedaff")
	pickedSkinBColor=Color("ff00ff1c")
	npcSkinData={
	"hair": {"r": Color("ff7f1b9b"),"g": Color("ff00ff0f"),"b": Color("ff631c89"),},
	}
	
	
func _getName():
	return "Tavi"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Red block inmate. A very tall feline with a unique purple and green fur pattern and red/green eyes"

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["biteattack", "kickToBallsAttack", "slapTitsAttack", "stretchingAttack", "lickWounds", "shoveattack", "trygetupattack"]

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 90

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("tavihair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 4
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getDefaultEquipment():
	return ["inmatecollar", "GuardArmor"]

func getParentCharacterID():
	return "tavi"
