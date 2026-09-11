extends SceneBase

func _init():
	sceneID = "DomM3s1Intro"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		addCharacter("kait")
		saynn("You're standing near the mission board. Kait is scratching her chin, looking at the notes she left for herself. Her tail flicks behind her in slow, lazy arcs.")

		saynn("[say=pc]So. We need lab equipment for Ferri.[/say]")

		saynn("[say=kait]I was thinking about it. If we take it from their biolab, the whole prison is gonna be up in arms in mere hours. Can't have that.[/say]")

		saynn("She taps her claw against the board.")

		saynn("[say=pc]Let's see what others think about it.[/say]")

		saynn("[say=kait]I dunno if we should ask Avy about it.[/say]")

		saynn("She glances sideways at you, brows furrowing.")

		saynn("[say=pc]Why not? We're a team.[/say]")

		saynn("[say=kait]Well, you know.. It's Avy.[/say]")

		saynn("[say=pc]I wanna hear everyone's opinion, Kait.[/say]")

		saynn("She lets out a slow breath through her nose and shrugs.")

		saynn("[say=kait]..fine.[/say]")

		addButton("Continue", "See what happens next", "asking_everyone")
	if(state == "asking_everyone"):
		addCharacter("avy")
		addCharacter("announcer")
		addCharacter("ferri")
		playAnimation(StageScene.Duo, "stand", {pc="announcer", npc="avy"})
		saynn("Sometime later.. Avy and Ans join you.. as well as Ferri. Avy leans against one of the walls, her arms crossed. Ans stands still, using his cane for support, calm as always. Ferri stands near.")

		saynn("[say=avy]Lab shit? No idea. I can source pills, not the fucking machinery that makes them.[/say]")

		saynn("The dark foxy waves a hand.")

		saynn("[say=announcer]I could ask around. Pull some strings. But that will take time. It might draw some unwanted attention to us too. It's worth considering if this game is worth it.[/say]")

		saynn("Right. It makes sense that getting such equipment would be next to impossible.")

		saynn("[say=pc]We might have to give up on that idea then. Pick a different approach.[/say]")

		saynn("[say=kait]Back to the drawing board then.. Shit.[/say]")

		saynn("Kait kicks the floor, her fluffy rear paw picking up some old dust in the process.")

		saynn("[say=announcer]Not the end of the world. Cheer up.[/say]")

		saynn("[say=kait]Mhm..[/say]")

		saynn("Ferri lowers her gaze, her lips parting slightly. She is standing behind everyone, her paw is raised to her snout, clawed digits brushing against her lips. Her dragon tail struggles to find a good spot, fluffy tip brushing against her leg.")

		addButton("Ferri?", "Ask what Ferri thinks", "ask_ferri")
	if(state == "ask_ferri"):
		playAnimation(StageScene.Duo, "stand", {npc="ferri"})
		saynn("[say=pc]Ferri? What's on your mind?[/say]")

		saynn("Being called out made her ears perk, dark tassels wiggling in the air.")

		saynn("Every pair of eyes gets pointed at the cyan dracat. She blinks.")

		saynn("[say=ferri]Mew.. This equipment is fragile.. so they keep lots of spares.. usually. Somewhere in some storage room.. usually..[/say]")

		saynn("If you can't steal the originals.. maybe you can steal the old stuff?")

		saynn("[say=pc]Storage room? Do you know where it could be?[/say]")

		saynn("[say=ferri]I don't know the exact location.. Probably in medbay..[/say]")

		saynn("Ferri shrugs. Maybe she just doesn't wanna be kicked off the team already.. or maybe she is actually right.")

		saynn("[say=pc]I'm sure we can find it.[/say]")

		saynn("[say=announcer]I've heard stories about what happens behind the closed doors. Sounds too dangerous.[/say]")

		saynn("[say=kait]If you're alone, sure. But we have each other.[/say]")

		saynn("You hear a grunt from Avy. She rolls her eyes so hard her whole head moves.")

		saynn("[say=avy]I'm gonna puke.[/say]")

		saynn("[say=kait]Oh wow. Did someone finally impregnate you?[/say]")

		saynn("Kait puts on a cheeky smile. But Avy doesn't even look at her.")

		saynn("[say=avy]Just allergic to cringe shit.[/say]")

		saynn("They can keep at it for a long time.. Might as well accelerate it.")

		saynn("[say=pc]Let's go find that storage room. Ferri, follow us.[/say]")

		saynn("[say=ferri]Yes..[/say]")

		saynn("[say=announcer]I'll stay here. My advice is simple. If it gets too hot, pull out.[/say]")

		saynn("Avy grins.")

		saynn("[say=avy]I never pull out, you should know that by now.[/say]")

		saynn("[say=announcer]I know.[/say]")

		saynn("Kait turns away from the board and starts heading towards the exit, passing by the foxy.")

		saynn("[say=kait]See you all in the medical lobby then. Including you, Miss-lazy-bitch Avy. Mhm?[/say]")

		saynn("[say=avy]I appreciate the royal treatment.[/say]")

		saynn("[say=kait]I don't appreciate having dead weight in this team.[/say]")

		saynn("Avy pushes herself off the wall.")

		saynn("[say=avy]Pff, screw you. I will be there.[/say]")

		saynn("Time to head out!")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "asking_everyone"):
		processTime(5*60)

	if(_action == "ask_ferri"):
		addMessage("Task updated.")

	setState(_action)
