extends SceneBase

var luxeAns = ""

func _init():
	sceneID = "MirriRank2Scene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Mirri shoves the laptop into your face, a loud purr intersects her each word.")

		saynn("[say=mirri]Mirri Blacktail is now officially slaver rank 2! I'm so happy, I wanna kiss you! Wanna make out?[/say]")

		saynn("She shoves herself into your personal space and attempts to steal a kiss but you just keep her at a distance for now.")

		saynn("[say=pc]I thought you're the best slaver in the whole galaxy.[/say]")

		saynn("The catgirl instantly stops purring and suddenly bites your hand instead.")

		saynn("[say=pc]OW.[/say]")

		saynn("[say=mirri]I am, objectively.[/say]")

		saynn("She throws the laptop back onto her desk and rolls her eyes.")

		saynn("[say=mirri]And subjectively.. this list is completely meaningless, it didn't count what I did before going solo, that's total bullshit and they all know it.[/say]")

		saynn("[say=pc]You're not exactly doing everything solo now, do you?[/say]")

		saynn("Mirri tilts her head.")

		saynn("[say=mirri]Talking about yourself? You're just my running puppy. Catching slaves is like the smallest part of this whole business. Be glad that you don't have to worry about the rest, it's politics through and through, I fucking hate it.[/say]")

		saynn("[say=pc]So why do you care about it so much? The list and everything.[/say]")

		saynn("She shrugs.")

		saynn("[say=mirri]'Cause of dad? We need bigger numbers near our names so our family looks better. We are the Blacktail after all. Dad is gonna kill me if I fuck up.[/say]")

		saynn("Makes sense.")

		saynn("[say=luxe]Khhm..[/say]")

		saynn("You hear a male cough behind you. The room suddenly got colder.")

		saynn("[say=mirri]Speaking of..[/say]")

		addButton("Continue", "See what happens next", "luxe_comes_in")
	if(state == "luxe_comes_in"):
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe"})
		saynn("Wolf is standing near the entrance of Mirri's room, looking around.")

		saynn("[say=mirri]You came here to congratulate me? You shouldn't have![/say]")

		saynn("Mirri rushes to him, her voice sounds sarcastic.. but her tail is upright and wagging with excitement.")

		saynn("[say=luxe]No.[/say]")

		saynn("The catgirl lowers her chin and backs off, her tail going limp.")

		saynn("[say=mirri]Aw.[/say]")

		saynn("The wolf steps in further, taking his sweet time. His golden marks add to the dim lighting, coloring everything around him. He stops when he reaches the middle of the space, his aura alone is making you press yourself into one of the walls.")

		saynn("[say=luxe]Wondering if you changed your mind yet, Mirri.[/say]")

		saynn("Mirri sighs.. and then clenches her fists.")

		saynn("[say=mirri]I ain't giving you the coords, dad! Especially now, when my plan is working.[/say]")

		saynn("The wolf directs his attention to you, making you freeze in your spot. His amber eyes are judging you.")

		saynn("[say=luxe]There is no time to argue, Mirri.[/say]")

		saynn("[say=mirri]I'm doing what's best for this family![/say]")

		saynn("[say=luxe]Right now we all have to do what's best for Syndicate.[/say]")

		saynn("Mirri growls and just sits behind her desk, her eyes staring into the laptop.")

		saynn("[say=mirri]Whatever, I'm trying to prove something to a deaf person it seems..[/say]")

		saynn("The silence insures. It's so quiet that you swear you went deaf yourself.")

		saynn("[say=luxe]Come.[/say]")

		saynn("[say=mirri]Why? I'm tired of yapping into the abyss. Let's just skip it, I.. I just want to take a nap.[/say]")

		saynn("[say=luxe]Not you.[/say]")

		saynn("Mirri raises a brow, her mean eyes looking at you.. just like the wolf's.. After all this, somehow you got a huge light projector put on you..")

		saynn("[say=mirri]Really? Fine, whatever.[/say]")

		saynn("The catgirl gets up and almost clips your shoulder as she walks past you.. before hitting the bed.")

		saynn("The wolf steps out the room.. Mirri gives you one last look.. a sad one.")

		addButton("Follow", "See what he has to say to you", "luxe_office")
	if(state == "luxe_office"):
		removeCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="luxe", npcAction="sit"})
		aimCamera("market_luxe")
		setLocationName("Office")
		saynn("You follow him to his giant office that has a big holographic map on its main wall and a lot of expensive wooden furniture.")

		saynn("The wolf sits behind his desk and pops some pill before leaning back in his grand chair.")

		saynn("You have exactly zero idea where to stand.. so you just stand in the middle of his office.")

		saynn("The wolf gazes upon you.. silently. His expression changes a few times.. subtly.")

		saynn("After some time, he finally breaks the ice with a first question.")

		saynn("[say=luxe]Do you know why we, Blacktail, do what we do?[/say]")

		addButton("Money", "Obviously they are just doing it for the credits", "say_money")
		addButton("Power", "They do it to feel power over others", "say_power")
		addButton("Fun", "There is fun to be had in breaking and selling slaves", "say_fun")
		addButton("Sex", "Fucking and breeding slaves. Obviously", "say_sex")
	if(state == "say_money"):
		if (luxeAns == "money"):
			saynn("[say=pc]Money? Credits?[/say]")

			saynn("The silent gaze judges you more.")

			saynn("[say=luxe]Correct.[/say]")

			saynn("That's almost boring..")

			saynn("The wolf takes another pause to look at you. His silence feels heavier than his words..")

			saynn("[say=luxe]It's not a matter of simple greed as you might think. Slaves are the foundation of the Syndicate's economy. A war economy.[/say]")

			saynn("Wow. That's one healthy economy they got here. After some time, he speaks again, his tone measured and deep.")

		elif (luxeAns == "power"):
			saynn("[say=pc]Power? You do it to feel power over others.[/say]")

			saynn("The silent gaze hardens.. and the wolf barely nods, his eyes narrowing.")

			saynn("[say=luxe]True enough. But power is just a tool for us, something practical. An essential evil.[/say]")

			saynn("The wolf holds his silence for a moment.")

			saynn("[say=luxe]Power creates structure. And structure is needed if you want an efficient war time economy.[/say]")

			saynn("It's always about money, huh. Who would have guessed.")

		elif (luxeAns == "fun"):
			saynn("[say=pc]I think you do it for fun. Breaking slaves is fun. And so is selling them, seeing their terrified faces for the last time.[/say]")

			saynn("The wolf's expression tightens.")

			saynn("[say=luxe]Fun? My family doesn't survive on fun. Syndicate doesn't either. Everything we've built is held together by war and sacrifice. Pleasure is a distraction, not a purpose.[/say]")

			saynn("His unforgiving eyes lock on yours.")

			saynn("[say=luxe]This is business, not entertainment. The Syndicate is what it is today because of a constant flow of resources. Resources that we, Blacktail, provide.[/say]")

			saynn("So it is all just for money after all it seems.")

		elif (luxeAns == "sex"):
			saynn("[say=pc]Sex? You breed the slaves or just use them as your fucktoys. When they break, you just sell them and enslave new ones.[/say]")

			saynn("The wolf's jaw clenches ever so slightly.. but his tone remains cold.")

			saynn("[say=luxe]Breeding is no priority here. The Syndicate isn't some den of idle pleasures. And unlike some, I see no value in weakness or indulgence.[/say]")

			saynn("He shifts in his seat, his voice low and calculated.")

			saynn("[say=luxe]Blacktail provides funds, control and stability, keeping the gears of the war machine oiled up. That is our focus.[/say]")

			saynn("Funds, huh.")

		saynn("[say=luxe]Total control is the most efficient way to run any system. And our family has been providing the means to keep that system alive, sometimes alone.[/say]")

		saynn("[say=pc]Total control over people, you mean? Slavery.[/say]")

		saynn("A shadow flickers across the wolf's face as he nods.")

		saynn("[say=luxe]Without control, everything collapses into chaos. Corruption, inefficiency, madness. All of these are just other names for AlphaCorp.[/say]")

		saynn("You notice his mouth twist, just slightly, when he mentions AlphaCorp.")

		saynn("[say=luxe]They think they're different. That somehow they're more humane, more moral. But in the end, their methods are no better than ours.[/say]")

		saynn("[say=pc]Pretty rich coming from.. well, slavers.[/say]")

		saynn("The wolf leans forward, an unsettling glint in his eyes.")

		saynn("[say=luxe]Blacktail takes pride in what we are. And our slaves know who they are. We're not interested in illusions.[/say]")

		saynn("He looks at your bulky metal collar.")

		saynn("[say=luxe]You know it better than me by now, AlphaCorp sells lies, fake freedom.. illusions of free will. Illusion of democracy.[/say]")

		saynn("Huh.. the more you think about it.. you're not really different from the Syndicate slaves.. you just have a fancy label attached to you.. inmate.")

		saynn("[say=luxe]Syndicate is smaller. And yet, we're stronger. Because we're efficient.[/say]")

		saynn("[say=pc]Alright, sure. Sounds like you're gonna win eventually. Why do you need me then?[/say]")

		saynn("The wolf tilts his head slightly, not irritated.. but calculating.")

		saynn("[say=luxe]Need is a strong word. By all accounts, you should be chained to a wall somewhere in the deepest reaches of our little paradise.[/say]")

		saynn("You swallow, unsure where he is going with this. The wolf's gaze hardens, the glint in his eyes turning cold and metallic.")

		saynn("[say=luxe]Yet here you stand, alive and relatively unscathed. Might just be a case of dumb luck.. but I don't believe in luck.[/say]")

		saynn("[say=pc]You need something from me. Did I guess it right?[/say]")

		saynn("He takes his time, breathing in and out.")

		saynn("[say=luxe]I will be blunt, your prison holds a lot of value for Syndicate. Not just because of prisoners of war or as a source of new slaves. Secrets. Our secrets. I intend to help take them back.[/say]")

		saynn("[say=pc]So, what, you need an inside man? You have Mirri already, just use..[/say]")

		saynn("He interrupts, his tone like a cold steel edge. His stare is directed somewhere else..")

		saynn("[say=luxe]Mirri.. is an unpredictable element. Emotional, reckless. A weakness.[/say]")

		saynn("..but not for long. He establishes eye contact again.")

		saynn("[say=luxe]And you, inmate.. somehow have her attention. Don't let yourself believe for a moment that her interest in you will end in anything but destruction.. for her, or for you.[/say]")

		saynn("The statement hangs in the air. He leans back again, letting his words sink in.")

		saynn("[say=luxe]I'm offering you an alternative option. You help me get what I need.. exact coordinates of your station.. And then I won't have to do what I will have to do.[/say]")

		saynn("Coordinates.. the ones that Mirri somehow got a hold of? Them being on bad terms is why he needs you, it seems.")

		saynn("[say=luxe]Or, you can stay under Mirri's thumb and gamble with her.. affection.[/say]")

		saynn("The choice is clear..")

		saynn("[say=pc]What will happen to me?[/say]")

		saynn("[say=luxe]You will be spared.[/say]")

		saynn("Freedom? You're not sure how much you can trust a head of a Syndicate family..")

		saynn("[say=pc]I guess I will think about it.[/say]")

		saynn("He regards you again when that icy, unyielding stare.")

		saynn("[say=luxe]Mirri will never share those coordinates with you, especially now. So just play along. And make the right choice when the time comes.[/say]")

		saynn("Makes sense. The wolf relaxes in his chair.")

		saynn("[say=pc]Guess I will go now.[/say]")

		saynn("But, before you leave, he stops you..")

		if (!getFlag("SlaveAuctionModule.knowsLuxeName")):
			setFlag("SlaveAuctionModule.knowsLuxeName", true)
			saynn("[say=luxe]My name is Luxe. If you have something to discuss, I will be here.[/say]")

		else:
			saynn("[say=luxe]If you have something to discuss, I will be here.[/say]")

		saynn("Oh, that is different. Very different. You can almost feel the room becoming warmer.. cozier.")

		saynn("You nod and head for the exit.")

		addButton("Mirri", "Go check on her", "after_talk")
	if(state == "after_talk"):
		removeCharacter("luxe")
		addCharacter("mirri")
		aimCameraAndSetLocName("market_intro")
		playAnimation(StageScene.Sleeping, "sleep", {pc="mirri"})
		saynn("You follow the corridor and return back into Mirri's room.")

		saynn("There she is, still napping on her bed. Mirri is curled up in a very feline way, her tail draped lazily over her side, her ears twitching every so often. Her paws.. hands.. are tucked up near her face, shielding herself from whatever is lurking in her dreams.")

		saynn("Not sure what to do, you just stand still, watching her sleep, a strange sense of peace settling over the room. Mirri's closed eyes twitch.. and every so often, she lets out a small, barely audible whimper. It's kinda adorable.. but whatever she is dreaming about, it's a no walk in the park.")

		addButton("Continue", "See what happens next", "mirri_wakesup")
	if(state == "mirri_wakesup"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcAction=["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]})
		saynn("But then, you shift slightly, and a soft creak escapes from the wooden floor beneath you.")

		saynn("In an instant, Mirri's up. Before her eyes are even fully open, she's got her gun drawn, level directly at you, her face a mask of feral rage. Her pupils are narrow, wild and unfocused.. wow.")

		saynn("[say=pc]Chill, chill! You're having nightmares, Mirri.[/say]")

		saynn("Mirri blinks and the rage goes away, replaced by confusion. Her gaze locks on you as she processes where she is. Her breathing slows, the grip on her gun loosening. A second later, she lowers it, rubbing a hand over her face while smiling.")

		saynn("[say=mirri]Nightmares? Hah.. Nah, those are just funny dreams.[/say]")

		saynn("She tucks her gun away and rubs her eyes.")

		saynn("[say=mirri]That was a nice nap.[/say]")

		saynn("Mirri stretches and arches her back, her thighs and wrists shiver.. before a cute moan leaves her lips.")

		saynn("[say=mirri]Ah~. So.. What did the old man tell you? I'm a curious cat.[/say]")

		addButton("Truth", "Tell Mirri exactly what the wolf told you", "mirri_truth")
		addButton("Not much", "He just wanted to chat", "mirri_chat")
		addButton("Coords?", "Ask about how Mirri found your prison", "mirri_coords")
	if(state == "mirri_chat"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("[say=pc]Luxe just wanted to chat.[/say]")

		saynn("Mirri nods.. many times.")

		saynn("[say=mirri]Right, yeah, of course. Dad is so-o-o chatty.[/say]")

		saynn("[say=pc]Maybe not with you.[/say]")

		saynn("[say=mirri]Ouch. Fuck you.[/say]")

		saynn("Mirri growls.. but then stops.")

		saynn("[say=mirri]Listen, I know what he said. He wants the coords to your prison. You know why?[/say]")

		saynn("[say=pc]I don't care. It's my way out.[/say]")

		saynn("She chuckles hearing that.")

		saynn("[say=mirri]Yeah, your way straight out of this life and into the afterlife. Dad hates AlphaCorp, more than I do even. And he hates ANYONE who is even remotely related to AlphaCorp.[/say]")

		saynn("[say=pc]Why are you telling me that if you hate AlphaCorp yourself?[/say]")

		saynn("[say=mirri]Because! I feel like you wanna betray me and I don't like that. There is a good fucking reason behind why I will never tell him the coords.[/say]")

		saynn("[say=pc]You hate your dad more than you hate AlphaCorp?[/say]")

		saynn("[say=mirri]Maybe. But the real answer - it's not his fucking problem. I found the prison. I get to do whatever I want with it, it's FAIR.[/say]")

		saynn("She is discussing it so casually like she is not enslaving inmates and staff..")

		saynn("[say=pc]Are you really that much better than him?[/say]")

		saynn("[say=mirri]I don't have a cock so obviously I'm worse by default, sure. Go choke on his balls if you want, I couldn't care less. But you know why he actually wants the coords? Did you really think that he is doing it for Syndicate or his family name or whatever?[/say]")

		saynn("Luxe doesn't seem like the type that would lie..")

		saynn("[say=mirri]Once I hand him the coords on a silver platter, he will just relay them to other families and get all the fame for destroying your fucking prison! That's what he wants![/say]")

		saynn("[say=pc]And you're mad because you won't get shit?[/say]")

		saynn("[say=mirri]Yeah?! Wouldn't you be fucking furious if someone else took all the rewards for your efforts?[/say]")

		saynn("Somehow, you know exactly how Mirri feels.")

		saynn("[say=pc]Yeah, I'd be mad.[/say]")

		saynn("Mirri nods and finally lowers her voice.")

		saynn("[say=mirri]Now you see? I'm fucking glad I'm not alone in this.[/say]")

		saynn("She sits on the edge of her desk and looks down at the floor.")

		saynn("[say=mirri]I hate it sometimes. Do you hate me?[/say]")

		addButton("Kiss", "Kiss her out of hate", "mirri_kiss_hate")
		addButton("No hate", "Tell her that you don't hate her", "mirri_nohate")
		addButton("Luxe is right", "Tell her that her father is right and she should just listen to him", "mirri_listendad")
	if(state == "mirri_coords"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("[say=pc]Can you tell me how you found BDCC?[/say]")

		saynn("Mirri tilts her head, her gaze narrowing.")

		saynn("[say=mirri]You'd have to try harder than that.[/say]")

		saynn("Looks like she won't just tell you anything indeed.")

		saynn("[say=pc]What?[/say]")

		saynn("[say=mirri]I'm dumb. But I'm not this dumb.[/say]")

		saynn("[say=pc]What are you talking about?[/say]")

		saynn("She growls.")

		saynn("[say=mirri]Shut up and answer my question.[/say]")

		addButton("Truth", "Tell Mirri exactly what the wolf told you", "mirri_truth")
		addButton("Not much", "He just wanted to chat", "mirri_chat")
		addButton("Silence", "Not say her anything", "mirri_silenttreatment")
	if(state == "mirri_silenttreatment"):
		setFlag("SlaveAuctionModule.r2outcome", "silence")
		saynn("She told you to shut up.. so you did just that.")

		saynn("[say=mirri]Very funny.[/say]")

		saynn("Mirri rolls her eyes.")

		saynn("[say=mirri]If you wanna play that game - whatever, like I give a fuck. You will never hear the coords from me.[/say]")

		saynn("Not in her current state.")

		saynn("[say=mirri]Keep bringing me slaves if you want your cut. That's all I care about.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "mirri_truth"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("You tell Mirri what Luxe told you.")

		saynn("[say=mirri]Yeah.. nothing new there. I heard it a million times. Syndicate, family, secrets, all of it. He is lying.[/say]")

		saynn("[say=pc]He doesn't seem like the kind that would lie.[/say]")

		saynn("Mirri walks up to her desk and sits on the edge.")

		saynn("[say=mirri]You know what he actually wants? Fame for destroying your prison. That is why he is so fucking cold to me all the time. To make me snap and tell him the coords. He didn't call me his daughter in years! I'm just.. Mirri.. to him.[/say]")

		saynn("Destroying BDCC.. That is your whole world.. current world.")

		saynn("[say=pc]So.. what's the profit in not giving him the coords? I doubt you can destroy the prison on your own and get any fame.[/say]")

		saynn("Mirri raises a brow at your question, the corners of her mouth raised.")

		saynn("[say=mirri]Wow, that's a bold statement, hah. I'm still the best Syndicate agent, don't forget that.[/say]")

		saynn("But then she lowers her head a bit.")

		saynn("[say=mirri]I found your prison on my own. Completely on my own. This is my mission, not anyone's else. I deserve that much, don't I?[/say]")

		saynn("You shrug. It feels weird to discuss this.")

		saynn("[say=mirri]I can destroy your prison. But I don't want to. Why would I? I get to enslave so many bitches.. so many assholes can get put into their place. It feels good to accomplish something. Ruining AlphaCorp's influence on this world, one slave at a time.[/say]")

		saynn("She looks at you.")

		saynn("[say=mirri]You hate me, don't you? I hate my dad. So it's okay if you hate me. Be honest, I ain't gonna kill you.[/say]")

		addButton("Kiss", "Kiss her out of hate", "mirri_kiss_hate")
		addButton("No hate", "Tell her that you don't hate her", "mirri_nohate")
		addButton("Luxe is right", "Tell her that her father is right and she should just listen to him", "mirri_listendad")
	if(state == "mirri_kiss_hate"):
		setFlag("SlaveAuctionModule.r2outcome", "kiss")
		playAnimation(StageScene.Hug, "kiss", {npc="mirri"})
		saynn("You close distance with Mirri, your noses almost collide..")

		saynn("She admires your eyes, her lips slightly parted, her tongue licking her fangs.")

		saynn("You silently watch her for a bit, putting on your most mean eyes.")

		saynn("[say=pc]You're a crazy, psycho bitch.[/say]")

		saynn("Mirri chuckles.. but is quickly silenced by your deep long kiss. Tongues get quickly involved, invading each other's mouths and sharing all the saliva during an intense, heated battle. Your kiss is passionate, raw, powerful.. as you both refuse to give an inch.")

		saynn("You press her against the wall, hands gripping her tightly.. while she doesn't reist. Instead, she meets you with that same fire, her paws running up your back, her claws digging in, leaving marks all across it.")

		saynn("[say=mirri]Yeah, I fucking hate you too~.[/say]")

		saynn("Her voice is low and breathy after that.. experience.")

		saynn("It was time to stop.")

		saynn("[say=mirri]Bring me more toys to sell, big {pc.boy}..[/say]")

		saynn("Mirri licks her lips while watching you.")

		saynn("[say=pc]Sure. Just be careful to not become one of those toys.[/say]")

		saynn("[say=mirri]Ha. I love you.[/say]")

		saynn("[say=pc]You just told me that you hate me.[/say]")

		saynn("[say=mirri]I love to hate you, AlphaCorp slave~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "mirri_nohate"):
		setFlag("SlaveAuctionModule.r2outcome", "nohate")
		saynn("[say=pc]I don't hate you. What you did makes sense in your situation.[/say]")

		saynn("You can't believe that you're agreeing with Syndicate.. with slavers, raiders and murderers.. and yet, it seems right.")

		saynn("[say=mirri]Does it? I feel like a failure all the time. And dad's cold heart doesn't help.[/say]")

		saynn("You approach her and gently scritch her under the chin.")

		saynn("[say=pc]You're a good girl. Screw dad.[/say]")

		saynn("Your ears pick up on faint purring.")

		saynn("[say=mirri]Can't believe that I'm agreeing with an AlphaCorp slave. But yeah, screw him.[/say]")

		saynn("You frown at that description.. while she looks away.")

		saynn("[say=mirri]He is still my dad though. What an asshole! GRrrr.. I can't. Can we just auction some more slaves off now?! We're doing so well, I wanna see others suffer, not focus on my own shit.[/say]")

		saynn("Fair enough, selling slaves is quite a distraction indeed.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "mirri_listendad"):
		setFlag("SlaveAuctionModule.r2outcome", "luxeisright")
		saynn("[say=pc]You know, maybe he is right though.[/say]")

		saynn("Mirri frowns.")

		saynn("[say=pc]Why not just give him the coords and move on with your life.[/say]")

		saynn("[say=mirri]He promised to spare you, didn't he?[/say]")

		saynn("Her paw hovers near her gun.")

		saynn("[say=mirri]Only my dad hates AlphaCorp slaves more than me. If you don't wanna be my bitch - I will make you my bitch. The rest you don't have to worry about, okay, fucker?[/say]")

		saynn("So defensive all of the sudden.")

		saynn("[say=pc]Whatever, you're a crazy psycho bitch yourself.[/say]")

		saynn("[say=mirri]I'm a psycho bitch all the time. But not until I'm really pissed. Bring me slaves to sell and you will get your cut. You and I both need credits.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "luxe_comes_in"):
		processTime(5*60)

	if(_action == "luxe_office"):
		processTime(5*60)

	if(_action == "say_money"):
		luxeAns = "money"
		setState("say_money")
		return

	if(_action == "say_power"):
		luxeAns = "power"
		setState("say_money")
		return

	if(_action == "say_fun"):
		luxeAns = "fun"
		setState("say_money")
		return

	if(_action == "say_sex"):
		luxeAns = "sex"
		setState("say_money")
		return

	if(_action == "after_talk"):
		processTime(20*60)

	if(_action == "mirri_wakesup"):
		processTime(3*60)

	if(_action == "mirri_truth"):
		getModule("SlaveAuctionModule").addMirriAffection(0.2)

	if(_action == "mirri_coords"):
		getModule("SlaveAuctionModule").addMirriAffection(-0.5)

	if(_action == "mirri_kiss_hate"):
		addMessage("You can now talk with Luxe at his office")
		getModule("SlaveAuctionModule").addMirriAffection(0.2)

	if(_action == "mirri_silenttreatment"):
		addMessage("You can now talk with Luxe at his office")
		getModule("SlaveAuctionModule").addMirriAffection(-0.5)

	if(_action == "mirri_nohate"):
		addMessage("You can now talk with Luxe at his office")

	if(_action == "mirri_listendad"):
		addMessage("You can now talk with Luxe at his office")

	setState(_action)

func saveData():
	var data = .saveData()

	data["luxeAns"] = luxeAns

	return data

func loadData(data):
	.loadData(data)

	luxeAns = SAVE.loadVar(data, "luxeAns", "")
