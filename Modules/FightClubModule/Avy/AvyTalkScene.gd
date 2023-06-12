extends "res://Scenes/SceneBase.gd"

var savedFighterID = ""

func _init():
	sceneID = "AvyTalkScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["avy"])):
		endScene()
		return

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})

	if(state == ""):
		var pcRank = FightClubModule.getPCRank()
		
		# (if fuck meat rank)
		if(pcRank == FightClubRank.FuckMeat):
			saynn("[say=avy]So, ready to prove yourself, fuck meat?[/say]")

		# (if failed hero rank)
		if(pcRank == FightClubRank.FailedHero):
			saynn("[say=avy]You’re making quite some noise for yourself, failed hero. Think you can handle the heat?[/say]")

		# (if play toy rank)
		if(pcRank == FightClubRank.PlayToy):
			saynn("[say=avy]People like how you fight. Don’t get any wrong ideas though, you’re still just a play toy.[/say]")

		# (if attention whore)
		if(pcRank == FightClubRank.AttentionWhore):
			saynn("[say=avy]Think you almost reached the top? Think twice, attention whore.[/say]")

		# (if grand champion)
		if(pcRank == FightClubRank.GrandChampion):
			saynn("[say=avy]Nobody stayed at the top for long, except for me. Enjoy it while it lasts.[/say]")

		saynn("She shows you her notes:")

		var showedPC = false
		var i = 1
		var avyRekt = getFlag("FightClubModule.AvyGotRekt", false)
		
		for rankID in FightClubRank.getAll():
			var rankName = FightClubRank.getVisibleName(rankID)
			
			sayn(rankName+":")
			
			for fighterID in GlobalRegistry.getFightClubFightersIDsByRank(rankID):
				if(!showedPC && pcRank == rankID && FightClubModule.isFighterDefeated(fighterID)):
					showedPC = true
					sayn(str(i)+" - {pc.name}")
					i+=1
				
				if(fighterID == "avy" && avyRekt):
					continue
				var fighter:FightClubFighter = GlobalRegistry.getFightClubFighter(fighterID)
				
				if(FightClubModule.isFighterDefeated(fighterID)):
					sayn(str(i)+" - "+fighter.getNameAndNickname()+" (defeated)")
				else:
					sayn(str(i)+" - "+fighter.getNameAndNickname())
				i+=1
			
			if(rankID == FightClubRank.FuckMeat && !showedPC):
				sayn(str(i)+" - {pc.name}")
				i+=1
			if(rankID == FightClubRank.FuckMeat && avyRekt):
				sayn(str(i)+" - Avy The Fallen Hero (defeated)")
			
			sayn("")
		
		var nextFighter = FightClubModule.getNextFighter()
		if(nextFighter != null):
			addButton("Arena", "Tell her that you are ready to fight the next opponent", "fightnext")
		else:
			addDisabledButton("Arena", "No one left to fight :(")
			
		if(!getFlag("FightClubModule.GotTaskToStealPlant")):
			if(getModule("FightClubModule").isReadyToFightAvy()):
				addButton("Fight Avy", "Time to do this", "do_fight_avy")
			else:
				addDisabledButton("Fight Avy", "You must defeated all other opponents before fighting Avy")
		else:
			if(getFlag("FightClubModule.AvyGotRekt")):
				addButton("Rematch Avy", "Redo the final fight", "do_fight_avy_second_time") # Maybe a choice between two fights
			else:
				if(getFlag("FightClubModule.ReturnedPlantToEliza")):
					addButton("Fight Avy", "Time to do this again", "do_fight_avy_second_time")
				else:
					addDisabledButton("Fight Avy", "You're not ready to do this! You know you gonna lose again.")
			
		addButton("Rematch", "Fight one of your defeated opponents again", "rematchmenu")
		addButton("Leave", "Gotta go", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["avy"])

	if(state == "rematchmenu"):
		saynn("Who do you wanna rematch?")
		
		for rankID in FightClubRank.getAll():
			for fighterID in GlobalRegistry.getFightClubFightersIDsByRank(rankID):
				if(fighterID == "avy"):
					continue
				if(!FightClubModule.isFighterDefeated(fighterID)):
					continue
				var fighter: FightClubFighter = GlobalRegistry.getFightClubFighter(fighterID)
				
				addButton(fighter.getVisibleName(), fighter.getNameAndNickname(), "rematch", [fighterID])
		
		addButton("Back", "You don't wanna fight anyone", "")

	if(state == "fight"):
		var arenaFighter:FightClubFighter = GlobalRegistry.getFightClubFighter(savedFighterID)
		# (if first time)
		if(!getFlag("FightClubModule.FightClubFirstArenaIntroduction")):
			saynn("[say=pc]I’m ready.[/say]")

			saynn("[say=avy]First time is always special, isn’t it, sugar.[/say]")

			saynn("Avy leans onto the fence and quickly goes through her notes.")

			saynn("[say=avy]"+arenaFighter.getAvyIntroduction()+"[/say]")

		# (if not first time)
		else:
			saynn("[say=pc]Who’s next?[/say]")

			saynn("Avy leans onto the fence and quickly goes through her notes.")

			saynn("[say=avy]"+arenaFighter.getAvyIntroduction()+"[/say]")

		# (can start fight or leave)

		addButton("Let's go", "Climb over the fence and start the fight", "fight1")
		addButton("Cancel", "You need some time to think", "endthescene")

	if(state == "fight1"):
		aimCameraAndSetLocName("fight_arena")
		removeCharacter("avy")
		
		var arenaFighter:FightClubFighter = GlobalRegistry.getFightClubFighter(savedFighterID)
		
		playAnimation(StageScene.Duo, "stand", {npc=arenaFighter.getFightCharacter()})
		addCharacter(arenaFighter.getFightCharacter())
		addCharacter("announcer")
		
		saynn("You nod and get into the fighting space by climbing over the fence. The arena itself is just a huge empty square space that’s separated from the crowd with a tall chain-link fence. Over one of the sides there is a balcony where the announcer stands.")

		saynn("[say=announcer]Welcome, ladies and gentleman! Are you ready to be entertained?[/say]")

		saynn("The crowd goes wild, you hear cheering and people banging against the fence.")

		# (if player first time)
		if(!getFlag("FightClubModule.FightClubFirstArenaIntroduction")):
			setFlag("FightClubModule.FightClubFirstArenaIntroduction", true)
			saynn("[say=announcer]Let’s do this then! We actually have a new addition in our ranks of fighters! In the left corner, we have {pc.name}! Can we make some noise for the fresh meat![/say]")

			saynn("The cheering only gets louder. Though some inmates yell out things like ‘Fuck meat!’, ‘Breeding stock!’, ‘Whore!’.")

		# (if fuck meat rank)
		else:
			saynn("[say=announcer]Let’s do this then! In the left corner, we have {pc.name}, a proud warrior with a " +FightClubRank.getVisibleName(FightClubModule.getPCRank())+ " rank! Make some noise![/say]")

			saynn("The cheering only gets louder.")

		saynn("[say=announcer]"+arenaFighter.getAnnouncerIntroduction()+"[/say]")

		saynn("[say=announcer]And remember, the winner gets to do whatever they want to the loser. Let the fight begin![/say]")

		addButton("Fight", "Time to fight", "startfight")



