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

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
