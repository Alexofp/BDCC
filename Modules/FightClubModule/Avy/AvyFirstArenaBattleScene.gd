extends SceneBase

func _init():
	sceneID = "AvyFirstArenaBattleScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		if (getFlag("FightClubModule.AttemptedAvyFight")):
			saynn("Avy is holding the notes where she tracks the list of the arena champions. Seeing you walk up to her makes her feel excited.")

			saynn("[say=avy]Oh, you're back for more~? Ready, fuckmeat? Or whoever you are.[/say]")

			addButton("Sure", "Let's prove her how wrong she is", "agree_fight")
			addButton("No", "You changed your mind", "endthescene")
		else:
			saynn("Avy holds the notes where she tracks the list of the arena champions.")

			saynn("[say=avy]So. Who are you fighting today, attention whore?[/say]")

			saynn("But instead of picking anyone else, you just point at the foxy.")

			saynn("[say=pc]I wanna fight you.[/say]")

			saynn("Avy chuckles, her little mean stare almost makes you feel small. She even stays quiet for a bit, letting the tension rise before finally breaking the silence.")

			saynn("[say=avy]Are you sure~?[/say]")

			saynn("Avy tilts her head slightly, admiring your face while a little sly smile shines on her muzzle.")

			saynn("[say=avy]You know why I'm standing here? I didn't lose a single fight inside this arena.[/say]")

			saynn("Her expression changes back to the mean one, her eyes scanning your {pc.masc} frame.")

			saynn("[say=avy]And I'm not about to start.[/say]")

			saynn("The dark foxy leans against the fence.")

			saynn("[say=avy]So? Ready to get fucked?[/say]")

			saynn("You give Avy a quick glance of her body. She doesn't even look that strong, you fought inmates that are much more muscly. And her intelligence.. hard to tell, her speech mostly consists of degrading others.")

			saynn("You do notice her shorts bulging where her crotch is. It seems losing would mean you will be fucked in more ways than one.")

			addButton("Sure", "Let's prove her how wrong she is", "fight_intro")
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

		saynn("[say=kait]No, it can't. Avy is.. she isn't fighting fair. I don't know.. But you won't win, no matter what you do.[/say]")

		saynn("You glance over Kait's fragile-looking feline body and notice her lilac colors. She catches your judging gazes and frowns.")

		saynn("[say=pc]Maybe you're just not strong enough?[/say]")

		saynn("The snow leopard rolls her eyes and finally lets you continue.")

		saynn("If she is right.. then this might prove to be problematic. But it's too late to stop now. Let's see how unbeatable Avy is.")

		addButton("Continue", "Time for a fight", "fight_intro")
	if(state == "fight_intro"):
		aimCameraAndSetLocName("fight_arena")
		removeCharacter("kait")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
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
			addButton("Get bred", "This will be rough..", "avy_pitty_breeds_anus")
	if(state == "avy_pitty_breeds_pussy"):
		addCharacter("avy", ["naked"])
		playAnimation(StageScene.SexMissionary, "tease", {pc = "avy", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("You see Avy's hungry stare and know that it doesn't mean anything good for you. Your hands grab her feet and make their best attempt at twisting it, forcing a painful hiss from the foxy. But instead of pulling her leg away, she commits even further and kicks your stomach, forcing all air out of you.")

		saynn("[say=avy]If you want rough, you will get rough, stupid bitch.[/say]")

		saynn("You try to crawl towards one of the fences but Avy easily catches up and stomps on you again.. and again.. until you give up your attempts.. She crouches and gets a good grip on your hair. It.. hurts.. As you look up at her.. she suddenly spits directly into your face.")

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
	if(state == "avy_pitty_breeds_anus"):
		addCharacter("avy", ["naked"])
		playAnimation(StageScene.SexMissionary, "tease", {pc = "avy", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("You see Avy's hungry stare and know that it doesn't mean anything good for you. Your hands grab her feet and make their best attempt at twisting it, forcing a painful hiss from the foxy. But instead of pulling her leg away, she commits even further and kicks your stomach, forcing all air out of you.")

		saynn("[say=avy]If you want rough, you will get rough, stupid bitch.[/say]")

		saynn("You try to crawl towards one of the fences but Avy easily catches up and stomps on you again.. and again.. until you give up your attempts.. She crouches and gets a good grip on your hair. It.. hurts.. As you look up at her.. she suddenly spits directly into your face.")

		saynn("[say=avy]Where are you going? I'm not done with you.[/say]")

		saynn("[say=pc]F-fuck you..[/say]")

		saynn("Avy yanks on your hair hard, forcing a painful cry out of you.")

		saynn("[say=avy]Oh, you think this is bad? You didn't even see me when I'm truly mad.[/say]")

		saynn("After torturing you like that for a bit, she finally lets go of your hair and instead pulls her shorts down, exposing her sheath with a canine-shaped red cock already peaking out and getting stronger. Avy is a dickgirl.. and she seems to be horny. Crowd is cheering loudly.")

		saynn("[say=avy]Spread your legs.. before I break them..[/say]")

		saynn("You don't listen so Avy rams her feet into your sides a few more times, making you cough. Then she uses that opportunity to forcibly part your {pc.thick} thighs before positioning herself between them, pinning you to the floor. You can feel.. dominance radiating from her every move. She catches your hands and holds them above your head with one paw"+str(" while the second one works on exposing your {pc.anusStretch} tailhole." if !GM.pc.isFullyNaked() else ".")+"")

		if (GM.pc.hasVagina()):
			saynn("[say=avy]Good bitch. Can't breed your pussy but this will do just fine.[/say]")

		else:
			saynn("[say=avy]Good bitch.[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("The foxy takes notice of the chastity cage that is on your penis and just can't help but to chuckle. Her free paw lands on your balls and squeezes them painfully.")

			saynn("[say=avy]Look at that. You're a breeding stock already.[/say]")

		elif (GM.pc.hasReachablePenis()):
			saynn("The foxy takes notice of your {pc.penis} and puts on a sly smile. Her free paw lands on your balls and squeezes them painfully.")

			saynn("[say=avy]You will never need this with me. Might as well go let it get caged.[/say]")

		saynn("Fuck.. She has you pinned and naked. And her canine cock is hard, leaking pre onto your belly. As she begins to align, you try to desperately throw the foxy off. But that only makes her more eager..")

		addButton("Continue", "See what happens next", "avy_pitty_breed_anus_do")
	if(state == "avy_pitty_breed_anus_do"):
		playAnimation(StageScene.SexMissionary, "sex", {pc = "avy", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("With a loud growl, Avy aligns herself with your dry anal ring and meets your resistance with an overpowering force, thrusting inside you with a power of a primal need, stretching your {pc.anusStretch} star wide, pushing her {avy.penis} inside. Without even letting you get used to her size, she starts pounding your ass rough, abusing the fact that you're completely helpless.")

		saynn("It hurts, her veiny member adds some wear and tear to your soft inner walls as she stretches you more and more. Painful cries escape from your lips but those only seem to entertain the foxy and crowd.")

		saynn("[say=avy]No lube? Not my problem, slut.[/say]")

		saynn("Her rhythmic thrusts are relentless, her pointy tip easily reaches the deepest points of your nethers, causing a small bump on your belly. At some point Avy frees your hands and instead puts her paw on your neck, putting pressure on your throat instead.")

		saynn("[say=avy]Moan bitch.[/say]")

		saynn("You don't, your whole body seems to be in agony from such rough intercourse. But Avy's thrusts are only getting stronger and more powerful, the knot on her cock is inflating with blood to the point of her unable to fit it inside you.. but she keeps trying, stretching your irritated tailhole even further.. You're struggling to breathe, only little painful cries escape from you while Avy is abusing your {pc.masc} ass.")

		addButton("Continue", "See what happens next", "avy_pitty_breed_anus_faster")
	if(state == "avy_pitty_breed_anus_faster"):
		playAnimation(StageScene.SexMissionary, "fast", {pc = "avy", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("The more she fucks you.. the more.. weird stuff.. you begin to feel.. Your mind is protesting any way it can but your body.. your body is betraying you. Your red bruised anus got lubed up with precum of that intruding cock, lowering the painful friction.. the inner walls clenching around the shaft and giving more pleasure to Avy.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Avy is destroying your swollen prostate.. Your locked up cock is trying to get hard but can't, desperately fighting the metal frame of the cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Avy is destroying your swollen prostate.. Your {pc.penis} is slowly getting harder and even leaks pre.")

		saynn("[say=avy]Oh, you're breaking already? Not before I knot your fucking ass.[/say]")

		saynn("The mean foxy lets her breeder side take over completely, shifting you into a 'mating press' position, which allows her to thrust inside you with even more force, overwhelming your senses. At least she is not choking you anymore, allowing you to breathe..")

		saynn("Moans.. begin to escape from you. It hurts so much to get your tailhole abused by that canine cock.. but feeling it inside you pushes all the right buttons.. Avy is panting while trying to shove her knot inside you.. the big meaty orb makes you moan like a slut while stretching your hole extremely wide.. before suddenly slipping inside..")

		saynn("Your body tenses, your inner walls clenching around Avy, kneading that shaft along its full length.. Avy grunts while her length is inside you.. all of it.. The crowd cheers her to cum and breed you while you orgasm hard, a wave after wave of intense agonizing pleasure washing over you.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Weak strings of {pc.cum} leak out of your cage.. it looks cute, seeing you cum completely hands free.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Strong strings of {pc.cum} get shot out of your cock.. it looks cute, seeing you cum completely hands free.")

		saynn("[say=avy]Nghh-h..[/say]")

		saynn("You are shaking hard from the orgasm. But Avy isn't, she suddenly yanks her knot out of your stretched anus before shoving it back inside.. and doing that a few times, knot-fucking you until finally reaching her peak.")

		addButton("Continue", "See what happens next", "avy_pitty_breed_anus_cum")
	if(state == "avy_pitty_breed_anus_cum"):
		playAnimation(StageScene.SexMissionary, "inside", {pc = "avy", npc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={exposedCrotch=true,hard=true}})
		saynn("Avy's cock begins throbbing and spilling its seed deep inside you, marking you as hers.. She grunts and shows you her fangs while holding you still and just cumming inside you..")

		saynn("[say=avy]That's what you deserve.. Breeding stock.[/say]")

		saynn("As Avy's primal instincts subside, you remain locked together in this pose, the bump on your belly looking quite a bit bigger. Your insides are.. burning.. the sensitivity slowly returns to you after your orgasm.. You begin to whine.")

		saynn("[say=avy]Pathetic. At least you're good for something.[/say]")

		saynn("Avy yanks her knot out after a few attempts, causing a strong flow of her cum out of your used gaping ass.")

		saynn("[say=avy]Come back when you want more.[/say]")

		saynn("After that she just dries her cock against your body and then vaults over the fence, leaving you on display like that..")

		addButton("Leave", "Time to go..", "endthescene")
	if(state == "avy_uses_drugs"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcAction="defeat"})
		saynn("Avy grunts as she collapses onto the hard arena floor, her confident demeanor shattered. Gasps and whispers can be heard echoing around the arena. The crowd seems to be confused about Avy, the supposed grand champion that is now laying in the middle of the arena, seemingly defeated.")

		saynn("As the murmurs spread, you begin to slowly approach Avy.")

		saynn("[say=announcer]It appears.. Avy.. The current Grand Champion of the arena.. has been defeated.. Ladies and gentlemen..[/say]")

		saynn("Avy is panting softly while glaring your way. Your attention was focused on her mean face so much that you didn't even notice her pulling something out.. a syringe?..")

		saynn("[say=announcer]Let's cheer for {pc.name}! The new Grand Champi-.. wait![/say]")

		saynn("As soon as you reach your hands out to pin the foxy, her eyes start shining with renewed determination. In a swift, fluid motion, that was only visible to you, she pulls that syringe out and injects it into her neck.")

		saynn("[say=avy]Thought it would be that easy?..[/say]")

		addButton("Continue", "See what happens next", "avy_is_fine")
	if(state == "avy_is_fine"):
		playAnimation(StageScene.Duo, "hurt", {npc="avy", npcAction="shove"})
		saynn("Suddenly Avy lets out a loud animal growl before getting up on her feet and shoving you away with the power of a truck. A surge of energy courses through her veins, making her look just as strong as she was before the fight.. or maybe even stronger..")

		saynn("[say=avy]I Am Unbeatable. Bitch.[/say]")

		saynn("The crowd erupts in a mix of gasps and cheers, the confusion replaced with excitement. The announcer raises his smooth voice, rallying the crowd.")

		saynn("[say=announcer]Ladies and gentlemen, the fight is not over yet! Avy has found her second wind! Exciting. Let the battle continue![/say]")

		saynn("Who said it's gonna be easy..")

		addButton("Fight", "Continue fighting", "start_second_fight")
	if(state == "avy_wins_anyway"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcAction="defeat"})
		saynn("Impossible, huh. It seems that the cat was wrong.")

		saynn("Avy The Unbeatable lays on the arena's floor, battered and beaten. The crowd is stunned, struggling to process it all.")

		saynn("[say=pc]Your drugs won't help you.[/say]")

		saynn("[say=announcer]Wow! Will Avy get up again or do we have a winner? So tense![/say]")

		saynn("As you carefully approach Avy, a glimmer of desperation flashes in her eyes. You press your knee into her back, pinning her in place while your hands try to wrench hers behind her. Quiet growling vibrates the air. You're almost done.. But then you realize that one of her clenched fists holds another syringe!")

		saynn("[say=avy]Fuck you.[/say]")

		saynn("With a swift motion, she injects it into her bruised body. A surge of renewed strength courses through her veins as she easily throws you off herself and springs up to her feet.")

		addButton("Continue", "See what happens next", "avy_wins_and_pins")
	if(state == "avy_wins_and_pins"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="avy", npc="pc"})
		saynn("Before you know it, Avy kicks you down and stomps on your chest, forcing all the air out of you. You gasp as she presses her feet hard into you.")

		saynn("[say=announcer]Unbelievable! Avy avoids the loss once again. With a remarkable recovery, she has completely turned the tables on our challenger![/say]")

		saynn("The crowd cheers. Avy stops growling and puts on her mean eyes before leaning down to you to tell you something that only you will hear.")

		saynn("[say=avy]Did you really think you could beat me? You know how many tried? Hah. All of you will always be below me, pathetic.. little.. slaves..[/say]")

		saynn("The crowd starts to yell various things that Avy should do to you. Listening to that.. makes her smile.. and her eyes shine.")

		if (getFlag("FightClubModule.ManagedToWinDruggedAvy")):
			saynn("[say=avy]You think you had me? Not even close. But. You know what. I'm feeling kind today. So I will give you a choice.[/say]")

		else:
			saynn("[say=avy]You know what. I'm feeling kind today. I will give you a choice.[/say]")

		saynn("Avy tilts her head to the side slightly, the corners of her mouth get turned down again, making her look mean. All the while the audience just begs the foxy to breed you.")

		saynn("[say=avy]I can break you. Fast and easy. A few bones there, a few bones there.. Maybe shatter your jaw.. Break the knees.. Just to show what happens when someone tries to cross me.[/say]")

		saynn("Each time you try to move or escape, Avy just puts more strain on your ribs.")

		saynn("[say=avy]Or we can do what the people want and turn you into some real fuckmeat. I promise.. not to be too rough on your ass.. sweetie.[/say]")

		saynn("That's one hell of a kind choice.. Avy still has that drug coursing through her veins which is what makes her unbeatable.")

		addButton("First option", "(Violence) You're not gonna let her fuck you..", "get_broken")
		addButton("Second option", "(Rough sex) You really don't wanna get your bones broken..", "get_fukd")
		addButton("Stay silent", "(Skip) You really don't want either", "get_knockedout")
	if(state == "get_knockedout"):
		saynn("You're not gonna play her games so you just stay completely silent. At some point the crowd begins to boo you two, clearly wishing for some action. The foxy rolls her eyes, quickly getting impatient.")

		saynn("[say=avy]Huh. Too shy to pick, huh? Fine. Have it your way.[/say]")

		saynn("The foxy just knocks you out with one devastating punch, square in the face.")

		saynn("And then there was darkness..")

		addButton("Continue", "Ouch", "got_knocked_out")
	if(state == "get_broken"):
		saynn("[say=pc]Fuck you..[/say]")

		saynn("Avy nods understandable.. And then raises her foot before delivering a series of ruthless stomps, each landing with bone-crushing force. Sounds of your [b]ribs snapping[/b] silenced every other noise in the arena.. but then came your cry of agony, even more ear-piercing..")

		saynn("The broken sharp pieces of your ribs shift inside you, some turning at uncomfortable angles and entering your lung, causing you to start coughing blood.. already.. Seeing that makes Avy stop.")

		saynn("[say=avy]Tshh-h.. We only just started.. you can't die on me already, little thing..[/say]")

		saynn("The crown, torn between morbid fascination and a fast-growing sense of unease, kept watching. Some cover their eyes, unable to witness the brutal display.. while others just can't tear their gaze away, captivated by the raw display of power.")

		saynn("You are in agony, breathing heavily, your eyes unable to focus on anything. Avy slowly crouches before you and catches one of your arms that you try to protect yourself with. She easily puts enough strength to yank it out of its socket and then smashes it against the floor, making something inside [b]crack[/b].. Ow.. Another wave of sharp sensations floods your mind.. making you yell out something incoherent.")

		saynn("[say=avy]So loud..[/say]")

		saynn("Avy seems to take pleasure in your suffering, relishing every whimper and cry that escapes from your tortured lips. She waits for a good moment when your mouth is opened and sinks her sharp claws into your tongue, catching it and leaving deep bleeding wounds.")

		saynn("[say=avy]But if I rip it out.. You wouldn't be able to tell everyone about me.. Sad..[/say]")

		saynn("Avy retracts her claws out of your tongue, letting you taste your own blood spilling inside your mouth. Then she slowly gets up and starts looking at your unharmed limbs.")

		saynn("[say=avy]Leg or arm, people?[/say]")

		saynn("Some sick people yell for her to break both. And some are actually sick, barely holding their breakfast. Avy looks down at you while you are writhing in agony, your broken arm shivering and slowly becoming blue.")

		saynn("[say=avy]I think they want the leg.. And since the arm was a closed fracture..[/say]")

		saynn("Avy suddenly raises her leg and stomps on yours with enough force to [b]break the shin bone[/b] in half and make both parts stick out of the skin. Ow.. This was probably the worst impact yet.. Avy laughs while you are desperately wriggling around on the floor, your voice becoming raspy from screaming so much..")

		saynn("Avy revels in the sadistic pleasure that surges through her as she does this. The sickening cracks of breaking bones bring her joy.")

		saynn("[say=avy]Can't walk anymore, huh? Shame. Look at me, I still can.[/say]")

		saynn("The foxy slowly circles you, her tail swishing behind her. Her eyes still shine brightly.")

		saynn("But despite your broken body.. a flicker of determination still burned.. The pain and despair fueling your rage.. You use the rest of your strength and, with a primal roar, you lash out at her, catching Avy off guard and knocking her back momentarily.")

		saynn("The crowd erupts into a mix of gasps and startled cheers, shocked by your sudden burst of resistance. It was a small moment, a glimpse of hope against the overwhelming odds. But Avy, fueled by her sadistic nature, is only chuckling before rising to her feet.")

		saynn("[say=avy]Oh yeah. I love a good fight. Let's see how much more you have in you.[/say]")

		saynn("She resumes her assault, raining down blow after blow upon your battered form. With calculated cruelty, she focuses on the rest of your limbs, subjecting each one to similar fates. The thuds of fractured bones echo through the arena, creating a horrifying symphony of pain. At some point you start gagging on your blood.. not a good sign..")

		saynn("[say=avy]Hah. I think that was it. I broke {pc.him}. The bitch is probably dying to find out what happens next.[/say]")

		saynn("Everything.. literally everything.. hurts.. Even just breathing is an agonizing experience.. You've lost so much blood that the vision becomes blurry.. unfocussed.. like you're about to pass out.. even the adrenaline pumping through your veins is not enough to keep you awake anymore.. Avy grabs your chin and forces you to look at her.")

		saynn("[say=avy]No-no-no.. Stay with me, whore. I want this to be a good lesson for you. For everyone. To see what happens when they try to do something as stupid as fighting me..[/say]")

		saynn("And with that, she grabs your broken body and effortlessly lifts it high above herself. The crowd's gasps of horror mix with excited cheers. Blood leaks out of your open wounds and Avy is sure to stick her tongue out and catch some of it.")

		saynn("[say=avy]Good night. I won't miss you.[/say]")

		saynn("In one swift, merciless motion, Avy brings you crashing down onto her knee that she raises just in time to shove into your back.. Your spine surely didn't like that.. The sound of impact reverberates through the arena.. A collective wince swept through the crowd, followed by.. silence..")

		saynn("Time seems to slow down.. dragging that moment for what feels like eternity.. And then the rest of it just flashes, you smacking against the floor for the last time before passing out.. Finally.. no more pain..")

		saynn("Only darkness..")

		addButton("Continue", "See if you're alive or not", "got_broken_hard")
	if(state == "get_fukd"):
		playAnimation(StageScene.SexFullNelson, "tease", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]You won't turn me into a fuckmeat..[/say]")

		saynn("Avy tilts her head slightly and puts on a mean smile. Her strong paws suddenly reach out for her uniform and pull her shorts down, exposing the canine member. It's tip is already peeking out of the sheath as Avy gets horny just from the thoughts. The crowd loves the display though and tells the foxy to do it already.")

		saynn("Without a word, Avy leans down to you and effortlessly picks you up, their motions calculated. Your pulse quickens as Avy's arms grabs your legs under your knees and raises them high in a V shape, exposing all your lewd parts to the public. She holds you in a very secure grip with her elbows bent and fingers interlocked behind your neck, forcing you to stare at the crowd while you are completely helpless.")

		saynn("[say=avy]Watch me, slut.[/say]")

		saynn("A mixture of fear and discomfort courses through your veins as you realize that she holds you in a 'full nelson' position. Any attempts to resist are met with her easily overpowering you and forcibly spreading your legs more.")

		saynn("[say=pc]W-wait..[/say]")

		saynn("You can feel.. heat.. radiating from Avy's crotch, her cock has fully left the sheath and is now twitching slightly, leaking precum onto the floor of the arena.")

		if (GM.pc.hasReachableVagina()):
			addButton("Continue", "See what happens next", "fukd_pussy_start")
		else:
			addButton("Continue", "See what happens next", "fukd_anus_start")
	if(state == "fukd_pussy_start"):
		playAnimation(StageScene.SexFullNelson, "sex", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Both of Avy's hands are busy so she just abuses her raw strength, aligning your whole frame with her hard cock before suddenly thrusting inside, forcibly penetrating your dry {pc.pussyStretch} slit and stretching wide before sliding deeper into your depths. Your body tenses up in response to such a powerful display of dominance, a mixture of pain.. and pleasure.. washing over you. The crowd cheers loudly, finally seeing some good action.")

		saynn("[say=pc]Ah-h.. H-hey..[/say]")

		saynn("[say=avy]Moan, whore.[/say]")

		saynn("Avy's grip on your legs remains unyielding, keeping you in this extremely vulnerable position as she rams her cock deeper, relentlessly pounding your cunt, her tip already smashing your cervix and leaving it with her precum.")

		if (GM.pc.isWearningChastityCage()):
			saynn("You may deny the pleasure all you want but your body knows better.. Your locked away cock starts inflating with blood.. but the metal keeps it nicely contained in a small package. The pressure inside is slowly rising though..")

		elif (GM.pc.hasReachablePenis()):
			saynn("You may deny the pleasure all you want but your body knows better.. Your {pc.penis} starts inflating with blood and leaking pre as the shaft bounces up and down from each Avy's thrust.")

		saynn("Muffled cries of pleasure begin to escape from your lips.. it seems Avy is hitting one of your pleasure spots. Her rhythm is steady but primal, little commanding growls can be heard from her..")

		saynn("[say=avy]Louder, let the whole arena hear how big of a slut you are.[/say]")

		saynn("You try to keep resisting but your body keeps betraying you. Your bruised stretched folds slowly become moist and needy.. Each forceful thrust sends waves of ecstasy crashing through you with pain only adding to that mix of sensations. You keep your mouth shut but little noises keep escaping when Avy's cock hits.. that.. spot..")

		saynn("Fuck, you're getting close..")

		addButton("Continue", "See what happens next", "fukd_pussy_faster")
	if(state == "fukd_pussy_faster"):
		playAnimation(StageScene.SexFullNelson, "fast", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Your wet bruised inner walls are kneading that intruding length and Avy feels it. She takes a better position and fastens her pace, increasing the onslaught on your poor stretched pussy.")

		saynn("[say=avy]Cum, bitch.[/say]")

		saynn("You make your best attempt to not let it happen.. but focusing on it.. only made it worse. Loud moans suddenly begin escaping from you. Your whole body shivering before the orgasm starts crashing down over you, waves after waves of weird but pleasurable sensations make your muscles tense up and your pussy squirt all over the arena floor, making the crowd happy. But no matter how hard you are trying to squirm, Avy always has you in a tight grip with her throbbing cock still pounding you hard.")

		if (GM.pc.isWearningChastityCage()):
			saynn("Your own cock shooting small strings of {pc.cum} through the little hole in the chastity cage which looks.. incredibly cute.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your own cock shooting strings of {pc.cum} while Avy is destroying your g-spot spot so much.")

		saynn("You begin to feel the base of Avy's member inflating.. a fat meaty knot appearing.. so big that she can't just slip it inside. But who is gonna stop her from trying..")

		saynn("[say=pc]Ah.. no-.. wai-..[/say]")

		saynn("[say=avy]Shut up and take it.[/say]")

		saynn("More little growls escape from Avy while she uses her full strength, raising you up slightly before forcibly bringing you down onto her dick, the knot slaps against your abused cunt and slowly stretches your petals even wider.")

		saynn("Inch by inch, her knot spreads the folds of your slit more.. until suddenly slipping inside..")

		saynn("Fuck. Full length of Avy's dick is inside.. but she doesn't stop.. instead she yanks it out again before forcing it back inside, knot-fucking your pussy while its loose enough. Almost instantly, you cum again, your whole body trying to struggle but yet again, the foxy overpowers you and makes you take her knot.. again and again.. each thrust causing more wear and tear to your sensitive flesh.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "fight_intro"):
		processTime(60)

	if(_action == "sudden_kait"):
		processTime(2*60)

	if(_action == "start_first_avy_fight"):
		runScene("FightScene", ["avy", "arenafight"], "first_arenafight")
		return

	if(_action == "avy_pitty_breeds_pussy"):
		processTime(3*60)

	if(_action == "avy_pitty_breeds_anus"):
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

	if(_action == "avy_pitty_breed_anus_do"):
		processTime(5*60)
		GM.pc.doWound("avy")

	if(_action == "avy_pitty_breed_anus_faster"):
		processTime(3*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Anus, "avy")
		GM.pc.addPain(20)
		GM.pc.gotAnusFuckedBy("avy")
		GM.pc.orgasmFrom("avy")

	if(_action == "avy_pitty_breed_anus_cum"):
		processTime(3*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Anus, "avy")
		GM.pc.cummedInAnusBy("avy")

	if(_action == "start_second_fight"):
		runScene("FightScene", ["avyArena", "arenafight"], "second_arenafight")
		return

	if(_action == "get_broken"):
		processTime(30*60)
		GM.pc.addPain(1000)
		GM.pc.doWound("avy")
		GM.pc.doWound("avy")
		GM.pc.doWound("avy")

	if(_action == "get_fukd"):
		processTime(5*60)

	if(_action == "got_knocked_out"):
		runScene("CHANGEME")
		endScene()
		return

	if(_action == "got_broken_hard"):
		runScene("CHANGEME")
		endScene()
		return

	if(_action == "fukd_pussy_start"):
		processTime(10*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina, "avy")

	if(_action == "fukd_anus_start"):
		processTime(10*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Anus, "avy")

	if(_action == "fukd_pussy_faster"):
		processTime(3*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina, "avy")
		GM.pc.gotVaginaFuckedBy("avy")
		GM.pc.orgasmFrom("avy")

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

	if(_tag == "second_arenafight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("avy_wins_anyway")
			setFlag("FightClubModule.ManagedToWinDruggedAvy", true)
			addExperienceToPlayer(150)
		else:
			setFlag("FightClubModule.ManagedToWinDruggedAvy", false)
			setState("avy_wins_and_pins")
			addExperienceToPlayer(100)
