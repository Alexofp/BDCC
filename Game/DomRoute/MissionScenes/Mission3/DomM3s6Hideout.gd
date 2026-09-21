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
		saynn("The journey is uneventful. You don't want the nurse to know where the underground arena is so you blindfold her before that. She gets lots of looks from the inmates while walking through it, her ears picking up lots of noises.")

		saynn("When you enter the hideout, you are met by the Announcer.")

		saynn("[say=announcer]I was getting worried. I see you brought in something.[/say]")

		saynn("[say=kait]Yes, we had some unforeseen complications. But we got the lab supplies in the end. They came with this cutie~.[/say]")

		saynn("The panting nurse carefully places the crate on the ground. She got quite tired so she planted her butt on the floor. Kait takes off her blindfold.")

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
	if(state == "kait_tribs"):
		playAnimation(StageScene.SexTribadism, "tease", {pc="kait", npc="nurse", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let Kait do what she wants to do.")

		saynn("Kait grins and grabs the nurse by the wrists, pulling her down onto the cold floor of the hideout. The nurse lets out a surprised squeak while Kait is already straddling her.")

		saynn("[say=kait]Shh, just relax, let me do everything~.[/say]")

		saynn("She leans down and licks the nurse's lips. Then she repositions herself a bit, sliding one leg under the nurse's.. interlocking them.. until their hips are pressed close. Their pussies are now inches apart, radiating heat.")

		saynn("[say=nurse]Ah.. are you really gonna..[/say]")

		saynn("[say=kait]And you're gonna love it~.[/say]")

		saynn("Kait rocks her hips forward, just a little.. until their pussies kiss. The first touch is electric, making the nurse shiver and moan softly.")

		saynn("[say=nurse]Ah..[/say]")

		saynn("[say=kait]You're so wet. Did I do that?[/say]")

		saynn("[say=nurse]Y-yes..[/say]")

		addButton("Continue", "See what happens next", "kait_trib_action")
	if(state == "kait_trib_action"):
		playAnimation(StageScene.SexTribadism, "sex", {pc="kait", npc="nurse", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kait grins and rolls her hips again.. proceeding to slowly grind pussies with the girl. Their clits brush, making the nurse shudder more. Kait keeps the pace slow at first.. just teasing.. letting the friction happen. Their juices mix, making the fur look all slick.")

		saynn("[say=kait]You like that? Mhh..[/say]")

		saynn("[say=nurse]Yes.. ah.. hah..[/say]")

		saynn("The nurse's impressive breasts sway subtly each time Kait grinds into her. They both start moaning into the air, the snow leopard biting her lip while watching the girl.")

		saynn("[say=nurse]Please.. faster..[/say]")

		saynn("[say=kait]Since you asked so nicely.[/say]")

		addButton("Continue", "See what happens next", "kait_trib_fast")
	if(state == "kait_trib_fast"):
		playAnimation(StageScene.SexTribadism, "fast", {pc="kait", npc="nurse", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Kait picks up the pace, her hips moving at a steady rhythm. The nurse's breathing becomes short, hot gasps. Her legs are trembling.. and yet.. she moves too, meeting Kait's thrusts, grinding her strawberry pussy against the leopard's.")

		saynn("The wet sounds fill the space.. accompanied by the soft moans of the girls. Their bodies rock together, fur slick with sweat and juices. Kait leans forward a bit to grope the nurse's tits while driving her hips harder.")

		saynn("[say=kait]That's it.. fuck.. You're gonna make me cum.[/say]")

		saynn("[say=nurse]Me too.. I'm close..[/say]")

		saynn("It doesn't take long before Kait's grinding gets all erratic. The nurse arches her back, crying out as her orgasm hits. Their pussies start visibly pulsing, still pressed tightly against each other, folds dancing with each other. Lots of hot moans escaping them both.")

		saynn("[say=nurse]Ahh.. ah.h..[/say]")

		saynn("A few seconds of pure ecstasy later.. they begin to slow down..")

		addButton("Continue", "See what happens next", "kait_trib_after")
	if(state == "kait_trib_after"):
		playAnimation(StageScene.SexTribadism, "tease", {pc="kait", npc="nurse", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And now, they just lie there, panting, tangled together.")

		saynn("[say=kait]Good girl.. very good girl..[/say]")

		saynn("[say=nurse]Mhh.. ah..[/say]")

		saynn("The nurse looks a bit dazed.. but clearly satisfied. Kait has a sly grin on her face.")

		saynn("They pull away from each other.. and then you surround the nurse again.")

		addButton("Continue", "See what happens next", "kait_menu")
	if(state == "kait_finger"):
		playAnimation(StageScene.GropeBehind, "gropefast", {pc="nurse", npc="pc", bodyState={naked=true, hard=true}})
		saynn("It's your time to have fun with the nurse.")

		saynn("You pull her into your embrace, your hands already landing on her curvy forms and exploring them, giving her hips some caressing.")

		saynn("[say=nurse]Ah.. w-wait..[/say]")

		saynn("[say=pc]You will have to put some trust into me. And then it will feel good.[/say]")

		saynn("Your palms cup her massive breasts from behind, fingers sinking into the fur. You give them a good squeeze, making the girl moan softly. Your digits search through the fur until they find her nipples.. already stiff. You pinch them and gently tug on them.")

		saynn("[say=nurse]Nnhh-..[/say]")

		saynn("Her back arches, brushing against your chest. You pinch her nips again, tugging harder. She gasps, her head falling back, finding your shoulder.")

		saynn("[say=pc]You're going to be good for me. Right?[/say]")

		saynn("[say=nurse]I.. I don't..[/say]")

		saynn("Her breath catches, a soft moan escaping her.")

		saynn("[say=pc]Right?[/say]")

		saynn("[say=nurse]M-maybe..[/say]")

		saynn("Maybe something else will convince her.")

		addButton("Continue", "See what happens next", "kait_finger_rub")
	if(state == "kait_finger_rub"):
		playAnimation(StageScene.GropeBehind, "rub", {pc="nurse", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You release one of her breasts and let your hand slide down to her slit. She is wet.. soaked really. Her thighs tremble as you trace along her folds, spreading them open.")

		saynn("[say=nurse]Ohh..[/say]")

		saynn("[say=pc]You're dripping. Is this from Kait.. or is it because of me?[/say]")

		saynn("[say=nurse]I.. I don't know..[/say]")

		saynn("You circle her clit, playing with it, just enough to make her twitch. She is so hot down there, you can really feel the heat. The sweet scent too.. strawberries.")

		saynn("[say=nurse]Nhh..[/say]")

		saynn("You slide one finger inside her. She is tight, clenching around you immediately. You pump it slowly, feeling her walls grip you.. Then you pull out and drag your wet digit along her slit, spreading her juices.")

		saynn("[say=nurse]Mhh.. please..[/say]")

		saynn("[say=pc]Please what?[/say]")

		saynn("[say=nurse]More..[/say]")

		saynn("You add a second finger and start thrusting deeper. Her juices are coating your digits, making it easy to finger-fuck her. When you pull out, strings of them hang between your fingertips. You bring your hand up to her muzzle.")

		saynn("[say=pc]Smell that? That's you.[/say]")

		saynn("She inhales shakily, her cheeks burning.")

		addButton("Continue", "See what happens next", "kait_finger_fast")
	if(state == "kait_finger_fast"):
		playAnimation(StageScene.GropeBehind, "rubfast", {pc="nurse", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You slide your fingers inside her again, harder this time. With how needy she is.. you can't help but to try to make her cum as fast as possible.")

		saynn("The nurse's pussy starts making wet noises, her hips moving to meet your hand, her maw producing hot moans. You curl your digits, trying to hit that pleasure spot..")

		saynn("[say=nurse]Ah.. ahh-.. F-fuck.. ahh..[/say]")

		saynn("You work her faster, your palm meeting with her clit with every thrust. Her breasts bounce in your other hand.. while you still knead them. The nurse is panting heavily, her moans growing louder, faster.")

		saynn("[say=nurse]I'm.. I'm gonna..[/say]")

		saynn("[say=pc]Do it. Be a good girl for me.[/say]")

		addButton("Continue", "See what happens next", "kait_finger_orgasm")
	if(state == "kait_finger_orgasm"):
		playAnimation(StageScene.GropeBehind, "orgasm", {pc="nurse", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You keep hammering away against her g-spot.. until she can't hold back anymore.")

		saynn("[say=nurse]AH-![/say]")

		saynn("She convulses in your arms, her pussy clamping down on your fingers as a gush of transparent fluids spray from her, splashing onto the floor, dripping down her thighs. And you keep rubbing her clit while she is doing it, extending the shower.")

		saynn("[say=pc]Such a squirter.[/say]")

		saynn("By the end of it, she is limp against you, gasping for air.")

		saynn("[say=nurse]Haa.. ha.. ahh..[/say]")

		saynn("You pull your fingers out.. and bring them to her mouth.")

		saynn("[say=pc]Clean.[/say]")

		saynn("She doesn't hesitate, her feline tongue lapping away at your digits, tasting herself, her eyes half-closed.. submission shining brightly in them.")

		saynn("[say=nurse]Mmm..[/say]")

		saynn("[say=pc]Good girl.[/say]")

		saynn("You release her, letting her slide down to the floor. She sits there, pussy still dripping, chest heaving.")

		saynn("Kait watches from nearby, a satisfied smirk on her face.")

		addButton("Continue", "See what happens next", "kait_menu")
	if(state == "kait_enough"):
		playAnimation(StageScene.SexStartDDS, "start", {pc="nurse", npc="pc", npc2="kait"})
		saynn("[say=pc]I think this is enough of a reward for her.[/say]")

		saynn("[say=kait]Yeah? Did you like it, kitty?[/say]")

		saynn("The nurse nods softly.")

		saynn("[say=nurse]Y-yes..[/say]")

		saynn("Kait leans close to her.")

		saynn("[say=kait]Are you gonna talk about us to anyone?[/say]")

		saynn("[say=nurse]N-no..[/say]")

		saynn("[say=kait]Good.[/say]")

		saynn("Kait gives her plenty of headpats.")

		saynn("[say=kait]We're not bad people. We just want to.. do some chemistry stuff. It's a hobby.[/say]")

		saynn("[say=nurse]Are you gonna.. blow up the space station?..[/say]")

		saynn("[say=kait]Noooo. Of course not. Why would we do that?[/say]")

		saynn("[say=nurse]Are you gonna make drugs?[/say]")

		saynn("[say=kait]Uh.. probably not.[/say]")

		saynn("[say=nurse]Then.. Why do you need it then?[/say]")

		saynn("Kait's kind expression worsens a bit.")

		saynn("[say=kait]That is.. not for you to ask. Alright? You were doing so well.[/say]")

		saynn("[say=nurse]Yes.. sorry.. I will forget this ever happened..[/say]")

		saynn("[say=kait]Wow. What a good girl! C'mon, let me help you.[/say]")

		saynn("Kait helps dress the nurse up.. Then she looks at you.")

		saynn("[say=kait]I will help her to get back to the prison grounds. I think this was fun~.[/say]")

		saynn("[say=pc]Somehow, it worked out. Too close.[/say]")

		saynn("[say=kait]Yeah.. Some unexpected things happened.[/say]")

		saynn("And so Kait puts a blindfold on the nurse.. and then walks her out.")

		saynn("Mission completed!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_break"):
		playAnimation(StageScene.SexStartDDS, "start", {pc="nurse", npc="pc", npc2="nurse"})
		removeCharacter("kait")
		removeCharacter("announcer")
		saynn("[say=pc]Can't be too safe, we have to break the nurse.[/say]")

		saynn("[say=avy]And there you go. See? {pc.name} agrees with me. Go ahead and reward me with your whining, Kait.[/say]")

		saynn("[say=kait]Your reward awaits you in the guard barracks, you should go there alone when you can. Have fun I guess.[/say]")

		saynn("[say=announcer]I don't think there is anything I can say that would change your mind, Avy. Just don't kill her or we all will be in huge trouble.[/say]")

		saynn("Kait and the announcer leave, leaving you and Avy near the shivering nurse.")

		saynn("[say=avy]Lose the clothes, slut.[/say]")

		saynn("[say=nurse]But..[/say]")

		saynn("[say=avy]I can rip them off if you want. You're gonna have to walk back naked then.[/say]")

		saynn("And so the nurse undresses, revealing her.. hefty assets.")

		addButton("Continue", "See what happens next", "avy_menu")
	if(state == "avy_menu"):
		playAnimation(StageScene.SexStartDDS, "start", {pc="nurse", npc="pc", npc2="avy", bodyState={naked=true}})
		saynn("What do you want to do?")

		addButton("Avy bullies", "Let Avy bully the nurse", "avy_bully")
		addButton("Avy rails her", "Let Avy rail the nurse's pussy", "avy_rail")
		addButton("Double penetration", "Double team the nurse! You fuck her pussy, Avy fucks her ass. Wear a strapon if you don't have a penis!", "avy_dp")
		addButton("Enough", "Enough fun for today", "avy_enough")
	if(state == "avy_bully"):
		playAnimation(StageScene.GropeBehind, "neck", {pc="nurse", npc="avy", bodyState={naked=true, hard=true}})
		saynn("You let Avy do what she wants to do with the girl.")

		saynn("[say=avy]Alright, come here.[/say]")

		saynn("As soon as the nurse hears that, she tries to get up and run away. But Avy is quick to catch her by the ponytail and yank her back into her hands.")

		saynn("[say=avy]Going somewhere? So soon?[/say]")

		saynn("[say=nurse]Don't kill me, please![/say]")

		saynn("[say=avy]Aw. Tugging on my heart strings. You heard the old man, I ain't gonna kill you. Just gonna roughen you up a little.[/say]")

		saynn("Avy's hand lands on the girl's neck, constraining the flow of air partly. The nurse gasps and breathes deeply.")

		saynn("[say=avy]After all, do I even look like an ice-cold murderer to you?[/say]")

		saynn("The girl is stammering.. taking her time to answer.")

		saynn("[say=nurse]N-no?[/say]")

		saynn("Avy chuckles and bares her fangs, her muzzle hovering near the girl's cheek.")

		saynn("[say=avy]Hah. Such a bad liar. That bitch Quinn is gonna read you like an open book.[/say]")

		saynn("[say=nurse]I won't tell her anything! I swear![/say]")

		saynn("[say=avy]You will say anything right now. And Quinn is gonna make you talk too, that sadistic bitch. We gotta raise your pain tolerance.[/say]")

		saynn("Avy suddenly sinks her fangs into the girl's shoulder, piercing the skin, letting the blood flow.")

		saynn("[say=nurse]AGhh! Please![/say]")

		saynn("The girl tries to break free but only receives a tighter grip on her throat, one that steals a gasp.")

		saynn("[say=avy]Funny taste. Strawberries. Makes me wanna take another bite.[/say]")

		saynn("[say=nurse]NHh.. I w-will do anything.. please.. Whatever you say.. it hurts..[/say]")

		saynn("[say=avy]One shoulder bite? This is nothing.[/say]")

		saynn("Avy lets her claws dig into the girl's neck, threatening to break skin.")

		saynn("[say=avy]You know what I like about claws? They leave such pretty marks. And they heal so slowly.[/say]")

		saynn("[say=nurse]..You're a monster.[/say]")

		saynn("[say=avy]Thanks.[/say]")

		addButton("Continue", "See what happens next", "avy_bullies_chest")
	if(state == "avy_bullies_chest"):
		playAnimation(StageScene.GropeBehind, "grope", {pc="nurse", npc="avy", bodyState={naked=true, hard=true}})
		saynn("Avy moves the clawed paw lower.. and suddenly digs the claws into her chest, dragging them along one of her breasts, leaving a scratch.")

		saynn("[say=nurse]AHHghhh..[/say]")

		saynn("The blood is fast to start coloring her fur red, like paint.")

		saynn("[say=avy]Such huge tits you got there. Where are the nips though.[/say]")

		saynn("Avy sinks both of her clawed paws into the girl's fur, squeezing her tits and trying to find something.")

		saynn("[say=avy]Ohh. There they are. Mmh.. Let's see.[/say]")

		saynn("[say=nurse]W-wait.. Ahh![/say]")

		saynn("The foxy presses her claws against them, hard enough to break the skin, drawing blood. The nurse cries out, her chest arching, whole body shivering.")

		saynn("[say=nurse]It.. h-hurts.. please..[/say]")

		saynn("[say=avy]I can give you a choice. I can either do this or break some of your ribs instead. What do you say?[/say]")

		saynn("Avy digs her claws more into the girl's nips, leaving her marks in the form of bleeding scratch lines on the areolas.")

		saynn("[say=avy]Can't hear you. Speak louder, staffer.[/say]")

		saynn("Foxy bares her fangs again, bringing her muzzle to the girl's neck, breathing warmly.")

		saynn("[say=nurse]..this.. ghh.. T-This..[/say]")

		saynn("[say=avy]See? I knew you had it in you. Little masochist whore.[/say]")

		saynn("Avy pulls her claws away from the nipples.. just leave another scratch on her breasts instead.")

		saynn("[say=nurse]Aghh..[/say]")

		saynn("The nurse is looking more like an abstract art canvas now, dripping blood creating splotches of color in different places. Her eyes are struggling to focus on anything now, her legs getting visibly weaker.")

		saynn("Better to intervene.")

		saynn("[say=pc]She is losing blood. Wrap it up.[/say]")

		saynn("[say=avy]She really tastes like strawberries, you should try it.[/say]")

		saynn("You quickly go through the nurse's things and find some anti-bleeding patches. You throw them to Avy.")

		saynn("[say=avy]Right. Let's set you down.[/say]")

		addButton("Continue", "See what happens next", "avy_bully_chair")
	if(state == "avy_bully_chair"):
		playAnimation(StageScene.SexChair, "start", {pc="nurse", npc="avy", bodyState={naked=true, hard=true}})
		saynn("Avy places the weak nurse on the chair and starts applying the patches over the wounds that she caused.")

		saynn("[say=avy]Hold still. I'm being nice.[/say]")

		saynn("[say=nurse]I.. I w-won't tell anyone..[/say]")

		saynn("[say=avy]I know. I know. How are you gonna explain these to Quinn?[/say]")

		saynn("Avy presses some of these patches over the girl's nipples. They look like pasties now!")

		saynn("[say=nurse]I.. was clumsy.. nhh.. ow.. near a bush..[/say]")

		saynn("[say=avy]Uh huh. And you think she will buy it?[/say]")

		saynn("[say=nurse]I d-don't know..[/say]")

		saynn("The foxy applies some patches to the shoulder too.. and then grabs the girl's ponytail to force eye contact.")

		saynn("[say=avy]You're gonna tell her that you're a subby painslut. And that you had this done to you because you like it. You hear?[/say]")

		saynn("[say=nurse]O-okay..[/say]")

		saynn("Avy yanks on the hair.")

		saynn("[say=avy]Who are you?[/say]")

		saynn("[say=nurse]Ah.. I'm a slut for pain..[/say]")

		saynn("[say=avy]Good. She will probably ask you to prove it. And so you're gonna obey her.[/say]")

		saynn("The nurse nods softly.")

		saynn("When Avy is done, you two surround the nurse again.")

		addButton("Continue", "See what happens next", "avy_menu")
	if(state == "avy_rail"):
		playAnimation(StageScene.SexMatingPress, "fast", {pc="avy", npc="nurse", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let Avy have some fun with the girl.")

		saynn("The foxy nods.. approaches the nurse.. and pins her down to the floor.")

		saynn("[say=nurse]Ah! W-wait![/say]")

		saynn("[say=avy]Shut up.[/say]")

		saynn("Avy guides her knotted cock between the girl's legs.. and drives her hips forward, burying her full length in one brutal thrust. The nurse cries out, her claws scratching against the floor.")

		saynn("[say=nurse]T-too m-much![/say]")

		saynn("The foxy pulls back and slams in again. And again. Her body keeps the nurse pinned to the floor while her cock keeps hammering away at her cunt, forcing out gasps.")

		saynn("[say=avy]Fucking take it, whore.[/say]")

		saynn("The wet slaps echo around the room. The nurse's legs are raised high, folded almost to her chest, keeping her completely exposed and helpless.")

		saynn("[say=nurse]Ah.. ahh.. t-too.. too d-deep..[/say]")

		saynn("Avy's foxy tail lashes behind her, her breaths coming out as hot growls. She is not stopping, not slowing. Her knot is already swelling, catching on the nurse's pussy folds with every thrust, stretching her wider each time.")

		saynn("[say=nurse]I-it w-won't.. w-won't..[/say]")

		addButton("Continue", "See what happens next", "avy_breed_cum")
	if(state == "avy_breed_cum"):
		playAnimation(StageScene.SexMatingPress, "inside", {pc="avy", npc="nurse", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Avy slams in one final time, forcing her entire length inside that cat, her knot included. The nurse's pussy stretches wide around that shaft, gripping it tightly..")

		saynn("[say=nurse]AGHh-hhh-hh-..[/say]")

		saynn("The foxy cums with a snarl, her balls tensing up, cock throbbing and pumping her with a huge load of seed, straight into her womb. Her paws hold the nurse still, pinned.. while her cock keeps filling her up.")

		saynn("The nurse is trembling beneath her, completely spent, her eyes rolling up.")

		saynn("[say=avy]There. Ghrr.. Fucking whore.[/say]")

		saynn("She stays buried for a long moment, letting her knot keep everything sealed inside.. before finally pulling out with a wet pop. The nurse whimpers, her used slit gushing cum.")

		saynn("That was fast.")

		addButton("Continue", "See what happens next", "avy_menu")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_licks"):
		processTime(5*60)

	if(_action == "kait_tribs"):
		processTime(5*60)

	if(_action == "kait_finger"):
		processTime(5*60)

	if(_action == "avy_bully"):
		processTime(3*60)

	if(_action == "avy_rail"):
		processTime(3*60)

	if(_action == "avy_dp"):
		processTime(3*60)

	if(_action == "avy_breed_cum"):
		getCharacter("avy").fillBalls(1.0)
		getCharacter("nurse").cummedInVaginaBy("avy")

	setState(_action)
