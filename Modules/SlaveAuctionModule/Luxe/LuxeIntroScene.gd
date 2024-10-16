extends SceneBase

func _init():
	sceneID = "LuxeIntroScene"

func _run():
	if(state == ""):
		aimCamera("market_luxe")
		setLocationName("Office")
		addCharacter("luxe")
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="mirri", npcAction="sit"})
		saynn("This corridor ends with a big door.. and this one is actually unlocked.")

		saynn("As you approach it.. you begin to hear the chatter behind it. You peek your head inside and see some kind of office..")

		saynn("A familiar black wolf is standing behind the desk while Mirri is sitting on a chair.")

		saynn("[say=mirri]What do you want now?[/say]")

		saynn("[say=luxe]About the latest auction..[/say]")

		saynn("Mirri gets up instantly.")

		saynn("[say=mirri]Hey, I've managed to sell that slave just fine! You just left too early![/say]")

		saynn("[say=luxe]Sit. The fuck. Down.[/say]")

		saynn("Wolf's cold tone is so strong, it's making you freeze up. Mirri keeps standing for a little longer.. before finally landing her half-naked butt back onto the chair.")

		saynn("[say=luxe]Don't interrupt me. You understand?[/say]")

		saynn("Mirri stays quiet, crossing her arms.")

		saynn("[say=luxe]Do you understand me, Mirri?[/say]")

		saynn("[say=mirri]Pf.. yes. My b.[/say]")

		saynn("[say=luxe]You clearly don't understand anything. You are not just ruining your image. You are ruining Blacktail's image. My image. You are making Syndicate seem weak. Single handedly.[/say]")

		saynn("Mirri seems to be just looking at her red claws, seeing if she needs to polish them.")

		saynn("The wolf stands tall, his eyes focussed on the catgirl. A silence ensures..")

		saynn("[say=mirri]What? Can I talk now?[/say]")

		saynn("[say=luxe]Don't play with me, you know better.[/say]")

		saynn("[say=mirri]Just listen to me for once and I won't have to. I sold that slave. Got a lot of credits. And there is gonna be more down the line. A lot more. Why the fuck are you always mad at me, dad?[/say]")

		saynn("Dad, huh. Mirri seems to be doing just fine under the verbal assault of her dad. Probably not the first time though..")

		saynn("[say=luxe]I'm mad because your rushed, bad decisions are having an effect on the whole family. A single ruined auction leaves a huge mark on me. Makes me look bad in front of the whole Syndicate.[/say]")

		saynn("[say=mirri]So that's what it's about, huh? It's about you? Ever thought about your daughter for once, DAD?[/say]")

		saynn("Their conversation is getting heated.. But Mirri's sarcastic tone is unable to move the wolf's cold demeanor even by an inch. The wolf is dead calm..")

		saynn("[say=luxe]Yes, I do, each time I have to solve the bullshit that you are causing. It's not about me.. it's about everything. Mirri, I gave you so many chances. I just can't..[/say]")

		saynn("You suddenly feel the whole room getting warmer.. The wolf grabs onto his heart, his glowing fur tips begin to dance like real fire.. but Mirri doesn't seem to be very concerned.")

		saynn("[say=mirri]Need help, dad?[/say]")

		saynn("In fact, she sounds bored. All the while you are almost sweating.. The wolf opens his desk and grabs a box of special pills. He takes one.. and swallows it..")

		saynn("[say=luxe]I'm fine..[/say]")

		saynn("Soon, the temperature begins to lower..")

		saynn("[say=luxe]Life works under simple rules. But life isn't simple. For now I'm only suggesting you reconsider your choices. If the time comes.. and nothing changes.. I will have to grab the leash into my own hands.[/say]")

		saynn("Mirri sighs.")

		saynn("[say=mirri]I hear you. But you weren't always a perfect slaver yourself. Everyone's gotta start off somewhere.[/say]")

		saynn("The wolf looks at the ceiling and sighs too.")

		saynn("[say=luxe]You are starting at the bottom of the ocean. And you think you can drain it before drowning in it yourself.[/say]")

		saynn("[say=mirri]You keep thinking that I'm dumb. I'm not dumb. I'm doing this because it's what's best for Blacktail.[/say]")

		saynn("[say=luxe]Then prove it. You can go.[/say]")

		saynn("Mirri looks around his giant office. Rich wooden furniture has golden trims to it, fitting the wolf's accent color. Behind the wolf is a giant map.. space map. It seemingly shows the whole galaxy.. compressed into a 2d view.. with certain systems outlined with different colors.")

		saynn("The catgirl gets up and prepares to leave.")

		saynn("[say=luxe]And tell that eavesdropper to come in on your way out.[/say]")

		saynn("[say=mirri]Huh?[/say]")

		saynn("Mirri walks out and sees you.")

		saynn("[say=mirri]Curiosity killed the cat, you know. Get the fuck in, say hello to my dad.[/say]")

		saynn("Might as well see what he has to say to you.")

		addButton("Step inside", "Step inside the office", "talk_with_luxe")
	if(state == "talk_with_luxe"):
		removeCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		saynn("You step inside the office.. while Mirri does the opposite, her feline tail brushing your leg on the way out, wagging actively from obvious frustration.")

		saynn("The wolf turns away, facing the map. You are greeted by complete silence.")

		saynn("You look around more.. but don't dare to sit. Dark.. is a good word to describe the room. Dark and gold. Huh, you notice that the space is actually updating in real time.. you notice little holograms of spaceships flying around, leaving trails of their routes.")

		saynn("[say=luxe]If I didn't know who you are, I'd have you killed. Goes without saying.[/say]")

		saynn("That's.. one way to greet someone. He turns around and looks at you. His stare is making you feel uneasy inside.")

		saynn("[say=luxe]But since you are helping our cause, I will tolerate you. One wrong move and I won't.[/say]")

		saynn("He looks at your collar.. and frowns.")

		saynn("[say=luxe]I'm not happy that an AlphaCorp slave is snooping around here now. Did I make myself clear?[/say]")

		setFlag("SlaveAuctionModule.customMirriGreeting", "If you wanna comment on that - don't. Just bring me more slaves to sell.")
		addButton("Yes", "Just say yes and get out of his way", "just_say_yes")
		addButton("Question", "Try to ask some questions", "try_ask_questions")
	if(state == "just_say_yes"):
		saynn("[say=pc]Yes, you did.[/say]")

		saynn("The wolf reaches into his desk and grabs a small wooden box. He opens it and takes an old-school looking cigar out of it. For some reason, he holds it near the tips of his mane.")

		saynn("He frowns.. hard.. and the cigar butt lights up red.")

		saynn("[say=luxe]Good. Now leave.[/say]")

		saynn("Disturbing his smoking session sounds like a pretty bad idea.. so you decide to take his advice and step out of the office.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "try_ask_questions"):
		saynn("[say=pc]I wanna ask a few questions.[/say]")

		saynn("Wolf is silently looking at you. The whole room is silently looking at you.")

		saynn("It's so quiet that you swear you hear your and his breathing.")

		saynn("[say=luxe]You don't.[/say]")

		saynn("The breeze is making you shiver. But you don't wanna give up that easily.")

		saynn("[say=pc]In fact, I do. I like what you did here. And now I'm very curious about some things. So?[/say]")

		saynn("The silent treatment feels like it will drag on forever. The wolf quietly leans against his desk.")

		saynn("He doesn't answer.")

		saynn("[say=pc]Hey. I helped sell an AlphaCorp slave.[/say]")

		saynn("[say=luxe]You get one.[/say]")

		saynn("That was.. a quick answer.")

		saynn("[say=pc]I get one?..[/say]")

		saynn("[say=luxe]I'm waiting.[/say]")

		addButton("Who", "Ask him who he is", "ask_who")
		addButton("Where", "Ask him where you are", "ask_where")
		addButton("Mirri", "Ask him about Mirri", "ask_mirri")
	if(state == "ask_who"):
		setFlag("SlaveAuctionModule.knowsLuxeName", true)
		saynn("[say=pc]Who exactly are you? I know that you are from Syndicate. Your second name is probably Blacktail. But you know.. a first name would be nice too.[/say]")

		saynn("[say=luxe]Luxe.[/say]")

		saynn("You feel like you're balancing on the knife's edge..")

		saynn("[say=pc]Alright, Luxe Blacktail. Has a nice ring to it. What are you doing here exactly?[/say]")

		saynn("He just silently looks you into the eyes. You notice.. fire.. in his stare.. while you are freezing more and more.")

		saynn("[say=pc]I get it, okay. Not the chatty type. I will leave you to it.[/say]")

		saynn("Luxe reaches into his desk and grabs a small wooden box. He opens it and takes an old-school looking cigar out of it. For some reason, he holds it near the tips of his mane.")

		saynn("He frowns.. hard.. and the cigar butt lights up red.")

		saynn("Passive smoking wasn't on your task list for today.. so you decide to leave the office.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "ask_where"):
		saynn("[say=pc]Where are we? Is this a space station? Or are we on a planet?[/say]")

		saynn("[say=luxe]Neither.[/say]")

		saynn("Well.. that does narrow it a bit.")

		saynn("[say=pc]Then.. that leaves.. a spaceship?[/say]")

		saynn("He just silently looks you into the eyes. You notice.. fire.. in his stare.. while you are freezing more and more.")

		saynn("[say=pc]I get it, okay. Not the chatty type. I will leave you to it.[/say]")

		saynn("Luxe reaches into his desk and grabs a small wooden box. He opens it and takes an old-school looking cigar out of it. For some reason, he holds it near the tips of his mane.")

		saynn("He frowns.. hard.. and the cigar butt lights up red.")

		saynn("Passive smoking wasn't on your task list for today.. so you decide to leave the office.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "ask_mirri"):
		saynn("[say=pc]Mirri and you.. Can I get some insight into your disagreement?[/say]")

		saynn("[say=luxe]Thinks she can enslave your whole prison by herself.[/say]")

		saynn("That's.. a big task. She is not alone anymore though.")

		saynn("[say=pc]And you think she won't be able to do it?[/say]")

		saynn("He just silently looks you into the eyes. You notice.. fire.. in his stare.. while you are freezing more and more.")

		saynn("[say=pc]I get it, okay. Not the chatty type. I will leave you to it.[/say]")

		saynn("Luxe reaches into his desk and grabs a small wooden box. He opens it and takes an old-school looking cigar out of it. For some reason, he holds it near the tips of his mane.")

		saynn("He frowns.. hard.. and the cigar butt lights up red.")

		saynn("Passive smoking wasn't on your task list for today.. so you decide to leave the office.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "talk_with_luxe"):
		processTime(15*60)

	setState(_action)
