extends SceneBase

var isCaged = false
var isCBT = false
var gotFucked = false
var gotStraponed = false
var didRimming = false
var usedAnsStrapon = false

func _init():
	sceneID = "AvyFinalArenaBattleScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You've been defeated by her.. but you only truly lose when you give up on your dreams.")

		saynn("You know perfectly well that she is not gonna play fair. And you are counting on it.")

		saynn("[say=pc]I'm here to challenge you, Avy. No tricks, no stupid drugs. Just a fair fight to prove who is stronger.[/say]")

		saynn("A mocking giggling escapes from her.")

		saynn("[say=avy]Well, well. So you are back for more, huh. Couldn't get enough last time?[/say]")

		saynn("Her taunting is not working on you. She doesn't know how screwed she is already.. So why ruin that surprise for her?")

		saynn("Avy switches back to her mean expression, slightly tilting her head, her voice becomes dark.")

		saynn("[say=avy]Listen, darling. I'm gonna tell you this once. I. Will. Fuck. You. Up. It's survival of the fittest. And that's clearly me.[/say]")

		saynn("[say=pc]We will see about that.[/say]")

		saynn("Avy raises a brow and puts her notes away, her foxy tail swishing in amusement.")

		saynn("[say=avy]Fine, I will give you what you want. Prepare for another humiliating and painful defeat, fuckmeat wannabe.[/say]")

		saynn("Foxy nods towards the announcer and begins to climb the fence.")

		addButton("Climb fence", "Join Avy in the arena", "in_arena")
	if(state == "in_arena"):
		aimCameraAndSetLocName("fight_arena")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You follow the foxy and climb over the fence before walking towards the familiar spot near the middle. The crowd takes notice and begins to gather around, anticipation hanging in the air.")

		saynn("The smooth voice of the announcer echoes through the space.")

		saynn("[say=announcer]Ladies and gentleman, thiefs, killers and all sorts of other misfits. Welcome to the Underground. Today, it seems, we have a big rematch! Between our grand champion Avy The Unbeatable, and {pc.name}, our resilient challenger![/say]")

		saynn("The crowd cheers for both of you. Probably because they enjoyed the last show and want more.")

		saynn("[say=announcer]Will history repeat itself? Or will the underdog manage to claim {pc.his} revenge?[/say]")

		saynn("Old rusty spotlights illuminate you and Avy. The foxy seems to be.. oozing confidence. The crowd's roars fill the air, showing their anticipation for the fight that is about to happen. Being in the center of attention, you can kinda understand why Avy does this all. It's so.. thrilling.")

		saynn("Time to do this.")

		addButton("Fight", "Time to do this", "start_first_avy_fight")
	if(state == "avy_tries_to_use_drugs"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcAction="defeat"})
		saynn("Avy, unable to continue fighting, collapses onto her knees. The crowd goes loud with people speculating what will happen next.")

		saynn("[say=announcer]It seems our current grand champion got knocked off her feet! Let's see if she can recover fast enough to continue![/say]")

		saynn("You begin to slowly approach her, really taking your time. All the while Avy searches through her uniform for something until she finally finds it, her muscle stimulant syringe.")

		saynn("[say=avy]This is only the beginning, sweetheart.[/say]")

		saynn("A confident smirk shines on her face as she sneakily injects herself with the syringe. She is clearly expecting a huge wave of energy to course through her veins once again. But.. as the seconds ticked by, an unfamiliar sensation began to spread throughout her body instead..")

		saynn("Avy tries to get up but a wave of heat suddenly washes over her, making her gasp and collapse yet again. Her cheeks turn red, you can just.. tell.. that her heart is racing right now. A sneaky gaze might notice the bulge in Avy's shorts getting big fast.")

		saynn("[say=avy]What.. What is happening to me!?.. What is this shit?[/say]")

		saynn("Her limbs get weak, the syringe shatters as she drops it. Avy's body is shivering, little moans of embarrassment begin to escape from her, field by an inexplicable desire. The aphrodisiac is clearly in her bloodstream, overwhelming her with an overpowering lust.")

		saynn("You approach the moaning foxy and get a good grip on her hair. You can see.. fear and panic in her eyes.. mixed with passionate desire.")

		saynn("[say=pc]Indeed. This is only the beginning.[/say]")

		saynn("[say=avy]B-bitch!.. It's you! You did it! You fucker, I will claw your eyes out!..[/say]")

		saynn("Despite your grip, Avy lashes out at you, desperate to win.")

		addButton("Pin her", "Show her who is the bitch here", "pin_avy")
	if(state == "pin_avy"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="avy"})
		saynn("But since Avy is even more weak than usual, you easily yank on her hair and then pin her bruised frame into the floor of the arena. A painful cry escapes from her as she assumes a horizontal position. The crowd goes wild, people can't believe their eyes.")

		saynn("Despite the hair pulling and your leg pressed into her stomach, bringing her lots of discomfort, Avy's shorts are still bulging, the foxy is looking oh so needy. It seems the drug only keeps making her more lusty and less willing to fight.")

		saynn("[say=announcer]Huh. I think it's safe to assume that.. our arena has a new Grand Champion![/say]")

		saynn("The confusion between the people fades, replaced with excitement. Everyone is cheering for you while the ex grand champion foxy is squirming under your leg. You spread your arms wide and welcome it.")

		saynn("[say=announcer]{pc.name}! You have proven to everyone that you are worthy of this title! I think you deserve this.[/say]")

		saynn("Announcer produces some fancy ring from his pocket and throws it to you.")

		saynn("[say=announcer]A little token that will remind you of your long journey. Ladies and gentlemen, let's all welcome the new Grand Champion![/say]")

		saynn("The crowd explodes again, you can hear cheering from all sides. Feels so good.. But you also hear Avy's lusty grumblings. You direct your attention towards her.")

		saynn("[say=avy]D-don't you dare touch m-me.. If you dare to undress me.. stroke my hard leaking c-cock.. abuse my needy hole.. I will d-destroy you!.. please.. fuck..[/say]")

		saynn("[say=announcer]I think Avy The Unbeatable is craving to serve hungry inmates in the slutwall.[/say]")

		saynn("[say=avy]N-no!..[/say]")

		saynn("Avy moans quietly and tries to hump the air, it seems the drug's effect is at its peak.")

		if (!GM.pc.hasReachablePenis()):
			saynn("[say=announcer]But you can do anything you want with her now. Those are the rules! I can lend you a strapon just for this special occasion if you need one, baby.[/say]")

		else:
			saynn("[say=announcer]But you can do anything you want with her now. Those are the rules![/say]")

		saynn("You lean down and forcibly strip the foxy, revealing her pulsating canine cock, even the knot near the base is inflated with blood, showing how aroused Avy is.")

		saynn("Time to decide what you will do with the loser..")

		addButton("Continue", "See what happens next", "choose_punish")
	if(state == "choose_punish"):
		addCharacter("avy", ["naked"])
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="avy", npcBodyState={naked=true, caged=isCaged}})
		saynn("You can do everything or nothing, it's your choice.")

		if (isCaged):
			saynn("Avy's throbbing cock is locked behind a sturdy metal cage, causing only the tip of her shaft to be peaking out of her sheath. The cage makes Avy even more desperate.")

		else:
			saynn("Avy's throbbing cock is free and leaking precum, begging for something to happen with it.")

		if (isCBT):
			saynn("Avy's balls are throbbing after receiving so many kicks.")

		if (gotFucked):
			saynn("Avy's used asshole is leaking your seed.")

		elif (gotStraponed):
			saynn("Avy's asshole is gaping wide, struggling to close.")

		if (didRimming):
			saynn("Avy looks extremely humiliated after having to lick your asshole in front of everyone.")

		saynn("What do you wanna do with Avy now?")

		if (isCaged):
			addDisabledButton("Chastity cage", "Avy is already wearing chastity")
		else:
			addButton("Chastity cage", "Lock Avy's cock because she doesn't need it to be a fucktoy", "add_chastity_cage")
		if (isCBT):
			addDisabledButton("Kick balls", "Avy's balls already got kicked")
		else:
			addButton("Kick balls", "Kick Avy's balls for everything she did", "do_kick_balls")
		if (gotFucked || gotStraponed):
			addDisabledButton("Anal!", "Avy already got fucked")
			addDisabledButton("Strapon anal!", "Avy already got fucked")
		else:
			addButtonWithChecks("Anal!", "Fuck Avy in the ass", "do_anal", [], [ButtonChecks.HasReachablePenis])
			addButtonWithChecks("Strapon anal!", "Peg Avy", "pick_strapon", [], [ButtonChecks.CanWearStrapon])
		if (didRimming):
			addDisabledButton("Rimming", "Avy already tasted your ass")
		else:
			addButton("Rimming", "Humiliate Avy by making her rim your ass", "force_rim")
		addButton("Done", "You humiliated Avy enough. Time to shove her into the slutwall", "start_slutwall")
	if(state == "add_chastity_cage"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="avy", npcBodyState={naked=true, caged=isCaged}})
		saynn("Seeing that throbbing cock makes you very eager to do something about it. You look up at the announcer.")

		saynn("[say=pc]Hey. Do you have a chastity cage by any chance?[/say]")

		saynn("The bald guy chuckles, his radio voice smooth.")

		saynn("[say=announcer]Of course, baby. Here is one, free of charge. Catch.[/say]")

		saynn("He throws you a little pink one and you catch it. Avy sees that and tries to remove your foot off her chest, growling desperately.")

		saynn("[say=avy]No.. no!.. Why are you helping {pc.him}![/say]")

		saynn("He points down at the pinned naked foxy.")

		saynn("[say=announcer]Big ego leads to big problems, baby. Sometimes you gotta get it trimmed.[/say]")

		saynn("Since Avy doesn't like your foot so much you shove your entire knee into her chest, basically sitting on her. You take the ring of the cage and try to put it on Avy's canine cock. All the precum acts like lube, making it easy.. except for the knot. As you start to apply more and more pressure onto that fat orb, forcing blood out of it, Avy can't help but to arch her back and moan loudly, it feels like her cock is about to burst.")

		saynn("[say=pc]If you cum right now I swear I will break the key.[/say]")

		saynn("[say=avy]Nghh-h-h.. fu-u-uck..[/say]")

		saynn("Finally, the knot gets squeezed enough to suddenly slip through the cock ring, meaning it's now stuck there, pressed against the sheath. But you're not done yet..")

		saynn("You take the main piece of the cage and press it against the pointy head of Avy's cock before proceeding to battle her erection. The more you press on that slut's dick, the more precum leaks out of it. The crowd loves seeing this.. but Avy is obviously not amused.")

		saynn("[say=avy]D-don't, please!..[/say]")

		saynn("[say=pc]You don't need your dick to pleasure all the other ones, bitch.[/say]")

		saynn("Your fingers work diligently, forcing Avy's member to retreat into its canine sheath before finally locking it with a key, the final click echoes through the whole arena, announcing that Avy is now officially a buttslut.")

		saynn("You get up and let the foxy look at her caged up sheath where only the tip of her cock is visibly peeking out of it. You can see desperation in her eyes, knowing that she can only cum one way now..")

		addButton("Continue", "See what happens next", "choose_punish")
	if(state == "do_kick_balls"):
		playAnimation(StageScene.SexFeetPlay, "crotch", {pc="pc", npc="avy", npcBodyState={naked=true, caged=isCaged}})
		saynn("Seeing how much pleasure drugged up Avy seems to be experiencing right now.. even if she can't get her release without your help.. it makes you wanna add a little contrasting sensation to that mix.")

		saynn("[say=pc]This is for all the pain that you caused.[/say]")

		saynn("[say=avy]..what are you.. Wait, NO![/say]")

		saynn("With a slow, deliberate movement, you raise your leg and then perform a well-aimed kick towards Avy's vulnerable balls.")

		saynn("The impact reverberates through the arena, and a sharp pain suddenly courses through Avy's body, making her cry out in pain and gasp, feeling the sting."+str(" The chastity cage, designed to lock the cock away, offers absolutely no protection for her exposed testicles." if isCaged else "")+" A big 'Ooh' wave washed over the crowd, it's like not just Avy felt that impact.")

		saynn("[say=avy]UGH-h!.. Kgh.. Fuck..[/say]")

		saynn("Avy grabs onto her balls and tries to endure the pain. Strangely enough, you saw her dick shooting out a string of precum right after your kick. You need to do it again.")

		saynn("[say=pc]Paws off.[/say]")

		saynn("[say=avy]N-no!..[/say]")

		saynn("Fine. With careful precision, you deliver another firm kick on the vulnerable testicles through Avy's paws, causing her body to tense up again and start to tremble, a loud cry escapes from her yet again. It's probably very humiliating to be hit in your nuts in front of all the people that thought you're unbeatable. But Avy is busy writhing and rolling around on the floor.")

		saynn("[say=avy]F-fu-uck..[/say]")

		saynn("Without even giving her much time to recover, you kick her again.. and again.. at some point her paws start to hurt too so she pulls them away, letting you stomp on her vulnerable beaten up balls.")

		saynn("Avy is shaking, unable to endure the pain and also unable to stop you. The pleasure that she feels from the drug is still there.. amplified by this.. agony. For some reason you notice her painful cries also being kinda.. lusty.")

		saynn("[say=pc]Painslut. Don't tell me you're into ballbusting now.[/say]")

		saynn("[say=avy]Kgh-h.. h-h.. ah.. fuck me-e-e..[/say]")

		saynn("By the end of this torture session, Avy's balls look bruised and inflamed, and also dirty from all the stomping.")

		addButton("Continue", "See what happens next", "choose_punish")
	if(state == "do_anal"):
		playAnimation(StageScene.SexFullNelson, "tease", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=isCaged}})
		saynn("Time to teach that fox a real lesson. With a mischievous smile, you take your foot off of her chest and instead put your hands under her thighs before skillfully lifting her frame. After that, your arms slide under her knees and pin her legs against your shoulders while your hands run end up behind her head, fingers interlocking into a secure firm hold.")

		saynn("[say=avy]H-hey! Put me down!.. No..[/say]")

		saynn("This position allows you to assert full control over that slut. You realize that she doesn't even weigh that much when she is not drugged up on her muscle stimulants. The audience can see everything, her "+str("caged up throbbing cock" if isCaged else "throbbing canine cock")+", her "+str("her bruised ballsack" if isCBT else "her tingling ballsack")+" and also a cute tight-looking asshole that's hiding behind, clenching in fear. The slut is missing a cunt for you to be able to properly breed her but that's fine, no one stops you from trying anyway.")

		saynn("[say=avy]What are you..[/say]")

		saynn("[say=pc]What do you think, whore.[/say]")

		saynn("You lower Avy slightly, letting her tight pucker feel your {pc.penis} prodding it. And wow, it's like her tailhole is radiating heat. The crowd already seems to be begging you to put it in.")

		saynn("[say=avy]No.. don't put it in..[/say]")

		saynn("Avy is saying it kinda quietly. She understands that either this happens or she is not cumming today, her drug messing with her mind. The foxy is completely helpless with her legs lifted and her head forced to look at the audience.")

		addButton("Fuck her", "Pound that ass in front of everyone", "do_anal_start")
	if(state == "do_anal_start"):
		playAnimation(StageScene.SexFullNelson, "sex", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=isCaged}})
		saynn("With Avy's legs forming such a seductive V shape, offering you full access to her needy fuckhole.. how could you not?")

		saynn("With calculated precision, you lower Avy onto your {pc.penis}, letting your hard shaft penetrate her tight star and start stretching her insides. Avy gasps as you roughly thrust inside her, there is no lube on your cock but that asshole seems to be getting wet already, just from the foxy being aroused. Still, her untrained inner walls receive some good bruises.")

		saynn("[say=avy]F-fu-uck..[/say]")

		saynn("[say=pc]Did anyone even fuck you before?[/say]")

		saynn("[say=avy]F-fuck you..[/say]")

		saynn("A few little cute moans escape from the drugged up buttslut. But after a few rough thrusts, suddenly, you stop, just letting your member be inside her. You can feel her trying to squirm, her asshole already clenching around your cock."+str(" Her own cock is putting lots of pressure on that cage while you are pressing on her p-spot" if isCaged else " Her own cock is rock hard, leaking pre while you are pressing on her p-spot")+"")

		saynn("[say=avy]H-hey..[/say]")

		saynn("[say=pc]Admit that you're a buttslut.[/say]")

		saynn("[say=avy]N-no..[/say]")

		saynn("[say=pc]I will stop then.[/say]")

		saynn("As you start to pull out of Avy, she whines softly.")

		saynn("[say=avy]I'm a buttslut!.. Fuck you.. This is all because of the drug..[/say]")

		saynn("Sure, of course it is. Moans of pleasure fill the arena as you continue pounding her ass, establishing a steady rhythm, this full nelson position allowing you to penetrate Avy extremely deeply while also making her feel subby.")

		addButton("Harder", "Let that slut feel it", "do_anal_faster")
	if(state == "do_anal_faster"):
		playAnimation(StageScene.SexFullNelson, "fast", {pc="pc", npc="avy", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=isCaged}})
		saynn("That asshole feels incredibly tight, gripping your cock in all the right ways. And you stuffed enough precum into Avy already, meaning you can freely abuse that little fuckhole for your pleasure without holding back.")

		saynn("[say=avy]Ah.. T-this is too much.. S-slow down?.. Nghh-h..[/say]")

		saynn("She needs to work on her begging because you're not planning to stop now.")

		if (isCaged):
			saynn("Avy's caged up cock is bouncing up and down each time you bring her down onto your member. You're constantly smashing her prostate to the point of it becoming swollen and firm. Being fucked with that chastity cage on Avy looks incredibly submissive.. She fell so low so quickly..")

			saynn("[say=avy]F-fu-u-uck..[/say]")

			saynn("Foxy got a little quiet for a second. But then, suddenly, her asshole started clenching hard on your shaft while her canine cock is shooting weak strings of cum from the little hole in the metal cage. Her eyes roll up and her tongue rolls out while her body tries to squirm and bend but you're not letting her, you just keep pounding that slutty star, extending her hands-free orgasm and grunting from the sensation that it provides.")

		else:
			saynn("Avy's free cock is bouncing up and down each time you bring her down onto your member. She didn't get soft at any moment, probably because you're constantly smashing her prostate to the point of it becoming swollen and firm. Being fucked raw like that, Avy looks incredibly submissive.. She fell so low so quickly..")

			saynn("[say=avy]F-fu-u-uck..[/say]")

			saynn("Foxy got a little quiet for a second. But then, suddenly, her asshole started clenching hard on your shaft while her canine cock is shooting strings of cum all over the floor. Her eyes roll up and her tongue rolls out while her body tries to squirm and bend but you're not letting her, you just keep pounding that slutty star, extending her hands-free orgasm and grunting from the sensation that it provides.")

		saynn("[say=pc]What a.. buttslut..[/say]")

		saynn("The bitch is cumming on you, entertaining the crowd and trying to milk your cock. And it works, your own climax starts approaching you too..")

		addButton("Cum inside", "There is no other choice", "do_anal_cum")
	if(state == "do_anal_cum"):
		playAnimation(StageScene.SexAllFours, "insideflop", {npc="avy", pc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=isCaged}})
		saynn("With a final thrust, you shove your member deep down that hungry hole before the orgasm overwhelms you as well. Your {pc.penis} starts throbbing and coating those soft sensitive walls with a layer of your sticky hot seed.")

		saynn("Avy lets out another moan of pleasure, her toes curl while her dick wastes another load, the buttslut is clenching so hard, your legs are shaking. The crowd loves it though, everyone is cheering for you.")

		saynn("[say=pc]Just a breeding toy..[/say]")

		saynn("[say=avy]Nghhh-h-h ah.. h-h.. fu..[/say]")

		saynn("As your body begins to come down from this euphoric high, you quickly pull your cock out of that used hole and just drop the foxy onto the cold floor, her gaping leaking ass is visible to anyone. She tries to close it by clenching but only ends up creating a little fountain of {pc.cum} out of her ass, lewd.")

		saynn("[say=avy]Arg..h-h.. fu-u..h-h..[/say]")

		saynn("She seems to be still with you. Good.")

		addButton("Continue", "See what happens next", "choose_punish")
	if(state == "pick_strapon"):
		saynn("Pick what strapon you wanna use.")

		addButton("Offered strapon", "Use the strapon that the announcer has offered to you", "use_offered_strapon")
		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "do_anal_strapon_pick")
	if(state == "do_anal_strapon_pick"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="avy", npcBodyState={naked=true, caged=isCaged}, bodyState={naked=true}})
		saynn("You produce one of your special strapons and secure it tightly around your waist. Avy is already shivering, just from the sight.")

		addButton("Continue", "See what happens next", "do_anal_strapon")
	if(state == "use_offered_strapon"):
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="avy", npcBodyState={naked=true, caged=isCaged}, bodyState={naked=true}})
		saynn("You decide to ask the announcer for a strapon and he throws you one. Ohh, this one seems to be of a canine type. Perfect. You secure it tightly around your waist. Avy is already shivering, just from the sight.")

		addButton("Continue", "See what happens next", "do_anal_strapon")
	if(state == "do_anal_strapon"):
		playAnimation(StageScene.SexFullNelson, "tease", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=isCaged}})
		saynn("Time to teach that fox a real lesson. With a mischievous smile, you take your foot off of her chest and instead put your hands under her thighs before skillfully lifting her frame. After that, your arms slide under her knees and pin her legs against your shoulders while your hands run end up behind her head, fingers interlocking into a secure firm hold.")

		saynn("[say=avy]H-hey! Put me down!.. No..[/say]")

		saynn("This position allows you to assert full control over that slut. You realize that she doesn't even weigh that much when she is not drugged up on her muscle stimulants. The audience can see everything, her "+str("caged up throbbing cock" if isCaged else "throbbing canine cock")+", her "+str("her bruised ballsack" if isCBT else "her tingling ballsack")+" and also a cute tight-looking asshole that's hiding behind, clenching in fear. You can't really properly breed her but that's fine, no one stops you from trying anyway.")

		saynn("[say=avy]What are you..[/say]")

		saynn("[say=pc]What do you think, whore.[/say]")

		saynn("You lower Avy slightly, letting her tight pucker feel your strapon prodding it. And wow, it's like her tailhole is radiating heat. The crowd already seems to be begging you to put it in.")

		saynn("[say=avy]No.. don't put it in..[/say]")

		saynn("Avy is saying it kinda quietly. She understands that either this happens or she is not cumming today, her drug messing with her mind. The foxy is completely helpless with her legs lifted and her head forced to look at the audience.")

		addButton("Fuck her", "Pound that ass in front of everyone", "do_anal_strapon_start")
	if(state == "do_anal_strapon_start"):
		playAnimation(StageScene.SexFullNelson, "sex", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=isCaged}})
		saynn("With Avy's legs forming such a seductive V shape, offering you full access to her needy fuckhole.. how could you not?")

		saynn("With calculated precision, you lower Avy onto your rubber cock, letting your shiny shaft penetrate her tight star and start stretching her insides. Avy gasps as you roughly thrust inside her, there is no lube on your toy but that asshole seems to be getting wet already, just from the foxy being aroused. Still, her untrained inner walls receive some good bruises.")

		saynn("[say=avy]F-fu-uck..[/say]")

		saynn("You don't get much stimulation since it's just a strapon.. But you do feel the friction between it and Avy's almost virgin-like asshole.")

		saynn("[say=pc]Did anyone even fuck you before?[/say]")

		saynn("[say=avy]F-fuck you..[/say]")

		saynn("A few little cute moans escape from the drugged up buttslut. But after a few rough thrusts, suddenly, you stop, just letting your rubber member be inside her. You can feel her trying to squirm, her asshole already clenching around your strapon."+str(" Her cock is putting lots of pressure on that cage while you are pressing on her p-spot" if isCaged else " Her cock is rock hard, leaking pre while you are pressing on her p-spot")+"")

		saynn("[say=avy]H-hey..[/say]")

		saynn("[say=pc]Admit that you're a buttslut.[/say]")

		saynn("[say=avy]N-no..[/say]")

		saynn("[say=pc]I will stop then.[/say]")

		saynn("As you start to pull out of Avy, she whines softly.")

		saynn("[say=avy]I'm a buttslut!.. Fuck you.. This is all because of the drug..[/say]")

		saynn("Sure, of course it is. Moans of pleasure fill the arena as you continue pounding her ass, establishing a steady rhythm, this full nelson position allowing you to penetrate Avy extremely deeply while also making her feel subby.")

		addButton("Harder", "Let that slut feel it", "do_anal_strapon_faster")
	if(state == "do_anal_strapon_faster"):
		playAnimation(StageScene.SexFullNelson, "fast", {pc="pc", npc="avy", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=isCaged}})
		saynn("That asshole feels incredibly tight, gripping your fake rubber cock in all the right ways. And Avy's inner walls seem to be quite slick now, meaning you can freely abuse that little fuckhole for your enjoyment without holding back.")

		saynn("[say=avy]Ah.. T-this is too much.. S-slow down?.. Nghh-h..[/say]")

		saynn("She needs to work on her begging because you're not planning to stop now.")

		if (isCaged):
			saynn("Avy's caged up cock is bouncing up and down each time you bring her down onto your rubber member. You're constantly smashing her prostate to the point of it becoming swollen and firm. Being fucked with that chastity cage on Avy looks incredibly submissive.. She fell so low so quickly..")

			saynn("[say=avy]F-fu-u-uck..[/say]")

			saynn("Foxy got a little quiet for a second. But then, suddenly, her asshole started clenching hard on your strapon while her canine cock is shooting weak strings of cum from the little hole in the metal cage. Her eyes roll up and her tongue rolls out while her body tries to squirm and bend but you're not letting her, you just keep pounding that slutty star, extending her hands-free orgasm and grunting from the sensation that it provides.")

		else:
			saynn("Avy's free cock is bouncing up and down each time you bring her down onto your rubber member. She didn't get soft at any moment, probably because you're constantly smashing her prostate to the point of it becoming swollen and firm. Being fucked raw like that, Avy looks incredibly submissive.. She fell so low so quickly..")

			saynn("[say=avy]F-fu-u-uck..[/say]")

			saynn("Foxy got a little quiet for a second. But then, suddenly, her asshole started clenching hard on your strapon while her canine cock is shooting strings of cum all over the floor. Her eyes roll up and her tongue rolls out while her body tries to squirm and bend but you're not letting her, you just keep pounding that slutty star, extending her hands-free orgasm and grunting from the sensation that it provides.")

		saynn("[say=pc]What a.. buttslut..[/say]")

		saynn("The bitch is cumming on you, entertaining the crowd and trying to milk your strapon. Such a good girl she is.")

		addButton("Drop her", "Be a little rough with her", "do_anal_strapon_cum")
	if(state == "do_anal_strapon_cum"):
		playAnimation(StageScene.SexAllFours, "teaseflop", {npc="avy", pc="pc", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true, caged=isCaged}})
		saynn("With a final thrust, you shove your strapon deep down that hungry hole for the last time, massaging Avy's prostate. And sure enough, she lets out another moan of pleasure, her toes curl while her dick wastes another load, the buttslut is clenching so hard, her legs are shaking. The crowd loves it though, everyone is cheering for you.")

		saynn("[say=pc]Just a breeding toy..[/say]")

		saynn("[say=avy]Nghhh-h-h ah.. h-h.. fu..[/say]")

		saynn("As her body begins to come down from this euphoric high, you quickly pull your strapon out of that used hole and just drop the foxy onto the cold floor, her gaping ass is visible to anyone. She tries to close it by clenching but fails spectacularly.")

		saynn("[say=avy]Arg..h-h.. fu-u..h-h..[/say]")

		saynn("She seems to be still with you. Good.")

		addButton("Continue", "See what happens next", "remove_strapon_and_choose")
	if(state == "force_rim"):
		playAnimation(StageScene.SexRimming, "tease", {npc="avy", npcBodyState={naked=true, hard=true, caged=isCaged}, bodyState={naked=true}})
		saynn("A great idea comes into your mind about how you can humiliate this foxy in front of everyone. You lift your leg from Avy's chest and put on a mean face. Avy is breathing heavily, the drug clouding her mind.")

		saynn("[say=pc]On your knees.[/say]")

		saynn("[say=avy]N-no.. f-fuck off..[/say]")

		saynn("[say=pc]Get up before I stomp on your balls."+str(". again.." if isCBT else "")+"[/say]")

		saynn("Avy's eyes widen as she changes her mind and slowly gets up to her knees, her posture is quite submissive.")

		saynn("With a few measured steps, you turn around and spread your legs wider before bending forward slightly, presenting Avy one of your most intimate areas, your {pc.analStretch} tailhole. Avy instantly tries to pull away but you get a good grasp on her long hair, preventing the foxy from escaping.")

		saynn("[say=avy]The fuck are you-.. Argh![/say]")

		saynn("[say=pc]No. You're gonna eat me out. Hear me?[/say]")

		saynn("[say=avy]I'm not licking your asshole, you s-stupid bitch!..[/say]")

		saynn("And so the fight begins, you pulling on Avy's hair, making her hiss and whine while she does her best to try and avoid your {pc.masc} butt, holding onto your legs..")

		saynn("[say=avy]Argh-h-h..[/say]")

		saynn("Slowly but surely, Avy is losing, you can feel your digits pulling her hair out, one hair at a time. The crowd cheers you to break that fox.")

		saynn("[say=pc]I don't care if you end up bald, bitch. Worst case I just sit on you. And then you will have no options but to be my asslicker.[/say]")

		saynn("Avy's eyes become very round, she huffs and whines loudly while the drug keeps her perpetually horny. After some quick thinking, she stops resisting and lets you bring her muzzle to your ass. Her warm breathing is making you clench, it's so arousing..")

		saynn("[say=pc]Lick~[/say]")

		saynn("Avy inches even closer to your waiting entrance. Slowly, with little eagerness but a lot of embarrassment, the foxy pokes her tongue out and begins teasing the outer edges of your {pc.analStretch} anus, exploring the contours while you clench more and help her by spreading your buttcheeks.")

		addButton("Continue", "See what happens next", "avy_likes_rimming")
	if(state == "avy_likes_rimming"):
		playAnimation(StageScene.SexRimming, "fast", {npc="avy", npcBodyState={naked=true, hard=true, caged=isCaged}, bodyState={naked=true, hard=true}})
		saynn("Some of the crowd laughs, seeing Avy finally succumb to your dominance. Who was once an unbeatable grand champion is now kneeling before the person who defeated them and is even licking their asshole. But Avy doesn't care, she just closes her eyes and slowly traces her tongue over your star, coating it with her saliva.")

		if (isCaged):
			saynn("You notice one of Avy's paws landing on her chastity cage and trying to pull on it or somehow stimulate the soft cock that's under it. You chuckle seeing that, it seems putting a cage on her was the right decision.")

		else:
			saynn("You notice one of Avy's paws landing on her knotted canine cock and sneakily stroking her length. It seems someone is getting into this a little too much.")

			saynn("[say=pc]Paws off your cock, Avy.[/say]")

			saynn("[say=avy]But..[/say]")

			saynn("You growl and the foxy listens, pulling her paw away from her throbbing member. You can hear more whining coming from her.")

		saynn("[say=pc]Good girl. But I know you can do better than that.[/say]")

		saynn("Avy sighs and gathers her courage before prodding your tailhole with her tongue, testing how easy it is to penetrate. A few more prods and Avy manages to thrust her tongue inside your tight and quivering hole. This sends shivers of pleasure through your body, a little moan escapes from you as you revel in this newly-found.. power.. over Avy.")

		saynn("You don't even have to encourage her anymore, the foxy is willingly prodding her tongue deeper, exploring your soft inner walls and coating them with her saliva. With every flick and swirl, she sends you waves of pleasurable sensations. Some of the crowd loves it, some are just chuckling, some prefer to look the other way.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Foxy is reaching so deep that she easily finds your prostate and begins massaging it with her tongue, making you leak precum through that chastity cage of yours.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Foxy is reaching so deep that she easily finds your prostate and begins massaging it with her tongue, making you get hard and leak precum.")

		saynn("[say=pc]Be a good girl and suck on it too, Avy.[/say]")

		saynn("You realize that you're not that far from your edge, all the stimulation and the passion that Avy puts into this brings you closer and closer..")

		addButton("Continue", "See what happens next", "rim_even_better")
	if(state == "rim_even_better"):
		playAnimation(StageScene.SexRimming, "sex", {npc="avy", pcCum=true, npcBodyState={naked=true, hard=true, caged=isCaged}, bodyState={naked=true, hard=true}})
		saynn("Avy hears your command and slows down, instead using her lips to form a tight seal around your sensitive anus flesh and applying suction and pressure to make you feel good. Her tongue is still delving deep inside you, probing the walls of your anal star, teasing and stimulating with careful motions. This mix of sensations makes you tremble with desire, who knew this foxy could be this good at rimming.")

		saynn("[say=pc]F-faster..[/say]")

		saynn("Moans escape from you while Avy thrusts her tongue inside your {pc.analStretch} asshole faster, her lips exploring every inch of your sensitive entrance. Very soon your legs begin to shake and your tailhole clenches but the foxy is gripping your butt tightly while hammering away at your pleasure spots.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your prostate is so swollen it's hard to miss it now. Avy feels you cumming and just keeps milking it, causing your locked dick to start dripping {pc.cum} from its cage. Hands-free orgasms aren't as powerful but they sure make your legs want to give up, your mind is extremely hazy from the sheer amount of pleasure..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your prostate is so swollen it's hard to miss it now. Avy feels you cumming and just keeps milking it, causing your {pc.penis} to start dripping {pc.cum} at a steady rate. Hands-free orgasms aren't as powerful but they sure make your legs want to give up, your mind is extremely hazy from the sheer amount of pleasure..")

		elif (GM.pc.hasReachableVagina()):
			saynn("Your neglected dripping pussy is suddenly pulsating, muscles visibly contracting and releasing while Avy manages to knead your g-spot through the inner wall enough for you to cum.")

		saynn("As your orgasm starts to fade, Avy pulls away and tries to hide her aroused face.")

		saynn("[say=pc]Good little asslicker.[/say]")

		saynn("[say=avy]F-fuck you..[/say]")

		saynn("Huh, it seems she still has some fight in her. So you just forcibly pin her to the floor yet again.")

		saynn("[say=pc]Wrong answer.[/say]")

		addButton("Continue", "See what happens next", "choose_punish")
	if(state == "start_slutwall"):
		setFlag("FightClubModule.AvyGotCaged", isCaged)
		setFlag("FightClubModule.AvyIsInSlutwall", true)
		setFlag("FightClubModule.AvySlutWallBroken", 0.0)
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcBodyState={naked=true, hard=true, caged=isCaged}})
		aimCameraAndSetLocName("fight_neararena")
		saynn("You think that Avy has suffered enough. You move your leg off of her and offer her a hand to help her get up.")

		saynn("[say=avy]W-wha?..[/say]")

		saynn("[say=pc]What? You thought I was gonna kill you?[/say]")

		saynn("Panting naked Avy huffs but still uses your help gladly.")

		saynn("[say=avy]No, but..[/say]")

		saynn("[say=pc]You're free to climb the fence Avy, I won't hurt you.[/say]")

		saynn("Avy squints, trying to figure out if there is a catch. But then she just quickly grabs her uniform and begins climbing over the fence.")

		saynn("At the same.. the audience.. clearly horny.. begins to collectively say something. Two words. 'Slut'. 'Wall'. Many times, slowly getting louder and louder. 'Slut'. 'Wall'. 'Slut'. 'Wall'. 'Slut!'. 'Wall!'.")

		saynn("[say=announcer]It seems our new grand champion has decided to let Avy go. But the crowd is not yet satisfied! Ladies and gentlemen, try not to break our arena keeper too much![/say]")

		saynn("Huh. Avy hears that and starts panicking. But it's too late, her arms get grabbed by the many hungry inmates, her uniform stolen from her yet again.")

		saynn("[say=avy]No! Y-You fuckers! Stop it! ARGH![/say]")

		saynn("Her weak punches keep a few horny people away. But then someone strong enough wrenches her arms behind her back and starts pulling her towards the slutwall..")

		saynn("Huh, interesting. You climb over the fence and decide to follow.")

		addButton("Follow", "See where they bring her", "avy_in_slutwall")
	if(state == "avy_in_slutwall"):
		aimCameraAndSetLocName("fight_slutwall")
		GM.pc.setLocation("fight_slutwall")
		playAnimation(StageScene.Slutwall, "idle", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}})
		saynn("The crowd brings Avy to one of the corners of this big space that is clearly some abandoned maintenance room. This particular corner is special though, one of the walls got holes in them. Above it is a make-shift plate claiming that this is a 'slutwall'. Huh.")

		saynn("[say=avy]No, fuck you!.. Fuck all of you!..[/say]")

		saynn("Avy is still trying to fight it. But she can't do anything against an entire horny crowd of inmates, they easily overpower her and shove her into one of the big holes, positioning her in such a way that only her dick, ass, thighs, hands and feet are exposed through the carefully crafted openings.")

		saynn("[say=avy]I will kill all of you fuckers!..[/say]")

		saynn("She is kicking anyone who tries to get near. But then someone catches her leg and twists it painfully, making the foxy cry out from the pain. That allows others to get close and secure her firmly in place with some chains and restraints. Each click is making Avy more and more helpless until.. there is nothing she can do anymore, her tight pucker, her "+str("caged up cock" if isCaged else "hard canine cock")+", are all on display.")

		saynn("Someone finds a piece of cardboard and quickly scribbles 'Avy The Fallen Hero' on it before hanging it just above Avy's ass. Then someone also adds a note saying 'Anal - FREE, condoms not allowed, break the bitch!' near. Beautiful.")

		saynn("You wonder if you should get in the queue..")

		addButton("Continue", "See what happens next", "endthescene")
