extends SceneBase

func _init():
	sceneID = "DomM4s4End"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("hideout_near_break_room")
		addCharacter("avy")
		GM.pc.setLocation("hideout_near_break_room")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("[say=avy]Alright-y. The bitch got broken![/say]")

		saynn("[say=pc]Indeed.[/say]")

		saynn("The foxy looks happy.")

		saynn("[say=avy]Fuck yeah. I'm gonna go see how she is doing.[/say]")

		saynn("Avy steps inside the cell.")

		saynn("Almost at the same time, Ans approaches you.")

		addButton("Continue", "See what happens next", "ans_talk")
	if(state == "ans_talk"):
		removeCharacter("avy")
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})
		saynn("He leans against his mic-cane.")

		saynn("[say=announcer]What a sight. I saw Kait run past me, completely naked.[/say]")

		saynn("You scratch the back of your head.")

		saynn("[say=pc]Yeah, she lost her clothes.. during the mission.[/say]")

		saynn("You hear a soft chuckle.")

		saynn("[say=announcer]I see, I see. Huh, mission? Did you catch someone?[/say]")

		saynn("[say=pc]Eliza Quinn, the doctor.[/say]")

		saynn("He raises a brow.")

		saynn("[say=announcer]Is that so? Already going after the staff?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Why not? We had some.. complications.. but we pulled through.[/say]")

		saynn("He scratches his chin.")

		saynn("[say=announcer]Something tells me you got extremely lucky.[/say]")

		saynn("[say=pc]Lucky? Why?[/say]")

		saynn("[say=announcer]You caught a staffer. And none of our faces are pinned into the cold floor still. I'd say that luck did play a role in that.[/say]")

		saynn("What happened to Kait can't exactly be called luck.")

		saynn("[say=pc]You think we shouldn't go after staff? Not yet at least?[/say]")

		saynn("[say=announcer]I am the voice of reason, simple as.[/say]")

		saynn("The only one that's not crazy. Maybe it's good to slow down once in a while.")

		saynn("[say=pc]I hear you, old man.[/say]")

		saynn("Both of you go silent for some time. Ans seems to be staring down at the floor, thinking.")

		saynn("[say=announcer]Maybe you're right. Maybe it's me.[/say]")

		saynn("[say=pc]You?[/say]")

		saynn("His time to shrug.")

		saynn("[say=announcer]Maybe I've grown too fond of this place. Can't live without it.[/say]")

		saynn("[say=pc]Things have to change.[/say]")

		saynn("[say=announcer]I know. Gonna be painful. Very painful.[/say]")

		saynn("You nod. Slowly, he steps away.")

		saynn("Just in time for Avy to come back.. with Eliza on a leash.")

		addButton("Continue", "See what happens next", "avy_eliza")
	if(state == "avy_eliza"):
		removeCharacter("announcer")
		addCharacter("avy")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="avy", npc="eliza", npcBodyState={leashedBy="avy"}})
		saynn("[say=avy]Here is our new slut! The one that we worked so hard for.[/say]")

		saynn("Eliza is stepping slowly behind Avy, her chin low.. her tail low too.")

		saynn("[say=avy]C'mon, say it, bitch![/say]")

		saynn("Avy yanks on the leash.. then does it again but even harder.")

		saynn("[say=eliza]Ugh.. woof..[/say]")

		saynn("Avy catches Eliza's ear, digging her claws into it.")

		saynn("[say=avy]What was that? Speak louder.[/say]")

		saynn("[say=eliza]Woof.. woof..[/say]")

		saynn("Avy shoves Eliza away.")

		saynn("[say=avy]Good fucking bitch.[/say]")

		saynn("[say=pc]I see you're training her already.[/say]")

		saynn("Avy nods.. and look at the feline again.")

		saynn("[say=avy]Yeah. You're our bitch now, correct?[/say]")

		saynn("[say=eliza]..yes.[/say]")

		saynn("Eliza is almost whispering, her posture.. that of a broken person.")

		saynn("[say=avy]Yes what?[/say]")

		saynn("[say=eliza]I'm your bitch.. gonna do whatever you need me to do..[/say]")

		saynn("Avy ruffles Eliza's ponytail, patting while also making the hair all messy.")

		saynn("[say=avy]Perfect. We're way above you, don't forget that.[/say]")

		saynn("[say=pc]Blindfold her before you walk her out. Here is the key to her belt.[/say]")

		saynn("You hand her the key.")

		saynn("[say=avy]Do we need to unlock her though.. We could keep the key and make her our personal cock-sleeve.[/say]")

		saynn("[say=pc]No, Avy. No need to draw any attention to her.[/say]")

		saynn("[say=avy]Fine-e. C'mon, useless.[/say]")

		saynn("And so Avy walks Eliza away.")

		saynn("And now.. you're one step closer to it.")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene_reseteliza")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "endthescene_reseteliza"):
		endScene()
		getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
		getCharacter("eliza").resetEquipment()
		playAnimation(StageScene.Solo, "stand")
		return

	setState(_action)
