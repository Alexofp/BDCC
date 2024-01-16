extends Character

func _init():
	id = "novaArena"
	
	pickedSkin="NovaSkin"
	pickedSkinRColor=Color("ffc5c4c4")
	pickedSkinGColor=Color("ff414241")
	pickedSkinBColor=Color("ff747474")
	npcSkinData={
	"hair": {"r": Color("ffd9d9d9"),"g": Color("ff0f5fdb"),"b": Color("ff0f5fdb"),},
	"ears": {"r": Color("ff737373"),"g": Color("ffb5b5b5"),"b": Color("ffb8b8b8"),},
	"penis": {"g": Color("ffd12020"),"b": Color("ff8b0000"),},
	}
	
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
	if(_battleName == "arenafight"):
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
	var mes = "Nova’s power armor lights up as she grabs her trusty stun baton and directs her attention to you."
	mes += "\n\n"
	return mes+formatSay("You have no right to remain silent, anything I say will be used against you. Come here, sweetie~")


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

func getDefaultEquipment():
	return ["GuardArmor"]
