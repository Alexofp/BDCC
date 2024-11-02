extends SceneBase

func _init():
	sceneID = "LuxeTalkScene"

func _reactInit():
	if(!getFlag("SlaveAuctionModule.luxeTalkIntro")):
		setFlag("SlaveAuctionModule.luxeTalkIntro", true)
		setState("big_intro")

func _run():
	if(state == ""):
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {npc="luxe", npcAction="sit"})
		aimCameraAndSetLocName("market_luxe")
		saynn("Luxe is sitting behind his desk.")

		saynn("[say=luxe]"+str(getModule("SlaveAuctionModule").getLuxeGreeting())+"[/say]")

		addButton("Talk", "Ask a few things", "talk_menu")
		if (!getFlag("SlaveAuctionModule.luxeSexIntro")):
			addButton("Sex?", "Check if the old wolf is up for some fun with you", "sex_intro")
		else:
			addButton("Sex", "See if the old wolf is up for some fun", "sex_menu")
		addButton("Leave", "Time to go", "endthescene")
	if(state == "big_intro"):
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {npc="luxe", npcAction="stand"})
		aimCameraAndSetLocName("market_luxe")
		saynn("You approach the reinforced doors at the end of the corridor.. and hear the metal screech as they actually decide to open for you this time.")

		saynn("The space itself begins to weigh on you as you cross it. The wolf's office radiates a dark, rich energy, walls paneled in deep polished wood with good trims glinting under soft, ambient lighting. Some red accents finish the look.")

		saynn("Luxe is staring at the holographic display of the galaxy, tracing the routes of the Syndicate ships with his eyes. The area is massive.. threaded by the many little glowing bugs.")

		saynn("You're still standing near the entrance, waiting for your permission to come in. And finally, he turns around, offering you no verbal greeting but a gesture, ordering you to step forward.")

		saynn("The silence stretches as Luxe takes a seat behind his dark leather chair, his fur tips creating interesting patterns all around its surface.")

		setFlag("SlaveAuctionModule.customLuxeGreeting", "So. What do you want?")
		addButton("Continue", "See what happens next", "")
	if(state == "talk_menu"):
		saynn("[say=pc]May I ask a few questions?[/say]")

		saynn("[say=luxe]Make it quick.[/say]")

		saynn("What do you want to ask?")

		addButton("Syndicate", "Ask him about what Syndicate even is", "ask_syndicate")
		addButton("Blacktail", "Ask him about the family", "ask_blacktail")
		addButton("Fur pattern", "Ask him about his unique fur pattern", "ask_fur")
		addButton("Mirri", "Ask him about Mirri", "ask_mirri")
		addButton("Mission", "Ask what you should do", "ask_mission")
		addButton("Back", "Enough chatting", "")
	if(state == "ask_syndicate"):
		saynn("[say=pc]Syndicate. Is it some kind of entity?[/say]")

		saynn("His gaze sharpens at your question, a faint glint of interest flickering in his cold glowing eyes. Luxe leans back in his chair, hand holding onto his chin.")

		saynn("[say=luxe]Syndicate is an alliance of families, each with its own skills, its own resources, all working toward the same purpose.[/say]")

		saynn("[say=pc]Destroying AlphaCorp?[/say]")

		saynn("He pauses, eyes glancing briefly toward the holographic map.")

		saynn("[say=luxe]Complete and utter destruction, you are correct.[/say]")

		saynn("[say=pc]Why does it need destroying? Excuse me if I don't see the obvious reasons.[/say]")

		saynn("Luxe leans forward slightly, his eyes locking onto yours.")

		saynn("[say=luxe]AlphaCorp is a plague of this galaxy, simple as that. It strips away freedom, the right to think, to choose, of everything that it touches.[/say]")

		saynn("You tug on your tight collar. But then you look around.")

		saynn("[say=pc]You're not exactly freedom fighters too, are you?[/say]")

		saynn("[say=luxe]We are who we have to be. Unlike AlphaCorp, Syndicate is dynamic, adapting in the moment, bending the rules if that's required. We fight because it's our choice.[/say]")

		saynn("[say=pc]Your slaves don't exactly have any choice, do they?[/say]")

		saynn("[say=luxe]Prove that you're strong - and you will get the reins. The rest will have to listen. And it will have to stay like that, at least until the threat of this galaxy is gone.[/say]")

		saynn("Huh. A fight for freedom.. no matter the cost.")

		saynn("[say=pc]Once you win, who can promise that Syndicate won't just turn into another AlphaCorp?[/say]")

		saynn("[say=luxe]Our organization is highly decentralized. Once our goal is achieved, there will be no reason for the combined Syndicate to exist.[/say]")

		saynn("Decentralization is probably how it managed to survive for so long.. how long..")

		saynn("[say=pc]How long is the war going already?[/say]")

		saynn("Luxe cups his chin and gets quiet for some time.")

		saynn("[say=luxe]Time is relative in space. At least a few generations by now. I doubt many remember how the world looked before it.[/say]")

		saynn("Interesting.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_blacktail"):
		saynn("[say=pc]Can you please tell me more about your family?[/say]")

		saynn("[say=luxe]We are Blacktail. We provide resources for the shared cause, be it credits or people.[/say]")

		saynn("[say=pc]And you do that.. by trading slaves?[/say]")

		saynn("[say=luxe]AlphaCorp slaves can barely be considered people. Nothing but mindless brainwashed husks.[/say]")

		saynn("Ouch.")

		saynn("[say=pc]Do I look mindless to you?[/say]")

		saynn("His gaze flickers, just for an instant, at your question. But his expression remains cold.")

		saynn("[say=luxe]Not entirely. You proved that you are capable of carving your own path rather than following one that AlphaCorp wants.[/say]")

		saynn("Proving yourself to the Syndicate.. one sold slave at a time.")

		saynn("[say=luxe]But still, if the circumstances were any different, we wouldn't be having this talk right now.[/say]")

		saynn("His words make you uncomfortable.. better ask something else.")

		saynn("[say=pc]How big is your family? If I might ask. I only know Mirri.[/say]")

		saynn("[say=luxe]Blacktail family consists of 23 members with me being the oldest.[/say]")

		saynn("Shit, this guy sure fucked a lot.")

		saynn("[say=luxe]We're a family built on power, respect and strict discipline. And yes, we are large. Extensive, even. And all of us are focused on the same task.. almost.[/say]")

		saynn("That's one way to run a family.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_fur"):
		saynn("[say=pc]Interesting fur pattern.[/say]")

		saynn("Luxe hears that.. and reaches into his desk, pulling out a little box. He opens it and grabs a cigar.")

		saynn("[say=pc]May I ask what caused it?[/say]")

		saynn("You don't hear any answers. Luxe frowns.. his whole expression becoming mean.. and the tips of his fur begin to glow even harder.. almost reminding you of real fire. He brings the cigar near them.. and watches as its end lights up.")

		saynn("[say=luxe]None of your business.[/say]")

		saynn("Huh. Looks like you won't get an answer. You do feel the whole room becoming warmer.. It might be some kind of mutation that he has. Or it could be an implant, who knows.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_mirri"):
		saynn("[say=pc]You're pretty cold to Mirri. Isn't she your daughter?[/say]")

		saynn("[say=luxe]The Blacktail family is not just me and Mirri. I have to uphold everyone to the same standards, it's only fair. Mirri.. proved herself to be quite unreliable over the time. But this is all that you should know.[/say]")

		saynn("[say=pc]C'mon, you can tell me more than that. Why is Mirri so.. different from you? Who is her mother, can I see her maybe?[/say]")

		saynn("Luxe gives you a dead cold stare. Yeah, he clearly doesn't want to share anything else.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_mission"):
		saynn("[say=pc]So.. what should I do again? Convince Mirri?[/say]")

		saynn("[say=luxe]I'm not asking or forcing you, an AlphaCorp slave, to do anything, I'm not her. But if you want to be spared when her plan eventually comes to its natural conclusion, I'd rather you not stand in my way.[/say]")

		saynn("That's.. not that hard to remember.. do not mess with the big ass wolf..")

		saynn("[say=pc]Spared.. What do you mean by spared?[/say]")

		saynn("[say=luxe]You will be kept alive.[/say]")

		saynn("[say=pc]Alive can mean many things. Will I be enslaved?[/say]")

		saynn("[say=luxe]Your situation will not get any worse than it already is. You will get your freedom from AlphaCorp. What happens next will be completely up to you.[/say]")

		saynn("That's.. something.. at least.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "sex_intro"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe", npcAction="sit"})
		saynn("You stand in the center of the Luxe's grand office, barely daring to meet the wolf's powerful, intense gaze.")

		saynn("The more time passes, the more his cold, unyielding eyes size you up in complete silence. Despite how glowing his stare is.. you fail to see a spark in it..")

		saynn("After an uncomfortable amount of time, he tilts his head slowly.")

		saynn("[say=luxe]Either say something or leave.[/say]")

		saynn("The words are barely spoken above a whisper.. and yet.. you feel their oppressive weight weighing you down.. down to your.. hm.")

		addButton("Leave", "Fight the feeling and just leave", "endthescene")
		addButton("Offer sex", "Offer the old wolfy a quickie", "sexintro_stupidoffer")
		addButton("Here to serve", "Tell him that you want to serve Luxe", "sexintro_heretoserve")
	if(state == "sexintro_stupidoffer"):
		saynn("Slowly and carefully, you approach the wolf's desk and even dare to put your hands on it as you lean forward, your voice laced with seductive undertones.")

		saynn("[say=pc]Wanna have some fun maybe?[/say]")

		saynn("All you get back is a dead stare.")

		saynn("[say=pc]C'mon, we can choose who will top and who will bottom. Do you like anal?[/say]")

		saynn("The saliva in your mouth turns into little ice crystals..")

		saynn("[say=pc]Uh. Your air conditioner really needs some tuning here, wow.[/say]")

		saynn("[say=luxe]Hands off.[/say]")

		saynn("He didn't say no!")

		saynn("[say=pc]C'mon. I'm sure you're bored all the time, why not spice up your life a little?[/say]")

		saynn("Your insides are freezing by now from being so close to him.. Not a single muscle on his face moves.")

		saynn("[say=luxe]Hands. Off. My desk.[/say]")

		saynn("You're freezing so much that your hands might just come off if you keep it up.. So you finally decide to take a step back.")

		saynn("[say=luxe]I have no desire for slaves. If you need sex, you have Mirri.[/say]")

		saynn("Is he.. offering his daughter to you?")

		saynn("Either way.. It was worth a shot.")

		addButton("Continue", "See what happens next", "")
	if(state == "sexintro_heretoserve"):
		saynn("He is so.. strong.. His presence alone is activating something hidden in your mind..")

		saynn("[say=pc]I'm.. I'm here to serve, Luxe. However you see fit..[/say]")

		saynn("You don't know what you made you say that.. but you did.")

		saynn("Your gaze instantly drops to the floor.. while he raises an eyebrow.")

		saynn("[say=luxe]You want to serve me?[/say]")

		saynn("A subtle nod confirms your intentions. Luxe's expression goes back to unreadable.. through his eyes narrow ever so slightly.")

		saynn("[say=luxe]You picked the wrong person to submit to. Go serve Mirri.[/say]")

		addButton("Leave", "He has a point", "endthescene")
		addButton("I want you", "You really want to be Luxe's slave", "sexintro_iwantyou")
	if(state == "sexintro_iwantyou"):
		saynn("[say=pc]But.. I want to serve you..[/say]")

		saynn("You watch as he taps the desk with his clawed digits in a wavy rhythm.")

		saynn("[say=luxe]I don't do slaves. Especially not AlphaCorp's slaves.[/say]")

		saynn("Here you are.. an AlphaCorp inmate.. begging the head of one of the Syndicate's families..")

		saynn("[say=pc]You don't have to treat me as an unwilling slave. Just know that.. my submission, my obedience, my body, it's.. all yours.. if you want.[/say]")

		saynn("[say=luxe]Submission. A hollow word, more often than not. What exactly do you mean by it?[/say]")

		saynn("You fail to find the right words to explain it.. hm..")

		addButton("Give up", "This submission thing is too hard", "endthescene")
		addButton("Kneel", "Just kneel before him", "sexintro_kneelbefore")
	if(state == "sexintro_kneelbefore"):
		playAnimation(StageScene.Duo, "kneel", {npc="luxe", npcAction="sit"})
		saynn("Do, not tell..")

		saynn("Slowly, you bring yourself down to your knees before him.")

		saynn("You hold his gaze as long as you can bear.. before looking down. The weight that his eyes are putting on you is making you sweat.")

		saynn("The room falls into a heavy silence.. you can only hear your heart beating.")

		addButton("Continue", "See what happens next", "sexintro_luxestands")
	if(state == "sexintro_luxestands"):
		playAnimation(StageScene.Duo, "kneel", {npc="luxe", npcAction="stand"})
		saynn("After a tense pause, Luxe rises slowly, walking around the desk to stand directly in front of you. He looms overhead.. his scent.. dark and bitter.. filling your senses.")

		saynn("[say=luxe]You're either brave or foolish to come here.[/say]")

		saynn("Or horny.")

		saynn("[say=luxe]Understand this - I don't forget and I don't forgive. Take one wrong step and your neck will be snapped faster than you can let out a squeak.[/say]")

		saynn("That's.. mildly threatening.. but it makes sense coming from him.")

		saynn("[say=pc]I understand..[/say]")

		saynn("A faint edge of curiosity slipping into his otherwise steely tone.")

		saynn("[say=luxe]What are you looking for?[/say]")

		saynn("You tilt your head a little while he crosses his arms.")

		saynn("[say=luxe]I have no time or desire for dates. I need to know what you need from me now.[/say]")

		saynn("Straight to the point, huh..")

		addButton("Sex", "Tell him that you just wanna be fucked..", "sexintro_say_sex")
		addButton("Relationship", "Tell him that you wanna be in a relationship with him", "sexintro_say_relationship")
		addButton("Breeding", "You want him to breed you", "sexintro_say_breeding")
		addButton("Be his", "Tell him that you just want to serve him", "sexintro_say_behis")
	if(state == "sexintro_say_sex"):
		saynn("[say=pc]I just wanna be..[/say]")

		saynn("Your cheeks are blushing just thinking about it.. The intense stare is making you squirm.")

		saynn("[say=pc]I just wanna be f-fucked by you..[/say]")

		saynn("He listens to you and nods.")

		saynn("[say=luxe]You can be my cocksleeve, help me take the edge off. But I ain't gonna 'love' you, for multiple reasons, hopefully obvious ones. Do you agree?[/say]")

		addButton("Agree", "Agree to be Luxe's cocksleeve", "sexintro_agree")
		addButton("Cancel", "You changed your mind", "sexintro_cancel")
	if(state == "sexintro_say_relationship"):
		saynn("[say=pc]I wanna..[/say]")

		saynn("Your cheeks are blushing just thinking about it.. The intense stare is making you squirm.")

		saynn("[say=pc]I wanna be your lover..[/say]")

		saynn("His tone is cold.")

		saynn("[say=luxe]I'm not looking for a lover. You can be my cocksleeve if you want, help me take the edge off occasionally. Anything more - just use a dating cyberapp.[/say]")

		saynn("Dating cyberapp? Who even uses those anymore.")

		saynn("[say=luxe]Do you agree?[/say]")

		addButton("Agree", "Agree to be Luxe's cocksleeve", "sexintro_agree")
		addButton("Cancel", "You changed your mind", "sexintro_cancel")
	if(state == "sexintro_say_breeding"):
		saynn("[say=pc]I really want to be..[/say]")

		saynn("Your cheeks are blushing just thinking about it.. The intense stare is making you squirm.")

		saynn("[say=pc]I really want to be bred by you.. by such a strong wolf..[/say]")

		saynn("His tone is cold.")

		saynn("[say=luxe]I have 22 kids, I'm really not looking for me. Especially from.. slaves.[/say]")

		saynn("Aw.")

		saynn("[say=luxe]You're not starting a family with me. But you can be my cocksleeve, help me take an edge off occasionally. Do you agree?[/say]")

		addButton("Agree", "Agree to be Luxe's cocksleeve", "sexintro_agree")
		addButton("Cancel", "You changed your mind", "sexintro_cancel")
	if(state == "sexintro_say_behis"):
		saynn("[say=pc]I wanna be..[/say]")

		saynn("Your cheeks are blushing just thinking about it.. The intense stare is making you squirm.")

		saynn("[say=pc]I wanna be yours..[/say]")

		saynn("His tone is cold.")

		saynn("[say=luxe]I'm not looking for slaves or subs, like I said. What you can be is my cocksleeve, help me take the edge off occasionally.[/say]")

		saynn("That's.. almost the whole deal, just without the slave part..")

		saynn("[say=luxe]Do you agree?[/say]")

		addButton("Agree", "Agree to be Luxe's cocksleeve", "sexintro_agree")
		addButton("Cancel", "You changed your mind", "sexintro_cancel")
	if(state == "sexintro_cancel"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("[say=pc]I.. changed my mind.[/say]")

		saynn("The wolf stays silent.. so you slowly get up.")

		saynn("[say=luxe]Stop wasting my time.[/say]")

		saynn("Yeah, better just leave at this point.")

		addButton("Leave", "Time to go", "endthescene")
	if(state == "sexintro_agree"):
		playAnimation(StageScene.Duo, "kneel", {npc="luxe", npcAction="sit"})
		saynn("[say=pc]Yes, I agree..[/say]")

		saynn("Luxe nods and returns back to his desk.")

		saynn("Not a single word wasted..")

		saynn("Well.. at least now you can serve him.")

		addButton("Continue", "See what happens next", "")
	if(state == "sex_menu"):
		saynn("How do you want to serve Luxe?")

		addButton("Table service", "Service his cock while under his table", "under_start")
		addButton("Back", "You changed your mind", "")
	if(state == "under_start"):
		saynn("Luxe, with his usual icy expression, finishes examining a document on his desk, his sharp eyes barely flickering in your direction as he points firmly to the space beneath his desk.")

		saynn("He doesn't drop a word.. but you understand what he means.")

		addButton("Table", "Get under his table", "under_table")
	if(state == "under_table"):
		# (( New anim table oral tease
		saynn("Without any extra questions, you approach his broad, expensive desk and get under it, positioning yourself where his hand has pointed to.")

		saynn("Now, hidden from view, you begin your work.. Your fingers brush along his strong thighs and reach for his zipper on his pants, already feeling the heat radiating from his crotch, the pressure rising behind the cloth.")

		saynn("One smooth motion exposes his thick, knotted shaft that is partly exposed from its sheath already. While you're getting all horny breathing in his manly scent, Luxe just grabs another document from the pile and begins skimming through it with his eyes, his focus directed towards the work.")

		addButton("Get it hard", "Make him fully hard with your hands", "under_table_stroke")
	if(state == "under_table_stroke"):
		# (( New anim table oral stroke
		saynn("Both of your hands land on his member and begin following along its veiny surface, from its pointy tip to the base where the deflated knot is located. Quite quickly, his length begins to twitch and inflate further, his body pumping blood into his cock, making it nice and hard for you.")

		saynn("Even though it's dark under his table, the glow of his veins is enough for you to see and admire the cock.. a small drop of pre already shining from its tip.")

		saynn("Luxe is motionless save for the smallest tensing of his jaw as you take him into your mouth, your lips wrapping around the head of his member while his cold eyes continue to scan through various files.")

		addButton("Suck him off", "Continue your obedient service", "under_table_suck")
	if(state == "under_table_suck"):
		# (( New anim table oral suck
		saynn("Slowly, you begin trying to fit more than the head of his dick into your mouth, sliding your head along it, trying to go slightly deeper with each pass, finding your and his rhythm, his shaft growing harder in your mouth as he maintains his detached expression.")

		saynn("The room is dead quiet.. with only the wet sounds of your mouth and lips occasionally breaking the complete silence, producing short slurps and lip smacks. Your hands don't sit around and rich into his pants before pulling out his rich ballsack, your digits carefully caressing his orbs as you struggle to fit his whole length in, the tip of his cock testing the back of your mouth, dripping pre down your throat.. salty and slightly sweet. Despite how cold he usually is, his length feels hot in your mouth..")

		saynn("And the scent.. incredible.. musky and rich, it's filling your nostrils with a deep, intoxicating aroma that wakes something primal within you, making you eager to suck him faster, your pulse quickening..")

		addButton("Faster", "Work faster under his table", "under_table_suck_fast")
	if(state == "under_table_suck_fast"):
		# (( New anim table oral fast suck
		saynn("With a slight shift of his hips, Luxe pushes his cock just a bit deeper, his powerful hand meeting the back of your head.. and guiding you to engulf more of his length. Luxe's breathing becomes slightly more ragged.. while yours gets all sorts of messed up by his cock suddenly bending down your throat, your tight inner walls clenching around his dick, your lips kissing his knot that is inflating with more blood with each second..")

		saynn("As you take him deeper, you let your hands fondle his heavy, full balls more, feeling their solid, warm weight in your palms. You knead them gently, feeling the tension building in his body.. while your mouth works in a steady rhythm, sliding up and down his length, testing your limits. The scent is still overwhelmingly masculine, making you crave him even more.")

		saynn("It looks like he is close.. It feels like that too, his knot pulsing and radiating heat like crazy.. subtle shivers begin to spread throughout his body..")

		addButton("Facials", "Let him cum on your face", "under_table_suck_facials")
		addButton("Swallow it", "Let him cum down your throat and not waste a single drop", "under_table_suck_inside")
	if(state == "under_table_suck_inside"):
		# (( New anim table oral suck inside
		saynn("When you feel his peak coming near, you forcibly impale yourself onto his cock as deep as your throat allows, taking the whole length except for the fat knot. You're sacrificing your ability to breathe for his pleasure.. but it's a worthy trade in your book.")

		saynn("Even while incredibly close, Luxe remains cold-faced, only the tension coiling in his muscles gives up that something is about to happen. And it does, his jaw clenches subtly.. and then, without a moment's warning.. his thick juicy shaft starts pulsing in your mouth as his hot seed spills down your throat, filling your belly.")

		if (GM.pc.isWearingChastityCage()):
			saynn("The aroma of his manliness in your lungs.. mixed with the taste of his cum.. creates an overwhelming sense of pleasure that drives you wild. You feel like your cock is gonna burst in your cage at any moment, the pressure that it is putting on its metal prison is insane..")

		elif (GM.pc.hasReachablePenis()):
			saynn("The aroma of his manliness in your lungs.. mixed with the taste of his cum.. creates an overwhelming sense of pleasure that drives you wild. You feel like your cock is gonna burst at any moment, the pressure in your length is insane..")

		elif (GM.pc.hasReachableVagina()):
			saynn("The aroma of his manliness in your lungs.. mixed with the taste of his cum.. creates an overwhelming sense of pleasure that drives you wild. Your pussy gushes with transparent juices without any direct stimulation, the pressure is just that intense..")

		else:
			saynn("The aroma of his manliness in your lungs.. mixed with the taste of his cum.. creates an overwhelming sense of pleasure that drives you wild.")

		saynn("Your throat works as fast as it can.. but his seed just keeps coming and coming, his balls tensing up as he just keeps reading the documents, seemingly unphased by all this.. only his hand is still on the back of your head, ensuring that you swallow every drop..")

		saynn("Only once he is spent does he release his hold, letting you pull away and start coughing, your mouth greedily catching any air that it can.")

		saynn("Feels fucking good..")

		addButton("Get out", "Get out from under his desk", "under_table_suck_getout")
	if(state == "under_table_suck_getout"):
		playAnimation(StageScene.Duo, "stand")
		saynn("You clean up after yourself, licking off the remaining cum from his cock and balls.. before crawling from under his desk. You use your hand to wipe the corners of your mouth and watch Luxey nodding.")

		saynn("[say=luxe]Mhm.[/say]")

		saynn("That's all you get.. but it's still so worth it.. and leaves you craving more..")

		saynn("But for now, it's time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "under_table_suck_facials"):
		# (( New anim table oral suck tease
		saynn("When you feel his peak coming near, you continue pushing him further and further, bringing him over the point of no return. That's when you sneak out from under his grip and pull your head back, your lips releasing his throbbing shaft..")

		saynn("Luxe lets out nothing but a low, quiet growl as he erupts, his balls tensing up, his thick cum splattering across your face in hot, creamy waves. You close your eyes and welcome it, trying to catch his whole load, letting him mark you with his salty seed..")

		saynn("As his orgasm begins to subside and his knotted cock stops showering you with cum.. you just sit there, feeling his seed dripping down your cheeks and chin. You can't even open your eyes, a few thick white strings went right over them..")

		saynn("Feels fucking good..")

		addButton("Get out", "Get out from under his desk", "under_table_suck_getout_facials")
	if(state == "under_table_suck_getout_facials"):
		playAnimation(StageScene.Duo, "stand")
		saynn("Slowly and carefully, you get out from under his desk, careful as to not leave too much of a mess..")

		saynn("You use your hands to clear the area around your eyes a little.. and finally open them again.")

		saynn("You see Luxe, his eyes judging you silently for what you did. But he doesn't seem to be too mad.. so you probably did alright.")

		saynn("[say=luxe]Hm.[/say]")

		saynn("That's all you get.. but it's still so worth it.. and leaves you craving more..")

		saynn("But for now, it's time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ask_syndicate"):
		processTime(10*60)

	if(_action == "ask_blacktail"):
		processTime(10*60)

	if(_action == "ask_fur"):
		processTime(10*60)

	if(_action == "ask_mirri"):
		processTime(10*60)

	if(_action == "ask_mission"):
		processTime(10*60)

	if(_action == "sexintro_heretoserve"):
		processTime(5*60)

	if(_action == "sexintro_luxestands"):
		processTime(5*60)

	if(_action == "sexintro_agree"):
		setFlag("SlaveAuctionModule.luxeSexIntro", true)

	if(_action == "under_start"):
		processTime(5*60)

	if(_action == "under_table"):
		processTime(3*60)

	if(_action == "under_table_stroke"):
		processTime(5*60)

	if(_action == "under_table_suck"):
		processTime(3*60)

	if(_action == "under_table_suck_fast"):
		processTime(3*60)
		GM.pc.gotMouthFuckedBy("luxe")

	if(_action == "under_table_suck_facials"):
		processTime(3*60)
		GM.pc.cummedOnBy("luxe")

	if(_action == "under_table_suck_inside"):
		processTime(3*60)
		GM.pc.cummedInMouthBy("luxe")

	if(_action == "under_table_suck_getout"):
		processTime(3*60)

	if(_action == "under_table_suck_getout_facials"):
		processTime(3*60)

	setState(_action)
