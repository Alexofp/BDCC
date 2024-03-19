extends SlaveActivityBase

func _init():
	id = "StuckInStocks"
	
func getVisibleName():
	return "Stuck in stocks"

func onStart(_args = []):
	pass

func onNewDay():
	pass

func preventsStatsDecay():
	return false

func preventsNormalInteractions():
	return true

func getActivityText():
	return "{npc.name} is currently stuck in stocks so {npc.he} {npc.isAre} not here."

func hoursPassed(_howMuch):
	if(RNG.chance(30*_howMuch)):
		var theChar:DynamicCharacter = getChar()
		if(GM.main.characterIsVisible(theChar.getID())):
			return
		
		var possible = ["onto"]
		if(theChar.hasReachableVagina()):
			possible.append("pussy")
		if(theChar.hasReachableAnus()):
			possible.append("ass")
		if(!theChar.isOralBlocked()):
			possible.append("face")
		
		if(possible.size() == 0):
			return
		
		GM.main.updateCharacterUntilNow(theChar.getID())
		
		for _i in range(RNG.randi_range(1, 4)):
			var randomFuck = RNG.pick(possible)
			
			var idToUse = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true}, true)
			if(idToUse == null):
				return
			GM.main.updateCharacterUntilNow(idToUse)
			
			if(randomFuck == "pussy"):
				theChar.gotVaginaFuckedBy(idToUse)
				theChar.cummedInVaginaBy(idToUse)
				theChar.addTallymarkCrotch()
			if(randomFuck == "face"):
				theChar.gotThroatFuckedBy(idToUse)
				theChar.cummedInMouthBy(idToUse)
				theChar.addTallymarkFace()
			if(randomFuck == "ass"):
				theChar.gotAnusFuckedBy(idToUse)
				theChar.cummedInAnusBy(idToUse)
				theChar.addTallymarkButt()
			if(randomFuck == "onto"):
				theChar.cummedOnBy(idToUse)
				theChar.addTallymarkButt()
				
			var npcSlave:NpcSlave = theChar.getNpcSlavery()
			if(npcSlave != null):
				npcSlave.addTired(1)
				if(npcSlave.getTiredEffect() >= 0.9):
					npcSlave.addDespair(0.06)
				else:
					npcSlave.addDespair(0.01)
					npcSlave.addBrokenSpirit(0.05 * npcSlave.getWorkEfficiency())
					npcSlave.addExperience(5)

func getInteractActions():
	return [
		{
			name = "Stocks",
			desc = "Pay them a visit",
			sceneID = "SlaveTPToLocScene",
			args = ["main_punishment_spot"],
			buttonChecks = [],
		}
	]

func getCustomInteractAnimInfo():
	return [StageScene.Solo, "stand", {pc="pc"}]
