extends Reference
class_name Module

var scenes = []
var characters = []
var items = []
var events = []
var quests = []

var attacks = []
var bodyparts = []
var species = []
var skills = []
var perks = []
var lustActions = []
var buffs = []
var statusEffects = []
var worldEdits = []
var gameExtenders = []
var computers = []
var partSkins = []

var id = "badmodule"
var author = "no author"
var flagsCache = null

func _init():
	flagsCache = getFlags()

func register():
	for scene in scenes:
		GlobalRegistry.registerScene(scene, author)
	
	for character in characters:
		GlobalRegistry.registerCharacter(character)
	
	for item in items:
		GlobalRegistry.registerItem(item)
	
	for event in events:
		GlobalRegistry.registerEvent(event)

	for quest in quests:
		GlobalRegistry.registerQuest(quest)
		
	for attack in attacks:
		GlobalRegistry.registerAttack(attack)
		
	for bodypart in bodyparts:
		GlobalRegistry.registerBodypart(bodypart)
	
	for specie in species:
		GlobalRegistry.registerSpecies(specie)
		
	for skill in skills:
		GlobalRegistry.registerSkill(skill)
		
	for perk in perks:
		GlobalRegistry.registerPerk(perk)
	
	for lustAction in lustActions:
		GlobalRegistry.registerLustAction(lustAction)
	
	for buff in buffs:
		GlobalRegistry.registerBuff(buff)
		
	for statusEffect in statusEffects:
		GlobalRegistry.registerStatusEffect(statusEffect)

	for worldEdit in worldEdits:
		GlobalRegistry.registerWorldEdit(worldEdit)
	
	for gameExtender in gameExtenders:
		GlobalRegistry.registerGameExtender(gameExtender)
	
	for computer in computers:
		GlobalRegistry.registerComputer(computer)

	for partSkin in partSkins:
		GlobalRegistry.registerPartSkin(partSkin)

func registerEventTriggers():
	pass

func resetFlagsOnNewDay():
	pass

func setFlag(flagID, value):
	GM.main.setFlag(flagID, value)

func getFlag(flagID, defaultValue = null):
	return GM.main.getFlag(flagID, defaultValue)

func increaseFlag(flagID, addvalue = 1):
	GM.main.increaseFlag(flagID, addvalue)

func getRandomSceneFor(_sceneType):
	return []

func getFlags():
	return {}
	
func getFlagsCache():
	return flagsCache

func flag(type):
	return {
		"type": type,
	}
