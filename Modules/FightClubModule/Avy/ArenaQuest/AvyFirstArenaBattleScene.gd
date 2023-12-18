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

			addButton("Sure", "Let's prove her how wrong she is", "fight_intro")
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
		saynn("Both of Avy's hands are busy so she just abuses her raw strength, aligning your whole frame with her hard cock before suddenly thrusting inside, forcibly penetrating your dry {pc.pussyStretch} slit and stretching it wide before sliding deeper into your depths. Your body tenses up in response to such a powerful display of dominance, a mixture of pain.. and pleasure.. washing over you. The crowd cheers loudly, finally seeing some good action.")

		saynn("[say=pc]Ah-h.. H-hey..[/say]")

		saynn("[say=avy]Moan, whore.[/say]")

		saynn("Avy's grip on your legs remains unyielding, keeping you in this extremely vulnerable position as she rams her cock deeper, relentlessly pounding your cunt, her tip already smashing your cervix and leaving it with her precum.")

		if (GM.pc.isWearingChastityCage()):
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

		if (GM.pc.isWearingChastityCage()):
			saynn("Your own cock shooting small strings of {pc.cum} through the little hole in the chastity cage which looks.. incredibly cute.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your own cock shooting strings of {pc.cum} while Avy is destroying your g-spot so much.")

		saynn("You begin to feel the base of Avy's member inflating.. a fat meaty knot appearing.. so big that she can't just slip it inside. But who is gonna stop her from trying..")

		saynn("[say=pc]Ah.. no-.. wai-..[/say]")

		saynn("[say=avy]Shut up and take it.[/say]")

		saynn("More little growls escape from Avy while she uses her full strength, raising you up slightly before forcibly bringing you down onto her dick, the knot slaps against your abused cunt and slowly stretches your petals even wider.")

		saynn("Inch by inch, her knot spreads the folds of your slit more.. until suddenly slipping inside..")

		saynn("Fuck. Full length of Avy's dick is inside.. but she doesn't stop.. instead she yanks it out again before forcing it back inside, knot-fucking your pussy while its loose enough. Almost instantly, you cum again, your whole body trying to struggle but yet again, the foxy overpowers you and makes you take her knot.. again and again.. each thrust causing more wear and tear to your sensitive flesh.")

		saynn("[say=avy]You're just a fucktoy.[/say]")

		saynn("It's too much, your eyes begin to roll up, your tongue out and drooling, making you look fucked silly. Uncontrollable slutty moans escape from you while Avy is panting warmly into your neck, her cock inflates with even more blood and throbs inside you..")

		addButton("Continue", "See what happens next", "fukd_pussy_cuminside")
	if(state == "fukd_pussy_cuminside"):
		playAnimation(StageScene.SexFullNelson, "inside", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Your inner walls clench around Avy's knotted cock so much that she can't hold back anymore. She establishes complete dominance over you by shoving the knot inside you for the last time and finally letting the orgasm take over, the pointy tip breaking into your womb before releasing Avy's seed directly into it.")

		saynn("The power of Avy's climax echoes through you, her tight grip makes your grip on her shaft even harder. Screams of ecstasy can be heard from you while Avy just casually grunts, emptying her balls inside you and making your belly receive a cute bump.")

		saynn("[say=avy]Stupid fucking bitch.. That's what you get for coming here.[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your g-spot is so destroyed by this point that your caged up dick just slowly drips {pc.cum}, almost non-stop.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your g-spot is so destroyed by this point that your {pc.penis} just slowly drips {pc.cum}, almost non-stop.")

		saynn("The audience cheers loudly, seeing Avy's full throbbing length inside you, knot and all. But for your mind it all becomes a blur at this point, that dick has seriously messed you up, physically and mentally..")

		saynn("[say=pc]..ah-h..[/say]")

		saynn("[say=avy]Think twice before coming back.[/say]")

		saynn("The last thing you remember after Avy forcefully yanking her knot out of you is how the floor of the arena begins to quickly approach you..")

		saynn("Something inside you cracked.. Was it your soul? Or your bones?")

		saynn("And then.. just darkness.. Who cares.")

		addButton("Continue", "Ouch", "got_fuckd_out")
	if(state == "fukd_anus_start"):
		playAnimation(StageScene.SexFullNelson, "sex", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Both of Avy's hands are busy so she just abuses her raw strength, aligning your whole frame with her hard cock before suddenly thrusting inside, forcibly penetrating your dry {pc.anusStretch} anal ring and stretching it wide before sliding deeper into your depths. Your body tenses up in response to such a powerful display of dominance, a mixture of pain.. and pleasure.. washing over you. The crowd cheers loudly, finally seeing some good action.")

		saynn("[say=pc]Ah-h.. H-hey..[/say]")

		saynn("[say=avy]Moan, whore.[/say]")

		saynn("Avy's grip on your legs remains unyielding, keeping you in this extremely vulnerable position as she rams her cock deeper, relentlessly pounding your ass, her tip already reaching extremely far and lubing the inner walls up with her precum. But that's not enough to soften the pain..")

		if (GM.pc.isWearingChastityCage()):
			saynn("You may deny the pleasure all you want but your body knows better.. Your locked away cock starts inflating with blood.. but the metal keeps it nicely contained in a small package. The pressure inside is slowly rising though, the more your prostate gets massaged..")

		elif (GM.pc.hasReachablePenis()):
			saynn("You may deny the pleasure all you want but your body knows better.. Your {pc.penis} starts inflating with blood and leaking pre as the shaft bounces up and down from each Avy's thrust, she massages your prostate so well..")

		saynn("Muffled cries of pleasure begin to escape from your lips.. it seems Avy is hitting one of your pleasure spots. Her rhythm is steady but primal, little commanding growls can be heard from her..")

		saynn("[say=avy]Louder, let the whole arena hear how big of a slut you are.[/say]")

		saynn("You try to keep resisting but your body keeps betraying you. Your bruised stretched tailhole slowly becomes slick and needy.. Each forceful thrust sends waves of ecstasy crashing through you with pain only adding to that mix of sensations. You keep your mouth shut but little noises keep escaping when Avy's cock hits.. that.. spot..")

		saynn("Fuck, you're getting close..")

		addButton("Continue", "See what happens next", "fukd_anus_faster")
	if(state == "fukd_anus_faster"):
		playAnimation(StageScene.SexFullNelson, "fast", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Your wet bruised inner walls are kneading that intruding length and Avy feels it. She takes a better position and fastens her pace, increasing the onslaught on your poor stretched anal ring.")

		saynn("[say=avy]Cum, bitch.[/say]")

		saynn("You make your best attempt to not let it happen.. but focusing on it.. only made it worse. Loud moans suddenly begin escaping from you. Your whole body shivering before the orgasm starts crashing down over you, waves after waves of weird but pleasurable sensations make your muscles tense up and your star visible clench, making the crowd happy. But no matter how hard you are trying to squirm, Avy always has you in a tight grip with her throbbing cock still pounding you hard.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your own cock shooting small strings of {pc.cum} through the little hole in the chastity cage which looks.. incredibly cute.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your own cock shooting strings of {pc.cum} while Avy is destroying your p-spot so much.")

		saynn("You begin to feel the base of Avy's member inflating.. a fat meaty knot appearing.. so big that she can't just slip it inside. But who is gonna stop her from trying..")

		saynn("[say=pc]Ah.. no-.. wai-..[/say]")

		saynn("[say=avy]Shut up and take it.[/say]")

		saynn("More little growls escape from Avy while she uses her full strength, raising you up slightly before forcibly bringing you down onto her dick, the knot slaps against your abused ass and slowly stretches the hole even wider.")

		saynn("Inch by inch, her knot spreads your tailhole more.. until suddenly slipping inside..")

		saynn("Fuck. Full length of Avy's dick is inside.. but she doesn't stop.. instead she yanks it out again before forcing it back inside, knot-fucking your anus while its loose enough. Almost instantly, you cum again, your whole body trying to struggle but yet again, the foxy overpowers you and makes you take her knot.. again and again.. each thrust causing more wear and tear to your sensitive flesh.")

		saynn("[say=avy]You're just a fucktoy.[/say]")

		saynn("It's too much, your eyes begin to roll up, your tongue out and drooling, making you look fucked silly. Uncontrollable slutty moans escape from you while Avy is panting warmly into your neck, her cock inflates with even more blood and throbs inside you..")

		addButton("Continue", "See what happens next", "fukd_anus_cuminside")
	if(state == "fukd_anus_cuminside"):
		playAnimation(StageScene.SexFullNelson, "inside", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Your inner walls clench around Avy's knotted cock so much that she can't hold back anymore. She establishes complete dominance over you by shoving the knot inside you for the last time and finally letting the orgasm take over, the pointy tip reaching deep inside you before releasing Avy's seed, waves upon waves of it..")

		saynn("The power of Avy's climax echoes through you, her tight grip makes your grip on her shaft even harder. Screams of ecstasy can be heard from you while Avy just casually grunts, emptying her balls inside you and making your belly receive a cute bump.")

		saynn("[say=avy]Stupid fucking bitch.. That's what you get for coming here.[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your p-spot is so destroyed by this point that your caged up dick just slowly drips {pc.cum}, almost non-stop.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your p-spot is so destroyed by this point that your {pc.penis} just slowly drips {pc.cum}, almost non-stop.")

		saynn("The audience cheers loudly, seeing Avy's full throbbing length inside you, knot and all. But for your mind it all becomes a blur at this point, that dick has seriously messed you up, physically and mentally..")

		saynn("[say=pc]..ah-h..[/say]")

		saynn("[say=avy]Think twice before coming back.[/say]")

		saynn("The last thing you remember after Avy forcefully yanking her knot out of you is how the floor of the arena begins to quickly approach you..")

		saynn("Something inside you cracked.. Was it your soul? Or your bones?")

		saynn("And then.. just darkness.. Who cares.")

		addButton("Continue", "Ouch", "got_fuckd_out")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "agree_fight"):
		setFlag("FightClubModule.AttemptedAvyFight", true)

	if(_action == "sudden_kait"):
		processTime(2*60)

	if(_action == "fight_intro"):
		processTime(60)

	if(_action == "start_first_avy_fight"):
		runScene("FightScene", ["avy", "arenafight"], "first_arenafight")
		return

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
		setFlag("FightClubModule.GotKnockedOutByAvy", true)
		runScene("WakingUpAfterFirstAvyBattleScene")
		endScene()
		return

	if(_action == "got_broken_hard"):
		setFlag("FightClubModule.GotDestroyedByAvy", true)
		runScene("WakingUpAfterFirstAvyBattleScene")
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

	if(_action == "fukd_pussy_cuminside"):
		processTime(3*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina, "avy")
		GM.pc.gotVaginaFuckedBy("avy")
		GM.pc.orgasmFrom("avy")
		GM.pc.cummedInVaginaBy("avy")

	if(_action == "got_fuckd_out"):
		setFlag("FightClubModule.GotFuckedByAvy", true)
		runScene("WakingUpAfterFirstAvyBattleScene")
		endScene()
		return

	if(_action == "fukd_anus_faster"):
		processTime(3*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Anus, "avy")
		GM.pc.gotAnusFuckedBy("avy")
		GM.pc.orgasmFrom("avy")

	if(_action == "fukd_anus_cuminside"):
		processTime(3*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Anus, "avy")
		GM.pc.gotAnusFuckedBy("avy")
		GM.pc.orgasmFrom("avy")
		GM.pc.cummedInAnusBy("avy")

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "first_arenafight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("avy_uses_drugs")
			addExperienceToPlayer(100)
		else:
			#setState("avy_pitty")
			addExperienceToPlayer(5)
			runScene("AvyArenaPittyFuckScene")
			endScene()

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

func getDevCommentary():
	return "This scene probably contains the most violent parts of the whole game. For now x3. If you choose to get beaten up.. let's just say I tried not to hold back ^^. Am I so fucked up I enjoy writing that? I dunno, it's just interesting to explore these themes, it's just fantasy after all. Games get away with showing gore nowadays, I'm not even being that graphic, is just text.. My whole mind was probably corrupted by reading that rainbow factory fanfic when I was young.. Taking cute characters and doing awful things with them is very powerful, who would've thought..\n\nYou can technically win Avy the second time but you will lose anyways 'in a cutscene'. Why did I do it like that? Time and drama.. I can spend time writing the alternative route where you just give up and leave the arena and then Kait tells you to ask the doctor or whatever.. Or I can make you 'meet' the doctor organically x3. I just needed a reason for you to get beaten up. And a reason to hate Avy. That way making her your bitch will feel better in the future ^^. It's like, you can't enjoy the highs without the lows. You getting destroyed is the low, it will probably make you feel something. Hopefully the payoff will be worth it for you ^^.\n\nGames are like art, they are about making you feel something. They don't have to always be fun, don't have to always be depressing, it's about the balance between the two ^^. Yes, that's how I just justified my laziness and one of the most brutal scenes in the game x3"

func hasDevCommentary():
	return true
