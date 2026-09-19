extends SceneBase

func _init():
	sceneID = "DomM3s6Hideout"

func _run():
	if(state == ""):
		playAnimation(StageScene.SexStartDDS, "start", {pc="nurse", npc="kait", npc2="avy"})
		addCharacter("nurse")
		addCharacter("kait")
		addCharacter("avy")
		addCharacter("announcer")
		aimCameraAndSetLocName("hideout_chill")
		GM.pc.setLocation("hideout_chill")
		saynn("The journey is uneventful. Of course the nurse gets quite surprised when you walk her down to the underground arena. She gets lots of looks from the inmates. No one is dumb enough to stop you though.")

		saynn("When you enter the hideout, you are met by the Announcer.")

		saynn("[say=announcer]I was getting worried. I see you brought in something.[/say]")

		saynn("[say=kait]Yes, we had some unforeseen complications. But we got the lab supplies in the end. They came with this cutie~.[/say]")

		saynn("The panting nurse carefully places the crate on the ground. She got quite tired so she planted her butt on the floor.")

		saynn("[say=pc]Ferri? Still drool-y or are you coming back to us?[/say]")

		saynn("[say=ferri]Yes.. I think so. I mean.. mew.. I'm okay. Mew.[/say]")

		saynn("You unclip the leash from the dracat's collar.")

		saynn("[say=pc]Good. You got your lab stuff. We don't have much space so just set it up here somewhere. Got it?[/say]")

		saynn("[say=ferri]I will get to it![/say]")

		saynn("Ferri grabs the crate and obeys your word, proceeding to furnish one of the unused corners of this space.")

		saynn("[say=announcer]Not sure if bringing the nurse here was the best play.[/say]")

		saynn("You all surround her.")

		saynn("[say=avy]She knows that we have the lab shit, whatever.[/say]")

		saynn("[say=kait]I think we can trust her. I'm pretty sure she is ready to join our cause. Isn't that right, kitty cat~?[/say]")

		saynn("[say=nurse]Um..[/say]")

		saynn("The poor girl doesn't know what to do.")

		saynn("[say=avy]Hold up. I think we should give her a taste of what will happen if she doesn't obey. We gotta break her.[/say]")

		saynn("Avy tries to put her paws on the nurse but Kait slaps them away.")

		saynn("[say=kait]I promised her a reward! She is getting a reward.[/say]")

		saynn("Avy shows her fangs for a moment.")

		saynn("[say=avy]Whatever. Guess we need a tie breaker. Ans? {pc.name}?[/say]")

		saynn("[say=announcer]You brought her in, not me. But if you're curious, I'd let her go.[/say]")

		saynn("Avy rolls her eyes.")

		saynn("[say=avy]Now it's a fucking three-way. Don't you dare add a fourth option, {pc.name}.[/say]")

		addButton("Reward her", "(Kait's love +) Reward the nurse for helping you with a very good time", "do_reward")
		addButton("Break her", "(Avy's love +) Be extremely rough with the nurse to show her what happens if she talks", "do_break")
		addButton("Let her go", "(nothing) Just let the nurse go. Don't do anything sexy or violent with her", "do_let_go")
	if(state == "do_let_go"):
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})
		saynn("[say=pc]I say we let her go.[/say]")

		saynn("Avy and Kait both gasp at the same time.")

		saynn("[say=kait]WHAT?![/say]")

		saynn("[say=avy]WHAT?![/say]")

		saynn("[say=pc]You heard me. The nurse had enough.[/say]")

		saynn("Both of them look furious.")

		saynn("[say=kait]We did so much to get these damn lab supplies and now you're just letting her go?![/say]")

		saynn("[say=avy]Don't tell me you grew empathy for a fucking staffer.[/say]")

		saynn("The announcer puts his cane in front of the girls, preventing them from cutting you up with their claws.")

		saynn("[say=announcer]The nurse was just doing her job I'm sure, she had nothing to do with it.[/say]")

		saynn("[say=avy]The bitch will talk.[/say]")

		saynn("[say=announcer]She will forget this place ever existed. She will forget us too. Right?[/say]")

		saynn("The nurse looks up at him and blinks many times.")

		saynn("[say=nurse]Yeah.. uh.. what place.[/say]")

		saynn("Ans smirks.")

		saynn("[say=announcer]Yes, you're a smart girl.[/say]")

		saynn("[say=kait]Pff. Whatever then.[/say]")

		saynn("Kait and Avy both walk away, leaving you alone with the nurse and Ans.")

		saynn("[say=announcer]I will see her out. You did good.[/say]")

		saynn("[say=pc]Not sure if this was the best decision.[/say]")

		saynn("[say=announcer]From my point of view, it was. Maybe it wasn't the best decision. But it was the right one.[/say]")

		saynn("The announcer invites the nurse to follow. She does so, her legs shaky.")

		saynn("Ferri is still setting up in the corner. Here is hope she doesn't blow this place up.")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_reward"):
		playAnimation(StageScene.SexStartDDS, "start", {pc="nurse", npc="pc", npc2="kait"})
		removeCharacter("avy")
		removeCharacter("announcer")
		saynn("[say=pc]I think we should reward the nurse for being such a good girl for us.[/say]")

		saynn("[say=kait]Correct choice! You heard that, Avy? Eat it! Try not to choke![/say]")

		saynn("[say=avy]I can make you choke alright. Have fun with the staffer bitch then, I'm not into all this vanilla crap.[/say]")

		saynn("[say=announcer]I will let you be as well.[/say]")

		saynn("Only you, Kait and the nurse are left.")

		saynn("[say=kait]Let's have some fun~. Gimme your clothes, cutie, you don't need them~.[/say]")

		saynn("[say=nurse]Are you sure?..[/say]")

		saynn("[say=kait]I will give them back, promise![/say]")

		saynn("And so the nurse undresses, revealing her.. hefty assets.")

		addButton("Continue", "See what happens next", "kait_menu")
	if(state == "avy_menu"):
		playAnimation(StageScene.SexStartDDS, "start", {pc="nurse", npc="pc", npc2="avy", bodyState={naked=true}})
		saynn("What do you want to do?")

		addButton("Avy bullies", "Let Avy bully the nurse", "avy_bully")
		addButton("Avy rails her", "Let Avy rail the nurse's pussy", "avy_rail")
		addButton("Double penetration", "Double team the nurse! You fuck her pussy, Avy fucks her ass. Wear a strapon if you don't have a penis!", "avy_dp")
		addButton("Enough", "Enough fun for today", "avy_enough")
	if(state == "kait_menu"):
		playAnimation(StageScene.SexStartDDS, "start", {pc="nurse", npc="pc", npc2="kait", bodyState={naked=true}})
		saynn("What do you want to do?")

		addButton("Kait licks", "Let Kait eat her out!", "kait_licks")
		addButton("Kait tribs", "Let Kait rub pussies with the nurse!", "kait_tribs")
		addButton("Finger her", "Pleasure the nurse yourself with your digits", "kait_finger")
		addButton("Enough", "Enough fun for today", "kait_enough")
	if(state == "kait_licks"):
		playAnimation(StageScene.Search, "breasts", {pc="nurse", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let Kait do what she wants to do.")

		saynn("The snow leopard grins and takes the nurse by the wrist, pulling her toward the nearest wall. The shy nurse stumbles and grabs onto the wall with both paws.")

		saynn("[say=kait]Get comfortable, cutie~.[/say]")

		saynn("The nurse's breath hitches as Kait's paws slide up her sides, over her ribs, settling on her chest.")

		saynn("[say=kait]Mmh.. Wow. These are really something.[/say]")

		saynn("You hear a slight hint of jealousy from Kait. It's understandable though, the nurse's breasts are massive, easily twice the size of Kait's heavy and soft. Kait cups them both, her fingers sinking into the fur. She kneads them slowly, forcing the nurse to react.")

		saynn("[say=nurse]Ah..[/say]")

		saynn("[say=kait]Don't hold back. You did so well, let me make you feel good~.[/say]")

		saynn("The fur hides the nurse's nipples.. but Kait finds them anyway, her digits giving them a few good rubs, sending shivers down the girl's spine. After that, Kait keeps kneading and squeezing the girl's boobs, her own breath getting deeper as she watches the nurse's reactions.")

		saynn("[say=kait]Let's see now..[/say]")

		addButton("Continue", "See what happens next", "kait_lick_rub")
	if(state == "kait_lick_rub"):
		playAnimation(StageScene.Search, "rub", {pc="nurse", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kait's paw slides down along the nurse's back, sneaking between her thighs. Her fingers come back slick.")

		saynn("[say=kait]Ohh. You're already this wet?[/say]")

		saynn("[say=nurse]I-I can't help it..[/say]")

		saynn("[say=kait]I know. It's cute~.[/say]")

		saynn("Kait crouches behind her, eye level with the nurse's pussy.")

		saynn("[say=kait]Fuck. You smell amazing..[/say]")

		saynn("[say=nurse]I.. I do?[/say]")

		saynn("[say=kait]Strawberries~.[/say]")

		saynn("Kait's fingers slide along the nurse's folds, spreading them open. The nurse gasps, her hips twitching. Even you can now sense the fruit-y smell.. It is indeed quite nice.")

		saynn("The snow leopard watches the wet pussy closely, her mouth watering.")

		saynn("[say=kait]Taste test![/say]")

		saynn("[say=nurse]What?..[/say]")

		addButton("Continue", "See what happens next", "kait_licks_actually")
	if(state == "kait_licks_actually"):
		playAnimation(StageScene.Search, "lick", {pc="nurse", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kait leans in closer and drags her tongue along the length of the nurse's slit, slowly and passionately.")

		saynn("[say=nurse]Ah-.. f-fuck..[/say]")

		saynn("Kait's tongue is quite rough, textured with lots of tiny 'hooks' that all stimulate the girl's sensitive flesh. The snow leopard starts licking up and down, circling the nurse's clit and then dipping to tease her entrance. The nurse starts squirming, lots of little moans escaping her.")

		saynn("[say=kait]Mmm.. You taste as good as you smell.[/say]")

		saynn("[say=nurse]Please.. don't stop..[/say]")

		addButton("Continue", "See what happens next", "kait_licks_faster")
	if(state == "kait_licks_faster"):
		playAnimation(StageScene.Search, "lickfast", {pc="nurse", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kait wasn't planning on stopping anyway. She presses her muzzle against that sweet pussy harder, her tongue working faster, lapping away at the tasty juices. Her paws grip the nurse's thighs, holding her steady.")

		saynn("[say=nurse]Mmh.. ahh.. hah..[/say]")

		saynn("Kait purrs, adding extra please to the act. Her tongue prods the entrance a few times and then slides inside, exploring the wet depths of the girl, lapping away at her inner walls now. The girl's legs are shaking now, her breath coming in short sharp gasps.")

		saynn("[say=nurse]Ah.. ahh.. I'm so close.. ahh-h-..[/say]")

		saynn("The leopard just keeps eating that pussy while the nurse is squirming hard, cries of pleasure leaving her maw. The girl is clearly cumming, her back arching, strawberry pussy visible clenching around Kait's tongue.")

		saynn("Kait doesn't seem to be done yet..")

		addButton("Continue", "See what happens next", "kait_licks_squirt")
	if(state == "kait_licks_squirt"):
		playAnimation(StageScene.Search, "rubfast", {pc="nurse", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kait pulls her muzzle away from the girl's pussy and instead slips two digits inside it, fingering her hard.")

		saynn("[say=kait]C'mon, just let it go![/say]")

		saynn("[say=nurse]Nhhhh-.. mhhh.. ahhh.. ahh-h-! F-ff-fu-u-uck-k..[/say]")

		saynn("Nurse's pussy starts making wet noises fast, her hips bucking.. and then.. a gush of transparent juices spray from her pussy onto the floor. Kait keeps going, forcing the girl's pussy to squirt again and again.. drawing it all out.. until the nurse is completely spent.")

		saynn("[say=kait]There we go.. That's a good girl.[/say]")

		saynn("Kait stands up and wipes her face with the back of her paw.")

		saynn("The nurse is a wet mess, her chest heaving.")

		saynn("You give her some time to rest and come back to senses.")

		saynn("[say=nurse]That felt.. great.. ah..[/say]")

		addButton("Continue", "See what happens next", "kait_menu")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_licks"):
		processTime(5*60)

	if(_action == "kait_finger"):
		processTime(5*60)

	setState(_action)
