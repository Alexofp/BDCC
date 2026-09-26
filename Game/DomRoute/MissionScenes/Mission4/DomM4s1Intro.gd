extends SceneBase

var npcID = ""
var lostNurseFight = false

func _init():
	sceneID = "DomM4s1Intro"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("You are standing in front of the mission board.")

		saynn("Kait doesn't seem to be around at the moment.")

		saynn("It's quiet here. Makes it easy to think.")

		saynn("You have a chemist. And you have a lab. Technically, the captain can't hide from you anymore. But you also can't hide from the shock collars that are on your necks. Something needs to be done about that.")

		addButton("Continue", "See what happens next", "ferri_comes_in")
	if(state == "ferri_comes_in"):
		playAnimation(StageScene.Duo, "stand", {npc="ferri"})
		addCharacter("ferri")
		saynn("You get approached by Ferri.")

		saynn("[say=ferri]Hey. I think I have something.[/say]")

		saynn("[say=pc]The lab you mean? We had to go through a lot to get that stuff.[/say]")

		saynn("She lowers her gaze.")

		saynn("[say=ferri]Yeah, mew. Sorry.. but.. just don't expect too much. Especially for now.[/say]")

		saynn("You didn't exactly steal the state of the art stuff anyway.")

		saynn("[say=pc]You're fine, Ferri. Having extra hands is more valuable anyway. Show me what you got.[/say]")

		saynn("She doesn't need more pressure, the girl is doing her best with what she got.")

		addButton("Continue", "See what happens next", "go_look_lab")
	if(state == "go_look_lab"):
		aimCameraAndSetLocName("hideout_chill")
		saynn("You head off to the break room. Ferri has claimed one of the corners for herself and turned it into a makeshift lab.")

		saynn("A few crates pushed against each other form a table, topped with a sheet of metal that serves as a work surface.")

		saynn("The glass stuff from the stolen crate is arranged in a few careful rows.. flasks, beakers, vials, each one labeled by the dracat personally.")

		saynn("A small heating element sits off near the corner of the table, its cord running deep into the maintenance wall somewhere.")

		saynn("One of the vents got adapted by her into a crappy ventilation hood. Smart. We probably don't want to be breathing none of what she makes.")

		saynn("[say=ferri]I'm a little rusty, haven't done this in a while.[/say]")

		saynn("You can sense the mix of pride and nervousness in her voice.")

		saynn("[say=pc]I'm sure it's just like riding a bike.[/say]")

		saynn("[say=ferri]A very explosive bike.[/say]")

		saynn("You take a look around, making sure not to touch or break anything.")

		saynn("[say=pc]How did you learn all this stuff?[/say]")

		saynn("[say=ferri]You pick up a few skills chasing your dreams..[/say]")

		saynn("You offer her a sly smile.")

		saynn("[say=pc]Making nerve agents is quite a dream.[/say]")

		saynn("[say=ferri]Yea.. wait.. What? How do you know about that?[/say]")

		saynn("She raises a brow, her claws come out instinctively.")

		saynn("[say=pc]I have a few skills of my own. Since you're still.. alive.. I guess you didn't get a chance to test it. Makes me wonder what made such a soft dracat turn so evil.[/say]")

		saynn("Ferri pouts. Adorable.")

		saynn("[say=ferri]I'm not soft.. grr..[/say]")

		saynn("[say=pc]Don't ignore the question.[/say]")

		saynn("[say=ferri]There was no question![/say]")

		saynn("Still a brat, even after the recruitment process.")

		saynn("You walk up to her and grab her by the dragon horn.")

		saynn("[say=pc]Ferri. Are you forgetting your place?[/say]")

		saynn("[say=ferri]Mghh.. no.. mow..[/say]")

		saynn("You let go of the horn and let your digits scritch under her chin instead.")

		saynn("[say=pc]So?[/say]")

		saynn("[say=ferri]AlphaCorp invaded my planet.. so I thought.. I might as well fight back.[/say]")

		saynn("A classic.")

		saynn("[say=pc]By unleashing a biological weapon?[/say]")

		saynn("[say=ferri]You don't understand how it feels! They treated us like dirt. I got mad. With no way to let it out.[/say]")

		saynn("She sounds like such a rebel.")

		saynn("[say=pc]I thought you like humiliation.[/say]")

		saynn("[say=ferri]The kinky kind.. This was different. Try hitting rocks for a few years.[/say]")

		saynn("Our location changes. Our purpose doesn't.")

		saynn("[say=pc]Isn't that exactly what we're doing here.[/say]")

		saynn("[say=ferri]Well.. At least they gave us collars.. mew..[/say]")

		saynn("Your smile makes her cheeks blush.")

		saynn("[say=pc]Hah. I see. Speaking off, can you do something about them? Pour some acid on them or whatever?[/say]")

		saynn("Ferri tilts her head slightly.")

		saynn("[say=ferri]Do you want me to pour some acid on your neck? Didn't know you're into that.[/say]")

		saynn("[say=pc]No. But you know what I mean. Stop twisting my words. Or I will twist your nipples.[/say]")

		saynn("[say=ferri]Do it~.[/say]")

		saynn("She sticks her tongue at you. How dare she.")

		saynn("[say=pc]I will.[/say]")

		saynn("You come closer and grab her by the collar, two of your digits sliding under it, making it feel even tighter. Ferri blinks and raises her chin higher instinctively, subtly shivers going up her spine.")

		saynn("You boop her on the snout and let go of her collar.")

		saynn("[say=pc]But first.. what about the collars?[/say]")

		saynn("Ferri clears her throat.. and looks around.")

		saynn("[say=ferri]It.. it looks like some military-grade alloy. If you want my guess.. Titanium-carbide composite with a self-healing polymer coating. I can probably destroy the bits that are poking out.. but who knows what kind of failsafes would get triggered.[/say]")

		saynn("That's a lot of words, all of them amounting to one thought.")

		saynn("[say=pc]So chemistry is out.[/say]")

		saynn("She shrugs.")

		saynn("[say=ferri]Whoever designed them did a pretty good job. You have to find a key, no way around it.[/say]")

		saynn("You were thinking about grabbing her collar again.. when suddenly a voice..")

		saynn("[say=avy]Yo. Let me shove myself in.[/say]")

		addButton("Continue", "See what happens next", "avy_comes_in")
	if(state == "avy_comes_in"):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("Avy approaches you, her eyes quickly scanning the new addition to the hideout.")

		saynn("[say=pc]What do you want, Avy?[/say]")

		saynn("[say=avy]Having a moment? My bad. Cool nerd corner. Listen. I haven't seen Kait anywhere. Did you?[/say]")

		saynn("Avy is asking about Kait? That's a new.")

		saynn("[say=pc]Don't think so. Since when did you start caring about her?[/say]")

		saynn("Avy crosses her arms and rolls her eyes.")

		saynn("[say=avy]I give exactly zero fucks about that slut, okay? She is fun to bully I guess.[/say]")

		saynn("[say=pc]If she is not here, where could she be?[/say]")

		saynn("The foxy scratches her nose.")

		saynn("[say=avy]There was a rumor floating around about the nerd cat. Some inmates saw that bitch Quinn.. she was at the greenhouses, personally watering her pretty flowers or whatever.[/say]")

		saynn("Eliza Quinn.. Alone.. Far away from everyone. That would be the perfect moment to grab her.")

		saynn("[say=pc]And you think Kait went after her?[/say]")

		saynn("Avy shrugs expressively.")

		saynn("[say=avy]No fucking clue. Stupid slut probably thought she could handle it alone.[/say]")

		saynn("That's.. not ideal. If Kait isn't here, Quinn might be the reason indeed.")

		saynn("[say=pc]Fuck. Why didn't she talk to us?[/say]")

		saynn("[say=avy]You can tell that to her when we find her. I'll handle the whipping part.[/say]")

		saynn("[say=pc]You gonna help me find her?[/say]")

		saynn("Avy growls and inflates her cheeks for a second.")

		saynn("[say=avy]Of course I'm gonna help you find that slut.. We're a fucking team. Don't be stupid, let's go.[/say]")

		saynn("[say=ferri]Do you.. need me?[/say]")

		saynn("Ferri can fight, you saw it.. but.. there might be a problem with that.")

		saynn("[say=pc]Are you gonna be able to fight Quinn after what she did to you?[/say]")

		saynn("[say=ferri]Probably.. not.. mew..[/say]")

		saynn("[say=pc]Then you should stay.[/say]")

		saynn("Ferri would turn into a subby mess too easily anyway.")

		saynn("Either way, it's time to go pay that doctor a visit.")

		addButton("Medical", "Rush down to the medical wing with Avy", "go_medical")
	if(state == "go_medical"):
		removeCharacter("ferri")
		aimCameraAndSetLocName("med_elevator")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You're standing inside the elevator that's moving down to the bright, sterile floor.")

		saynn("[say=pc]So what's the plan?[/say]")

		saynn("[say=avy]We grab the bitch and shake her, until any clues about Kait's whereabouts come out. Then we bag both cats and get out. I brought some bondage shit.[/say]")

		saynn("The two of you, you aren't exactly an army. You will have to be quick about it.")

		saynn("[say=pc]Let's hope it will work.[/say]")

		saynn("[say=avy]It must.[/say]")

		saynn("Before the doors open.. Avy swiftly injects herself with something. Painkillers.. probably.")

		addButton("Step out", "See what waits you outside", "step_out_to_eliza")
	if(state == "step_out_to_eliza"):
		aimCameraAndSetLocName("med_lobby_start")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("The elevator doors open.. revealing the normal-looking medical lobby. You step out. The nurses are like busy bees, doing their tasks in the background, paying little attention to you.")

		saynn("Behind the counter of the lobby sits Eliza Quinn. She is busy tapping away on her laptop.")

		saynn("You speak firmly across the whole lobby.")

		saynn("[say=pc]Where is she?[/say]")

		saynn("All the nurses stop and look at you.")

		saynn("Eliza leans to the side a bit, her ears and eyes peeking from behind her laptop. She raises a brow.")

		saynn("[say=eliza]Hey there~. What can I..[/say]")

		saynn("Avy cuts her off.")

		saynn("[say=avy]You know exactly who we're talking about, you bitch whore. Talk.[/say]")

		saynn("You hear a soft chuckle. Eliza closes the laptop, takes a sip from her personal coffee mug and then gets up.")

		saynn("[say=eliza]Oh, you are talking about that cute snowy kitty~. An adorable little creature, isn't she?[/say]")

		saynn("Her smugness makes your veins boil.")

		saynn("[say=pc]What did you do to her?![/say]")

		saynn("She smiles and playfully tilts her head left and right, eyes looking to the side, the tips of her ears lagging behind her wiggle.")

		saynn("[say=eliza]She showed that she is unfit for normal prison life in her current.. mental.. state. So unfortunate, she really is a cute little kitty.[/say]")

		saynn("So she did indeed grab Kait.")

		saynn("[say=pc]What did you DO to her?![/say]")

		saynn("[say=eliza]I can't disclose patient medical information I'm afraid~.[/say]")

		saynn("Avy takes a bold step forward, clenching her fists.")

		saynn("[say=avy]I've heard enough. Just gonna break you, little nerd slut.[/say]")

		saynn("Avy growls and dashes forward, with intent to leap over the counter.")

		saynn("But the doctor is faster than she looks..")

		addButton("Continue", "See what happens next", "avy_gets_dazed_lobby")
	if(state == "avy_gets_dazed_lobby"):
		playAnimation(StageScene.Duo, "hurt", {pc="avy", npc="eliza", npcAction="throw"})
		saynn("Doctor's paw snaps to her labcoat's pockets, producing a small glass vial. She hurls it at Avy's face.")

		saynn("The vial shatters against the foxy's muzzle.")

		saynn("A cloud of pale purple gas engulfs Avy. She crashes into the counter and gets knocked back, her eyes losing focus, her growl turning into a slurred whimper.")

		saynn("While that is happening, Eliza snatches her coffee mug and runs towards the back exit.")

		saynn("[say=eliza]Nurses! Get them![/say]")

		saynn("Avy shakes her head, flailing wildly to push the purple cloud bits away.")

		saynn("[say=avy]Fuck.. grrh.. I hate her so much.[/say]")

		addButton("Continue", "See what happens next", "nurse_1_show")
	if(state == "nurse_1_show"):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		saynn("The nurses drop what they're doing and surround you.")

		saynn("[say=avy]Bring it on, whores.[/say]")

		saynn("Time to fight back. You pick one of them and focus on {npc.him}.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "nurse_fight_lost"):
		playAnimation(StageScene.GivingBirth, "idle")
		saynn("You've lost the fight..")

		addButton("Continue", "See what happens next", "nurse_fight_won")
	if(state == "nurse_fight_won"):
		playAnimation(StageScene.Solo, "kick", {pc="avy"})
		if (lostNurseFight):
			saynn("You got defeated.. but Avy is still fighting.")

		else:
			saynn("After you're done with your nurse, you direct your attention towards Avy.")

		saynn("One of the nurses raises a remote and points it at her. Moments later, Avy's hand is already wrapped around that nurse's neck.")

		saynn("[say=avy]C'mon. Press it, little whore. Make my muscles tense up, see what happens.[/say]")

		saynn("The shivering nurse decides to just drop the remote. That's when Avy throws them into a pair of other nurses, making them all collapse.")

		saynn("Another nurse swings a shock baton at her head.. but Avy is swift enough to duck under it.. before kicking that staffer into a wall.")

		saynn("[say=avy]Save your bones, stupid, quit fighting.[/say]")

		saynn("A sneaky nurse tries to flank her and get behind. Avy spins, catches the weaponized hand.. and plants her knee into the nurse's gut, forcing all the air out.")

		saynn("One of the nurses manages to shove the electrified tip of the stun baton into Avy's side!")

		saynn("[say=avy]GRhh![/say]")

		saynn("Growl echoes around the lobby as the electricity sends lots of blue little lightnings into the foxy's body.")

		saynn("Avy is taking it. Tanking it. Her whole body freezes up still.. except for one of her arms that grabs the nurse's wrist and wrenches it behind their back.. until something cracks inside. The nurse yelps and collapses instantly.")

		saynn("[say=avy]IS THIS WHAT YOU WANT, FUCKERS?![/say]")

		saynn("Her voice sends a shockwave across the whole room. The rest of the nurses are quick to grab the wounded ones.. before proceeding to escape.")

		if (lostNurseFight):
			saynn("[say=avy]Not so quick.[/say]")

			saynn("Avy runs up to one of the nurses and rips the badge off of their uniform.")

			saynn("[say=avy]That's mine now. Get out of my sight.[/say]")

			saynn("She then walks up to you and helps you to get up. Avy is still panting a bit.")

			saynn("[say=avy]Wake up, samurai. We got a bitch to break.[/say]")

		else:
			saynn("[say=pc]Not so quick.[/say]")

			saynn("You run up to one of the nurses and rip the badge off of their uniform.")

			saynn("[say=pc]That's mine now. Get out of my sight.[/say]")

			saynn("Avy walks up to you.")

			saynn("[say=avy]Let's get inside.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_look_lab"):
		processTime(5*60)

	if(_action == "avy_comes_in"):
		processTime(10*60)

	if(_action == "go_medical"):
		processTime(13*60)

	if(_action == "nurse_1_show"):
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Nurses, [], NurseGenerator.new(), {})

	if(_action == "start_fight"):
		runScene("FightScene", [npcID], "nurseFight")
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "nurseFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("nurse_fight_won")
			addExperienceToPlayer(20)
		else:
			lostNurseFight = true
			setState("nurse_fight_lost")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["npcID"] = npcID
	data["lostNurseFight"] = lostNurseFight

	return data

func loadData(data):
	.loadData(data)

	npcID = SAVE.loadVar(data, "npcID", "")
	lostNurseFight = SAVE.loadVar(data, "lostNurseFight", false)
