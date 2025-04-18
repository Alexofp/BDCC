extends SceneBase

func _init():
	sceneID = "ElizaDrugTestGrowCockScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("[say=pc]Wanna try that pill yourself maybe?[/say]")

		saynn("Eliza raises a brow.")

		saynn("[say=eliza]Why?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Aren't you curious? What it's like to have one hanging between your legs.[/say]")

		saynn("She hums and scritches her chin.")

		saynn("[say=eliza]It sounds awkward.. I feel like it'd be getting in the way all the time.[/say]")

		saynn("[say=pc]But draining your balls might feel so good, who knows.[/say]")

		saynn("Eliza tilts her head slightly, her expression puzzled.")

		saynn("[say=pc]But it's okay, I can test that pill on someone..[/say]")

		saynn("[say=eliza]Fine, I will try it![/say]")

		saynn("She throws the pill into her mouth and swallows it..")

		saynn("[say=eliza]My curious ass will get me into trouble one day.. although, it already did.[/say]")

		saynn("You smile and just wait for the reaction. And soon, a subtle tremble runs through her thighs. Eliza parts her lips and starts to breathe deeply, leaning against the wall.")

		saynn("[say=eliza]Mmh..[/say]")

		saynn("Something is certainly happening.. you can see the cloth of her skirt getting tight in her crotch region.")

		saynn("[say=pc]I think you might want to lose that skirt.. before you rip it.[/say]")

		saynn("[say=eliza]You might be right.. hah..[/say]")

		addButton("Continue", "See what happens next", "eliza_looks_at_cock")
	if(state == "eliza_looks_at_cock"):
		playAnimation(StageScene.TFLook, "crotch", {pc="eliza", bodyState={exposedCrotch=true, hard=true}})
		saynn("She takes off most of her clothes.. revealing a big bulge that has formed in her panties.")

		saynn("[say=eliza]That was quick..[/say]")

		saynn("She bites her lip while watching it, not yet brave enough to touch. But even that is enough to make the bulge grow.")

		saynn("Eliza's new member is peeking out of the sheath and stretching the black fabric more and more.. until suddenly.. the barbs cut through it, ripping her underwear apart.")

		saynn("[say=eliza]Ah.. dammit. I will need new ones now.[/say]")

		saynn("Now that the panties aren't in the way anymore, you can both admire it.")

		saynn("Beautiful pink-ish color, modest size and girth.. the shaft is littered with lots of barbs. Her erection is pulsing with her heartbeat. A bead of clear precum already hangs from the tip, catching the lab's cold light.")

		saynn("She looks at you.")

		saynn("[say=eliza]Well.. there you go. Eliza Quinn with a cock. Any questions?[/say]")

		saynn("[say=pc]Do you still have.. your other bits?[/say]")

		saynn("She hums.")

		saynn("[say=eliza]I mean.. Only one way to find out.[/say]")

		saynn("She gets a grasp on her new package.. and gently moves it out of the way, showing you the slick, wet pink slit that is hiding behind her balls.")

		saynn("[say=eliza]Yep. Mmhm..[/say]")

		saynn("Her shaft is pulsing subtly in her paw.")

		saynn("[say=eliza]It feels good to touch.. so sensitive.[/say]")

		saynn("Unable to resist, she brushes her fingertips against the barbs. Her breath hitches the instant she does it, a soft moan slipping past her lips.")

		saynn("[say=eliza]Feels very good..[/say]")

		saynn("[say=pc]Why not touch it more then?[/say]")

		saynn("You offer her a small cunning smile.. Eliza bites her lip again and considers it.")

		addButton("Watch", "Just see what happens next", "just_watch")
		addButton("Help her", "Help Eliza by stroking her cock yourself", "help_stroke")
	if(state == "just_watch"):
		playAnimation(StageScene.Grope, "watchstroke", {pc="eliza", npc="pc", pcCum=true, bodyState={exposedCrotch=true, hard=true}})
		saynn("Eventually, she gives in.")

		saynn("One of her paws grips the base firmly while the other one wraps its clawed digits around the shaft and begins to stroke it in slow, deliberate sweeps. Her barbs get caught by her fingers.. each one sending involuntary quivers through her body.")

		saynn("[say=eliza]Ah~..[/say]")

		saynn("Her chest rises and falls, each breath is followed by a fresh moan. Her paw manages to squeeze more of that transparent pre out of her shaft, her balls twitching.")

		saynn("[say=pc]Looks like you're enjoying yourself.[/say]")

		saynn("She nods.. as her strokes grow more urgent. Her feline cock swells further, veins pulsing under her fingers. And soon, a passionate noise of love escapes from her.")

		saynn("[say=eliza]Ah-h-h-h~..[/say]")

		saynn("Her body convulsed.. as a thick jet of cum blasts from her throbbing cock.. splattering onto the cold floor.. She throws her head back and moans into the air while riding the waves of her orgasm.")

		addButton("Continue", "See what happens next", "after_watch_orgasm")
	if(state == "after_watch_orgasm"):
		playAnimation(StageScene.Grope, "tease", {pc="eliza", npc="pc", bodyState={exposedCrotch=true}})
		saynn("Eliza is left panting after her peak. Her member is becoming soft.. retracting into its sheath.")

		saynn("[say=eliza]I will have to clean up the mess..[/say]")

		saynn("She notices that some of the cum has landed on her paw. Eliza blinks a few times.. and then licks it off. Her muffled panting transitions into a low purr as she cleans her every digit, licking off any seed that got onto them..")

		saynn("[say=eliza]Not too bad. But I think I had enough fun with it for now.[/say]")

		saynn("She throws a blue pill into her mouth.. making it so her cock is gone.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "help_stroke"):
		playAnimation(StageScene.ChairOral, "tease", {pc="eliza", npc="pc", bodyState={exposedCrotch=true, hard=true}})
		saynn("You decide to do more than just stand around.")

		saynn("[say=pc]Hey, let me help you.[/say]")

		saynn("She raises a brow as you move a chair behind her, inviting her to settle in.")

		saynn("[say=eliza]Oh?[/say]")

		saynn("You kneel before her, your heart slightly pounding at the sight of her feline member.. You can see every vein in great detail, her tip slick with clear precum, her tiny barbs.")

		saynn("Gently, you catch some of her precum and spread it along her shaft, following the barbs direction. Huh, they don't seem to be that sharp or stiff actually.. only the tips are slightly prickly.")

		saynn("A quiet purring escapes Eliza's lips as you tease her member.")

		saynn("[say=eliza]Mmm.. I'd offer a rubber.. but I'm afraid it will follow the panties' fate.[/say]")

		saynn("[say=pc]It's okay.[/say]")

		addButton("Stroke", "Begin stroking her cock", "begin_stroke_her")
	if(state == "begin_stroke_her"):
		playAnimation(StageScene.ChairOral, "stroke", {pc="eliza", npc="pc", bodyState={exposedCrotch=true, hard=true}})
		saynn("Gently, you begin to stroke her hard feline member, going against the barbs.. which makes Eliza arch her back immediately.")

		saynn("[say=eliza]Ah.. f-fuck~..[/say]")

		saynn("Her legs shift, tail twitching, as your fingers glide over her full length. Eliza grips the chair tightly while cute moans keep landing on your ears. When you focus on the head of her member, doing little circular motions with your thumb, her shaft starts to pulse in response, more of her precum leaking from the tip.")

		saynn("[say=eliza]Mmhh~.. ah..[/say]")

		saynn("It's so fun to play with her.. Each time you glide your hand over the barbs, she squirms.. as if your touches send tiny stabs of pleasure darting through her spine. As your strokes grow more confident, her barbs become stiffer and sharper, scraping against your palm.")

		saynn("[say=eliza]I'm close.. can I maybe.. mh-h.. on your face..[/say]")

		saynn("You can see her balls tensing.")

		addButton("Facials", "Allow her to cum on you", "pc_strokes_allow_facials")
		addButton("No facials", "Make her cum without getting you all messy", "pc_strokes_no_facials")
	if(state == "pc_strokes_allow_facials"):
		playAnimation(StageScene.ChairOral, "stroke", {pc="eliza", npc="pc", pcCum=true, bodyState={exposedCrotch=true, hard=true}})
		saynn("Well.. you went this far.. might as well.")

		saynn("You close your eyes and present your face.. while still stroking Eliza off, trying not to hurt your palm too much.")

		saynn("[say=eliza]Mmhh.. ahh-hh~..[/say]")

		saynn("And soon, you begin to feel thick, hot streams of her seed landing onto your face, waves after waves of it. Eliza moans and squirms while her new member throbs in your palm.")

		saynn("[say=eliza]F-fuck.. yes-s-s~.. Ahhh-h..[/say]")

		saynn("You open one of your eyes and see her throwing her head back and moaning into the air.")

		saynn("You only stop stroking when you make sure you have milked her for all of the cum.")

		addButton("Continue", "See what happens next", "got_facials_relax")
	if(state == "got_facials_relax"):
		playAnimation(StageScene.ChairOral, "tease", {pc="eliza", npc="pc", bodyState={exposedCrotch=true, hard=true}})
		saynn("Eliza is left panting, her member getting soft and retracting back into its sheath.")

		saynn("[say=eliza]That felt.. ah.. amazing~.[/say]")

		saynn("You nod subtly.. trying to avoid her seed getting anywhere important. Eliza notices that and swipes some of her mess from your lips and the closed eye.. before bringing her digits to her mouth and licking them clean.")

		saynn("[say=eliza]Tastes not too bad. I can definitely feel the coffee aftertaste.[/say]")

		saynn("[say=pc]So you're.. keeping it?[/say]")

		saynn("She shakes her head.")

		saynn("[say=eliza]I don't really have a reason to. I had my share of fun. For now, at least~.[/say]")

		saynn("She pops a blue pill into her mouth.. and soon, her member disappears, morphing back into a fully female crotch.")

		saynn("[say=eliza]Thank you for being so helpful~.[/say]")

		saynn("You nod.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pc_strokes_no_facials"):
		playAnimation(StageScene.ChairOral, "stroke", {pc="eliza", npc="pc", pcCum=true, bodyState={exposedCrotch=true, hard=true}})
		saynn("You decide against it, leaning to the side, away from the danger zone.")

		saynn("[say=pc]Sorry, Eliza, I'd rather not get messy.[/say]")

		saynn("She doesn't have enough will or time to protest anyway, your hand still keeps stroking her cock, trying not to hurt itself on her sharp barbs.")

		saynn("[say=eliza]Mmhh.. f-fine~.. ahh-hh~..[/say]")

		saynn("And soon, you see her thick, hot streams of seed flying past your face, waves after waves of it, creating quite a mess on the floor. Eliza moans and squirms while her new member throbs in your palm.")

		saynn("[say=eliza]F-fuck.. yes-s-s~.. Ahhh-h..[/say]")

		saynn("She throws her head back and moans into the air, her toes curling up, her hands digging into the chair's leather.")

		saynn("You only stop stroking when you make sure you have milked her for all of the cum.")

		addButton("Continue", "See what happens next", "no_facials_relax")
	if(state == "no_facials_relax"):
		playAnimation(StageScene.ChairOral, "tease", {pc="eliza", npc="pc", bodyState={exposedCrotch=true, hard=true}})
		saynn("Eliza is left panting, her member getting soft and retracting back into its sheath.")

		saynn("[say=eliza]That felt.. ah.. amazing~.[/say]")

		saynn("You nod subtly.. and notice that some of her cum did manage to land onto your hand. You were about to swipe it off.. but Eliza catches your wrist and brings it up to her lips. She flicks her tongue out and begins licking your digits clean..")

		saynn("[say=eliza]Tastes not too bad. I can definitely feel the coffee aftertaste.[/say]")

		saynn("[say=pc]So you're.. keeping it?[/say]")

		saynn("She shakes her head.")

		saynn("[say=eliza]I don't really have a reason to. I had my share of fun. For now, at least~.[/say]")

		saynn("She pops a blue pill into her mouth.. and soon, her member disappears, morphing back into a fully female crotch.")

		saynn("[say=eliza]Thank you for being so helpful~.[/say]")

		saynn("You nod.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "eliza_looks_at_cock"):
		processTime(5*60)
		setFlag("ElizaModule.elizatf_cock", "feline")
		getCharacter("eliza").updateBodyparts()
		getCharacter("eliza").fillBalls()

	if(_action == "just_watch"):
		processTime(5*60)
		getCharacter("eliza").orgasmFrom("eliza")

	if(_action == "help_stroke"):
		processTime(5*60)

	if(_action == "after_watch_orgasm"):
		processTime(3*60)
		setFlag("ElizaModule.elizatf_cock", "")
		getCharacter("eliza").updateBodyparts()
		if(!getFlag("ElizaModule.tfcan_felinecock", false)):
			setFlag("ElizaModule.tfcan_felinecock", true)
			addMessage("Eliza can now grow a feline cock if you tell her to.")

	if(_action == "begin_stroke_her"):
		processTime(5*60)

	if(_action == "pc_strokes_allow_facials"):
		processTime(2*60)
		GM.pc.cummedOnBy("eliza")
		getCharacter("eliza").orgasmFrom("eliza")

	if(_action == "pc_strokes_no_facials"):
		processTime(2*60)
		getCharacter("eliza").orgasmFrom("eliza")

	if(_action == "got_facials_relax"):
		setFlag("ElizaModule.elizatf_cock", "")
		getCharacter("eliza").updateBodyparts()
		if(!getFlag("ElizaModule.tfcan_felinecock", false)):
			setFlag("ElizaModule.tfcan_felinecock", true)
			addMessage("Eliza can now grow a feline cock if you tell her to.")

	if(_action == "no_facials_relax"):
		setFlag("ElizaModule.elizatf_cock", "")
		getCharacter("eliza").updateBodyparts()
		if(!getFlag("ElizaModule.tfcan_felinecock", false)):
			setFlag("ElizaModule.tfcan_felinecock", true)
			addMessage("Eliza can now grow a feline cock if you tell her to.")

	setState(_action)
