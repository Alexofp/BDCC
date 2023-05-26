extends SceneBase

func _init():
	sceneID = "AvyFirstArenaBattleScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("Avy holds the notes where she tracks the list of the arena champions.")

		saynn("[say=avy]So. Who are you fighting today, attention whore?[/say]")

		saynn("But instead of picking anyone else, you just point at the foxy.")

		saynn("[say=pc]I wanna fight you.[/say]")

		saynn("Avy chuckles, her little mean stare almost makes you feel small. She even stays quiet for a bit, letting the tension rise before finally breaking the silence.")

		saynn("[say=avy]Are you sure~?[/say]")

		saynn("Avy tilts her head slightly, admiring your face while a little sly smile shines on her muzzle.")

		saynn("[say=avy]You know why I'm standing here? I didn't lose a single fight inside this arena.[/say]")

		saynn("Her expression changes back to the mean one, her eyes scanning your {pc.masc} frame.")

		saynn("[say=avy]And I'm not about to start. I Am Unbeatable.[/say]")

		saynn("The dark foxy leans against the fence.")

		saynn("[say=avy]So? Ready to get fucked?[/say]")

		saynn("You give Avy a quick glance of her body. She doesn't even look that strong, you fought inmates that are much more muscly. And her intelligence.. hard to tell, her speech mostly consists of degrading others.")

		saynn("You do notice her shorts bulging where her crotch is. It seems losing would mean you will be fucked in more ways than one.")

		addButton("Sure", "Let's prove her how wrong she is", "agree_fight")
		addButton("No", "You changed your mind", "endthescene")
	if(state == "agree_fight"):
		saynn("[say=pc]I wonder what will break first, your ego or your body. Yes, I'm ready.[/say]")

		saynn("Avy laughs sharply.")

		saynn("[say=avy]You? Break me? Let me remind you, dear underdog. You're about to step into a world of pain. Scale the fence and prepare to be humiliated.[/say]")

		saynn("Avy puts her notes away and starts climbing up the fence in an agile way. She stops to add some more encouraging words.")

		saynn("[say=avy]I might spare you if you beg well enough. Let's go, bitch.[/say]")

		addButton("Continue", "See what happens next", "sudden_kait")
	if(state == "sudden_kait"):
		removeCharacter("avy")
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("Just when you are about to start climbing the fence, someone's hand stops you. Huh. It's that cat that you have beaten before.")

		saynn("[say=kait]Listen, I fought her many times.[/say]")

		saynn("Avy has already scaled the fence and is now waiting for you. The crowd slowly begins to gather and the announcer is here too. Everyone is waiting for you..")

		saynn("[say=pc]So? Can't this wait?[/say]")

		saynn("[say=kait]No, it can't. Avy is.. she is cheating. I don't know how. But you won't win, no matter what you do. Trust me, I tried.[/say]")

		saynn("You glance over Kait's fragile-looking feline body and notice her lilac colors. She catches your judging gazes and frowns.")

		saynn("[say=pc]Maybe you're just not strong enough?[/say]")

		saynn("The snow leopard rolls her eyes and finally lets you continue.")

		saynn("If she is right.. then this might prove to be problematic. But it's too late to stop now. Let's see how unbeatable Avy is.")

		addButton("Continue", "Time for a fight", "fight_intro")
	if(state == "fight_intro"):
		aimCameraAndSetLocName("fight_arena")
		removeCharacter("kait")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You quickly climb over the fence and take your spot near the middle, opposite of Avy.")

		saynn("The crowd is.. huge.. to say the least. The dim maintenance lights allow you to only see their silhouettes but the excited cheering and trash talk make it obvious. It feels just like the first time you entered this place.. but now you're on the other side of the fence..")

		saynn("Suddenly, the announcer's voice makes everyone quiet.")

		saynn("[say=announcer]Ladies and Gentlemen! Inmates! All sorts of misfits! Welcome! It's time. Time for another thrilling spectacle![/say]")

		saynn("The crowd erupted into more cheering, their collective roar echoing through the improvised arena.")

		saynn("[say=announcer]Tonight, we have a special show lined up just for you. In the right corner, we have a true force to be reckoned with, known far and wide as Avy The Unbeatable! So far she didn't lose a single fight. Thanks to her sheer strength and incredible stamina, she managed to break anyone who even just looks at her the wrong way![/say]")

		saynn("Avy stands tall, radiating an aura of confidence and power. Her face doesn't show much emotion, only her eyes are piercing through you. The audience seems to love her, some are cheering her to win.")

		saynn("[say=announcer]And in the left corner. We have {pc.name}, one of the most promising warriors that we had in a while. {pc.He} started at the complete bottom of the champion list and managed to climb the ranks until {pc.he} is here! What do you think, will {pc.he} be able to take away Avy's Grand Champion rank or will {pc.he} end up just as another tally mark in Avy's book?[/say]")

		saynn("A loud murmur of anticipation swipes through the audience, everyone seems to be curious to see the clash between you and Avy. Or maybe they're just waiting for another loser to get fucked..")

		saynn("[say=announcer]And remember, there are no rules in The Underground! The winner gets to do anything they want! Let the fight begin![/say]")

		addButton("Fight", "Time to do this", "start_first_avy_fight")
	if(state == "avy_pitty"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="avy", npc="pc"})
		saynn("Defeated, you lose balance and collapse onto the floor. And just when you try to get up again, Avy just pins you to the floor with her leg. She doesn't even put too much strength into it but it's enough to keep you panting and groaning from the uncomfortable digi foot digging its claws into your chest.")

		saynn("[say=avy]Huh. You're so.. weak.[/say]")

		saynn("Avy swipes dust off her inmate uniform and spits at you.. Luckily the saliva has missed your face. Still.. the crowd doesn't know that, making you feel humiliated either way.")

		saynn("[say=avy]Pathetic display. Didn't even make me sweat.[/say]")

		saynn("She leans down and stares you in the face. Then she puts more pressure on your chest, making you gasp and squirm.")

		saynn("[say=avy]I would break your body.. but.. You didn't even put up a good fight.[/say]")

		saynn("She puts her clawed paw on you and begins dragging it down along your {pc.masc} body, slowly getting closer to your crotch.")

		saynn("[say=avy]So this will be enough.[/say]")

		saynn("You can.. feel.. her member already getting bigger in her shorts. The crowd cheers her to breed you."+str(" They don't even care that you don't have a pussy, they just wanna see it.." if !GM.pc.hasVagina() else "")+"")

		saynn("You're not sure how much you like this no-rules policy.. But it's probably too late to ask for a rematch..")

		if (GM.pc.hasReachableVagina()):
			addButton("Get bred", "This will be rough..", "avy_pitty_breeds_pussy")
		else:
			pass
	if(state == "avy_pitty_breeds_pussy"):
		addCharacter("avy", ["naked"])
		playAnimation(StageScene.SexMissionary, "tease", {pc = "avy", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("You see Avy's hungry stare and know that it doesn't mean anything good for you. Your hands grab her feet and make their best attempt at twisting it, forcing a painful hiss from the foxy. But instead of pulling her leg away, she commits even further and kicks your stomach, forcing all air out of you.")

		saynn("[say=avy]If you want rough, you will get rough, stupid bitch.[/say]")

		saynn("You try to crawl towards one of the fences but Avy easily catches up and stomps on you again.. and again.. until you stop.. She crouches and gets a good grip on your hair. It.. hurts.. As you look up at her.. she suddenly spits directly into your face.")

		saynn("[say=avy]Where are you going? I'm not done with you.[/say]")

		saynn("[say=pc]F-fuck you..[/say]")

		saynn("Avy yanks on your hair hard, forcing a painful cry out of you.")

		saynn("[say=avy]Oh, you think this is bad? You didn't even see me when I'm truly mad.[/say]")

		saynn("After torturing you like that for a bit, she finally lets go of your hair and instead pulls her shorts down, exposing her sheath with a canine-shaped red cock already peaking out and getting stronger. Avy is a dickgirl.. and she seems to be horny. Crowd is cheering loudly.")

		saynn("[say=avy]Spread your legs.. before I break them..[/say]")

		saynn("You don't listen so Avy rams her feet into your sides a few more times, making you cough. Then she uses that opportunity to forcibly part your {pc.thick} thighs before positioning herself between them, pinning you to the floor. You can feel.. dominance radiating from her every move. She catches your hands and holds them above your head with one paw"+str(" while the second one works on exposing your {pc.pussyStretch} pussy." if !GM.pc.isFullyNaked() else ".")+"")

		saynn("[say=avy]Good bitch.[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("The foxy takes notice of the chastity cage that is on your penis and just can't help but to chuckle. Her free paw lands on your balls and squeezes them painfully.")

			saynn("[say=avy]Look at that. You're a breeding stock already.[/say]")

		elif (GM.pc.hasReachablePenis()):
			saynn("The foxy takes notice of your {pc.penis} and puts on a sly smile. Her free paw lands on your balls and squeezes them painfully.")

			saynn("[say=avy]You will never need this with me. Might as well go let it get caged.[/say]")

		saynn("Fuck.. She has you pinned and naked. And her canine cock is hard, leaking pre onto your belly. As she begins to align, you try to desperately throw the foxy off. But that only makes her more eager..")

		addButton("Continue", "See what happens next", "avy_pitty_breed_pussy_do")
	if(state == "avy_pitty_breed_pussy_do"):
		playAnimation(StageScene.SexMissionary, "sex", {pc = "avy", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("With a loud growl, Avy aligns herself with your dry pussy entrance and meets your resistance with an overpowering force, thrusting inside you with a power of a primal need, stretching your {pc.pussyStretch} cunt wide, pushing her {avy.penis} inside. Without even letting you get used to her size, she starts pounding your slit rough, abusing the fact that you're completely helpless.")

		saynn("It hurts, her veiny member adds some wear and tear to your soft inner walls as she stretches you more and more. Painful cries escape from your lips but those only seem to entertain the foxy and crowd.")

		saynn("[say=avy]You're not wet yet? Not my problem, slut.[/say]")

		saynn("Her rhythmic thrusts are relentless, her pointy tip easily reaches your womb and smashes the entrance, causing a small bump on your belly. At some point Avy frees your hands and instead puts her paw on your neck, putting pressure on your throat instead.")

		saynn("[say=avy]Moan bitch.[/say]")

		saynn("You don't, your whole body seems to be in agony from such rough intercourse. But Avy's thrusts are only getting stronger and more powerful, the knot on her cock is inflating with blood to the point of her unable to fit it inside you.. but she keeps trying, stretching your irritated cunt even further.. You're struggling to breathe, only little painful cries escape from you while Avy is abusing your pussy slit.")

		addButton("Continue", "See what happens next", "avy_pitty_breed_pussy_faster")
	if(state == "avy_pitty_breed_pussy_faster"):
		playAnimation(StageScene.SexMissionary, "fast", {pc = "avy", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("The more she fucks you.. the more.. weird stuff.. you begin to feel.. Your mind is protesting any way it can but your body.. your body is betraying you. Your red bruised pussy begins to get wet around that intruding cock.. the inner walls clenching around the shaft and giving more pleasure to Avy.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Avy must be pushing on some pleasure spot.. Your locked up cock is trying to get hard but can't, desperately fighting the metal frame of the cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Avy must be pushing on some pleasure spot.. Your {pc.penis} is slowly getting harder and even leaks precum.")

		saynn("[say=avy]Oh, you're breaking already? Not before I knot your fucking cunt.[/say]")

		saynn("The mean foxy lets her breeder side take over completely, shifting you into a 'mating press' position, which allows her to thrust inside you with even more force, overwhelming your senses. At least she is not choking you anymore, allowing you to breathe..")

		saynn("Moans.. begin to escape from you. It hurts so much to get your pussy abused by that canine cock.. but feeling it inside you pushes all the right buttons.. Avy is panting while trying to shove her knot inside you.. the big meaty orb makes you moan like a slut while stretching your hole extremely wide.. before suddenly slipping inside..")

		saynn("Your body tenses, your inner walls clenching around Avy, kneading that shaft along its full length.. Avy grunts while her length is inside you.. all of it.. The crowd cheers her to cum and breed you while you orgasm hard, a wave after wave of intense agonizing pleasure washing over you.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Weak strings of {pc.cum} leak out of your cage.. it looks cute, seeing you cum completely hands free.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Strong strings of {pc.cum} get shot out of your cock.. it looks cute, seeing you cum completely hands free.")

		saynn("[say=avy]Nghh-h..[/say]")

		saynn("You are shaking hard from the orgasm. But Avy isn't, she suddenly yanks her knot out of your stretched cunt before shoving it back inside.. and doing that a few times, knot-fucking you until finally reaching her peak.")

		addButton("Continue", "See what happens next", "avy_pitty_breed_pussy_cum")
	if(state == "avy_pitty_breed_pussy_cum"):
		playAnimation(StageScene.SexMissionary, "inside", {pc = "avy", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("Avy's cock begins throbbing and spilling its seed deep inside you, marking your womb as hers.. She grunts and shows you her fangs while holding you still and just cumming inside you..")

		saynn("[say=avy]That's what you deserve.. Breeding stock.[/say]")

		saynn("As Avy's primal instincts subside, you remain locked together in this pose, the bump on your belly looking quite a bit bigger. Your insides are.. burning.. the sensitivity slowly returns to you after your orgasm.. You begin to whine.")

		saynn("[say=avy]Pathetic. At least you're good for something.[/say]")

		saynn("Avy yanks her knot out after a few attempts, causing a strong flow of her cum out of your used gaping pussy.")

		saynn("[say=avy]Come back when you want more.[/say]")

		saynn("After that she just dries her cock against your body and then vaults over the fence, leaving you on display like that..")

		addButton("Leave", "Time to go..", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sudden_kait"):
		processTime(2*60)

	if(_action == "fight_intro"):
		processTime(60)

	if(_action == "start_first_avy_fight"):
		runScene("FightScene", ["avy", "arenafight"], "first_arenafight")
		return

	if(_action == "avy_pitty_breeds_pussy"):
		processTime(3*60)

	if(_action == "avy_pitty_breed_pussy_do"):
		processTime(5*60)
		GM.pc.doWound("avy")

	if(_action == "avy_pitty_breed_pussy_faster"):
		processTime(3*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina, "avy")
		GM.pc.addPain(20)
		GM.pc.gotVaginaFuckedBy("avy")
		GM.pc.orgasmFrom("avy")

	if(_action == "avy_pitty_breed_pussy_cum"):
		processTime(3*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina, "avy")
		GM.pc.cummedInVaginaBy("avy")

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "first_arenafight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("avy_uses_drugs")
			addExperienceToPlayer(100)
		else:
			setState("avy_pitty")
			addExperienceToPlayer(5)