func _react(_action: String, _args):
	if(_action in ["fight1", "startfight"]):
		processTime(RNG.randi_range(5, 10) * 60)
	
	if(_action == "startfight"):
		var arenaFighter:FightClubFighter = GlobalRegistry.getFightClubFighter(savedFighterID)
		
		runScene("FightScene", [arenaFighter.getFightCharacter(), "arenafight"], "arenafight")
	
	if(_action == "fightnext"):
		savedFighterID = FightClubModule.getNextFighter()
		setState("fight")
		return
		
	if(_action == "rematch"):
		savedFighterID = _args[0]
		setState("fight")
		return
		
	if(_action == "do_fight_avy"):
		runScene("AvyFirstArenaBattleScene")
		endScene()
		return
		
	if(_action == "do_fight_avy_second_time"):
		runScene("AvyFinalArenaBattleScene")
		endScene()
		return
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)


func saveData():
	var data = .saveData()
	
	data["savedFighterID"] = savedFighterID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	savedFighterID = SAVE.loadVar(data, "savedFighterID", "")

func _react_scene_end(_tag, _result):
	if(_tag == "arenafight"):
		processTime(RNG.randi_range(30, 60) * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		var arenaFighter:FightClubFighter = GlobalRegistry.getFightClubFighter(savedFighterID)
		
		if(battlestate == "win"):
			#setState("if_won")
			
			# first time
			if(!FightClubModule.isFighterDefeated(savedFighterID)):
				addExperienceToPlayer(arenaFighter.getWinExperience())
				var addCredits = arenaFighter.getWinCredits()
				GM.pc.addCredits(addCredits)
				addMessage("You received "+str(addCredits)+" "+Util.multipleOrSingularEnding(addCredits, "credit"))
			else:
				addExperienceToPlayer(arenaFighter.getRepeatWinExperience())
				var addCredits = arenaFighter.getRepeatWinCredits()
				GM.pc.addCredits(addCredits)
				addMessage("You received "+str(addCredits)+" "+Util.multipleOrSingularEnding(addCredits, "credit")+" for a rematch")
				
			FightClubModule.markFighterAsDefeated(savedFighterID)
			FightClubModule.raisePCRankTo(arenaFighter.getRank())
			
			var winScene = arenaFighter.getWinScene()
			if(winScene != null):
				playAnimation(StageScene.Duo, "stand", {npc=arenaFighter.getFightCharacter(), npcAction="kneel"})
				runScene(winScene)
			endScene()
		else:
			#setState("if_lost")
			var lostScene = arenaFighter.getLoseScene()
			if(lostScene != null):
				playAnimation(StageScene.Duo, "kneel", {npc=arenaFighter.getFightCharacter()})
				runScene(lostScene)
			
			endScene()

func getDebugActions():
	return [
		{
			"id": "instantWin",
			"name": "Win all fights",
			"args": [
			],
		},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "instantWin"):
		getModule("FightClubModule").forceWinEveryoneExpectAvy()

func getDevCommentary():
	return "Avy.. Avy, Avy, Avy.. Is that even a good name for her? x3\n\nAvy is.. a bitch. Like Risha x3. But Avy is sliiiiightly more complex than that. Avy is the only shemale static character currently ^^. Is she suffering from that somehow? Nah, this is the future where everyone just accepted -all- the genders, utopia if you will x3. And if you don't like your gender/private bits then there are ways to change that. If you look at real life, I think that's where it's all heading. At some point everyone will just.. stop giving a fuck about what's between your legs or how you identify as. Personality > Body. Hopefully ^^. People are still allowed to have preferences obviously, straight/gay/bi/pan is an entirely different thing..\n\nWhy did I write that.. Right, Avy is a dickgirl x3. Why is she a dickgirl? Because its more fun to have someone with a dick at the top of the chain. They think they will always be at the top and dick others ^^.\n\nRisha is mean because she is horny. Avy is.. more of a bully I guess? She wants power over you. What would she do with that power? She doesn't know. But she needs to see -everyone- be her sub"

func hasDevCommentary():
	return true
