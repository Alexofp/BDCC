extends Character

func _init():
	id = "mirri"
	
	pickedSkin="FurGirl"
	pickedSkinRColor=Color("ffb67d70")
	pickedSkinGColor=Color("ffbb5466")
	pickedSkinBColor=Color("ff1f1f1f")
	npcSkinData={
	"hair": {"r": Color("ff900c0a"),"g": Color("ff830200"),"b": Color("ff2c2a2a"),},
	"ears": {"r": Color("ff891917"),"g": Color("ffcca2a2"),"b": Color("fff3e9e9"),},
	"tail": {"r": Color("ff891917"),"g": Color("ff790402"),"b": Color("ff891917"),},
	}
	
	npcLevel = 15
	npcBasePain = 250
	npcBaseLust = 200
	npcCharacterType = CharacterType.Guard
	
	npcLustInterests = {

	}
	
func _getName():
	return "Mirri Blacktail"

func getGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A ginger guard who is wearing a very skimpy armor"

func getChatColor():
	return "#E24F4D"

func getSpecies():
	return ["feline", "human"]

func _getAttacks():
	return ["biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return getName() + " gets into the combat stance and prepares for a fight."

func getThickness() -> int:
	return 100

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = BreastsSize.D
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("ponytailhair3"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))

func getLootTable(_battleName):
	return GuardLoot.new()

func getDefaultEquipment():
	return ["MirriArmor", "MirriPanties"]
