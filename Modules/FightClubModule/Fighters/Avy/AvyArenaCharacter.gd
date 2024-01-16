extends Character

func _init():
	id = "avyArena"
	
	pickedSkin="WoonaSkin"
	pickedSkinRColor=Color("ff393939")
	pickedSkinGColor=Color("ff242424")
	pickedSkinBColor=Color("ff1f1f1f")
	npcSkinData={
	"hair": {"r": Color("ff161616"),"g": Color("ffff0000"),"b": Color("ff070707"),},
	"ears": {"g": Color("ff890000"),"b": Color("fff00000"),},
	"breasts": {"g": Color("ff581818"),"b": Color("ff800000"),},
	"penis": {"g": Color("ffff0000"),"b": Color("ff8b0000"),},
	}
	
	npcLevel = 30
	npcBasePain = 300
	npcBaseLust = 300
	npcBaseStamina = 300
	npcCharacterType = CharacterType.Inmate
	
	
func _getName():
	return "Avy"

func getGender():
	return Gender.Androgynous
	
func getPronounGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Red inmate, medium-height fox with a black fur and a feminine look."

func getSpecies():
	return ["canine"]
	
func _getAttacks():
	return ["biteattack", "simplekickattack", "AttackFury", "AvyDrugHeal", "AvyMeanGaze", "DestroyRestraintsAttack", "EvasiveManeuver", "FeralAssault", "trygetupattack"]

func getFightIntro(_battleName):
	if(_battleName == "arenafight"):
		return "Avy stands tall, her foxy tail swishing behind her. It seems she is waiting for you to do the first move.."
	return "Avy stands straight, her hands slightly behind her, clawed digits spread out."

func getThickness() -> int:
	return 75

func getFemininity() -> int:
	return 50

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 4
	giveBodypartUnlessSame(breasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("foxhead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("longhair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	var penis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninetail"))

func getLootTable(_battleName):
	return InmateLoot.new()

func getDefaultEquipment():
	return ["inmatecollar", "inmateuniformHighsec"]
	
func getParentCharacterID():
	return "avy"
