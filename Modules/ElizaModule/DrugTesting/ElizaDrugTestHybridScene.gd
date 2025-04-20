extends SceneBase

func _init():
	sceneID = "ElizaDrugTestHybridScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]I think you should try this pill yourself.[/say]")

		saynn("[say=eliza]You think so? Why?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]I'm just curious.[/say]")

		saynn("[say=eliza]Curiosity killed the cat, don't you know![/say]")

		saynn("[say=pc]But you're still alive, aren't you?[/say]")

		saynn("She blinks.. and squints.")

		saynn("[say=eliza]I guess. I never looked at it like that.[/say]")

		saynn("Her gaze switches to the pill in her paw.")

		saynn("[say=eliza]Well, this should be interesting.[/say]")

		saynn("She throws the pill into her mouth and swallows it in one graceful gulp.")

		saynn("For a heartbeat, nothing happens.. then her eyes widen in surprise.")

		addButton("Continue", "See what happens next", "eliza_tfs")
	if(state == "eliza_tfs"):
		playAnimation(StageScene.TFLook, "hands", {pc="eliza"})
		saynn("A soft ripple runs through her sleek fur. She gasps, pressing a hand to her throat as her muzzle begins to shorten.. whiskers retracting back into her cheeks. Some parts of her furcoat fade away.. revealing a red-ish skin.")

		saynn("[say=eliza]Hey, my fur![/say]")

		saynn("Her ears change their texture, becoming more fluffy.. and pink, copying the exact color of her ponytail. She reaches up, feeling them.")

		saynn("[say=eliza]These feel soft..[/say]")

		saynn("She looks at her paws.. who still remain mostly the same.. but somehow looking even more paw-like.")

		saynn("[say=eliza]I feel soft..[/say]")

		saynn("You watch the transformation with great interest. As the contours of her head finish changing.. you realize.. that she is a human now.. well, part-human.. a catgirl. Her pupils are thin and tall, like that of a wild animal.")

		addButton("Continue", "See what happens next", "silly_talk")
	if(state == "silly_talk"):
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza"})
		saynn("Eliza looks at herself through the camera of her datapad.")

		saynn("[say=eliza]Could have been worse. My tail and ears are still there.[/say]")

		saynn("[say=pc]Yeah, I think you look cute.[/say]")

		saynn("She blinks a lot, bouncing in place.")

		saynn("[say=eliza]For some reason.. I really wanna say it..[/say]")

		saynn("[say=pc]Say what?[/say]")

		saynn("Suddenly, raises her paws and does peace-signs with both.")

		saynn("[say=eliza]Nyah~![/say]")

		saynn("Her voice is now higher than before. Oh no..")

		saynn("She smiles silly and sticks her tongue out at you.")

		saynn("[say=pc]You're alright?[/say]")

		saynn("[say=eliza]Uwu~.[/say]")

		saynn("[say=pc]Did you really just say that?[/say]")

		saynn("Maybe her brain got transformed too.")

		saynn("[say=eliza]I'm awright, rewax![/say]")

		saynn("You squint.. while she tries to lick the tip of her nose. Her sharp fangs rest on top of her bottom lip. Eventually, the tip of her tongue manages to do it.")

		saynn("[say=eliza]Myah![/say]")

		saynn("She giggles and reaches her paw out to poke you on the nose.")

		saynn("[say=eliza]You okay?[/say]")

		saynn("[say=pc]I'm not sure anymore.[/say]")

		saynn("Eliza jumps up to you and starts nuzzling your face from all directions, rubbing cheeks with you, purring playfully.")

		saynn("[say=eliza]Sowwy! I'm so silly. Can you pat me??[/say]")

		saynn("She keeps pawing at you, her ears twitch, flirty tail brushing against your leg.")

		saynn("[say=eliza]Pwease![/say]")

		addButton("Continue", "See what happens next", "eliza_begs")
	if(state == "eliza_begs"):
		playAnimation(StageScene.Beg, "beg", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}})
		saynn("She wiggles out of her clothes, revealing her hair-less belly, chest and crotch. She looks more surprised than you are.")

		saynn("[say=eliza]My fur is gone! Wowsies, am even more nekked.[/say]")

		saynn("Despite it, the catgirl kneels before you and starts to bounce.")

		saynn("[say=eliza]Pwease! Pat me, pat me, pat me![/say]")

		saynn("She keeps her paws raised to her chest level, squeezing her {eliza.breasts} between them.")

		saynn("Maybe combining feline and human features together was a mistake.. But she is kinda cute though.")

		saynn("[say=eliza]Uwu![/say]")

		saynn("..just gotta gag her maybe.")

		addButton("Pat her", "Might as well", "do_pat")
		addButton("No pats", "Order her to turn back into a fully feline form", "no_pat")
	if(state == "no_pat"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcBodyState={naked=true}})
		saynn("[say=pc]I ain't gonna pat you. Turn back into your old self, you're acting way too silly.[/say]")

		saynn("[say=eliza]Nyo![/say]")

		saynn("She shows fangs and hisses at you, claws out, tail puffed up.")

		saynn("You find a blue pill in her clothes..")

		saynn("[say=pc]Fine, I will pat you, only once. Okay?[/say]")

		saynn("[say=eliza]Nyes! Meow-meow-meow~.[/say]")

		saynn("You reach your hand out.. but instead of patting her, you quickly force-feed her the pill.")

		saynn("[say=eliza]Nyoo-o-o, you myonstyer![/say]")

		saynn("Her human features begin to morph away before your eyes, her muzzle extending, growing fur and whiskers. Her ears lose some of their volume.. and become the color of the rest of her fur.")

		saynn("When the process is done.. Eliza is left standing.. Her expression.. complete and utter shame. Disgust even. Her opened wide eyes are staring at you.")

		saynn("[say=pc]Are you.. okay?[/say]")

		saynn("You wave a hand in front of her face.. while Eliza just cringes internally.")

		saynn("[say=eliza]Let's forget that this ever happened..[/say]")

		saynn("[say=pc]You don't have to tell me twice.[/say]")

		saynn("You hand Eliza her clothes.. and then she just runs away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_pat"):
		playAnimation(StageScene.Beg, "pat", {pc="eliza", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Fine. You reach your hand out and begin patting the silly catgirl between her ears.")

		saynn("[say=eliza]Uwu![/say]")

		saynn("[say=pc]Please don't say that.[/say]")

		saynn("[say=eliza]Okay..[/say]")

		saynn("She just purrs while accepting your pats, her frame bouncing eagerly, making her breasts jump up and down.")

		saynn("[say=eliza]Mmmhhrrr~..[/say]")

		saynn("You reach for her clothes and find a blue pill.")

		saynn("[say=pc]Now you're gonna eat this, okay?[/say]")

		saynn("[say=eliza]Do nyot want! I need tunya![/say]")

		saynn("[say=pc]Uh.. this tastes like tunya, I'm sure.[/say]")

		saynn("[say=eliza]Ohhh! Gimme-gimme-gimme![/say]")

		saynn("She devours the pill from your hand and licks her lips.")

		saynn("[say=eliza]It didn't taste like tunya at all![/say]")

		saynn("[say=pc]Sorry, it's better that way.[/say]")

		saynn("Her human features begin to morph away before your eyes, her muzzle extending, growing fur and whiskers. Her ears lose some of their volume.. and become the color of the rest of her fur.")

		addButton("Continue", "See what happens next", "after_pat")
	if(state == "after_pat"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcBodyState={naked=true}})
		saynn("When the process is done.. Eliza is left standing.. Her expression.. puzzled.")

		saynn("[say=pc]You're okay?[/say]")

		saynn("You wave a hand in front of her face..")

		saynn("[say=eliza]Yeah.. I think my IQ dropped by about a hundred.[/say]")

		saynn("[say=pc]It was kinda cute.[/say]")

		saynn("She cringles slightly.")

		saynn("[say=eliza]Gag me if I ever say uwu again.[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("You hand Eliza her clothes.. and then she just runs away.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "eliza_tfs"):
		processTime(5*60)
		setFlag("ElizaModule.elizatf_species", "catgirl")
		getCharacter("eliza").updateBodyparts()

	if(_action == "silly_talk"):
		processTime(5*60)

	if(_action == "eliza_begs"):
		processTime(5*60)

	if(_action == "do_pat"):
		processTime(3*60)

	if(_action == "no_pat"):
		processTime(3*60)
		setFlag("ElizaModule.elizatf_species", "")
		getCharacter("eliza").updateBodyparts()
		if(!getFlag("ElizaModule.tfcan_catgirl", false)):
			setFlag("ElizaModule.tfcan_catgirl", true)
			addMessage("Eliza can now transform into a catgirl. If you ask her.")

	if(_action == "after_pat"):
		processTime(3*60)
		setFlag("ElizaModule.elizatf_species", "")
		getCharacter("eliza").updateBodyparts()
		if(!getFlag("ElizaModule.tfcan_catgirl", false)):
			setFlag("ElizaModule.tfcan_catgirl", true)
			addMessage("Eliza can now transform into a catgirl. If you ask her.")

	setState(_action)
