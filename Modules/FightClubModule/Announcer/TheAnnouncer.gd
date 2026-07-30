extends Character

func _init():
	id = "announcer"
	
	pickedSkin="HumanSkin"
	pickedSkinRColor=Color("ff593737")
	pickedSkinGColor=Color("ff423028")
	pickedSkinBColor=Color("ffa87d57")
	npcSkinData={
	"hair": {"r": Color("ff000000"),"g": Color("ff322727"),"b": Color("ff090909"),},
	"ears": {"b": Color("ff413937"),},
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
	return 60

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
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("humanoldhead"))

func getLootTable(_battleName):
	return InmateLoot.new()

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformSexDeviant"]