func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "do_anal_strapon_pick", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_arena"):
		processTime(2*60)

	if(_action == "start_first_avy_fight"):
		runScene("FightScene", ["avy", "arenafight"], "final_arenafight")
		return

	if(_action == "pin_avy"):
		processTime(3*60)
		if(!getFlag("FightClubModule.AvyGotRekt", false)):
			GM.pc.addCredits(100)
			addExperienceToPlayer(300)
			addMessage("You received 100 credits for your win! And also a ring.")
			FightClubModule.markFighterAsDefeated("avy")
			FightClubModule.raisePCRankTo(FightClubRank.GrandChampion)
			setFlag("FightClubModule.AvyGotRekt", true)
			GM.pc.getInventory().addItem(GlobalRegistry.createItem("RingFighter"))

	if(_action == "add_chastity_cage"):
		processTime(3*60)
		isCaged = true

	if(_action == "do_kick_balls"):
		processTime(3*60)
		isCBT = true

	if(_action == "do_anal"):
		processTime(5*60)
		gotFucked = true

	if(_action == "pick_strapon"):
		gotStraponed = true

	if(_action == "force_rim"):
		processTime(5*60)
		didRimming = true

	if(_action == "do_anal_start"):
		processTime(3*60)

	if(_action == "do_anal_faster"):
		processTime(5*60)

	if(_action == "do_anal_cum"):
		processTime(3*60)
		getCharacter("avy").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("avy")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "use_offered_strapon"):
		usedAnsStrapon = true
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("StraponCanine"))

	if(_action == "do_anal_strapon_pick"):
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		usedAnsStrapon = false

	if(_action == "do_anal_strapon_start"):
		processTime(3*60)

	if(_action == "do_anal_strapon_faster"):
		processTime(5*60)

	if(_action == "do_anal_strapon_cum"):
		processTime(3*60)
		getCharacter("avy").cummedInAnusBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("avy")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "remove_strapon_and_choose"):
		
		if(usedAnsStrapon):
			GM.pc.removeStrapon()
		else:
			GM.pc.unequipStrapon()
		
		setState("choose_punish")
		return

	if(_action == "avy_likes_rimming"):
		processTime(5*60)
		GM.pc.addLust(30)

	if(_action == "rim_even_better"):
		processTime(3*60)
		GM.pc.orgasmFrom("avy")

	if(_action == "avy_in_slutwall"):
		processTime(2*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "final_arenafight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("avy_tries_to_use_drugs")
			addExperienceToPlayer(100)
		else:
			#setState("avy_pitty")
			addExperienceToPlayer(5)
			runScene("AvyArenaPittyFuckScene")
			endScene()

func saveData():
	var data = .saveData()

	data["isCaged"] = isCaged
	data["isCBT"] = isCBT
	data["gotFucked"] = gotFucked
	data["gotStraponed"] = gotStraponed
	data["didRimming"] = didRimming
	data["usedAnsStrapon"] = usedAnsStrapon

	return data

func loadData(data):
	.loadData(data)

	isCaged = SAVE.loadVar(data, "isCaged", false)
	isCBT = SAVE.loadVar(data, "isCBT", false)
	gotFucked = SAVE.loadVar(data, "gotFucked", false)
	gotStraponed = SAVE.loadVar(data, "gotStraponed", false)
	didRimming = SAVE.loadVar(data, "didRimming", false)
	usedAnsStrapon = SAVE.loadVar(data, "usedAnsStrapon", false)

func getDevCommentary():
	return "Avy's final arena battle scene.. This is what it's all about ^^. This is the payout for the whole Arena content so I had to make it good ^^. Hopefully it turned out fun. Avy doesn't just lose, she gets -destroyed- because of your actions. If you win the first battle that is x3.\n\nShould I have made Avy a herm? Nahhh, I don't see her as a herm at all. Yes, it would allow you to breed her and stuff. But in my head she is just a mean dickgirl. And making a mean dickgirl into a subby buttslut is more fun than making her into a subby mother ^^. Just how I see it. Getting buttfucked is more humiliating than getting bred basically. And this scene is all about humiliating her."

func hasDevCommentary():
	return true
