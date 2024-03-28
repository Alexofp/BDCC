extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var npc2ID = ""
var npc2:DynamicCharacter
var slutIsDom = false

var intimidateReason = ""
var instantConflict = false

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)
	if(_args.size() > 1):
		instantConflict = _args[1]

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID
	if(_charID == "npc2"):
		return npc2ID

func _reactInit():
	if(RNG.chance(50)):
		npc2ID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Guards, [], GuardGenerator.new(), {})
	else:
		npc2ID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {})
	if(npc2ID == null || npc2ID == ""):
		addMessage("Couldn't find a good client :(")
		endScene()
		return
	npc2 = getCharacter(npc2ID)
	
	var npcSlave:NpcSlave = npc.getNpcSlavery()
	
	var subStat = npcSlave.personalityScore({PersonalityStat.Subby:1.0})
	var subbyness = RNG.randf_range(-1.0, 1.0) + subStat
	slutIsDom = (subbyness < 0.0)
	
	if(instantConflict):
		setState(RNG.pick(["skipped_client_rude", "skipped_client_rob"]))
		addCharacter(npcID)
		addCharacter(npc2ID)

func _init():
	sceneID = "SlutProstitutionWatch"

func _run():
	if(state == ""):
		addCharacter(npcID)
		addCharacter(npc2ID)
		playAnimation(StageScene.Duo, "stand", {pc=npcID, npc=npc2ID})
		
		#var npcSlave:NpcSlave = npc.getNpcSlavery()
		#var prostitution = npcSlave.getActivity()
		
		saynn("You notice your slut {npc.name} offering {npc.himself} to someone.")
		
		if(slutIsDom):
			saynn("Looks like your slut's offer includes {npc.him} taking charge.")
		else:
			saynn("Looks like your slut's offer includes {npc.him} being on the receiving end.")
		
		saynn("Do you want to watch them?")
		
		addButton("Watch", "See how they fuck", "do_watch")
		addButton("Leave", "You'd rather not", "rude_check")
	
	if(state == "after_sex"):
		playAnimation(StageScene.Duo, "stand", {pc=npcID, npc=npc2ID})
		
		saynn("Your slut gets paid after the sex and starts looking for another client.")
		
		addButton("Continue", "See what happens next", "endthescene")

	if(state == "skipped_client_rude"):
		playAnimation(StageScene.Duo, "hurt", {pc=npcID, npcAction="shove", npc=npc2ID})
		
		if(instantConflict):
			saynn("You were going somewhere.. but then you notice that one of your sluts, {npc.name}, and {npc.his} client have a big verbal conflict.")
		else:
			saynn("You were about to go somewhere.. but then you notice that the client is being incredibly rude with your slut.")

		saynn("{npc.name} tries to walk away.. but the client turns into a real asshole and starts shoving {npc.him}.")
		
		addButton("Protect", "You're not gonna let that happen", "do_intimidate", ["rude"])
		addButton("Walk away", "Whatever, your slut can handle it", "do_walkaway", ["rude"])
		
	if(state == "skipped_client_rob"):
		playAnimation(StageScene.Duo, "hurt", {pc=npcID, npcAction="shove", npc=npc2ID})

		if(instantConflict):
			saynn("You were going somewhere.. but then you notice that one of your sluts, {npc.name}, and {npc.his} client are having a fight.")
		else:
			saynn("You were about to go somewhere.. but then you notice that the client is doing something to your slut.")

		saynn("Yeah, the client is not looking for sex, {npc2.he} {npc2.isAre} actually trying to rob {npc.name}!")
		
		addButton("Protect", "You're not gonna let that happen", "do_intimidate", ["rob"])
		addButton("Walk away", "Whatever, your slut can handle it", "do_walkaway", ["rob"])
		
	if(state == "aftersex_rob"):
		playAnimation(StageScene.Duo, "hurt", {pc=npcID, npcAction="shove", npc=npc2ID})

		saynn("The sex has ended.. but the client doesn't seem to be satisfied.")

		saynn("{npc2.He} {npc2.isAre} trying to rob your slut!")
		
		addButton("Protect", "You're not gonna let that happen", "do_intimidate", ["rob"])
		addButton("Walk away", "Whatever, your slut can handle it", "do_walkaway", ["rob"])
		
	if(state == "aftersex_notsatisfied"):
		playAnimation(StageScene.Duo, "hurt", {pc=npcID, npcAction="shove", npc=npc2ID})

		saynn("The sex has ended.. but the client doesn't seem to be satisfied.")

		saynn("{npc2.He} {npc2.isAre} being incredibly rude with your slut!")
		
		addButton("Protect", "You're not gonna let that happen", "do_intimidate", ["rude"])
		addButton("Walk away", "Whatever, your slut can handle it", "do_walkaway", ["rude"])
		
	if(state == "do_intimidate"):
		playAnimation(StageScene.Duo, "stand", {pc="pc", npc=npc2ID})
		
		saynn("You can't let that happen so you step in and drag the asshole away from your whore.")
		
		saynn("[say=npc2]"+RNG.pick([
			"Huh, are you some kind of pimp? I will fuck you up.",
			"Wow, so brave. You are in love with this slut or something?",
			"So brave. It's your slut, isn't it? Would be a shame if something would to happen with her.",
			"Fucker, I wasn't done with that slut.",
		])+"[/say]")
		
		saynn("Looks like it's a fight..")
		addButton("Fight", "Start the fight", "do_fight")
		
	if(state == "do_walkaway"):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You have no time for this so you just walk away.")
		
		if(intimidateReason == "rude"):
			saynn("Your slut, {npc.name}, got a little more depressed after {npc.he} got verbally and physically assaulted.")
		
		if(intimidateReason == "rob"):
			saynn("Your slut, {npc.name}, got robbed, meaning {npc.he} lost all of the credits that {npc.he} earned today.")
		
		addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "lost_fight"):
		playAnimation(StageScene.Solo, "defeat")
		
		saynn("You lost the fight. Your slut saw that you were losing and managed to escape in time.. But {npc.he} will trust you less now for sure")

		addButton("Continue", "Oh well", "endthescene")

	if(state == "won_fight"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		saynn("You won the fight. The defeated asshole crawls away, there is no point torturing {npc2.him} more.")
		
		saynn("Looks like your slut trusts you more now.")

		addButton("Continue", "Nice work", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "do_intimidate"):
		intimidateReason = _args[0]
		
	if(_action == "do_walkaway"):
		intimidateReason = _args[0]
		
		if(intimidateReason == "rude"):
			var npcSlave:NpcSlave = npc.getNpcSlavery()
			npcSlave.addDespair(0.1)
		if(intimidateReason == "rob"):
			var npcSlave:NpcSlave = npc.getNpcSlavery()
			var prostitution = npcSlave.getActivity()
			prostitution.earnedCreds = 0
		
	if(_action == "rude_check"):
		if(RNG.chance(70)):
			endScene()
			return
		else:
			setState(RNG.pick(["skipped_client_rude", "skipped_client_rob"]))
			return
	
	if(_action == "do_watch"):
		if(slutIsDom):
			runScene("GenericSexScene", [npcID, npc2ID], "prostitutionsex")
		else:
			runScene("GenericSexScene", [npc2ID, npcID], "prostitutionsex")
		
		setState("after_sex")
		return

	if(_action == "do_fight"):
		runScene("FightScene", [npc2ID], "fight_rude_client")
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "prostitutionsex"):
		if(RNG.chance(70)):
			npc.getNpcSlavery().addExperience(10)
			setState("after_sex")
			return
		else:
			setState(RNG.pick(["aftersex_rob", "aftersex_notsatisfied"]))
			return
	
	if(_tag == "fight_rude_client"):
		processTime(10 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("won_fight")
			addExperienceToPlayer(10)
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			npcSlavery.addTrust(0.1)
			#npcSlavery.afterBeatenUp()
			#npcSlavery.handlePunishment(2)
		else:
			setState("lost_fight")
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			npcSlavery.addTrust(-0.2)

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["npc2ID"] = npc2ID
	data["slutIsDom"] = slutIsDom
	data["intimidateReason"] = intimidateReason
	data["instantConflict"] = instantConflict

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
	npc2ID = SAVE.loadVar(data, "npc2ID", "")
	npc2 = GlobalRegistry.getCharacter(npc2ID)
	slutIsDom = SAVE.loadVar(data, "slutIsDom", false)
	intimidateReason = SAVE.loadVar(data, "intimidateReason", "")
	instantConflict = SAVE.loadVar(data, "instantConflict", false)
	
