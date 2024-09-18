extends Module

func getFlags():
	return {
		"slavesSpace": flag(FlagType.Number),
		
		"hasSybian": flag(FlagType.Bool),
		"hasWoodenHorse": flag(FlagType.Bool),
		
		
		"debugSlaveInfo": flag(FlagType.Bool),
		
		"slutEventCooldown": flag(FlagType.Number),
		"slutBigEventCooldown": flag(FlagType.Number),
		"pupEventCooldown": flag(FlagType.Number),
	}

func _init():
	id = "NpcSlaveryModule"
	author = "Rahi"
	
	scenes = [
			"res://Modules/NpcSlaveryModule/SocketBuyCellUpgradesScene.gd",
		
			"res://Modules/NpcSlaveryModule/Enslaving/EnslaveDynamicNpcScene.gd",
			"res://Modules/NpcSlaveryModule/Enslaving/KidnapDynamicNpcScene.gd",
			
			"res://Modules/NpcSlaveryModule/Slavery/SlaveTalkScene.gd",
			"res://Modules/NpcSlaveryModule/Slavery/SlavesCheckScene.gd",
			"res://Modules/NpcSlaveryModule/Slavery/SlaveStartActionScene.gd",
			"res://Modules/NpcSlaveryModule/Slavery/SlaveActionWrapperScene.gd",
			"res://Modules/NpcSlaveryModule/Slavery/SlaveEventWrapperScene.gd",
			"res://Modules/NpcSlaveryModule/Slavery/SlaveTPToLocScene.gd",
			
			"res://Modules/NpcSlaveryModule/Devices/SybianRidingScene.gd",
		]
	characters = [
	]
	items = []
	events = [
		"res://Modules/NpcSlaveryModule/Enslaving/EnslaveDynamicNpcEvent.gd",
		"res://Modules/NpcSlaveryModule/Slavery/SlaveTalkEvent.gd",
		"res://Modules/NpcSlaveryModule/Slavery/SlaveEventEvent.gd",
		
		"res://Modules/NpcSlaveryModule/Devices/PlayerCellDevicesEvent.gd",
	]

func resetFlagsOnNewDay():
	pass

func getSlavesSpace() -> int:
	return int(getFlag("NpcSlaveryModule.slavesSpace", 0))

func canEnslave():
	return getSlavesSpace()

func getSlaves():
	return GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)

func hasSlaves():
	return int(GM.main.getDynamicCharactersPoolSize(CharacterPool.Slaves)) > 0

func hasFreeSpaceToEnslave():
	var currentSlaveAmount = int(GM.main.getDynamicCharactersPoolSize(CharacterPool.Slaves))

	var freeSpace = getSlavesSpace() - currentSlaveAmount
	return freeSpace > 0

func makeSurePCHasSlaveSpace():
	var currentSlaveAmount = int(GM.main.getDynamicCharactersPoolSize(CharacterPool.Slaves))

	var freeSpace = getSlavesSpace() - currentSlaveAmount
	if(freeSpace <= 0):
		setFlag("NpcSlaveryModule.slavesSpace", currentSlaveAmount + 1)

func slavesHaveAnyEvents():
	var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
	
	for charID in slaves:
		var character:DynamicCharacter = GlobalRegistry.getCharacter(charID)
		var npcSlavery:NpcSlave = character.getNpcSlavery()
		if(npcSlavery == null):
			continue
		if(npcSlavery.hasRandomEventToTrigger()):
			return true
	return false

func getSlavesSpaceUpgradeCost():
	var currentSpace = getSlavesSpace()
	
	if(currentSpace == 0):
		return 30
	return currentSpace * 10
	
func doEnslaveCharacter(npcID, defaultSlaveType = SlaveType.Slut):
	var theChar:DynamicCharacter = GlobalRegistry.getCharacter(npcID)
	
	if(theChar == null || !theChar.isDynamicCharacter()):
		return false
	if(theChar.isSlaveToPlayer()):
		return false
	
	var theEnslaveQuest:NpcEnslavementQuest = theChar.getEnslaveQuest()
	theChar.setEnslaveQuest(null)
	
	var slaveType = defaultSlaveType
	if(theEnslaveQuest != null):
		slaveType = theEnslaveQuest.slaveType
	
	var newNpcSlavery = NpcSlave.new()
	newNpcSlavery.setChar(theChar)
	newNpcSlavery.setMainSlaveType(slaveType)
	newNpcSlavery.slaveSpecializations = {
		slaveType: 0,
	}
	#newNpcSlavery.generateTasks()
	theChar.setNpcSlavery(newNpcSlavery)
	newNpcSlavery.onEnslave()
	
	GM.main.IS.deletePawn(npcID)
	GM.main.removeDynamicCharacterFromAllPools(npcID)
	GM.main.addDynamicCharacterToPool(npcID, CharacterPool.Slaves)
	return true

func doFreeEnslavedCharacter(npcID):
	var theChar:DynamicCharacter = GlobalRegistry.getCharacter(npcID)
	
	if(theChar == null || !theChar.isDynamicCharacter()):
		return false
	if(!theChar.isSlaveToPlayer()):
		return false
	
	#var npcSlavery:NpcSlave = theChar.getNpcSlavery()
	theChar.setEnslaveQuest(null)
	theChar.setNpcSlavery(null)
	
	GM.main.removeDynamicCharacterFromAllPools(npcID)
	var newPool = CharacterPool.characterTypeToPool(theChar.getCharacterType())
	if(newPool != null):
		GM.main.addDynamicCharacterToPool(npcID, newPool)
	
