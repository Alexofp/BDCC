extends Character

func _init():
	id = "novaArena"
	
	npcArmor = {
		DamageType.Physical: 30,
	}
	npcLevel = 10
	npcBasePain = 200
	npcBaseLust = 150
	npcCharacterType = CharacterType.Guard

	
	
func getAmbientLust():
	return 40
	
func _getName():
	return "Nova"

func getGender():
	return Gender.Androgynous
	
func getPronounGender():
	return Gender.Female
	
func getSmallDescription() -> String:
	return "Gray husky that wears hi-tech guard armor. Medium height, fit body"

func getSpecies():
	return ["canine"]

func _getAttacks():
	return ["stunbatonAttack", "stunbatonOverchargeAttack", "AIHumiliateMommy", "shoveattack", "trygetupattack"]

func getFightIntro(_battleName):
	var mes = "Seeing one of the staff members in the arena is quite strange, Nova pulls out her trusty stun baton and directs her attention to the crowd."
	mes += "\n\n"
	mes += "[say=nova]This is a bust, everyone please quietly lower yourself to your knees and await my justice.[/say]"
	mes += "\n\n"
	mes += "She is met with mostly quietness from the crowd. Someone brave yells ‘Go fuck yourself, slut!’."
	mes += "\n\n"
	mes += "[say=nova]Should have seen your faces. Nah, the only one who should worry is you.[/say]"
	mes += "\n\n"
	mes += "The husky points at you with her weapon before taking a fighting stance. She also flicks some kind of switch on her advanced power armor, causing it to light up like a christmas tree. Seems like she is way more protected than usual."
	mes += "\n\n"
	mes += "[say=nova]I’m awfully horny today, cutie. Gonna help a dog bury her bone?[/say]"
	return mes

func getPenisSize():
	return 18.0

func getChatColor():
	return '#90A9F4'

func createBodyparts():
	var mybreasts: BodypartBreasts = GlobalRegistry.createBodypart("humanbreasts")
	mybreasts.size = BreastsSize.G
	giveBodypartUnlessSame(mybreasts)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("caninehead"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("vagina"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anus"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthrobody"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("anthroarms"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("canineears"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("shorthair"))
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("digilegs"))
	var penis:BodypartPenis = GlobalRegistry.createBodypart("caninepenis")
	penis.lengthCM = 21
	giveBodypartUnlessSame(penis)
	giveBodypartUnlessSame(GlobalRegistry.createBodypart("huskytail"))

func getThickness():
	return 115


func getLootTable(_battleName):
	return GuardLoot.new()

func getParentCharacterID():
	return "nova"

func createEquipment():
	getInventory().equipItem(GlobalRegistry.createItemNoID("GuardArmor"))
