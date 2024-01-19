extends Character

func _init():
	id = "announcer"
	
	pickedSkin="HumanSkin"
	pickedSkinRColor=Color("ff593737")
	pickedSkinGColor=Color("ff3b3434")
	pickedSkinBColor=Color("ff847a7a")
	npcSkinData={
	"hair": {"r": Color("ff1a1515"),"g": Color("ff4e4747"),"b": Color("ff444040"),},
	"penis": {"g": Color("ff5e3c3c"),"b": Color("ff412a2a"),},
	}
	
	npcLevel = 1
	npcBasePain = 100
	npcBaseLust = 100
	npcCharacterType = CharacterType.Inmate
	
	npcLustInterests = {

	}
	
func _getName():
	return "The Announcer"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Lilac inmate. Pure human with a black skin and a very smooth voice"

func getChatColor():
	return "#EE3EFF"

func getSpecies():
	return ["human"]

func _getAttacks():
	return ["biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return getName() + " gets into the combat stance and prepares for a fight."

func getThickness() -> int:
	return 80

func getFemininity() -> int:
	return 25

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("plantilegs"))
	var penis = GlobalRegistry.createBodypart("humanpenis")
	penis.lengthCM = 15
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("coolhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanhead"))

func getLootTable(_battleName):
	return InmateLoot.new()

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformSexDeviant"]
