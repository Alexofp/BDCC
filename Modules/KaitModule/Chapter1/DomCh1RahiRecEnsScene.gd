extends SceneBase

func _init():
	sceneID = "DomCh1RahiRecEnsScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("[say=pc]I have an offer for you, kitty cat.[/say]")

		saynn("Her ears perk.")

		saynn("[say=rahi]Oh.. meow?[/say]")

		saynn("Sharing all details is maybe not the best idea.")

		saynn("[say=pc]We're gathering a team. For something big. We could use your skills.[/say]")

		saynn("You clear your throat as the feline tries to process it, her cheeks getting a bit more red.")

		saynn("[say=pc]Khm.. Your thieving skills.[/say]")

		saynn("That helps to narrow it down for her. But now Rahi gets all tense about it.")

		saynn("[say=rahi]Is that gonna be.. safe?[/say]")

		saynn("You could lie.. but you probably shouldn't.")

		saynn("[say=pc]No, not really. We might be getting ourselves into huge trouble.[/say]")

		saynn("Rahi tilts her head down, her tail curls around her ankle.")

		saynn("[say=pc]You can say no.[/say]")

		saynn("She stays quiet.")

		saynn("Seconds pass, the atmosphere gets thicker.")

		saynn("[say=rahi]Well.. why not? It's something else for kitty to do.. And there is nothing for kitty to do if you get into trouble and she does not.[/say]")

		saynn("If she didn't trust you so much, she probably wouldn't agree so easily.")

		saynn("[say=pc]There is only one extra thing.[/say]")

		saynn("You're not exactly making this offer seem appealing. But sometimes you gotta do what you gotta do.")

		saynn("[say=rahi]Meow? What would that be..[/say]")

		saynn("[say=pc]I trust you. The rest of the team.. maybe not so much. You might have to go through some.. procedures.[/say]")

		saynn("Rahil rubs her snout, the last word making her space out for a second. But she soon regains focus.")

		saynn("[say=rahi]Procedures?[/say]")

		saynn("[say=pc]I'm not yet sure. Might be something simple. Or it might be rough.[/say]")

		saynn("This is where she says no and you have to decide if you're gonna force her.")

		saynn("[say=rahi]Yeah.. okay. It's kinda.. exciting.. in a way.. meow..[/say]")

		saynn("She offers you a smile. You offer her a pat on the head.")

		saynn("[say=rahi]Kitty is soft.. but she can try to not be soft too if that's required. Meow! Lead the way..[/say]")

		saynn("That was easy.")

		addButton("Hideout", "Bring Rahi to the hideout", "do_start")
		addButton("Never mind", "You need to do something else first", "nevermind")
	if(state == "nevermind"):
		saynn("[say=pc]I actually need to do something first.[/say]")

		saynn("[say=rahi]Okay.. she will be waiting then..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_start"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		aimCameraAndSetLocName("fight_nearentrance")
		saynn("You invite Rahi to follow and so she does, walking by your side.")

		saynn("The bulldog that's guarding the entrance near the gym seems to be informed already. He just lets you in.")

		saynn("The underground arena reveals its ugly sight to the feline. A whole crowd of prisoners stand around the big cage, cheering the next poor bathered souls to continue fighting it out.")

		saynn("Rahi's big kitty eyes are staring at everything around her with naive fascination. It doesn't seem like she ever paid this place a visit.")

		addButton("Continue", "See what happens next", "hideout")
	if(state == "hideout"):
		aimCameraAndSetLocName("hideout_middle")
		saynn("You pull Rahi behind the arena and towards the secret entrance in the Announcer's office. It's hidden behind the metal shelves so you take some time to push them aside. As you do, you begin to see some faint signs of light. Huh.")

		saynn("This abandoned maintenance corridor looks much less abandoned now, that's for sure. It's still a wreck of a place.. but most of the obvious trash has been cleared up. The half-broken table is not here anymore, the thing got moved.")

		saynn("It looks like someone even managed to get the power going. Probably Kait. And probably still without the insulated gloves.")

		saynn("[say=rahi]..wow..[/say]")

		saynn("[say=pc]Welcome.[/say]")

		saynn("[say=rahi]Meow..[/say]")

		saynn("A familiar voice approaches.")

		addButton("Continue", "See what happens next", "kait_finds")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "hideout"):
		processTime(5*60)

	if(_action == "kait_finds"):
		processTime(3*60)
		endScene()
		runScene("DomCh1RahiBreakIntroScene")

	setState(_action)
