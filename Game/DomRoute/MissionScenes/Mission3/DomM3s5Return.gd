extends SceneBase

func _init():
	sceneID = "DomM3s5Return"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait", pc="avy"})
		addCharacter("kait")
		addCharacter("avy")
		saynn("You meet with Kait and Avy near the locked storage room again.")

		saynn("Kait is on her knees, below the access panel, messing with its exposed wiring.")

		saynn("[say=avy]Hey. How is the hacking going, cat?[/say]")

		saynn("[say=kait]I will trigger the bolts if I rip out the wrong wire. I will leave as a last resort option. Did you find something, {pc.name}?[/say]")

		saynn("You show them what you found.")

		saynn("[say=pc]I got a badge. It looks a bit different from the other ones.[/say]")

		saynn("[say=kait]Oh. Worth a try.[/say]")

		saynn("Kait snatches the thing and presses it against the panel. The screen turns a happy green color.")

		saynn("[say=kait]That works![/say]")

		saynn("The double-doors of the storage room begin sliding apart, inviting you all inside. Perfect.")

		saynn("Moments later.. a nurse steps out from behind the corner, a pre-warmed shock remote in her hand. All the while you were busy watching the rusty mechanism..")

		saynn("Kait's ears perk.")

		saynn("[say=kait]Oh shit, behind you![/say]")

		saynn("A buzz.. Followed instantly by a deafening cry.")

		addButton("Continue", "See what happens next", "avy_gets_shocked")
	if(state == "avy_gets_shocked"):
		playAnimation(StageScene.Duo, "defeat", {npc="nurse", pc="avy"})
		saynn("Avy hits the floor, blue arcs of electricity dancing across Avy's neck. She convulses on the floor, a raw scream tearing from her throat.")

		saynn("[say=avy]AGHH! FUCK![/say]")

		saynn("[say=kait]The nurse![/say]")

		saynn("You dash towards her. The nurse's thumb is fingering the main button on the remote so hard you can hear the plastic begging for mercy.")

		addButton("Nurse!", "Bring her down", "bring_nurse_down")
	if(state == "bring_nurse_down"):
		playAnimation(StageScene.SexLowDoggy, "tease", {pc="pc", npc="nurse"})
		saynn("You slam into the nurse before the remote recharges! Both of you crash to the floor, the remote skittering across the floor.")

		saynn("The nurse thrashes beneath you, trying to claw at your face.")

		saynn("[say=nurse]Let.. go![/say]")

		saynn("You catch one of her clawed paws and wrench it behind her back, turning her around to face the cold floor tiles in the process. You reach around to grab her other arm and pull it back behind her too, mostly pacifying the girl.")

		saynn("[say=kait]I got the fucking remote![/say]")

		saynn("When you subdue the nurse, you get a chance to look at Kait who is stomping onto the remote.. making it look like a mess of wires and electric boards.. with a fancy blue glow coming from the core of it.")

		saynn("[say=nurse]Security! SECURITY! Help me![/say]")

		saynn("She is wriggling hard underneath you, her tail baps your face again and again.")

		saynn("[say=pc]Kait. I could use some help over here.[/say]")

		saynn("[say=kait]Right! One second.[/say]")

		saynn("She produces some ropes and runs up to you.")

		saynn("You keep the nurse pinned while Kait starts working on her. The first loop goes around her wrists and elbows, pulling them together until they almost touch. She makes sure she got the cat's arms fully tied up.")

		saynn("[say=nurses]Ah.. quit it![/say]")

		saynn("[say=kait]Oh, I'm just getting started.[/say]")

		addButton("Continue", "See what happens next", "nurse_gets_tied_up")
	if(state == "nurse_gets_tied_up"):
		playAnimation(StageScene.Hogtied, "idle", {pc="nurse"})
		saynn("Kait runs the rope under the nurse's arms, around her chest, just above her breasts.. and then below them too. The rope digs into the fabric, making her tits bulge out visibly. The nurse lets out a strangled gasp.")

		saynn("[say=nurse]Stop it, I'm not gonna resist![/say]")

		saynn("[say=kait]Too late![/say]")

		saynn("The snow kitty works swiftly and efficiently, running the rope between the nurse's legs and looping it around her thighs.. before tightening it up hard! The rope digs hard into the nurse's clothed pussy slit, making the nurse jerk against the restraints, her face flushing red.")

		saynn("[say=nurse]Nnh..[/say]")

		saynn("Kait finishes it up by folding the nurse's legs and tying them up.. before running the rope from her ankles to her wrists, pulling the poor staffer into a strict hogtie.")

		saynn("The nurse's back is arching, her chest thrust forward, breasts straining against the ropes, crotch rope biting deep.")

		saynn("You get up.. letting her squirm. She tries.. but every movement just makes the ropes dig in harder.")

		saynn("[say=nurse]You're gonna regret it when Doctor Quinn finds you! She.. ah.. she has her special ways with someone like you![/say]")

		saynn("[say=kait]I've heard about it. And I'm not afraid in the slightest. Let's get you gagged.[/say]")

		saynn("[say=nurse]Hey! No![/say]")

		saynn("Kait shoves a rubber ballgag into the nurse's mouth and secures the harness around her face.")

		saynn("After that, Kait runs up to Avy.")

		addButton("Continue", "See what happens next", "kait_helps_avy")
	if(state == "kait_helps_avy"):
		playAnimation(StageScene.SexStartDDS, "start", {pc="avy", npc="kait"})
		saynn("[say=kait]Get up, Avy. Quit drooling on the floor.[/say]")

		saynn("[say=avy]Can't believe my eyes, you tried to save me. Me, an evil bitch. Such a hero.[/say]")

		saynn("[say=kait]We're doing a heist, stupid. I don't wanna drag your unconscious ass to the hideout.[/say]")

		saynn("[say=avy]Still, you tried your best. I guess that makes you a failed hero, hah.[/say]")

		saynn("[say=kait]I should just finish you..[/say]")

		saynn("Avy pulls out a pill bottle and pops one. A sigh of relief comes not long after.")

		saynn("[say=avy]Oh yeah, with your hands~?[/say]")

		saynn("[say=kait]Shut up. Please.[/say]")

		saynn("[say=avy]You're right, hands are only enough for a prelude.[/say]")

		saynn("[say=pc]We're all gonna get fucked if we don't hurry up. That doctor might be done with Ferri any minute now.[/say]")

		saynn("[say=avy]Fine. We can reminisce later when we have the time.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "avy_gets_shocked"):
		processTime(3*60)

	if(_action == "nurse_gets_tied_up"):
		putOn("nurse", "ropeharness")

	setState(_action)
