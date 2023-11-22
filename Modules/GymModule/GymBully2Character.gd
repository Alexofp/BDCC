extends Character

func _init():
	id = "gymbully2"
	
	npcLevel = 10
	npcBasePain = 180
	npcBaseLust = 150
	npcCharacterType = CharacterType.Inmate
	
	pickedSkin="SoftSpikySkin"
	pickedSkinRColor=Color("ffde9c71")
	pickedSkinGColor=Color("ffdcdcdc")
	pickedSkinBColor=Color("ff7f573c")
	npcSkinData={
	"head": {"skin": "StripesSkin",},
	"hair": {"r": Color("ff2c1e14"),"g": Color("ff1c1c1c"),"b": Color("ff000000"),},
	"arms": {"skin": "WoonaSkin",},
	"penis": {"g": Color("ffff0000"),"b": Color("ff8b0000"),},
	"legs": {"skin": "MonsterGirl",},
	}
	
	npcLustInterests = {

	}
	
func _getName():
	return "Quiet Bully"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Red inmate, has a red band on his head."

func getSpecies():
	return ["canine"]
	
func _getAttacks():
	return ["biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getThickness() -> int:
	return 60

func getFemininity() -> int:
	return 0

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("messyhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	var breasts = GlobalRegistry.createBodypart("malebreasts")
	breasts.size = -1
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 18
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))

func getLootTable(_battleName):
	return InmateLoot.new()

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("inmatecollar"))
	getInventory().equipItem(GlobalRegistry.createItemNoID("inmateuniformHighsec"))
