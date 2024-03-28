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
var stageScenes = []
var lootTables = []
var lootLists = []
var fetishes = []
var sexGoals = []
var sexActivities = []
var sexTypes = []
var fluids = []
var speechModifiers = []
var slaveBreakTasks = []
var slaveTypes = []
var slaveActions = []
var slaveEvents = []
var slaveActivities = []

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
		
	for stageScene in stageScenes:
		GlobalRegistry.registerStageScene(stageScene)
		
	for lootTable in lootTables:
		GlobalRegistry.registerLootTable(lootTable)
		
	for lootList in lootLists:
		GlobalRegistry.registerLootList(lootList)
		
	for fetish in fetishes:
		GlobalRegistry.registerFetish(fetish)
		
	for sexGoal in sexGoals:
		GlobalRegistry.registerSexGoal(sexGoal)
		
	for sexActivity in sexActivities:
		GlobalRegistry.registerSexActivity(sexActivity)
		
	for sexType in sexTypes:
		GlobalRegistry.registerSexType(sexType)
		
	for fluid in fluids:
		GlobalRegistry.registerFluid(fluid)
		
	for speechModifier in speechModifiers:
		GlobalRegistry.registerSpeechModifier(speechModifier)

	for slaveBreakTask in slaveBreakTasks:
		GlobalRegistry.registerSlaveBreakTask(slaveBreakTask)
	
	for slaveType in slaveTypes:
		GlobalRegistry.registerSlaveType(slaveType)
		
	for slaveAction in slaveActions:
		GlobalRegistry.registerSlaveAction(slaveAction)
		
	for slaveEvent in slaveEvents:
		GlobalRegistry.registerSlaveEvent(slaveEvent)
		
	for slaveActivity in slaveActivities:
		GlobalRegistry.registerSlaveActivity(slaveActivity)

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
