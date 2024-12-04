extends SceneBase

var isVag = false

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

		saynn("Affection towards you: "+str(Util.roundF(getModule("SlaveAuctionModule").getLuxeAffection()*100.0, 1))+"%")

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

		saynn("[say=luxe]You can be my cocksleeve, help me take the edge off. But I ain't gonna 'love' you, for multiple reasons, hopefully obvious ones. Not gonna breed you too, I got enough kids. Do you agree?[/say]")

		if (GM.pc.hasAnyWomb()):
			saynn("[say=pc]What if you do breed me.. by accident?[/say]")

			saynn("[say=luxe]I don't care, they are yours then.[/say]")

		addButton("Agree", "Agree to be Luxe's cocksleeve", "sexintro_agree")
		addButton("Cancel", "You changed your mind", "sexintro_cancel")
	if(state == "sexintro_say_relationship"):
		saynn("[say=pc]I wanna..[/say]")

		saynn("Your cheeks are blushing just thinking about it.. The intense stare is making you squirm.")

		saynn("[say=pc]I wanna be your lover..[/say]")

		saynn("His tone is cold.")

		saynn("[say=luxe]I'm not looking for a lover. You can be my cocksleeve if you want, help me take the edge off occasionally. Anything more - just use a dating cyberapp.[/say]")

		saynn("Dating cyberapp? Who even uses those anymore.")

		saynn("[say=luxe]No breeding too, I got enough kids. Do you agree?[/say]")

		if (GM.pc.hasAnyWomb()):
			saynn("[say=pc]What if you do breed me.. by accident?[/say]")

			saynn("[say=luxe]I don't care, they are yours then.[/say]")

		addButton("Agree", "Agree to be Luxe's cocksleeve", "sexintro_agree")
		addButton("Cancel", "You changed your mind", "sexintro_cancel")
	if(state == "sexintro_say_breeding"):
		saynn("[say=pc]I really want to be..[/say]")

		saynn("Your cheeks are blushing just thinking about it.. The intense stare is making you squirm.")

		saynn("[say=pc]I really want to be bred by you.. by such a strong wolf..[/say]")

		saynn("His tone is cold.")

		saynn("[say=luxe]I have 22 kids, I'm really not looking for more. Especially from.. slaves.[/say]")

		saynn("Aw.")

		saynn("[say=luxe]You're not starting a family with me. But you can be my cocksleeve, help me take an edge off occasionally. Do you agree?[/say]")

		if (GM.pc.hasAnyWomb()):
			saynn("[say=pc]What if you do breed me.. by accident?[/say]")

			saynn("[say=luxe]I don't care, they are yours then.[/say]")

		addButton("Agree", "Agree to be Luxe's cocksleeve", "sexintro_agree")
		addButton("Cancel", "You changed your mind", "sexintro_cancel")
	if(state == "sexintro_say_behis"):
		saynn("[say=pc]I wanna be..[/say]")

		saynn("Your cheeks are blushing just thinking about it.. The intense stare is making you squirm.")

		saynn("[say=pc]I wanna be yours..[/say]")

		saynn("His tone is cold.")

		saynn("[say=luxe]I'm not looking for slaves or subs, like I said. What you can be is my cocksleeve, help me take the edge off occasionally.[/say]")

		saynn("That's.. almost the whole deal, just without the slave part..")

		saynn("[say=luxe]No breeding too, I got enough kids. Do you agree?[/say]")

		if (GM.pc.hasAnyWomb()):
			saynn("[say=pc]What if you do breed me.. by accident?[/say]")

			saynn("[say=luxe]I don't care, they are yours then.[/say]")

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

		var sexProgress = getFlag("SlaveAuctionModule.luxeSexProgress", 0)
		addButton("Table service", "Service his cock while under his table", "under_start")
		if (sexProgress >= 1):
			addButton("Deepthroating", "Let the wolf have more fun with your throat", "deepthroat_start")
		else:
			addDisabledButton("Deepthroating", "Do the previous options to unlock this one")
		if (sexProgress >= 2):
			addButton("Over the desk", "Let him take you over the desk", "sexdesk_start")
		else:
			addDisabledButton("Over the desk", "Do the previous options to unlock this one")
		if (sexProgress >= 3):
			addButton("Marathon", "Let him claim you as his property during a long sex marathon", "sexmar_start")
		else:
			addDisabledButton("Marathon", "Do the previous options to unlock this one")
		addButton("Back", "You changed your mind", "")
	if(state == "under_start"):
		saynn("Luxe, with his usual icy expression, finishes examining a document on his desk, his sharp eyes barely flickering in your direction as he points firmly to the space beneath his desk.")

		saynn("He doesn't drop a word.. but you understand what he means.")

		addButton("Table", "Get under his table", "under_table")
	if(state == "under_table"):
		playAnimation(StageScene.ChairOral, "tease", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true}, npcBodyState={hard=true}})
		saynn("Without any extra questions, you approach his broad, expensive desk and get under it, positioning yourself where his hand has pointed to.")

		saynn("Now, hidden from view, you begin your work.. Your fingers brush along his strong thighs and reach for his zipper on his pants, already feeling the heat radiating from his crotch, the pressure rising behind the cloth.")

		saynn("One smooth motion exposes his thick, knotted shaft that is partly exposed from its sheath already. While you're getting all horny breathing in his manly scent, Luxe just grabs another document from the pile and begins skimming through it with his eyes, his focus directed towards the work.")

		addButton("Get it hard", "Make him fully hard with your hands", "under_table_stroke")
	if(state == "under_table_stroke"):
		playAnimation(StageScene.ChairOral, "stroke", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true}, npcBodyState={hard=true}})
		saynn("Both of your hands land on his member and begin following along its veiny surface, from its pointy tip to the base where the deflated knot is located. Quite quickly, his length begins to twitch and inflate further, his body pumping blood into his cock, making it nice and hard for you.")

		saynn("Even though it's dark under his table, the glow of his veins is enough for you to see and admire the cock.. a small drop of pre already shining from its tip.")

		saynn("Luxe is motionless save for the smallest tensing of his jaw as you take him into your mouth, your lips wrapping around the head of his member while his cold eyes continue to scan through various files.")

		addButton("Suck him off", "Continue your obedient service", "under_table_suck")
	if(state == "under_table_suck"):
		playAnimation(StageScene.ChairOral, "suck", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true}, npcBodyState={hard=true}})
		saynn("Slowly, you begin trying to fit more than the head of his dick into your mouth, sliding your head along it, trying to go slightly deeper with each pass, finding your and his rhythm, his shaft growing harder in your mouth as he maintains his detached expression.")

		saynn("The room is dead quiet.. with only the wet sounds of your mouth and lips occasionally breaking the complete silence, producing short slurps and lip smacks. Your hands don't sit around and rich into his pants before pulling out his rich ballsack, your digits carefully caressing his orbs as you struggle to fit his whole length in, the tip of his cock testing the back of your mouth, dripping pre down your throat.. salty and slightly sweet. Despite how cold he usually is, his length feels hot in your mouth..")

		saynn("And the scent.. incredible.. musky and rich, it's filling your nostrils with a deep, intoxicating aroma that wakes something primal within you, making you eager to suck him faster, your pulse quickening..")

		addButton("Faster", "Work faster under his table", "under_table_suck_fast")
	if(state == "under_table_suck_fast"):
		playAnimation(StageScene.ChairOral, "suckfast", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true}, npcBodyState={hard=true}})
		saynn("With a slight shift of his hips, Luxe pushes his cock just a bit deeper, his powerful hand meeting the back of your head.. and guiding you to engulf more of his length. Luxe's breathing becomes slightly more ragged.. while yours gets all sorts of messed up by his cock suddenly bending down your throat, your tight inner walls clenching around his dick, your lips kissing his knot that is inflating with more blood with each second..")

		saynn("As you take him deeper, you let your hands fondle his heavy, full balls more, feeling their solid, warm weight in your palms. You knead them gently, feeling the tension building in his body.. while your mouth works in a steady rhythm, sliding up and down his length, testing your limits. The scent is still overwhelmingly masculine, making you crave him even more.")

		saynn("It looks like he is close.. It feels like that too, his knot pulsing and radiating heat like crazy.. subtle shivers begin to spread throughout his body..")

		addButton("Facials", "Let him cum on your face", "under_table_suck_facials")
		addButton("Swallow it", "Let him cum down your throat and not waste a single drop", "under_table_suck_inside")
	if(state == "under_table_suck_inside"):
		playAnimation(StageScene.ChairOral, "suckinside", {pc="luxe", npc="pc", npcCum=true, bodyState={showPenis=true, hard=true}, npcBodyState={hard=true}})
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
		playAnimation(StageScene.Solo, "stand")
		saynn("You clean up after yourself, licking off the remaining cum from his cock and balls.. before crawling from under his desk. You use your hand to wipe the corners of your mouth and watch Luxey nodding.")

		saynn("[say=luxe]Mhm.[/say]")

		saynn("That's all you get.. but it's still so worth it.. and leaves you craving more..")

		saynn("But for now, it's time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "under_table_suck_facials"):
		playAnimation(StageScene.ChairOral, "tease", {pc="luxe", npc="pc", pcCum=true, bodyState={showPenis=true, hard=true}, npcBodyState={hard=true}})
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
	if(state == "deepthroat_start"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("It was fun to serve Luxe under the desk.. but you want more.. You don't know why, you just do.")

		saynn("[say=pc]May I serve as your cocksleeve again, Luxe..[/say]")

		saynn("He puts his documents down and silently eyes your {pc.masc} figure out.. figure that radiates a strong submissive aura..")

		saynn("[say=luxe]Hm.[/say]")

		saynn("His stare is making you blush and lower your gaze.. is that a yes?")

		saynn("Finally, his hands start to put away the papers, freeing his big wooden desk. After that, he just points at it.")

		addButton("Desk", "Climb it", "sexdt_desk")
	if(state == "sexdt_desk"):
		playAnimation(StageScene.SexOralTable, "tease", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true, condom=true}, npcBodyState={hard=true}})
		saynn("You do as told, getting onto his desk. Luxe wastes no time and secures your wrists and ankles to it with some chains and cuffs, leaving you utterly vulnerable and exposed, only your head is sticking out from the side a bit..")

		saynn("Your heart races with anticipation as he leans over you, his cold breath washing over your face, carrying the unmistakable scent of masculinity with it that fills your senses.. You can't help but inhale deeply, the musky aroma igniting a fire deep within you..")

		saynn("With a little fiery glint in his eyes, Luxe positions himself in front of your face, already casually rolling a thick condom over his exposed knotted cock of an impressive size. The latex shines in the glow of his veins, emphasizing every contour of his shaft.. and you feel a shiver of excitement ripple through your body.")

		saynn("He steps closer, a slight hint of heat now radiating from him and his cock, making it hard to think as he brushes his member against your lips, teasing you.")

		saynn("[say=luxe]Mouth.[/say]")

		saynn("His command sends a thrill down your spine.. how can you not..")

		addButton("Obey", "Open your mouth for him", "sexdt_fuck")
	if(state == "sexdt_fuck"):
		playAnimation(StageScene.SexOralTable, "suck", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true, condom=true}, npcBodyState={hard=true}})
		saynn("As you part your lips, he pushes forward, his wrapped-up cock sliding past your lips and into your mouth. It goes smoothly until the tip finds the back of your mouth, making you gag slightly.. but Luxe doesn't relent.")

		saynn("With slow thrusts, he begins to fuck your mouth, one of his hands landing on your neck and holding it firmly in place, his clawed fingers digging into your throat.")

		saynn("It feels good.. each motion of his hips is accompanied by the wet sounds of your mouth swallowing him, slurps and gags punctuate the air each time he tests your gag reflex, getting his shaft a little deeper each time.. until your neck begins to bulge under his powerful palm.. the sensation makes your own arousal spike even higher.."+str(" Your {pc.penis} is throbbing slightly.." if GM.pc.hasPenis() else "")+""+str(" Your pussy dripping juices onto the desk.." if GM.pc.hasReachableVagina() else "")+"")

		saynn("It's getting hot in here..")

		addButton("Continue", "See what happens next", "sexdt_faster")
	if(state == "sexdt_faster"):
		playAnimation(StageScene.SexOralTable, "suckfast", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true, condom=true}, npcBodyState={hard=true}})
		saynn("Tears begin streaming down your cheeks a bit.. but you seem to be able to swallow most of his musky cock now, his knot is slapping against your lips while the shaft goes down your {pc.throatStretch} throat, making it bulge..")

		saynn("Luxe's breathing becomes deeper.. you can feel the quiet growls of pleasure rumbling deep in his chest as he pushes you to your limits, fucking your throat at a faster pace. You do your best to suppress your gagging.. but it keeps happening, your inner walls clenching around his cock as you're making all sorts of humiliating wet slurps and gags..")

		saynn("You're deepthroating a head of the Syndicate family.. You certainly took a few wrong turns in your life.. or maybe quite the opposite.")

		saynn("He tightens his grip on your neck, showcasing his control. The added pressure sends more shivers through you, amplifying your struggles.. but also the pleasure of serving.")

		if (GM.pc.hasPenis()):
			saynn("You feel your own cock pulsing with need, each thrust causing your body to respond in ways you can't control. The sight of his powerful frame, the sounds of your deepthroating, and the intoxicating scent of his musk fill your senses.. it's all too much..")

		elif (GM.pc.hasReachableVagina()):
			saynn("You feel your neglected pussy twitching with need, each thrust causing your body to respond in ways you can't control. The sight of his powerful frame, the sounds of your deepthroating, and the intoxicating scent of his musk fill your senses.. it's all too much..")

		saynn("That knot.. it keeps slapping against your lips.. forcing your jaw to open wider bit by bit.. it's almost like he is..")

		addButton("Continue", "See what happens next", "sexdt_cum")
	if(state == "sexdt_cum"):
		playAnimation(StageScene.SexOralTable, "suckinside", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true, condom=true}, npcBodyState={hard=true}})
		saynn("With one last deep and powerful thrust, he forces his entire length down your throat. Your jaw almost gets dislocated while the big, fat orb forces it wide open before slipping inside, locking his member in!")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your body convulses, and with a series of desperate muffled groans around Luxe's thick shaft, you suddenly cum, your locked away dick throbbing in its little cage before releasing multiple thick ropes of {pc.cum}, coating your stomach as you twitch and gasp.. and all of that without any stimulation to your cock..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your body convulses, and with a series of desperate muffled groans around Luxe's thick shaft, you suddenly cum, your {pc.penis} throbbing before releasing multiple thick ropes of {pc.cum}, coating your stomach as you twitch and gasp.. and all of that without any stimulation to your member..")

		elif (GM.pc.hasReachableVagina()):
			saynn("Your body convulses, and with a series of desperate muffled groans around Luxe's thick shaft, you suddenly cum, your pussy spasming as a wave of pleasure crashes over you, making you squirt juices all over that desk.. and all of that without any direct stimulation to your sensitive folds..")

		saynn("Luxe lets out a quiet grunt as his cock starts pulsing in your mouth, filling that condom with waves of hot, creamy seed, making it fill up your throat and belly.. It just doesn't end, the latex stretches more and more to accommodate his huge load.. your breathing is put on pause as his climax is blocking your only air intake path..")

		saynn("[say=luxe]Hhh..[/say]")

		saynn("Fuck.. it feels so good to be his cocksleeve..")

		saynn("He doesn't pull back immediately. Instead, he ties off the condom while it remains in you, leaving it in place for a moment longer. After that, his cock slips free from your mouth, leaving a filled latex balloon in your throat..")

		addButton("Continue", "See what happens next", "sexdt_after")
	if(state == "sexdt_after"):
		playAnimation(StageScene.SexOralTable, "tease", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true}, npcBodyState={hard=true}})
		saynn("The air is running out.. and make that clear, struggling and squirming.. And so Luxe finally pulls it out too, all his seed neatly contained in it..")

		saynn("You cough and grab all the air that you can.")

		saynn("[say=pc]Kgh.. kghhh.. hh. f-fuck.. ah.. you got a h-huge cock..[/say]")

		saynn("Luxe just watches you.")

		saynn("[say=luxe]You got a tight throat.[/say]")

		saynn("You hope that this is a compliment.")

		saynn("[say=pc]T-thanks.. a-anything else you need?[/say]")

		saynn("He shakes his head and undoes your bindings.")

		saynn("[say=pc]R-right.. Your cocksleeve will serve you again some other time when you will need it..[/say]")

		saynn("Slowly, you get off his desk and just leave his office.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sexdesk_start"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("Luxe sees you biting your lip.. and starts to put things off of his grand desk.. a good sign.")

		saynn("You step a little closer, your heart racing while his is cold as a stone.. but you do notice signs of.. hunger.. in his eyes.")

		saynn("[say=luxe]Bend.[/say]")

		saynn("He commands you with a low voice..")

		addButton("Obey (anal)", "Do as he says. Present your butt", "sexdesk_choose_anal")
		addButtonWithChecks("Obey (vaginal)", "Do as he says. Present your pussy", "sexdesk_choose_vag", [], [[ButtonChecks.HasReachableVagina]])
	if(state == "sexdesk_chose"):
		playAnimation(StageScene.SexOverTable, "tease", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true, condom=isVag}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("You comply without hesitation, surrendering to his will. Your palms press against the cool surface of the desk, your butt"+str(" and pussy" if isVag else "")+" fully exposed, making you look vulnerable.")

		saynn("Luxe steps behind you, his presence looming like a storm ready to break.")

		saynn("With a sudden grip, he grabs your hips and pulls you back against him, the cold heat of his body surrounding you. The pointy head of his thick canine cock already prods against your "+str("{pc.analStretch} back entrance" if !isVag else "{pc.pussyStretch} pussy entrance")+", teasing and testing.")

		saynn("No words are exchanged.. no words are needed, really. You feel yourself being his plaything.. and you love it.")

		if (isVag):
			saynn("Before he commits though, Luxe catches himself and stops for a second. He reaches into his desk and grabs a condom.")

			saynn("[say=pc]You don't have to use..[/say]")

			saynn("[say=luxe]I do.[/say]")

			saynn("It feels like you won't be able to stop him..")

		addButton("Continue", "See what happens next", "sexdesk_sex")
	if(state == "sexdesk_sex"):
		playAnimation(StageScene.SexOverTable, "sex", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true, condom=isVag}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn(""+str("After putting a condom on, " if isVag else "")+"Luxe doesn't give you a moment to adjust.. he just pushes his cock in, stretching your "+str("tailhole" if !isVag else "sensitive folds")+" and filling you in one powerful thrust! You gasp, your body instinctively tightening around him, your inner walls gripping his glowing shaft as it leaks pre inside..")

		saynn("The head of the Syndicate family begins to use you, each his thrust reaching deeper than the last. He grips your waist tightly, holding you in place as he drives into you, fucking your body as he please. The sharp sound of flesh meeting flesh echoes in the office, only broken by your moans and gasps. His manly scent envelops you, a heavy mix of dominant aura and raw masculinity, making your head spin with need..")

		if (GM.pc.isWearingChastityCage()):
			saynn("The way his length is pushing on your "+str("prostate" if !isVag else "g-spot")+".. it hits all the right buttons. Blood tries to flow to your locked cock.. but the cage prevents you from getting any kind of erection.. keeping you extremely horny while the pressure in your drippy little cock rises..")

		elif (GM.pc.hasReachablePenis()):
			saynn("The way his length is pushing on your "+str("prostate" if !isVag else "g-spot")+".. it hits all the right buttons. Blood flows to your {pc.penis}, making you extremely hard. The stimulation is keeping you extremely horny while the pressure in your drippy cock rises..")

		elif (GM.pc.hasReachableVagina()):
			saynn("The way his length is pushing on your "+str("pleasure spot through the inner wall of your ass" if !isVag else "g-spot")+".. it manages to hit all the right buttons. "+str("Your asshole is not as sensitive as your pussy.. but the stimulation still keeps you extremely horny, your neglected folds getting wet, dripping juices.." if !isVag else "Even though he is using a condom, the stimulation is making your wet folds eagerly drip juices..")+"")

		addButton("Continue", "See what happens next", "sexdesk_fast")
	if(state == "sexdesk_fast"):
		playAnimation(StageScene.SexOverTable, "fast", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true, condom=isVag}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("As Luxe continues to ram into you, his inflating knot increases its pressure, pressing insistently against your entrance. It doesn't fit.. but Luxe doesn't stop, he pounds into you harder, the knot stretching you wider bit by bit, the sensation almost unbearable. You can feel yourself teetering on the edge, your moans echoing around the room.")

		saynn("[say=luxe]Take it.[/say]")

		saynn("[say=pc]Ahh-h.h. mhh.. h..[/say]")

		saynn("You can only whimper in response to his command as the orb is still too fat to fit inside you.. you can feel your body resisting, your "+str("tailhole" if !isVag else "pussy")+" clenches around it, refusing to yield. So hot, you feel something igniting in him and you..")

		saynn("Luxe grips your hips harder, pulling you back against him, his thrusts are relentless as he stretches you further. With each motion, he forces the knot a bit deeper.. until..")

		addButton("Cum", "See what happens next", "sexdesk_cum")
	if(state == "sexdesk_cum"):
		playAnimation(StageScene.SexOverTable, "inside", {pc="luxe", npc="pc", pcCum=isVag, npcCum=true, bodyState={showPenis=true, hard=true, condom=isVag}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Until finally, with a last powerful thrust, the knot slips inside with a satisfying plop! The sensation is incredibly sharp, a rush of fullness and tightness that sends sudden shockwaves of pleasure through both of you. Luxe's breath hitches, and he growls deeply, the sound resonating through your body.")

		if (GM.pc.isWearingChastityCage()):
			saynn("The moment the knot locks in place, the world falls away. Your cock twitches in its little cage.. and you feel a surge building deep within.. The way his knot puts immense pressure against your "+str("prostate" if !isVag else "pleasure spot")+" sends sparks of electricity through your body.. and moments later, {pc.cum} begins spilling out from your {pc.penis} in weak thick ropes, splattering against the desk..")

		elif (GM.pc.hasReachablePenis()):
			saynn("The moment the knot locks in place, the world falls away. Your hard cock twitches a lot.. and you feel a surge building deep within.. The way his knot puts immense  pressure against your "+str("prostate" if !isVag else "pleasure spot")+" sends sparks of electricity through your body.. and moments later, {pc.cum} begins shooting out from your {pc.penis} in strong thick ropes, splattering against the desk..")

		elif (GM.pc.hasReachableVagina()):
			saynn("The moment the knot locks in place, the world falls away. You instantly fall into a huge, powerful climax, your inner walls pulse and contract around Luxe's knot as your "+str("neglected " if !isVag else "")+"pussy releases a fountain of girlcum onto the desk. "+str("Even though it's your ass that is getting stimulated, it's enough to send wave after wave of immense pleasure through you.." if !isVag else "The way his fat knot massages your g-spot.. it's enough to send wave after wave of immense pleasure through you..")+"")

		else:
			saynn("The moment the knot locks in place, the world falls away. You instantly fall into a huge, powerful climax, your inner walls pulse and contract around Luxe's knot as a powerful orgasm surges through your body, your pleasure spot overstimulated by his huge cock..")

		if (!isVag):
			saynn("As you clench around Luxe, he follows you into the abyss of pleasure too.. His glowing cock is throbbing inside your ass as it starts pumping you full of his hot seed, filling you to the brim with his heat.. more and more of it until your belly becomes a little more bumpy than it was before.. the outline of his cock clearly visible..")

		else:
			saynn("As you clench around Luxe, he follows you into the abyss of pleasure too.. His glowing cock is throbbing inside your pussy.. before it starts pumping the condom inside your womb full of his hot seed, filling the rubber to the brim with his heat.. more and more of it until your belly becomes a little more bumpy than it was before.. the outline of his cock clearly visible.. The condom that he chose.. it just doesn't want to burst..")

		saynn("[say=pc]Oh fuck.. you're so fucking big..[/say]")

		saynn("His whole length is stuck inside you, making you squirm on his desk, your shaking legs giving up on you.. In this moment, you are nothing more than his cocksleeve.. and somehow, it feels exactly right..")

		addButton("Continue", "See what happens next", "sexdesk_after")
	if(state == "sexdesk_after"):
		playAnimation(StageScene.SexOverTable, "tease", {pc="luxe", npc="pc", bodyState={showPenis=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Luxe tries to yank his knot out.. but it's stuck good, keeping any mess inside..")

		saynn("[say=luxe]You will have to wait.[/say]")

		saynn("[say=pc]NHh.h.. o-okay..[/say]")

		saynn("Being his cock warmer isn't that bad of a fate.. Minutes begin to pass, little moans keep sneaking from your lips.. the feeling of being stretched is just too much.")

		saynn("After his orgasm, Luxe looks bored, he can't even reach his documents from here. Might as well try to chat..")

		saynn("[say=pc]W-why.. why are you against b-breeding?[/say]")

		saynn("[say=luxe]I've got enough kids. Too many for one guy even.[/say]")

		saynn("[say=pc]Why not m-more?[/say]")

		saynn("[say=luxe]Your job as a cocksleeve is to not ask questions.[/say]")

		if (!isVag):
			saynn("Fair enough.. You shut your mouth and just wait for his knot to start deflating.. That's when Luxe pulls out, making you arch your back and let out another loud moan, his seed instantly starts to leak out of your used stretched fuckhole.")

		else:
			saynn("Fair enough.. You shut your mouth and just wait for his knot to start deflating.. That's when Luxe ties the condom up and pulls out, making you arch your back and let out another loud moan, most of his seed neatly contained in the rubber.. but some got onto the floor.. Your used stretched fuckhole is still pulsing.")

		saynn("[say=luxe]Clean up.[/say]")

		saynn("[say=pc]Yes..s.. of course..[/say]")

		saynn("You slide down the desk and begin licking the remains of the rough fuck.")

		saynn("[say=luxe]Wait. Don't fucking lick it. Use this.[/say]")

		saynn("He hands you a wet sponge and heads towards his chair.")

		saynn("Yeah, your horny mind was a little bit ahead of him.")

		saynn("You grab the sponge and clean the various lewd fluids that ended up on his desk and floor.. as best as you can.")

		saynn("[say=luxe]Now go.[/say]")

		saynn("Your legs are still shaky.. so you take your time.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sexmar_start"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe", bodyState={leashedBy="luxe"}})
		saynn("[say=pc]Hey, Luxe..[/say]")

		saynn("Even just the intonation in your voice is enough for him to perk his ears. Luxe slowly gets up and stands in front of his desk, his clawed digits calling you to get closer.")

		saynn("Obviously, you obey his call and close the distance, your head lowered as a million dirty thoughts rush through it.")

		saynn("[say=pc]Can I be your cocksleeve again..[/say]")

		saynn("[say=luxe]You can.[/say]")

		saynn("Somehow, he seems more.. talkative.. even though he only said two words.")

		saynn("[say=luxe]You can be my cock's slave, how about that?[/say]")

		saynn("He leans forward, his hand raises your chin to make you look at him.")

		saynn("[say=luxe]I won't stop until you drain me completely.[/say]")

		saynn("Sounds intimidating.. and exciting..")

		saynn("[say=pc]S-sounds g-good..[/say]")

		saynn("Click.")

		saynn("You don't even realize that he clicks a leash to your collar, his hand is so swift.")

		saynn("He leads you towards a door.. but not the exit of his office.. but rather his personal room..")

		addButton("Follow", "See what happens next", "sexmar_room")
	if(state == "sexmar_room"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="luxe", pc="pc", bodyState={naked=true,hard=true}})
		saynn("Luxe's private quarters.. are quite spacious.. and just as rich as his office. Your sight is stolen by the big double bed that is placed against one of the walls, various golden patterns carved into its panels.. but that's not where he is leading you.")

		saynn("The wolf pulls out some chains and attaches them to the special ceiling hooks. His usual cold gaze holds a different edge tonight.. something possessive.. something darker.")

		saynn("Without a word extra, Luxe takes your wrists and snaps heavy cuffs around them before lifting them above your head, securing you to the chains. The steel pulls tightly, leaving you standing on your toes, completely vulnerable and at this mercy.")

		saynn("[say=pc]Ah.. you have a nice room.[/say]")

		saynn("[say=luxe]Mmh.[/say]")

		addButton("Continue", "See what happens next", "sexmar_undress")
	if(state == "sexmar_undress"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="luxe", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]..and a nice cock..[/say]")

		saynn("He takes off his usual uniform, revealing himself fully to you, his golden marks are all on display.. and his canine sheath with a hard glowing shaft housed in it.")

		saynn("You feel his scent now.. thick and musky.. sharp and raw.. it's making your head spin. The room is clearly getting warmer..")

		addButton("Continue", "See what happens next", "sexmar_circle")
	if(state == "sexmar_circle"):
		playAnimation(StageScene.HangingSex, "tease", {npc="luxe", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("He circles you slowly, his powerful frame prowling with control.. dominance. He stops just behind you, so close you can feel the head radiating from his chest against your back. One large, clawed hand traces down your spine, sending shivers through your {pc.masc} body as he explores each exposed inch. His hot breath is on your neck.. you can feel his lips graze your ear as he rumbles a deep, low growl.. it makes your body tremble.. it makes you want him..")

		saynn("[say=pc]When are gonna..[/say]")

		saynn("[say=luxe]Soon.[/say]")

		saynn("His other hand wraps around your throat, his claws dig in ever so slightly, asserting his total control over you.. and testing your limits. He makes you arch your back in just the way that he wants..")

		addButton("Ass", "Luxe will fuck your ass", "sexmar_pick_ass")
		addButtonWithChecks("Pussy", "Luxe will fuck your pussy with a condom", "sexmar_pick_pussy", [], [[ButtonChecks.HasReachableVagina]])
	if(state == "sexmar_sex"):
		playAnimation(StageScene.HangingSex, "sex", {npc="luxe", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true, condom=isVag}})
		if (isVag):
			saynn("Quickly, he fetches a condom and spreads it over his length.")

		saynn("Without another sound, he aligns himself behind you, his knotted, throbbing length pressing against your "+str("butt, teasing your {pc.anusStretch} entrance" if !isVag else "slick folds, teasing your {pc.pussyStretch} pussy entrance")+". One powerful hand grips your {pc.thick} hip tightly, pulling you back toward him as he pushes forward, his thick cock pressing inside, stretching you to take him!")

		saynn("[say=pc]Ah!..[/say]")

		saynn("His grip on your waist increases, fingers digging into your flesh as he begins to move, his hips slamming against you, making you take his glowing gold length again and again, keeping your "+str("tailhole" if !isVag else "folds")+" stretched wide open..")

		saynn("Luxe sets a slow, punishing rhythm at first, each thrust is making you feel like you're about to break, the pressure inside you builds, your inner walls gripping his cock nice and tight..")

		addButton("Continue", "See what happens next", "sexmar_fast")
	if(state == "sexmar_fast"):
		playAnimation(StageScene.HangingSex, "fast", {npc="luxe", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true, condom=isVag}})
		saynn("And soon, Luxe begins to fuck you faster, driving his cock deeper, his knot swelling and stretching you.. but not fitting inside anymore, instead just making you writhe against him. Juicy moans escape your lips, combining with the sounds of bodies slapping against each other..")

		saynn("[say=pc]I love your cock.. ah..[/say]")

		saynn("His hand grabs your neck again, forcing you back against him as he pounds into you, his powerful body fully taking you. With each powerful thrust, his knot presses harder, straining, stretching..")

		saynn("Yeah, he is not stopping now.. you can tell it by now..")

		addButton("Continue", "See what happens next", "sexmar_cum1")
	if(state == "sexmar_cum1"):
		playAnimation(StageScene.HangingSex, "inside", {npc="luxe", pc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true, condom=isVag}})
		saynn("With a final, forceful motion, he rams the whole length inside your "+str("ass" if !isVag else "cunt")+", locking himself with you as his knot pushes past your "+str("anal ring" if !isVag else "pusy folds")+", sealing the two of you together.")

		saynn("A quiet growl escapes him as his cock starts throbbing inside you, stuffing its load deep inside, pulsing deep within.. You can feel each spasm, his thick cum flooding into "+str("you" if !isVag else "the, seemingly unbreakable, condom inside your womb")+".. with nothing leaking out..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your "+str("prostate" if !isVag else "g-spot")+" gets smashed by the fat orb, causing your little locked cock to start wasting its load, shooting weak spurts of {pc.cum} onto the floor, your own orgasm is sending you shaking..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your "+str("prostate" if !isVag else "g-spot")+" gets smashed by the fat orb, causing your {pc.penis} to start wasting its load, shooting strong spurts of {pc.cum} onto the floor, your own orgasm is sending you shaking..")

		elif (GM.pc.hasReachableVagina()):
			saynn("Your pussy is pulsing around "+str("empty air, this anal pounding" if !isVag else "that shaft, the pounding")+" is enough to make you cum, your own sudden orgasm sending you shaking..")

		saynn("Bound, knotted and claimed.. The hot breath on your neck is adding to it.. making you squirm and clench around him..")

		saynn("[say=pc]Nhh.. f-fuck..[/say]")

		saynn("The wolf takes a small breather, his full length still inside you..")

		saynn("[say=luxe]We're only getting started.[/say]")

		saynn("Oh shit..")

		addButton("Continue", "See what happens next", "sexmar_fullnelson")
	if(state == "sexmar_fullnelson"):
		playAnimation(StageScene.SexFullNelson, "sex", {pc="luxe", npc="pc", bodyState={naked=true,hard=true, condom=isVag}, npcBodyState={naked=true, hard=true}})
		saynn("While his cock is still fully inside, Luxe uncuffs your hands and catches you, his hands snake under your knees and pin them up high against your shoulders before locking behind your head, grabbing into a full nelson hold.")

		saynn("Just as before, you are completely helpless, your feet dangling high, your body fully locked by his powerful hands..")

		saynn("With one swift motion, he yanks his knot out of your stuffed ass, making your asshole gape and start leaking cum.. but only for a few moments"+str(", while he switches condoms," if isVag else "")+" before he starts thrusting inside you with raw, unrestrained force, this new angle allowing him to hit your "+str("prostate" if (GM.pc.hasPenis() && !isVag) else "most sensitive spots")+" with greater force.")

		saynn("[say=pc]Ah.. f-fuck!.. You're gonna break me!..[/say]")

		saynn("[say=luxe]I do.[/say]")

		addButton("Continue", "See what happens next", "sexmar_fullnelson_fast_cum")
	if(state == "sexmar_fullnelson_fast_cum"):
		playAnimation(StageScene.SexFullNelson, "fast", {pc="luxe", npc="pc", bodyState={naked=true,hard=true, condom=isVag}, npcBodyState={naked=true, hard=true}})
		saynn("The pose is forcing to take him entirely, Luxe is fucking you faster and stronger, bringing you down onto his shaft with great strength, the heat making your heart beat insanely fast.")

		saynn("[say=pc]I'm.. I'm gg-gonna.. Ahh![/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your orgasm catches up with you again, your poor "+str("prostate is begging for mercy as the fat shaft is massaging it relentlessly, milking it for all its fluids" if !isVag else "g-spot is begging for mercy as the fat shaft is kneading it relentlessly during the rough pounding")+". Your locked away cock throbs in its little cage and starts dripping {pc.cum} eagerly, in rhythm with the rough pounding..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your orgasm catches up with you again, your "+str("prostate is begging for mercy as the fat shaft is massaging it relentlessly, milking it for all its fluids" if !isVag else "g-spot is begging for mercy as the fat shaft is kneading it relentlessly during the rough pounding")+". Your own dick throbs and starts dripping {pc.cum} eagerly, in rhythm with the rough pounding..")

		elif (GM.pc.hasReachableVagina()):
			saynn("Your orgasm catches up with you again, your poor g-spot is begging for mercy as the fat shaft is massaging it relentlessly during this. Your pussy pulses and starts squirting, releasing girlcum in short bursts, in rhythm with the rough pounding..")

		else:
			saynn("Your orgasm catches up with you again, your pleasure spots are all begging for mercy as the fat shaft is massaging them relentlessly. You're cumming from the rough pounding..")

		saynn("With every thrust, you can feel his knot swallowing again, the pressure building up until he pulls you down hard against his cock, forcing his fat orb inside you once more. The combination of your helplessness and his dominance drives you wild, his glowing member pumping "+str("your ass full of his virile seed again" if !isVag else "the fresh condom in your pussy full of his virile seed again")+".")

		saynn("[say=luxe]Nh..[/say]")

		saynn("[say=pc]So much.. oh fu-uck.. oh fuck..[/say]")

		saynn("Your belly is actually glowing a bit, the golden accents showing through.. and it's also growing too, the cum that is being pumped into it is making it look slightly bigger.."+str(" How is that condom still holding.." if isVag else "")+"")

		saynn("He doesn't stop too, moving his hips, his cock is shifting inside you, stretching you out more and more..")

		saynn("[say=pc]"+str("My ass" if !isVag else "My pussy")+".. you s-stuffed me..[/say]")

		saynn("[say=luxe]I'm not done with you yet.[/say]")

		saynn("[say=pc]Wha-a..[/say]")

		saynn("Still in this full nelson pose, he brings you to his king-sized bed..")

		addButton("Continue", "See what happens next", "sexmar_mating")
	if(state == "sexmar_mating"):
		playAnimation(StageScene.SexMatingPress, "sex", {pc="luxe", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("He gives you just a moment to catch your breath.. before yanking his cock out and throwing you onto his bed.")

		saynn("[say=pc]AH![/say]")

		saynn("The landing is soft, luckily.. But that can not be said for what happens next."+str(" Luxe takes off the filled rubber.. ties it up.. and looks at you, a fresh condom in his hands." if isVag else "")+"")

		if (isVag):
			saynn("[say=pc]Luxe?..[/say]")

			saynn("He deliberates for a bit.. and then throws the condom to the side.")

			saynn("[say=pc]Oh?..[/say]")

		saynn("Luxe's hands raise your legs onto his shoulder and pin you into the sheets, your back pressed firmly against the surface.")

		saynn("He's got you into a firm mating press.. and that gives him complete control, allowing him to thrust into you again, the angle is perfect to start pounding your "+str("ass, your gaping asshole eagerly stretching against to fit his length." if !isVag else "cunt, your gaping pussy eagerly stretching against to fit his length.. Feels so much better without a rubber..")+"")

		saynn("[say=pc]I love your cock![/say]")

		saynn("[say=luxe]Good. Take it all.[/say]")

		addButton("Continue", "See what happens next", "sexmar_mating_fast")
	if(state == "sexmar_mating_fast"):
		playAnimation(StageScene.SexMatingPress, "fast", {pc="luxe", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("As the heat between you builds, Luxe changes his rhythm, pulling out almost entirely before slamming his cock back in, the slaps echoing around the room. Your body arches against him, your needy "+str("asshole" if !isVag else "flower")+" clenching, trying to milk his balls dry as you approach another peak..")

		saynn("Luxe's thrusts are becoming more urgent.. he puts more strength into them.. until the knot gets forced into you again.. and then again and again, your "+str("tailhole" if !isVag else "pussy")+" got stretched enough for him to be able to yank his orb out and force it back inside before your ring closes up..")

		saynn("[say=pc]Fuc-ck! You're knot-fucking me!..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("It doesn't take long for your caged member to start leaking {pc.cum} again, your balls are pretty much drained by this point, your "+str("prostate" if !isVag else "g-spot")+" smashed to bits..")

		elif (GM.pc.hasReachablePenis()):
			saynn("It doesn't take long for your {pc.penis} to start leaking {pc.cum} again, your balls are pretty much drained by this point, your "+str("prostate" if !isVag else "g-spot")+" smashed to bits..")

		elif (GM.pc.hasReachableVagina()):
			saynn("It doesn't take long for your pussy to gush with fluids again.. just much less.. as that cock is leaving you drained by this point..")

		else:
			saynn("It doesn't take long for you to cum again, your ass desperately squeezing that cock..")

		addButton("Continue", "See what happens next", "sexmar_mating_cum")
	if(state == "sexmar_mating_cum"):
		playAnimation(StageScene.SexMatingPress, "inside", {pc="luxe", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("As Luxe reaches his limit, he lets out a primal animal growl and forces his whole length inside you again, the knot locking you both together! Feeling the immense pressure, you cry out in ecstasy, your orgasm keeps getting prolonged, your body squirming under him.")

		if (!isVag):
			saynn("Luxe leans down and stares you directly into the eyes as his cock starts throbbing inside you again, somehow stuffing even more of his potent cum inside your ass, your legs shaking wildly as his balls are tensing up.. again and again.. pushing his load inside..")

		else:
			saynn("Luxe leans down and stares you directly into the eyes as his cock starts throbbing inside you.. Now that the condom is gone, his potent cum is getting pumped directly into your babymaker, filling it to the brim, your legs are shaking wildly as his balls are tensing up.. again and again.. pushing his load inside..")

		saynn("You see the fire in his eyes.. that primal spark. It spreads waves of heat through you too.. a little too much perhaps..")

		saynn("The wolf keeps grunting.. until your clenching, used fuckhole leaves him dry.")

		saynn("[say=luxe]Nothing but prey.. my prey.[/say]")

		saynn("Feels good to be his prey..")

		addButton("Continue", "See what happens next", "sexmar_after_mating")
	if(state == "sexmar_after_mating"):
		playAnimation(StageScene.Solo, "stand", {bodyState={naked=true}})
		saynn("Slowly, after you both begin to come down back to your senses after that crazy.. marathon.. of rough passion..")

		saynn("Luxe is still panting, even after yanking his knotted cock out of you.. probably because it's so hot in here.. why is it so hot in here..")

		saynn("[say=luxe]..h.. f-fuck.[/say]")

		saynn("He suddenly puts his hand onto his chest.. the tips of his fur are shining.. no, they're burning! And soon, the wolf collapses by your side, onto the bed.")

		saynn("[say=pc]Luxe? Hey, are you okay?![/say]")

		saynn("[say=luxe]..p-pills..[/say]")

		saynn("You see his eyes.. he is in huge pain.. all the while the room is getting hotter and hotter. Oh shit.")

		saynn("[say=pc]Pills, yes, pills. Where are they?[/say]")

		saynn("Luxe is not saying anything.. just grunting and gritting his teeth.")

		saynn("[say=pc]Luxe, you have to tell me.[/say]")

		saynn("[say=luxe]..d-desk.. c-code.. 52734..[/say]")

		saynn("Right..")

		addButton("Desk", "Go grab his pills", "sexmar_pills")
	if(state == "sexmar_pills"):
		playAnimation(StageScene.BreastFeeding, "tease", {pc="luxe", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You rush to his desk and enter the code.. opening the drawers. There are a lot of things there.. a gun, some documents, lots of little thumb drives.. a sealed urn.. some kind of old burnt-looking chastity cage.. and a pill bottle! You grab it and run back to Luxe.. who seems to be burning up from inside..")

		saynn("A single pill later.. you hear a loud sigh of relief coming from him. The room temperature begins to calm down..")

		saynn("[say=luxe]Hhh..[/say]")

		saynn("[say=pc]Are you okay?..[/say]")

		saynn("[say=luxe]About as good as I look.[/say]")

		saynn("[say=pc]So, not okay?[/say]")

		saynn("A single chuckle escapes his lungs.. before he leans back and lets his head fall onto a comfy pillow.")

		saynn("[say=luxe]I need a rest.[/say]")

		saynn("[say=pc]Yeah.. I will leave you to it.[/say]")

		saynn("Suddenly, his hand grabs you by the collar and pulls you onto him.")

		saynn("[say=luxe]No you don't.[/say]")

		saynn("Snuggles, yay..")

		addButton("Rest", "Rest with him", "sexmar_rest")
	if(state == "sexmar_rest"):
		playAnimation(StageScene.Sleeping, "sleep", {pc="luxe", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("Luxe snores quietly, one of his hands wrapped around you, keeping you on his chest. It's getting kinda chilly actually.. but his fur helps.")

		saynn("You take a little nap too.. but the wear and tear that his cock inflicted on you is making that a little problematic, your body keeps wanting to squirm..")

		saynn("[say=luxe]My young days are long gone.[/say]")

		saynn("He opens his eyes, his voice low and rumbly.")

		saynn("[say=pc]What are you talking about, you're still amazing..[/say]")

		saynn("He looks at you and hums.")

		saynn("[say=luxe]Tell me that thirty minutes ago.[/say]")

		saynn("[say=pc]That was just a.. I don't know what it is. Heart problems?[/say]")

		saynn("He sighs.")

		saynn("[say=luxe]Kinda like that.[/say]")

		saynn("[say=pc]You don't have to tell me, I understand.[/say]")

		saynn("A silence emerges. Only two souls breathing keep it from being complete..")

		saynn("[say=luxe]DNA splicing. The experiment was a little too advanced for my times so it came with some.. complications.[/say]")

		saynn("[say=pc]Syndicate is doing DNA experiments?[/say]")

		saynn("AlphaCorp is probably not shy of doing it too.")

		saynn("[say=luxe]Mhm. That's the idea of Syndicate. Free to do whatever you can. As long as it helps the cause.[/say]")

		saynn("Free to enslave people..")

		saynn("[say=pc]That's freedom.. in a way.[/say]")

		saynn("[say=luxe]It is. I wouldn't have it any other way.[/say]")

		saynn("[say=pc]It's nice to live a life of no regrets.[/say]")

		saynn("Luxe doesn't say anything back.. so you just snug to him a little better.. and rest.")

		addButton("Rest more", "Just cuddle the wolf", "sexmar_after_cuddlecuddle")
	if(state == "sexmar_after_cuddlecuddle"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("But at some point.. it was time to get up.")

		saynn("[say=luxe]I gotta return to my work.[/say]")

		saynn("[say=pc]Yeah.. of course.. uh.. thanks.[/say]")

		saynn("He tilts his head.")

		saynn("[say=luxe]Why?[/say]")

		saynn("[say=pc]Uh.. for making me your cocksleeve.. I thought I'd say that..[/say]")

		saynn("He lowers his stare.. and nods.")

		saynn("[say=luxe]Mhm.[/say]")

		saynn("Luxe rubs his eyes, his cold demeanor is seemingly back.")

		saynn("And so, after that slightly awkward exchange, he brings you out of his room and office..")

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
		setFlag("SlaveAuctionModule.luxeSexProgress", Util.maxi(getFlag("SlaveAuctionModule.luxeSexProgress", 0), 1))

	if(_action == "deepthroat_start"):
		processTime(5*60)
		setFlag("SlaveAuctionModule.luxeSexProgress", Util.maxi(getFlag("SlaveAuctionModule.luxeSexProgress", 0), 2))

	if(_action == "sexdesk_start"):
		processTime(5*60)
		setFlag("SlaveAuctionModule.luxeSexProgress", Util.maxi(getFlag("SlaveAuctionModule.luxeSexProgress", 0), 3))

	if(_action == "sexmar_start"):
		processTime(5*60)
		setFlag("SlaveAuctionModule.luxeSexProgress", Util.maxi(getFlag("SlaveAuctionModule.luxeSexProgress", 0), 4))
		getModule("SlaveAuctionModule").addLuxeAffection(1.0)

	if(_action == "under_table"):
		processTime(3*60)

	if(_action == "under_table_stroke"):
		processTime(5*60)

	if(_action == "under_table_suck"):
		processTime(3*60)

	if(_action == "under_table_suck_fast"):
		processTime(3*60)
		GM.pc.gotThroatFuckedBy("luxe")

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

	if(_action == "sexdt_desk"):
		processTime(3*60)

	if(_action == "sexdt_fuck"):
		processTime(3*60)

	if(_action == "sexdt_faster"):
		processTime(3*60)

	if(_action == "sexdt_cum"):
		processTime(5*60)
		GM.pc.gotThroatFuckedBy("luxe")
		addFilledCondomToLootIfPerk(getCharacter("luxe").createFilledCondom())
		GM.pc.orgasmFrom("luxe")

	if(_action == "sexdt_after"):
		processTime(3*60)

	if(_action == "sexdesk_choose_anal"):
		isVag = false
		setState("sexdesk_chose")
		return

	if(_action == "sexdesk_choose_vag"):
		isVag = true
		setState("sexdesk_chose")
		return

	if(_action == "sexdesk_sex"):
		processTime(3*60)

	if(_action == "sexdesk_fast"):
		processTime(3*60)
		if(isVag):
			GM.pc.gotVaginaFuckedBy("luxe")
		else:
			GM.pc.gotAnusFuckedBy("luxe")

	if(_action == "sexdesk_cum"):
		processTime(3*60)
		
		if(isVag):
			GM.pc.gotVaginaFuckedBy("luxe")
			addFilledCondomToLootIfPerk(getCharacter("luxe").createFilledCondom())
		else:
			GM.pc.gotAnusFuckedBy("luxe")
			GM.pc.cummedInAnusBy("luxe")
		GM.pc.orgasmFrom("luxe")

	if(_action == "sexdesk_after"):
		processTime(15*60)

	if(_action == "sexmar_room"):
		processTime(3*60)

	if(_action == "sexmar_undress"):
		processTime(3*60)

	if(_action == "sexmar_circle"):
		processTime(3*60)

	if(_action == "sexmar_pick_ass"):
		isVag = false
		setState("sexmar_sex")
		return

	if(_action == "sexmar_pick_pussy"):
		isVag = true
		setState("sexmar_sex")
		return

	if(_action == "sexmar_fast"):
		processTime(3*60)

	if(_action == "sexmar_cum1"):
		processTime(3*60)
		
		if(isVag):
			GM.pc.gotVaginaFuckedBy("luxe")
		else:
			GM.pc.gotAnusFuckedBy("luxe")
			GM.pc.cummedInAnusBy("luxe")
		
		GM.pc.orgasmFrom("luxe")

	if(_action == "sexmar_fullnelson"):
		processTime(3*60)

	if(_action == "sexmar_fullnelson_fast_cum"):
		processTime(13*60)
		
		if(isVag):
			GM.pc.gotVaginaFuckedBy("luxe")
		else:
			GM.pc.gotAnusFuckedBy("luxe")
			GM.pc.cummedInAnusBy("luxe")
		
		GM.pc.orgasmFrom("luxe")

	if(_action == "sexmar_mating"):
		processTime(5*60)

	if(_action == "sexmar_mating_fast"):
		processTime(5*60)

	if(_action == "sexmar_mating_cum"):
		processTime(13*60)
		
		if(isVag):
			GM.pc.gotVaginaFuckedBy("luxe")
			GM.pc.cummedInVaginaBy("luxe")
		else:
			GM.pc.gotAnusFuckedBy("luxe")
			GM.pc.cummedInAnusBy("luxe")
		
		GM.pc.orgasmFrom("luxe")

	if(_action == "sexmar_after_mating"):
		processTime(3*60)

	if(_action == "sexmar_pills"):
		processTime(3*60)

	if(_action == "sexmar_rest"):
		processTime(30*60)

	if(_action == "sexmar_after_cuddlecuddle"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isVag"] = isVag

	return data

func loadData(data):
	.loadData(data)

	isVag = SAVE.loadVar(data, "isVag", false)
