extends SceneBase

func _init():
	sceneID = "DomCh1RahiBreakIntroScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="hurt", pc="kait", npcBodyState={leashedBy="kait"}})
		saynn("[say=kait]You brought her in? Perfect.[/say]")

		saynn("Kait rushes in from the side-room, chain in her paw. She swiftly clips it to Rahi's collar. Something about it rubs you the wrong way.")

		saynn("[say=rahi]Ow..[/say]")

		saynn("The feline grabs onto the chain and tugs on it. The snow leopard slaps those brown paws away.")

		saynn("[say=kait]We have just finished clearing out the room for you.[/say]")

		saynn("[say=rahi]Oh?..[/say]")

		saynn("Kait catches your strict glance that's directed towards her.")

		saynn("[say=kait]Something is wrong?[/say]")

		saynn("Rahi decides to chime in.")

		saynn("[say=rahi]She is very-very..[/say]")

		saynn("But you interrupt her by covering up her lips.")

		saynn("[say=pc]You will understand everything soon.[/say]")

		saynn("That seems to satisfy her curiosity for now.")

		saynn("Next, you raise your palm towards Kait.")

		saynn("[say=pc]Hand me the leash.[/say]")

		saynn("[say=kait]Uh.. why? I can hold it.[/say]")

		saynn("Your gaze turns into a glare.")

		saynn("[say=kait]We're a team, no?[/say]")

		addButton("Assert yourself", "(Kait submission +) You brought Rahi after all", "do_assert_yourself")
		addButton("Let her keep it", "(Kait love +) Teamwork makes the dream work", "do_let_her_keep_it")
	if(state == "do_let_her_keep_it"):
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", pc="kait", npcBodyState={leashedBy="kait"}})
		saynn("Might as well be brutally honest about it and see what happens.")

		saynn("[say=pc]It's just.. I was the one who brought her in. But now you're holding her leash.[/say]")

		saynn("Kait's expression changes, her lips rounding into a soft 'oh', her ears turning down.")

		saynn("[say=kait]Oh.. do you want it back?[/say]")

		saynn("She offers you the leash, what a nice cat.")

		saynn("[say=pc]Keep it, Kait. I do trust you. It just rubbed my dominant side the wrong way a bit.[/say]")

		saynn("Your small smile is met with a cute chuckle.")

		saynn("[say=kait]Hah, I can make up for it by rubbing something else later~.[/say]")

		saynn("[say=pc]Sure, sounds good.[/say]")

		saynn("Rahi is blushing a bit when you two direct your attention back at her.")

		saynn("[say=pc]Shall we?[/say]")

		saynn("[say=kait]Yes, let's go.[/say]")

		saynn("Kait shows you the special little room that they have cleared out. Seems to be an old tool storage room. There is not much here at the moment, just a few chairs and an empty shelf.")

		saynn("There is also a pipe running along one of the walls. Kait brings Rahi in and wraps the chain around it. Good enough.")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("[say=kait]You're gonna stay here for a bit. Just a bit. Be a good kitty, uh huh?[/say]")

		saynn("The brown feline blinks many times and watches as you walk out of the room with Kait and close the door behind.")

		addButton("Continue", "See what happens next", "explain_mechanic")
	if(state == "do_assert_yourself"):
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={leashedBy="pc"}})
		saynn("Your hand doesn't move, palm still raised, eyes locked on hers.")

		saynn("[say=pc]And each team has a leader.[/say]")

		saynn("Kait's ears twitch. Her grip on the chain tightens for a moment. The air gets all tense all of the sudden.")

		saynn("Rahi watches this quietly, her tail frozen.")

		saynn("You lower your hand and step closer to Kait. Close enough that she has to tilt her head up to keep eye contact. Close enough that she can feel the heat coming off you.")

		saynn("[say=pc]Do you agree, Kait?[/say]")

		saynn("Her whiskers twitch, her gaze can only hold yours for so long before she looks away.")

		saynn("[say=kait]Well.. yeah. I guess.[/say]")

		saynn("It gets quiet. Somewhere deeper in the tunnel, a pipe trips. Water on metal.")

		saynn("Kait offers you the chain. You take hold of it, your digits brush against each other for a very brief moment.")

		saynn("[say=pc]I appreciate it. Really.[/say]")

		saynn("She offers you a nod.")

		saynn("[say=pc]Shall we?[/say]")

		saynn("[say=kait]Yes, let's go.[/say]")

		saynn("Kait shows you the special little room that they have cleared out. Seems to be an old tool storage room. There is not much here at the moment, just a few chairs and an empty shelf.")

		saynn("There is also a pipe running along one of the walls. You bring Rahi in and wrap the chain around it. Good enough.")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("[say=pc]You're gonna stay here for a bit. Just a bit. Thank you for being so calm about it.[/say]")

		saynn("The brown feline blinks many times and watches as you walk out of the room with Kait and close the door behind.")

		addButton("Continue", "See what happens next", "explain_mechanic")
	if(state == "explain_mechanic"):
		aimCameraAndSetLocName("hideout_near_break_room")
		removeCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You're standing out of the room with Kait.")

		saynn("[say=kait]Okay, the plan is simple. We gotta recruit this cat, make her do what we need her to do. Exactly as told.[/say]")

		saynn("Her eyes check you out.")

		saynn("[say=kait]You seem good with people so we might as well let you do this. This is your first time so I will give you some extra instructions.[/say]")

		saynn("You nod.")

		saynn("[say=kait]From what I've seen so far.. It looks like she won't resist it much. That won't always be the case, don't get used to it.[/say]")

		saynn("Lonely meows are coming from inside the.. cell.")

		saynn("[say=kait]Some will require a simple pat on the head. Some will need to be broken. Hard.[/say]")

		saynn("Sounds kinda fun.")

		saynn("[say=kait]You will have to find a unique approach for each. By the end they must be on their knees, begging to serve us. If that isn't the case, you will have to try again.[/say]")

		saynn("It's not like they can run away anymore anyway.")

		saynn("[say=kait]Talk with them. Figure out their kinks, their fears. Use what you've learned against them.[/say]")

		saynn("You nod again.")

		saynn("[say=kait]You will outline a plan and then execute it. If you don't wanna see it, you can let me do it. Or someone else, doesn't matter much. If the plan is good, the person will break and join us.[/say]")

		saynn("She sure knows a lot about this kind of stuff. Especially for a lilac.")

		saynn("[say=pc]Where did you learn all of that? You had experience breaking people?[/say]")

		saynn("Your question made her lower her gaze for a second.")

		saynn("[say=kait]Not really, this is my first time too. But I did watch and help a bit a few times. That doesn't matter right now, let's just do it. Ready when you are.[/say]")

		saynn("Kait leans against the wall near the door, making sure Rahi doesn't escape.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_assert_yourself"):
		getModule("KaitModule").incKaitSubmission()

	if(_action == "do_let_her_keep_it"):
		getModule("KaitModule").incKaitLove()

	if(_action == "explain_mechanic"):
		processTime(3*60)

	setState(_action)
