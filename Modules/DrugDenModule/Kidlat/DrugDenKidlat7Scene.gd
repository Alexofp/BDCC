extends SceneBase

func _init():
	sceneID = "DrugDenKidlat7Scene"

func _run():
	if(state == ""):
		saynn("You hear Kidlat's speech.. which means that she is somewhere around the corner.")

		saynn("But who is she talking to.. If it's one of the junkies, this can't be anything but bad news.")

		addButton("Peek", "(Boss fight) See what's up", "do_peek")
		addButton("Leave", "Maybe check on her some other time", "endthescene")
	if(state == "do_peek"):
		addCharacter("junkieBoozeSeller")
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {pc="kidlat", npc="junkieBoozeSeller"})
		saynn("You peek behind the corner and see a big scene unfolding.")

		saynn("[say=junkieBoozeSeller]The fuck do you mean, stupid cat? Do I have to beat my credits out of you?[/say]")

		saynn("A conflict seems to be in full force. The junkie glares at Kidlat with her angry eyes, her hands clenched into fists.. while Kidlat's paws have her claws out.")

		saynn("[say=kidlat]Hey, don't get your knickers in a twist. I already told you, not today.[/say]")

		saynn("[say=junkieBoozeSeller]We had a deal, you dumb biatch. Give me my fucking credits.[/say]")

		saynn("The angry girl reaches out to grab Kidlat's collar.. but gets her wrist swiped by Kidlat.")

		saynn("[say=kidlat]Oi, what's even your problem, cunt. I don't need your rotten booze so I'm not paying. Not today.[/say]")

		saynn("In a flash of raw aggression, the junkie kicks Kidlat's box, sending all of its contents scattering all over the floor.")

		saynn("[say=kidlat]Hey! That's my stuff![/say]")

		saynn("Kidlat starts to quickly pick it all up.. which gives the junkie time to slap her hard across the cheek. Kidlat gasps and hisses.. while something inside you makes you step out.")

		saynn("[say=kidlat]Ow.. fuck..[/say]")

		saynn("[say=junkieBoozeSeller]I ain't leaving without my creds. Either you give them to me or I'm just gonna loot them off of your body.[/say]")

		addButton("Continue", "See what happens next", "junkie_notices_pc")
	if(state == "junkie_notices_pc"):
		playAnimation(StageScene.Duo, "stand", {npc="junkieBoozeSeller"})
		saynn("Junkie notices your presence.. her eyes see your.. very annoyed.. expression.")

		saynn("[say=junkieBoozeSeller]The fuck do you want, fuckface?[/say]")

		saynn("[say=pc]Hitting girls isn't very nice.[/say]")

		saynn("The bitch chuckles.")

		saynn("[say=junkieBoozeSeller]Is that so, huh? I'm a girl, you're gonna harm me now?[/say]")

		saynn("[say=pc]I can make an exception.[/say]")

		saynn("Kidlat quickly puts all her stuff into her box and crawls into the corner, under some pipes. Her sad eyes watch you.")

		saynn("[say=kidlat]I'm very sorry, luv..[/say]")

		saynn("You nod Kidlat to hide better and prepare for a fight.")

		addButton("Fight", "Time to do this", "do_fight")
	if(state == "fight_won"):
		playAnimation(StageScene.Duo, "stand", {npc="junkieBoozeSeller", npcAction="defeat"})
		saynn("Junkie hits the floor, unable to continue fighting.")

		saynn("[say=junkieBoozeSeller]Ugh.. fucker..[/say]")

		saynn("[say=pc]That should teach you a lesson.[/say]")

		saynn("[say=junkieBoozeSeller]Shut up asshole.[/say]")

		saynn("Kidlat climbs out from under the pipes and walks up to you. Her paws gently wrap around you, embracing you from behind.")

		saynn("[say=kidlat]Hey.. uh.. good job, luv.[/say]")

		saynn("[say=junkieBoozeSeller]Luv, huh? Give me a fucking break with that shit. I need my dose, bitch. I need the fucking creds, I'm having the jitters already.[/say]")

		saynn("Kidlat hums.. her paw pulls out a credits chip. You stop her, your hand landing on her wrist.")

		saynn("[say=pc]Don't enable it.[/say]")

		saynn("[say=kidlat]But..[/say]")

		saynn("[say=pc]You wanna make her depend on you as well as the drugs?[/say]")

		saynn("She shakes her head.. and puts the chip away.")

		saynn("You give the junkie a stern look.")

		saynn("[say=pc]Now go away before I change my mind.[/say]")

		saynn("The junkie growls.. but eventually she gets up and leaves.")

		addButton("Continue", "See what happens next", "kidlat_talk")
	if(state == "kidlat_talk"):
		removeCharacter("junkieBoozeSeller")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("After the junkie is gone, you turn towards Kidlat, who's still catching her breath. She fiddles with the edge of her worn cardboard box, her eyes flicking up at you with a sheepish half-smile.")

		saynn("[say=kidlat]Hey, hun.. Um.. sorry.[/say]")

		saynn("You shake your head, stepping closer.")

		saynn("[say=pc]Why? You didn't do anything wrong, from what I've seen, just protected yourself.[/say]")

		saynn("She taps her cheek and rolls her eyes.")

		saynn("[say=kidlat]I made you protect my sorry butt![/say]")

		saynn("A small laugh escapes you as you nod.")

		saynn("[say=pc]I will protect your sorry butt any day of the week. Now who was she, should I be worried?[/say]")

		saynn("Kidlat sighs, glancing away.")

		saynn("[say=kidlat]That junkie.. is the one I've been buying contraband alcohol from.. She wasn't happy that I decided to skip my fix.[/say]")

		saynn("You raise an eyebrow.")

		saynn("[say=pc]Why not? Too expensive?[/say]")

		saynn("She shrugs, her eyes dancing around the space.")

		saynn("[say=kidlat]Well.. I drink when I need to get away from bad thoughts..[/say]")

		saynn("You smile softly.")

		saynn("[say=pc]No longer drowning in those?[/say]")

		saynn("She chuckles dryly, her gaze lowers for a moment.")

		saynn("[say=kidlat]Life still sucks, luv, don't be silly, hah. It feels like life will never not suck..[/say]")

		saynn("[say=pc]Aw.[/say]")

		saynn("An awkward silence settles between you and Kidlat.")

		saynn("She is not wrong, life is rarely going the way you want it to go.")

		saynn("Kidlat rubs her snout and looks you in the eyes.")

		saynn("[say=kidlat]But.. with people like you.. with you.. it feels like I don't have to drink as much, y'know..[/say]")

		saynn("That's sweet. For some reason the tunnels have just become warmer..")

		saynn("She looks down at her bathered cardboard box. Poor box that probably has seen it all.")

		saynn("[say=kidlat]Maybe I don't even need to be here anymore. No reason for me to hide here. This place is so dangerous, hah.[/say]")

		saynn("[say=pc]Someone is growing up.[/say]")

		saynn("She chuckles and baps you with her tail.. but reaches out to hug..")

		addButton("Continue", "See what happens next", "kidlat_hug")
	if(state == "kidlat_hug"):
		playAnimation(StageScene.Hug, "hug", {npc="kidlat"})
		saynn("She hugs you and presses her muzzle against your cheek, purring softly. Your arms wrap around her.")

		saynn("[say=kidlat]I will still have to come begging to her one day.[/say]")

		saynn("[say=pc]Let's hope that this day will never come.[/say]")

		saynn("A bit optimistic. Feels like life will always find a way to screw you over, one way or another. It's up to you how you will react to it though.")

		saynn("[say=kidlat]Until then, I will just make my current supply last for as long as possible~.[/say]")

		saynn("[say=pc]Supply, huh? How much do you have stored?[/say]")

		saynn("She leans in a bit closer, making you feel her warm breath. Her muzzle is slightly tilted to the side, her eyes are tracking your lips.. Her tongue flicks out and mlems the air.")

		saynn("[say=kidlat]Well..[/say]")

		saynn("She leaves her mouth slightly opened after that single word, dragging the moment for a little longer.")

		saynn("[say=kidlat]Did you know that it's possible to get drunk on love, luv~?[/say]")

		saynn("She winks and boldly mlems your lips. That answers some of your questions.")

		saynn("[say=kidlat]Hey, why don't you swing by my cell sometime later?[/say]")

		saynn("[say=pc]You have a cell?[/say]")

		saynn("Kidlat pouts and frees one of her hands to poke your cheek with her claws.")

		saynn("[say=kidlat]I always had it! I swear![/say]")

		saynn("[say=pc]Sure, sure.[/say]")

		saynn("She squints.. and boops noses with you.")

		saynn("[say=kidlat]Come and see it yourself then, you silly goober.[/say]")

		saynn("This invitation is hard to say no to.")

		saynn("[say=kidlat]But for now.. I'd be happy to sell you something~. You are my shop's most valuable customer.[/say]")

		saynn("Seeing the population.. it's not that high of a bar to smash.")

		addButton("Browse", "See what she has for sale!", "do_browse")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_fight"):
		runScene("FightScene", ["junkieBoozeSeller"], "boozeJunkieFight")
		return

	if(_action == "do_browse"):
		endScene()
		runScene("DrugDenKidlatShopScene")
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "boozeJunkieFight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setFlag("DrugDenModule.Kidlat7Hap", true)
			setState("fight_won")
			addExperienceToPlayer(100)
		else:
			if(GM.main.DrugDenRun != null):
				GM.main.DrugDenRun.markEncounterAsCompleted(GM.pc.getLocation())
			endScene()
			runScene("DrugDenEncounterInstantLossScene", ["junkieBoozeSeller"])
