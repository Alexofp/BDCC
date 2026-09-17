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
		addCharacter("nurse")
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

		saynn("After that, Kait runs up to Avy. You do the same.")

		addButton("Continue", "See what happens next", "kait_helps_avy")
	if(state == "kait_helps_avy"):
		playAnimation(StageScene.SexStartDDS, "start", {pc="avy", npc="kait"})
		saynn("Avy groans, her limbs twitching slightly as the last echoes of the shock wear off.")

		saynn("[say=kait]Get up, Avy. Quit drooling on the floor.[/say]")

		saynn("You hear a pained chuckle from the dark foxy. She slowly sits up.")

		saynn("[say=avy]Can't believe my eyes, you saved me. Me, an evil bitch. Such a hero.[/say]")

		saynn("[say=kait]I didn't save you, shut up. And we're doing a heist, stupid. I don't wanna drag your unconscious ass to the hideout.[/say]")

		saynn("Avy swipes the dust off of her uniform.")

		saynn("[say=avy]Blah blah blah, you tried your best, I know. I guess that makes you a failed hero, hah.[/say]")

		saynn("[say=kait]I should just finish you..[/say]")

		saynn("Avy pulls out a pill bottle and pops one. A sigh of relief comes not long after.")

		saynn("[say=avy]Oh yeah, with your hands~?[/say]")

		saynn("[say=kait]Oh no, shut up. Please.[/say]")

		saynn("The foxy finally gets up. She rolls her shoulders and stretches a bit.")

		saynn("[say=avy]You're right, hands are only enough for a prelude.[/say]")

		saynn("[say=pc]We're all gonna get fucked if we don't hurry up. That doctor might be done with Ferri any minute now.[/say]")

		saynn("[say=avy]Fine. We can reminisce later when we have the time. We can't leave the nurse here, let's get that bitch inside the storage room.[/say]")

		saynn("She walks over to the gagged cat, grabs the ropes at her back and lifts her up. The nurse lets out a muffled squeak through the ballgag, her eyes wide.")

		addButton("Storage room", "Search it!", "do_search_room")
	if(state == "do_search_room"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", pc="kait"})
		aimCameraAndSetLocName("medical_storage")
		saynn("You all step inside the storage room.")

		saynn("It's about what you'd expect.. multiple rows of shelves each filled with crates and containers.")

		saynn("Avy drops the nurse in the corner, facing away from you.")

		saynn("[say=avy]So.. where is the fucking lab shit?[/say]")

		saynn("[say=kait]Probably in one of these crates.. crap. I guess we have to search them all.[/say]")

		saynn("That would take forever, there is no way you're doing it.")

		saynn("You get a little closer to one of the crates.. and notice something.")

		saynn("[say=pc]They all got labels on them. Just read.[/say]")

		saynn("And so the three of you start going through each row of shelves, carefully examining each label. Everyone got a single row to check.")

		saynn("Time passes..")

		saynn("And soon..")

		saynn("[say=kait]I think I found it! This one says 'Dangerous equipment and materials. Dispose when possible'. Huh, we'd be practically doing them a favor by stealing this.[/say]")

		saynn("She pulls the crate off the shelf and opens it.")

		saynn("Inside, nestled in foam padding, is a complete chemistry setup. Glass flasks, beakers, a small heating element, coiled tubing.. and rows of sealed vials filled with some kind of liquids.")

		saynn("It's almost too good to be true.")

		saynn("[say=pc]This is it. Should be enough for Ferri.[/say]")

		saynn("Kait closes the crate.")

		saynn("[say=kait]Let's carry it to the hideout![/say]")

		saynn("Avy elbow-bumps the snow leopard.")

		saynn("[say=avy]Excuse me, how are you gonna do that? Every guard and their mother will want to tackle you on-sight.[/say]")

		saynn("[say=kait]..shit.[/say]")

		saynn("Indeed. The crate is too big to hide it. It's contents too.")

		saynn("[say=avy]And even if we shove everything up our asses, we're not walking through that checkpoint![/say]")

		saynn("[say=kait]We're not gonna do that. We need a plan..[/say]")

		saynn("It's not looking good. Everything that you did.. you might have to give it up now. Ferri wouldn't get her lab.. you wouldn't get its benefits.")

		saynn("You gotta think. And you don't have time, Eliza is gonna be done any second now.")

		saynn("Maybe there is something you can do.")

		saynn("You look around the room.")

		saynn("Shelves. You have shelves with crates. Crates with all sorts of medical stuff. Pills.. breast pumps.. fluid tanks..")

		saynn("You have a lab.. theoretically.. but you don't have anyone who can run it.")

		saynn("What else is there..")

		addButton("Continue", "See what happens next", "do_think")
	if(state == "do_think"):
		saynn("Think.. you gotta think.")

		saynn("[say=kait]What if.. we leave the crate in one of the vents. Somewhere close to the elevator.. and then we smuggle its contents piece by piece, multiple runs.[/say]")

		saynn("[say=avy]That is a dumb idea.[/say]")

		saynn("Very dangerous. Will take forever too. It's a no go.")

		saynn("[say=kait]Oh yeah, your shove-everything-up-our-asses idea was so much better. At least I'm offering a solution.[/say]")

		saynn("You need to get a single crate out of here.")

		saynn("[say=avy]Fine. But if this blows up in our faces, I'm blaming you.[/say]")

		saynn("You let them argue while you think. Getting the crate out.. How can you do that? None of you can just walk out with it. Right?")

		saynn("[say=kait]You always blame me.[/say]")

		saynn("You'd be brought down instantly.. Only a staffer would realistically be able to do it.")

		saynn("[say=avy]Because it's always your fault.[/say]")

		saynn("The nurse!")

		saynn("[say=pc]I got a better idea.[/say]")

		saynn("Everyone's ears perk towards you.")

		saynn("[say=pc]Tell the nurse to carry it for us.[/say]")

		saynn("You hear a confused muffled noise from the corner.")

		saynn("[say=avy]Why the fuck would she agree to do that for.. hmm-.. Wait a second. You might be right. Let me handle this.[/say]")

		saynn("Avy starts walking towards the nurse. The girl almost got rid of her ropes too by now, her legs and arms are pretty much free.")

		saynn("[say=avy]Ohh, look at you. You almost struggled free. So cute.[/say]")

		addButton("Continue", "See what happens next", "avy_on_nurse")
	if(state == "avy_on_nurse"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="avy", npc="nurse"})
		saynn("The nurse tries to crawl away but Avy is quick to pin her into the floor. The foxy flips the nurse onto her back and plants a hind paw on her chest, pressing just enough to make breathing annoyingly-hard.")

		saynn("[say=avy]Here's the deal, pussycat. You're gonna do exactly what we say. No screaming. No running. No hero shit.[/say]")

		saynn("Avy looks down at her with mean red eyes.")

		saynn("[say=avy]Yes, if you do any of that, you're gonna ruin our plans. It'd be so-so terrible for us. But let me run it down for you, tell you what happens next.[/say]")

		saynn("Avy tilts her head a bit.")

		saynn("[say=avy]We're gonna enjoy our time in solitary. We're gonna think of so many things that we will want to do to you.. And then.. we're gonna be out.[/say]")

		saynn("[say=avy]We're in the same small prison, you know. I know how you look. I can find you. You can't hide.[/say]")

		saynn("[say=avy]And then.. I guess I will start with small stuff. I will tear those cute whiskers off, you don't really need them. Could bite a chunk of your ear off. Your claws.. I could snap them in half. It's really painful. REALLY-really painful.[/say]")

		saynn("[say=avy]I guess I could torture your nipples. Your clit. Your cunt. Leave them all bleeding.[/say]")

		saynn("[say=avy]And then.. I knotted cock, you know. Could dislocate your jaw. Could loosen up your pretty ass. We will see.[/say]")

		saynn("Kait runs up to the foxy.")

		saynn("[say=kait]Avy, quit scaring the poor staffer to death. Go away.[/say]")

		saynn("Kait shoves Avy off and straddles the nurse herself.")

		addButton("Continue", "See what happens next", "kaits_turn")
	if(state == "kaits_turn"):
		playAnimation(StageScene.SexCowgirlAlt, "tease", {pc="nurse", npc="kait"})
		saynn("[say=kait]I can't stop Avy from doing things to you if you fuck it up for us.[/say]")

		saynn("[say=kait]But if you obey us this one time, good stuff is gonna happen. There is a big reward waiting for you~.[/say]")

		saynn("[say=kait]I can make you feel really-really good, you know..[/say]")

		saynn("[say=kait]Your desires.. I could make them real.[/say]")

		saynn("[say=kait]You'd also be receiving our protection. So? What do you think? Can you carry a little box for us for a few minutes?[/say]")

		saynn("The scared nurse blinks many times.. but then nods once softly. Kait smiles.")

		saynn("[say=kait]Good girl~.[/say]")

		saynn("Kait unties the rest of the ropes and takes the ballgag harness off of the nurse's head.")

		saynn("Good inmate, bad inmate. They managed to execute it pretty well.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "avy_gets_shocked"):
		processTime(3*60)

	if(_action == "nurse_gets_tied_up"):
		putOn("nurse", "ropeharness")

	if(_action == "do_search_room"):
		processTime(15*60)
		addMessage("You found 3x painkillers in the meantime!")
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))

	setState(_action)
