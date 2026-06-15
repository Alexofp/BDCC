extends SceneBase

func _init():
	sceneID = "DomM2s3"

func _reactInit():
	putOff("ferri", "inmatewristcuffs")
	putOff("ferri", "basketmuzzle")

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		addCharacter("kait")
		saynn("Kait bounces happily.")

		saynn("[say=kait]Finally! That brat got what she deserved.[/say]")

		saynn("So much for just a doormat.")

		saynn("[say=pc]No point in holding her in the cell anymore.[/say]")

		saynn("[say=kait]Yep. Let's see how subby she is now~.[/say]")

		addButton("Continue", "See what happens next", "player_brings_ferri_out")
	if(state == "player_brings_ferri_out"):
		addCharacter("ferri")
		playAnimation(StageScene.Duo, "stand", {npc="ferri", npcBodyState={leashedBy="pc"}, npcAction="kneel"})
		saynn("You go ahead and bring Ferri out, your hand holding her leash. You also took off all the restraints that she had.")

		saynn("[say=ferri]Mew..[/say]")

		saynn("Kait leans close to her face.")

		saynn("[say=kait]You're gonna do what we tell you, right, brat~?[/say]")

		saynn("[say=ferri]Yes, miss.. m-mew..[/say]")

		saynn("Might as well test that.")

		saynn("[say=pc]Kneel in front of me.[/say]")

		saynn("Ferri's ears perk when she hears you. She is quick to position herself in front of you before getting down to her knees, just as ordered. Her cyan eyes looking up at you, her tail resting on the floor.")

		saynn("[say=ferri]Here..[/say]")

		saynn("Kait is grinning wide.")

		saynn("[say=kait]Adorable![/say]")

		saynn("Ferri's cheeks blush softly.")

		saynn("[say=ferri]No you..[/say]")

		saynn("[say=pc]Admit that you're adorable.[/say]")

		saynn("[say=ferri]No-o-o..[/say]")

		saynn("She tries to look away but you catch her chin and make her look up at you again.")

		saynn("[say=pc]Ferri.[/say]")

		saynn("Her lips twitch.")

		saynn("[say=ferri]Hmpff.. I'm a bit adorable..[/say]")

		saynn("You give her a pat on the head.")

		saynn("[say=pc]Good girl. You're gonna be our chemist.[/say]")

		saynn("[say=ferri]Mew.. Do you have a.. a chemistry lab setup?..[/say]")

		saynn("Right. Those are a thing. You and Kait look at each other.")

		saynn("[say=pc]We will figure it out.[/say]")

		saynn("You tug up on the leash, making her get up.")

		saynn("[say=pc]You're free for now. We will find you when we need you.[/say]")

		saynn("[say=ferri]Okay..[/say]")

		saynn("You unclip the leash and let her go.")

		addButton("Continue", "See what happens next", "last_mission_complete")
	if(state == "last_mission_complete"):
		setCharacters(["kait"])
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("[say=kait]I guess that could have gotten better overall. But we did it.[/say]")

		saynn("[say=pc]I guess we need to source a lab for Ferri now.[/say]")

		saynn("[say=kait]Oh yeah, who would have guessed.. chemists need chemistry labs.. About time we pay medbay a visit.[/say]")

		saynn("But that's for another time. For now, you can just enjoy your sweet victory.")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "player_brings_ferri_out"):
		processTime(3*60)

	if(_action == "last_mission_complete"):
		GM.main.MS.completeMission()

	setState(_action)
