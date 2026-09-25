extends SceneBase

func _init():
	sceneID = "DomM4s1Intro"

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

	setState(_action)
