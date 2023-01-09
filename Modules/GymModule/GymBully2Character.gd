extends Character

func _init():
	id = "gymbully2"
	
	npcLevel = 5
	npcBasePain = 80
	npcBaseLust = 50
	npcCharacterType = CharacterType.Inmate
	
	npcLustInterests = {

	}
	
func _getName():
	return "Bully"

func getGender():
	return Gender.Male
	
func getSmallDescription() -> String:
	return "Red inmate, has a red band on his head."

func getSpecies():
	return ["canine"]
	
func _getAttacks():
	return ["biteattack", "simplekickattack", "stretchingAttack", "lickWounds", "shoveattack", "trygetupattack"]

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
