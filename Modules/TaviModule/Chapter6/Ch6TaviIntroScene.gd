extends SceneBase

func _init():
	sceneID = "Ch6TaviIntroScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="sit"})
		setFlag("TaviModule.Ch6Corruption", 1.0)
		saynn("Time to try and figure out what they did to Tavi..")

		saynn("You enter her cell and find her.. sitting on her bed uneasy. Her face shows.. lust.")

		saynn("[say=tavi]Hey there..[/say]")

		saynn("[say=pc]How are you doing, Miss Tavi?[/say]")

		saynn("She lowers her head. You realize that one of her paws is inside her shorts..")

		saynn("[say=tavi]Don't call me that.. Just Tavi is fine.. Or.. you can call me a slut too..[/say]")

		saynn("You slowly walk up to her and put your hand on her shoulder.")

		saynn("[say=pc]Why would I do that?[/say]")

		saynn("Tavi looks up at you, her eyes.. full of desperation.")

		saynn("[say=tavi]Ple-e-ease.. I want to be a good girl.. and a good slut.. And I want to..[/say]")

		saynn("Her paw in her shorts rubs her pussy faster.. there is a visible wet spot on her shorts.")

		saynn("[say=tavi]This lust is insatiable.. Maybe if you fuck this pussy it will go away.. Will you fuck your slutty pet?..[/say]")

		saynn("She pulls her shorts down a little, exposing her wet dripping pussy. It's like Tavi is in heat..")

		saynn("[say=tavi]Ple-ease.. Make me feel good.. I will do anything.. I'm such a horny slut..[/say]")

		saynn("That is certainly a big leap from how Tavi was before. Your best guess is that all the orgasms that she received.. [b]corrupted[/b] her. Made her addicted to them somehow.")

		saynn("While you were thinking about that, Tavi just can't find a way to stay still. Her clawed digits pull her shorts even lower before she spreads her green pristine-looking pussy for you, displaying.. her hymen.. Right, Tavi is still a virgin.")

		saynn("[say=tavi]There is nothing more I want than for you to breed this slutty cunt.. Please-e, take her virginity..[/say]")

		saynn("She is even trying to beg you. Doing her best at least.")

		if (!GM.pc.hasReachablePenis()):
			saynn("[say=pc]What if I can't?[/say]")

			saynn("Tavi quickly reaches under her bed and pulls out.. a strapon harness. Right. She wants you to take her virginity with that.")

		saynn("Tavi's current corruption is {taviCorruption}.")

		addButton("Fingers", "Just use your fingers to satisfy Tavi without taking her virginity", "do_fingers")
		if (GM.pc.hasReachablePenis()):
			addButton("Fuck Tavi", "Use your new pet's pussy", "do_fuck")
		else:
			addButton("Fuck Tavi", "Use your new pet's pussy with a strapon", "do_fuck_strapon")
	if(state == "do_fingers"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}})
		saynn("You can't bring yourself to do it, Tavi is clearly acting like that because of what happened to her.")

		saynn("[say=pc]I will help you, Tavi. Get up and undress.[/say]")

		saynn("The air inside her simple cell is charged with anticipation. Needy Tavi gets all blushy when she pulls her paw out of her shorts, her digits covered in her juices.")

		saynn("She stands up and begins to slowly unbutton her shirt and pull down her shorts, exposing her cute perky breasts and a perfect untouched shiny pussy.")

		saynn("[say=tavi]S-sex?..[/say]")

		saynn("Tavi is kinda cute when needy, you can't deny that. You point at one of the flat walls of her cell and so Tavi takes the spot near it, her paws pressed against the cold surface.")

		saynn("She looks behind her while spreading her legs slightly and pushing her butt back, her feline tail moves to the side, offering you.. everything.")

		saynn("You join behind her and start by caressing her girly thighs, giving her time to relax and become comfortable with your touch. Tavi's body responds by shivering ever so slightly, her lips let out a soft purr. Seeing that, you slowly move your hand higher until you reach that warm wet pussy.. You can feel the heat radiating from it.")

		saynn("[say=pc]I'm not gonna fuck you, Tavi. But I will make you feel good.[/say]")

		saynn("[say=tavi]Please.. anything..[/say]")

		saynn("Your fingers begin to explore Tavi's tight pussy folds, tracing tender little circles around her cute clit, rubbing it ever so slightly. Moans begin escaping from the feline, she can't help but to arch her back, inviting you to do more.")

		saynn("Her pussy only gets wetter the more you please her, your digits quickly get coated in her juices as you spread her folds and start prodding the entrance itself without going too far.")

		saynn("[say=tavi]Ah.. ah-h..[/say]")

		saynn("Tavi gasps as your digits find a particularly sensitive spot, sending a jolt of pleasure through her. You try to sink your digits a little deeper and push on that spot a little more but your attempts are quickly stopped by the organic barricade.")

		saynn("[say=tavi]You're free to.. tear through it.. I c-can endure it..[/say]")

		saynn("[say=pc]No.[/say]")

		saynn("You pull your digits away from her pussy hole and just focus on rubbing her folds with your thumb teasing her clit. As you do that, Tavi's body responds eagerly. Waves of pleasure ripple through her, causing her muscles to tense. Her moans become louder, her hips are swaying and trying to hump your digits.")

		saynn("[say=pc]You're staying a virgin, Tavi. At least for now.[/say]")

		saynn("[say=tavi]Ngh-h.. Y-yes.. O-okay.. ah..[/say]")

		saynn("Your fingers find a steady rhythm, knowing exactly where to rub for the best effect. Tavi's body trembles as the pleasure within her builds, her breath hitching ever so often. You observe closely, enjoying the sight of your inexperienced Miss finally getting to do the fun stuff.")

		saynn("[say=tavi]I'm gonna.. g-gonna.. c-cum..[/say]")

		saynn("[say=pc]Do it.[/say]")

		saynn("With a final stroke on her pussy lips, Tavi succumbs to the overwhelming pleasure. Her body tenses up as hard as it can as her back is arching, rubbing against your {pc.masc} chest. She moans and gasps as the climax makes her pussy folds pulsate around your digits.")

		saynn("As Tavi rides out of the waves of the orgasm, you stay close, holding her tenderly with your free hand. You begin whispering into her ear.")

		saynn("[say=pc]Good girl.. This should satisfy you for now..[/say]")

		saynn("But Tavi just breathes warmly and squirms under your touch.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("As you pull your hand away from her pussy.. you realize that it's still incredibly wet from her juices. Making Tavi lick them off would be lewd.. but it would also probably affect her.. Hey, maybe that's a good thing?")

		addButton("Make Tavi lick", "Make Tavi clean your hand", "tavi_licks_juices")
		addButton("Lick your hand", "Clean that hand yourself", "you_lick_juices")
	if(state == "tavi_licks_juices"):
		saynn("A playful glint shines in your eyes. You decide to bring those wet digits to Tavi's lips, offering her to clean them out in an obvious way. Tavi sees them and.. blushes.. her cheeks looking green.")

		saynn("But then, without much hesitation, Tavi parts her lips and takes your fingers into her mouth. Her feline tongue is gliding over them with a delicate touch, savoring every drop of her own arousal. It tickles a little bit..")

		saynn("[say=pc]Good slut.. Get used to tasting various fluids.. You will have to do it a lot.[/say]")

		saynn("Quiet purring can be heard from Tavi as she draws your fingers deeper into her mouth, hungrily and eagerly. But that's probably enough for now, you don't want to reignite Tavi's heat so soon..")

		saynn("So you pull your digits out, completely clean.")

		saynn("[say=tavi]Thank you.. for satisfying your slut..[/say]")

		saynn("It seems.. getting Tavi to be her old self will be hard.. But do you even want that? She is so much happier now.")

		saynn("For now, all you can do is.. start training your new pet.. and see what happens..")

		addButton("Continue", "See what happens next", "start_talk_scene")
	if(state == "you_lick_juices"):
		saynn("You decide not to corrupt your Tavi further and just quickly lick those digits yourself. Oh, the taste is so great.. You wish you could taste your Miss. Well, now you can.")

		saynn("Tavi slowly calms down from her high.")

		saynn("[say=tavi]Thank you.. I feel better..[/say]")

		saynn("Better, huh? Her posture still looks quite.. subby. Just like her voice. Is it even possible to get Tavi to be her old self?")

		saynn("She seems quite happy too.. Maybe the captain was right.. Maybe not..")

		saynn("For now, all you can do is.. start training Tavi some things that she probably forgot or was forced to forget.. and see what happens..")

		addButton("Continue", "See what happens next", "start_talk_scene")
	if(state == "do_fuck"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("You think about it a little bit. Tavi has had you as a pet for so long and never gave you an opportunity to fuck her. But now it's your turn to take..")

		saynn("[say=pc]I will help you, Tavi. Get up.[/say]")

		saynn("The air inside her simple cell is charged with anticipation. Needy Tavi gets all blushy when she pulls her paw out of her shorts, her digits covered in her juices.")

		saynn("She stands up and begins to slowly unbutton her shirt and pull down her shorts, exposing her cute perky breasts and a perfect untouched shiny pussy.")

		saynn("Tavi bites her lip when she sees your {pc.penis}. As much as you might want to just take her now.. Might as well make her first time somewhat pleasant. You walk up to her and slip two of your digits under her collar.. feeling some glass object stored in there.. another vial? Doesn't matter.. You bring Tavi to the nearest wall and gently push on her back, inviting her to bend forward.")

		saynn("[say=tavi]I've never done this before.. But I want it so much..[/say]")

		saynn("[say=pc]We will take it slow.[/say]")

		saynn("Tavi trusts your touches and leans forward, putting her paws on the cold surface while also sticking her cute round ass out for you. Her feline tail moves out of the way, giving you full access to her little green flower..")

		saynn("It feels like her body is on fire as your hands explore her, caressing that soft fur and tracing a path down her girly curves. You rest your chin on her shoulder and give her neck a little kiss as you start aligning your hard member against her slick folds. The tip spreads her petals aside.. but then quickly encounters a barricade which causes Tavi to jerk away and whine softly.")

		saynn("[say=tavi]It hurts..[/say]")

		saynn("[say=pc]Should I stop?[/say]")

		saynn("[say=tavi]..no. Do it. As rough as you want.[/say]")

		saynn("Huh. That gives you an idea. Instead of giving her neck kisses, you get a grasp on her short hair and yank on it, forcing Tavi to throw her head back and hiss.")

		saynn("Now is the time..")

		addButton("Push", "Steal Tavi's virginity", "do_fuck_inside")
	if(state == "do_fuck_inside"):
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("While Tavi is busy with her hair being pulled, you suddenly push your hips forward, your {pc.penis} putting pressure on her hymen.. until it gets torn. As her virginity is forcefully taken, she grips onto the wall tightly and gasps, her claws digging into the concrete, her body shivering.. her pussy clenching around the intruding cock.. so tight..")

		saynn("[say=tavi]Ah-h.. h.h-h..[/say]")

		saynn("You let go of her hair to let her rest a little and get used to your length. Green blood trickles down Tavi's thighs, evidence of her lost innocence. She is not a girl anymore.. but a woman.")

		saynn("[say=pc]You're okay, Tavi?[/say]")

		saynn("She is still shivering, her tail wagging sporadically as she tries to.. endure it.")

		saynn("[say=tavi]Please.. don't stop..[/say]")

		saynn("Her breathing is deep, her voice is laced with.. desire.")

		addButton("Continue", "Start fucking Tavi", "do_fuck_fuck")
	if(state == "do_fuck_fuck"):
		playAnimation(StageScene.SexStanding, "sex", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("Slowly, you begin thrusting inside her slit, your shaft exploring her slick tight tunnel that massages you so well.. You can't help but to grunt softly.. You're finally fucking Tavi.. and it feels better than any other pussy.")

		saynn("[say=pc]Good..[/say]")

		saynn("Your actions become a little more forceful, one of your hands slides up to her {tavi.breasts} and gives them a good squeeze while the second one just holds onto her hips. Tavi's initial discomfort starts to transform into a raw.. electrifying pleasure.. making her crave for more.")

		saynn("[say=tavi]Y-yes-s.. You took your slut's virginity.. Now fuck her.. Fuck her rough.. Ah..[/say]")

		saynn("Moans escape from her as she arches her back and spreads her long legs for you more, allowing you to ram your cock deeper down her sex and even reach the organic wall that is her cervix.")

		saynn("[say=tavi]Ah.. Why was I denying myself this pleasure.. It feels so g-good..[/say]")

		saynn("You reach a pretty good pace, pounding that incredible pussy raw as it only gets tighter around your cock. Very soon Tavi's walls begin clenching around you, her body quivering with overwhelming pleasure as passionate noises leave her lips. You support her through her first vaginal sex orgasm, holding your hands on her body and shaky legs. You quickly realize that you're not that far too..")

		saynn("[say=tavi]Ah!.. Cum inside me!.. P-please! I can't get pregnant, I'm too damaged. But that makes me a perfect cum whore.. No need to worry ever, just turn me into your plaything!..[/say]")

		saynn("Somehow you can feel doctor Quinn's influence in how Tavi talks. Giving her what she wants would probably affect her in some way.. But maybe that's good?")

		addButton("Cum inside", "Attempt to breed that slut anyway", "do_fuck_cum_inside")
		addButton("Pull out", "Deny Tavi her request", "do_fuck_pullout")
	if(state == "do_fuck_cum_inside"):
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", pcCum=true, npcCum=true, npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("That eager pussy quickly pushes you to your peak just by kneading your cock.. until it's too late to pull out. You grunt as you hold onto Tavi's body tightly and cum inside her, your throbbing cock stuffing her toxic-colored pussy full of your thick virile {pc.cum}.")

		saynn("[say=tavi]Yes-s-s~..[/say]")

		saynn("As Tavi rides the rest of her orgasmic waves out, her stuffed pussy already begins to leak out some of your seed mixed with that fancy glowing blood.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("After breeding your new pet thoroughly, you pull your cock out and get a good view. Tavi is still sticking her ass out, allowing you to see in great detail how her pussy twitches and drips.")

		saynn("It seems.. getting Tavi to be her old self will be hard.. But do you even want that? She is so much happier now. And satisfying her needs.. won't be that hard.")

		saynn("For now, all you can do is.. start training your new pet.. and see what happens..")

		addButton("Continue", "See what happens next", "start_talk_scene")
	if(state == "do_fuck_pullout"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", pcCum=true, npcCum=true, npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("That eager pussy quickly pushes you to your peak just by kneading your cock.. But you decide against cumming inside your new pet during her first sex and pull out. Your {pc.penis} throbs and twitches before strings of your thick warm {pc.cum} begin landing on Tavi's bare ass and lower back, adding a new color to her unique color palette.")

		saynn("[say=tavi]Aw.. It's okay.. Thank you for being careful..[/say]")

		saynn("As Tavi rides the rest of her orgasmic waves out, her pussy is already back to looking tight and neat, only the glow and little twitches show that she got fucked recently.")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("It seems.. getting Tavi to be her old self will be hard.. For now, all you can do is.. start training your new pet.. and see what happens..")

		addButton("Continue", "See what happens next", "start_talk_scene")
	if(state == "do_fuck_strapon"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("You think about it a little bit. Tavi has had you as a pet for so long and never gave you an opportunity to fuck her. But now it's your turn to take..")

		saynn("[say=pc]I will help you, Tavi. Get up.[/say]")

		saynn("The air inside her simple cell is charged with anticipation. Needy Tavi gets all blushy when she pulls her paw out of her shorts, her digits covered in her juices.")

		saynn("She stands up and begins to slowly unbutton her shirt and pull down her shorts, exposing her cute perky breasts and a perfect untouched shiny pussy.")

		saynn("Tavi bites her lip when she sees you securing that strapon harness around your waist. As much as you might want to just take her now.. Might as well make her first time somewhat pleasant. You walk up to her and slip two of your digits under her collar.. feeling some glass object stored in there.. another vial? Doesn't matter.. You bring Tavi to the nearest wall and gently push on her back, inviting her to bend forward.")

		saynn("[say=tavi]I've never done this before.. But I want it so much..[/say]")

		saynn("[say=pc]We will take it slow.[/say]")

		saynn("Tavi trusts your touches and leans forward, putting her paws on the cold surface while also sticking her cute round ass out for you. Her feline tail moves out of the way, giving you full access to her little green flower..")

		saynn("It feels like her body is on fire as your hands explore her, caressing that soft fur and tracing a path down her girly curves. You rest your chin on her shoulder and give her neck a little kiss as you start aligning your new silicon member against her slick folds, using her juices as lube. The rubber tip spreads her petals aside.. but then quickly encounters a barricade which causes Tavi to jerk away and whine softly.")

		saynn("[say=tavi]It hurts..[/say]")

		saynn("[say=pc]Should I stop?[/say]")

		saynn("[say=tavi]..no. Do it. As rough as you want.[/say]")

		saynn("Huh. That gives you an idea. Instead of giving her neck kisses, you get a grasp on her short hair and yank on it, forcing Tavi to throw her head back and hiss.")

		saynn("Now is the time..")

		addButton("Push", "Steal Tavi's virginity", "do_fuck_strapon_inside")
	if(state == "do_fuck_strapon_inside"):
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("While Tavi is busy with her hair being pulled, you suddenly push your hips forward, your strapon putting pressure on her hymen.. until it gets torn. As her virginity is forcefully taken, she grips onto the wall tightly and gasps, her claws digging into the concrete, her body shivering.. her pussy clenching around the intruding rubber cock..")

		saynn("[say=tavi]Ah-h.. h.h-h..[/say]")

		saynn("You let go of her hair to let her rest a little and get used to the length of the toy. Green blood trickles down Tavi's thighs, evidence of her lost innocence. She is not a girl anymore.. but a woman.. even if it wasn't a real cock that did it exactly.")

		saynn("[say=pc]You're okay, Tavi?[/say]")

		saynn("She is still shivering, her tail wagging sporadically as she tries to.. endure it.")

		saynn("[say=tavi]Please.. don't stop..[/say]")

		saynn("Her breathing is deep, her voice is laced with.. desire.")

		addButton("Continue", "Start fucking Tavi", "do_fuck_strapon_fuck")
	if(state == "do_fuck_strapon_fuck"):
		playAnimation(StageScene.SexStanding, "sex", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("Slowly, you begin thrusting inside her slit, your strapon exploring her slick tight tunnel that grips your length so well that it starts putting pressure on your crotch.. You can't help but to moan softly.. You're finally fucking Tavi.. and it feels pretty good.")

		saynn("[say=pc]Good..[/say]")

		saynn("Your actions become a little more forceful, one of your hands slides up to her {tavi.breasts} and gives them a good squeeze while the second one just holds onto her hips. Tavi's initial discomfort starts to transform into a raw.. electrifying pleasure.. making her crave for more.")

		saynn("[say=tavi]Y-yes-s.. You took your slut's virginity.. Now fuck her.. Fuck her rough.. Ah..[/say]")

		saynn("Moans escape from her as she arches her back and spreads her long legs for you more, allowing you to ram your strapon deeper down her sex and even reach the organic wall that is her cervix, the pointy tip kissing it.")

		saynn("[say=tavi]Ah.. Why was I denying myself this pleasure.. It feels so g-good..[/say]")

		saynn("You reach a pretty good pace, pounding that incredible pussy as it only gets tighter around your strapon, increasing the friction. Very soon Tavi's walls begin clenching even harder, her body quivering with overwhelming pleasure as passionate noises leave her lips. You support her through her first vaginal sex orgasm, holding your hands on her body and shaky legs.")

		saynn("[say=tavi]Ah!.. Knot me!.. P-please! I can't get pregnant, I'm too damaged. But that makes me a perfect whore.. No need to worry ever, just turn me into your plaything!..[/say]")

		saynn("Somehow you can feel doctor Quinn's influence in how Tavi talks. You can't exactly get pregnant with this thing either way, seems like Tavi got into her role a little too much. Giving her what she wants would probably affect her in some way.. But maybe that's good?")

		saynn("This strapon indeed features a knot.. But is Tavi even ready for it..")

		addButton("Knot Tavi", "Attempt to shove that knot inside anyway", "do_fuck_strapon_knot")
		addButton("No knot", "Deny Tavi her request", "do_fuck_strapon_no_knot")
	if(state == "do_fuck_strapon_knot"):
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("Knotting a previously virgin kitty during her first sex? Sounds fun! Your hands grip Tavi as tight as they can while you ram your knotted strapon deep inside her, the rubber fat orb stretching her folds painfully wide.. until finally slipping inside.")

		saynn("Tavi arches her back even harder, a loud slutty moan escapes her as she starts shaking and shivering under you. Her pussy is pulsating and then suddenly squirts from sheer amount of overstimulation.")

		saynn("[say=tavi]AHHh-h-h.. F-fuu-uck!..[/say]")

		saynn("You don't feel much since it's just a toy. But Tavi sure seems to be enjoying herself.")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("After fucking your new pet thoroughly, you pull your strapon out and get a good view. Tavi is still sticking her ass out, allowing you to see in great detail how her pussy twitches and drips.. cum lube? Oh wow, that strapon was loaded with cum-like fluid and now it's leaking out of Tavi. Lewd.")

		saynn("It seems.. getting Tavi to be her old self will be hard.. But do you even want that? She is so much happier now. And satisfying her needs.. won't be that hard.")

		saynn("For now, all you can do is.. start training your new pet.. and see what happens..")

		addButton("Continue", "See what happens next", "start_talk_scene")
	if(state == "do_fuck_strapon_no_knot"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("That pussy is so inviting.. But you decide against knotting your new pet during her first sex and pull out instead.")

		saynn("[say=tavi]Aw.. It's okay.. Thank you for being careful..[/say]")

		saynn("As Tavi rides the rest of her orgasmic waves out, her pussy is already back to looking tight and neat, only the glow and little twitches show that she got fucked recently.")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("It seems.. getting Tavi to be her old self will be hard.. For now, all you can do is.. start training your new pet.. and see what happens..")

		addButton("Continue", "See what happens next", "start_talk_scene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_fuck"):
		setFlag("TaviModule.TaviIsNotVirgin", true)

	if(_action == "do_fuck_strapon"):
		var strapon = GlobalRegistry.createItem("StraponCanine")
		var fluids = strapon.getFluids()
		fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
		GM.pc.getInventory().equipItem(strapon)
		setFlag("TaviModule.TaviIsNotVirgin", true)

	if(_action == "tavi_licks_juices"):
		processTime(3*60)
		getModule("TaviModule").addCorruption(1)

	if(_action == "you_lick_juices"):
		processTime(3*60)
		getModule("TaviModule").addCorruption(-1)
		GM.pc.addLust(30)

	if(_action == "start_talk_scene"):
		GM.pc.removeStrapon()
		endScene()
		setFlag("TaviModule.Ch6TaviSatisfied", true)
		runScene("Ch6TaviTalkScene")
		return

	if(_action == "do_fuck_inside"):
		processTime(5*60)

	if(_action == "do_fuck_fuck"):
		processTime(3*60)

	if(_action == "do_fuck_cum_inside"):
		processTime(3*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		getModule("TaviModule").addCorruption(1)

	if(_action == "do_fuck_pullout"):
		processTime(3*60)
		getCharacter("tavi").cummedOnBy("pc")
		getModule("TaviModule").addCorruption(-1)

	if(_action == "do_fuck_strapon_inside"):
		processTime(5*60)

	if(_action == "do_fuck_strapon_fuck"):
		processTime(3*60)

	if(_action == "do_fuck_strapon_knot"):
		processTime(30*60)
		getCharacter("tavi").cummedInVaginaBy("pc", FluidSource.Strapon)
		getModule("TaviModule").addCorruption(1)

	if(_action == "do_fuck_strapon_no_knot"):
		processTime(3*60)
		#getCharacter("tavi").cummedOnBy("pc", FluidSource.Strapon)
		getModule("TaviModule").addCorruption(-1)

	setState(_action)
