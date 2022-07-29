extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AvyTalkScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		GM.main.playAnimation(StageScene.Duo, "stand", {npc="avy"})

	if(state == ""):
		# (if fuck meat rank)

		saynn("[say=avy]So, ready to prove yourself, fuck meat?[/say]")

		# (if failed hero rank)

		saynn("[say=avy]You’re making quite some noise for yourself, failed hero. Think you can handle the heat?[/say]")

		# (if play toy rank)

		saynn("[say=avy]People like how you fight. Don’t get any wrong ideas though, you’re still just a play toy.[/say]")

		# (if attention whore)

		saynn("[say=avy]Think you almost reached the top? Think twice, attention whore.[/say]")

		# (if grand champion)

		saynn("[say=avy]Nobody stayed at the top for long, except for me. Enjoy it while it lasts.[/say]")

		saynn("She shows you her notes:")

		for rankID in FightClubRank.getAll():
			var rankName = FightClubRank.getVisibleName(rankID)
			
			sayn(rankName+":")
			
			for fighterID in GlobalRegistry.getFightClubFightersIDsByRank(rankID):
				var fighter:FightClubFighter = GlobalRegistry.getFightClubFighter(fighterID)
				
				sayn(fighter.getNameAndNickname())
			
			sayn("")


		saynn("Grand Champion:")

		saynn("1 - Avy, The Unbeatable")

		saynn("Attention Whore:")

		saynn("2 - Some stallion stud")

		saynn("3 - Kait, Tavi’s old pet")

		saynn("Play Toy:")

		saynn("4 - Axis. Some buff dude? Canine that wants you to call him Daddy")

		saynn("5 - Nova")

		saynn("Failed Hero:")

		saynn("6 - Rebel, Horse that likes to fist")

		saynn("7 - Ferri")

		saynn("Fuck Meat:")

		saynn("8 - Volk, Small canine that has a shiv")

		saynn("9 - Rubi, The Horny Femboy")

		saynn("10 - {pc.name}")

		addButton("Fight", "Tell her that you are ready to fight the next opponent", "fight")
		addButton("Leave", "Gotta go", "endthescene")

	if(state == "fight"):
		# (if first time)

		saynn("[say=pc]I’m ready.[/say]")

		saynn("[say=avy]First time is always special, isn’t it, SUGAR.[/say]")

		saynn("Avy leans onto the fence and quickly goes through her notes.")

		saynn("[say=avy]Alright, your first opponent is <opponent>. <opponent_details>[/say]")

		# (if not first time)

		saynn("[say=pc]Who’s next?[/say]")

		saynn("Avy leans onto the fence and quickly goes through her notes.")

		saynn("[say=avy]So eager. Alright, your next opponent is <opponent>. <opponent_details>[/say]")

		# (can start fight or leave)

		addButton("Fight", "Climb over the fence and start the fight", "fight1")
		addButton("Cancel", "You need some time to think", "endthescene")

	if(state == "fight1"):
		saynn("You nod and get into the fighting space by climbing over the fence. The arena itself is just a huge empty square space that’s separated from the crowd with a tall chain-link fence. Over one of the sides there is a balcony where the announcer stands.")

		saynn("[say=announcer]Welcome, ladies and gentleman! Are you ready to be entertained?[/say]")

		saynn("The crowd goes wild, you hear cheering and people banging against the fence.")

		# (if player first time)

		saynn("[say=announcer]Let’s do this then! We actually have a new addition in our ranks of fighters! In the left corner, we have {pc.name}! Can we make some noise for the fresh meat![/say]")

		saynn("The cheering only gets louder. Though some inmates yell out things like ‘Fuck meat!’, ‘Breeding stock!’, ‘Whore!’.")

		# (if fuck meat rank)

		saynn("[say=announcer]Let’s do this then! In the left corner, we have {pc.name}, a proud warrior with a Fuck Meat rank! Make some noise![/say]")

		saynn("The cheering only gets louder.")

		saynn("[say=announcer]<opponent_greeting>[/say]")

		saynn("[say=announcer]And remember, the winner gets to do whatever they want to the loser. Let the fight begin![/say]")

		addButton("Fight", "Time to fight", "fight2")

	if(state == "fight2"):
		# (the fight scene gets started)

		# (it also handles the winning/losing)
		pass
		# (scene ends)



func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

