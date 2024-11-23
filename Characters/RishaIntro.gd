extends Character

func _init():
	id = "rishaIntro"
	npcLevel = 1
	npcBasePain = 100
	npcBaseLust = 80
	npcCharacterType = CharacterType.Guard
	
	pickedSkin="FerriSkin"
	pickedSkinRColor=Color("ff007e91")
	pickedSkinGColor=Color("ffd0e4e3")
	pickedSkinBColor=Color("ff000000")
	npcSkinData={
	"hair": {"r": Color("ff003e6f"),"g": Color("ff113c5e"),"b": Color("ff00335c"),},
	"ears": {"g": Color("ffff5858"),},
	"penis": {"g": Color("ffc31919"),"b": Color("ffd0501e"),},
	}
	
func _getName():
	return "Risha"

func getGender():
	return Gender.Androgynous
	
func getPronounGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "A very tall lynx with cyan fur. Usually wears her bulky guard armor. Her feline face features a huge amount of piercings"

func getSpecies():
	return ["feline"]

func _getAttacks():
	return ["aitaunthumiliate", "stunbatonAttack", "stunbatonStrongAttack", "biteattack", "simplekickattack", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	return getName() + " eyes you out and licks her lips.\n\n"+("[say=risha]You're an easy prey for me. Why don't you just undress and we can have some fun instead~[/say]")+"\n\nRisha then gets into a combat stance and gestures you to come closer. Her heavy armor doesn't seem to impact her mobility one bit, her hand holds the stun baton very tightly\n\nSeems the first move is yours"

func getThickness() -> int:
	return 110

func getFemininity() -> int:
	return 70

func createBodyparts():
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("felinehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("overeyehair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("lynxears2"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("buffarms"))
	var breasts = GlobalRegistry.createBodypart("humanbreasts")
	breasts.size = 8
	giveBodypartUnlessSame(breasts)
	var penis = GlobalRegistry.createBodypart("felinepenis")
	penis.lengthCM = 22
	penis.ballsScale = 1
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorttail"))

func getParentCharacterID():
	return "risha"

func getDefaultEquipment():
	return ["GuardArmor", "RishaPiercings"]
