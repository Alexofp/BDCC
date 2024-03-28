extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "PunishSlaverySlutwallTalkScene"

func _run():
	if(state == ""):
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		addCharacter(npcID)
		aimCameraAndSetLocName("fight_slutwall")
		GM.pc.setLocation("fight_slutwall")
		playAnimation(StageScene.SlutwallSex, "idle", {pc=npcID, npc="pc", bodyState={naked=true}})
		
		saynn("{npc.name} is stuck in the slutwall. You can wait for someone to use {npc.him} or do it yourself.")
		
		if(npcSlave != null):
			if(npcSlave.getWorkEfficiency() <= 0.1):
				saynn("Your slave is very tired. Using {npc.him} now will make {npc.him} more depressed.")
				
			if(npcSlave.getDespair() >= 0.8):
				saynn("{npc.He} looks very depressed, {npc.his} mind might snap at any moment.")
			elif(npcSlave.getDespair() >= 0.5):
				if(npcSlave.getBrokenSpirit() >= 0.9):
					saynn("{npc.He} looks supressed. But {npc.he} also doesn't resist at all, {npc.his} spirit must be broken by now!")
				elif(npcSlave.getBrokenSpirit() > 0.5):
					saynn("{npc.He} looks supressed. But {npc.he} also doesn't resist much, a sign of {npc.his} spirit breaking.")
				else:
					saynn("{npc.He} looks supressed. But {npc.he} keeps trying to break out occasionally, {npc.his} spirit is clearly very high.")
			else:
				if(npcSlave.getBrokenSpirit() >= 0.9):
					saynn("{npc.He} doesn't resist at all, {npc.his} spirit must be broken by now!")
				elif(npcSlave.getBrokenSpirit() > 0.5):
					saynn("{npc.He} doesn't resist much, a sign of {npc.his} spirit breaking.")
			
		if(npc.hasEffect(StatusEffect.HasTallyMarks)):
			var tallyMarks = npc.getEffect(StatusEffect.HasTallyMarks)
			var tallyAmount = tallyMarks.totalAmount
			
			if(tallyAmount > 0):
				saynn("{npc.His} body has "+str(tallyAmount)+" tallymark"+("s" if tallyAmount != 1 else "")+" on it which means that {npc.he} got used roughly that many times.")
		
		addButton("Watch", "See what others do with your slave", "do_watch")
		addButtonWithChecks("Use", "Fuck your slave yourself", "do_use", [], [ButtonChecks.CanStartSex])
		
		addButton("Free slave", "Enough stocks", "do_free_slave")
		addButton("Leave", "Time to go", "endthescene")

	if(state == "do_free_slave"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		
		saynn("Enough slutwalls, you free {npc.name} up and then bring {npc.him} back to your cell.")
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "do_free_slave"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery == null):
			return
		npcSlavery.stopActivity()
	
	if(_action == "do_watch"):
		processTime(60*RNG.randi_range(10, 30))
		var characterPool = RNG.pick([CharacterPool.Guards, CharacterPool.Inmates])
		var generator = null
		if(characterPool == CharacterPool.Guards):
			generator = GuardGenerator.new()
		else:
			generator = InmateGenerator.new()
		
		var idToUse = NpcFinder.grabNpcIDFromPoolOrGenerate(characterPool, [], generator, {})
		if(idToUse == null):
			return
		getCharacter(idToUse).prepareForSexAsDom()
		npc.lustStateFullyUndress()
		runScene("GenericSexScene", [idToUse, npcID, SexType.SlutwallSex], "watchsex")
		return
		
	if(_action == "do_use"):
		npc.lustStateFullyUndress()
		runScene("GenericSexScene", ["pc", npcID, SexType.SlutwallSex], "usesex")
		return
		
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag in ["usesex", "watchsex"]):
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		if(npcSlave != null):
			npcSlave.addTired(1)
			if(npcSlave.getTiredEffect() >= 0.9):
				npcSlave.addDespair(0.06)
			else:
				npcSlave.addDespair(0.01)
				npcSlave.addBrokenSpirit(0.05 * npcSlave.getWorkEfficiency())
		
		setState("")

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
