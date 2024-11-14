extends SceneBase

var lastChoice = ""

func _init():
	sceneID = "MirriRank3Scene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		lastChoice = getFlag("SlaveAuctionModule.r2outcome", "")
		# (( # kiss nohate luxeisright silence ))
		if (lastChoice == "kiss"):
			saynn("Mirri smiles and sticks her tongue out at you.")

			saynn("[say=mirri]Hey, lover, look, I reached the third rank! Yay and stuff.[/say]")

		elif (lastChoice == "nohate"):
			saynn("Mirri purrs softly.")

			saynn("[say=mirri]Hey, look, I reached the third rank! Yay and stuff.[/say]")

		elif (lastChoice == "luxeisright"):
			saynn("Mirri pokes your shoulder.")

			saynn("[say=mirri]I know you'd probably rather be sitting in my dad's lap but look, I reached the third rank![/say]")

		else:
			saynn("Mirri pokes your shoulder.")

			saynn("[say=mirri]I remember that our last talk didn't end so well. But look, I reached the third rank.[/say]")

		saynn("She points at her name in the big list of slavers.")

		saynn("[say=pc]Good job, you totally deserve it.[/say]")

		saynn("Her feline ears do pick up on the sarcasm notes in your voice.")

		saynn("[say=mirri]I wasn't sitting on my pretty butt all day, I was enslaving and selling too.. And fuck me, it's a lot of work breaking these stupid slaves..[/say]")

		saynn("[say=pc]So you know how I feel now, huh.[/say]")

		saynn("Mirri sits on the corner of her desk and pouts.. but then throws her head back and sighs at the ceiling.")

		saynn("[say=mirri]Yeah-h-h-h. I ain't gonna tell you I'm sorry. I'm too fucking tired for that.[/say]")

		saynn("She was this close to being nice to you for once.")

		saynn("[say=pc]Sounds like you need to reset.[/say]")

		saynn("[say=mirri]Reset? That's what the mind rewriter does, it resets your brain down to a blank slate.. maybe I could use something like that..[/say]")

		saynn("Her feline eyes look at you again.")

		saynn("[say=mirri]I could use some rest though.[/say]")

		saynn("She looks at the walls.. and then at her soft-looking bed. Bed that you would kill for..")

		saynn("[say=mirri]Nah.. There is no rest for me here. This place only reminds me of pointless grind and constant suffering.[/say]")

		saynn("Mirri genuinely looks tired, even her tail just lazily hangs from the side of her desk.")

		saynn("[say=pc]Prison has a few cozy spots.[/say]")

		saynn("A slight tilt of her head, her ears perk.")

		saynn("[say=mirri]Oh yeah?[/say]")

		addButton("Never mind", "(Cancel date) You'd rather not do anything with this woman", "cancel_date")
		addButton("Waterfall", "Show Mirri the waterfall", "waterfall")
	if(state == "cancel_date"):
		saynn("After what Mirri did, she doesn't deserve your kindness.")

		saynn("[say=pc]Actually, scratch that.[/say]")

		saynn("Mirri stays quiet.. and then nods a few times.")

		saynn("[say=mirri]Your prison is a giant dump, you don't have to give me more confirmation.[/say]")

		saynn("[say=pc]Rude. Your room is not much better.[/say]")

		saynn("[say=mirri]You couldn't have been more wrong actually. I fucking hate how clean it is.[/say]")

		saynn("[say=pc]You just hate everything.[/say]")

		saynn("You hear growling.")

		saynn("[say=mirri]You're very observant, slave. Just leave me alone, I need to think.[/say]")

		saynn("Best to just let her stir in her own emotions for now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "waterfall"):
		saynn("[say=pc]There is a good place. A bit loud though.[/say]")

		saynn("[say=mirri]Hopefully it's louder than all the voices, let's go![/say]")

		saynn("Mirri springs back to her hind paws and heads to the teleporter.")

		saynn("A blue rift illuminates the space.. It leads back to your cell.")

		saynn("[say=mirri]C'mon, what are you waiting for?[/say]")

		addButton("Lead her", "Bring Mirri to the place", "waterfall_tp")
	if(state == "waterfall_tp"):
		aimCameraAndSetLocName("yard_waterfall")
		GM.pc.setLocation("yard_waterfall")
		playAnimation(StageScene.GivingBirth, "idle", {pc="mirri"})
		saynn("The journey to the waterfall wasn't too eventful. Mirri's armor.. even if incomplete.. seems to be enough to fool most staff members.")

		saynn("You lead Mirri to the prison's yard.")

		saynn("[say=mirri]Green.. I like it here. Can't remember the last time I saw any greenery.[/say]")

		saynn("You follow the neat stone pathways.. and after a few turns.. you end up near a little waterfall.")

		saynn("[say=mirri]Ohhh![/say]")

		saynn("Mirri rushes to it and dips her paw into the artificial pond beneath it.")

		saynn("[say=mirri]I hate water.. but this feels nice.[/say]")

		saynn("She lays down near and just watches the water flow.. while you just sit on the bench nearby.")

		saynn("[say=mirri]Sounds like.. static.. white noise, you know?[/say]")

		saynn("[say=pc]Yeah, too loud?[/say]")

		saynn("She shakes her head.")

		saynn("[say=mirri]It's perfect.. Wanna cuddle maybe?[/say]")

		saynn("Cuddling with that crazy Syndicate bitch?.. Although, she doesn't seem to be very crazy at the moment..")

		saynn("Her blue eyes catch your hesitation.")

		saynn("[say=mirri]Listen.. I'm well aware of how I act sometimes. I know that I'm annoying.. occasionally.[/say]")

		saynn("[say=pc]Occasionally?[/say]")

		saynn("Her feline gaze pierces you.. but quickly pulls its daggers out.")

		saynn("[say=mirri]Yes, only occasionally. C'mon, it's a nice view. Get over here, I won't kill you if you do. It was your idea after all.[/say]")

		saynn("That's one way to invite someone.")

		addButton("Cuddle Mirri", "Rest together", "cuddle_mirri")
	if(state == "cuddle_mirri"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="mirri"})
		saynn("You get off the bench and join Mirri near the water, your hands wrap around her girly curves and pull her close to your chest.")

		saynn("The high-pitched sounds of running water are now interlaced with a quiet purring.")

		saynn("The peaceful view soothes your mind as well. A nice break from the slave business..")

		saynn("[say=mirri]There we go, you're so soft. I don't really have anyone to hang out with.[/say]")

		saynn("[say=pc]Don't you have a family?[/say]")

		saynn("[say=mirri]I do. It's a huge ass family.. huge pain in the ass too, especially how.. grr..[/say]")

		saynn("Mirri catches herself getting loud again and just stays quiet for some time, her paw playing with the water.")

		saynn("[say=mirri]..I think I know what's up with him and me.. I always knew, deep inside..[/say]")

		saynn("[say=pc]And what is that?[/say]")

		saynn("[say=mirri]Isn't it obvious? I'm different. My tail isn't even black.. and that's like, the whole thing of this family.. haha.[/say]")

		saynn("She's.. not wrong. Mirri wraps her red tail around her and yours waists.. like a rope.")

		saynn("[say=mirri]I thought about painting it, you know..[/say]")

		saynn("The tip of her tail looks at her.. like a cobra.")

		saynn("[say=mirri]Relax, I won't, I'm not that desperate. Yet.[/say]")

		saynn("Her tail calms down.. allowing both of you to continue resting.. The white noise scratches your brain in all the right ways..")

		saynn("[say=pc]You're sure it's about how you look? Does he really care that much?[/say]")

		saynn("She shrugs.")

		saynn("[say=mirri]I don't know. I guess he likes me less and less with each day because of my.. stubbornness. Still, he will have to accept me and my decision at some point. What other choice does he have?[/say]")

		saynn("Now it's your turn to shrug.")

		saynn("[say=mirri]What? I'm Blacktail, his genes are in me.[/say]")

		saynn("She looks at her paws.")

		saynn("[say=mirri]Some of my fur is black.. But, I guess, I took most of my genes from my mother.[/say]")

		saynn("[say=pc]Mother?[/say]")

		saynn("[say=mirri]Yeah, she was some kind of slut. That's all I know. Never even saw her once. I think she is still alive.. dad doesn't want to tell me about her.[/say]")

		saynn("Interesting.")

		saynn("[say=mirri]So it's either my mother.. or his scrambled DNA.. Makes me feel self-conscious all the time..[/say]")

		saynn("[say=pc]Like you don't fit in?[/say]")

		saynn("[say=mirri]I'm trying to. I'm simply doing my best, you know?[/say]")

		saynn("Mirri's best is.. quite crazy. But right now she is so.. different.. from her usual self.")

		saynn("[say=mirri]Can you.. call me a good girl?[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("She looks at you over her shoulder, her voice that of a mean cat.")

		saynn("[say=mirri]You heard me, you.. fucker..[/say]")

		addButton("Good girl", "Tell Mirri that she is a good girl", "say_goodgirl")
		addButton("Bad girl", "Tell Mirri that she is a bad girl", "say_badgirl")
		addButton("Crazy girl", "Tell Mirri that she is one crazy girl", "say_crazygirl")
	if(state == "say_badgirl"):
		saynn("She is anything but a good girl.")

		saynn("[say=pc]You're a bad girl, Mirri.[/say]")

		saynn("Mirri's eyes narrow, her lips revealing the tips of her sharp fangs.")

		saynn("[say=mirri]I hope that's a compliment.[/say]")

		saynn("Her words are a slow hiss, her tone dripping with irritation.")

		saynn("[say=pc]You're selling people, Mirri.[/say]")

		saynn("Suddenly, she leans back into you with full force, her ponytail whips you as she turns her head rapidly.")

		saynn("[say=mirri]You get a cut too, you fuck.[/say]")

		saynn("Things are getting heated fast. But you can't back away now.")

		saynn("[say=pc]Not a huge cut.[/say]")

		saynn("[say=mirri]And that makes it okay? You're just greedy.[/say]")

		saynn("[say=pc]And you're plain evil. You are NOT a good girl, not even close.[/say]")

		addButton("Continue", "See what happens next", "bad_pin")
	if(state == "bad_pin"):
		playAnimation(StageScene.SexStandRide, "tease", {pc="pc", npc="mirri"})
		saynn("Before you can finish, she grabs you by the collar and throws you into the nearest wall. Then, with a fluid, predatory grace, she shifts close and brings one of her legs up to your shoulder, pinning you. Her blue eyes are shining brightly.")

		saynn("[say=mirri]I'm a bad bitch, huh? I guess I should act like one then.[/say]")

		addButton("Shove her", "Shove Mirri away", "bad_shoveaway")
		addButton("Panties", "Get into her panties", "bad_panties")
	if(state == "bad_shoveaway"):
		playAnimation(StageScene.Duo, "shove", {npc="mirri", npcAction="hurt"})
		saynn("You shove her back. Since she was standing only on one leg, it was easy to make her lose her balance.. but you do feel her claws scratching your shoulders as she was trying to hold onto you.")

		saynn("[say=mirri]You.. fuck. Grrr.. Whatever, fuck you too then.[/say]")

		setFlag("SlaveAuctionModule.customMirriGreeting", "You're back, fucker? Bring me some slaves already, I don't care what else you have to say.")
		saynn("Mirri growls.. and just walks away, her tail wagging behind her.")

		saynn("That bitch.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "bad_panties"):
		playAnimation(StageScene.SexStandRide, "rub", {pc="pc", npc="mirri"})
		saynn("Her feline eyes look sharp, her ears perked up, waiting for you to continue insulting her.")

		saynn("Hm. The urge is too much.")

		saynn("You boldly reach your hand towards her legs.. and make it slip under the waistband of her striped panties. Mirri instantly tenses, her icy glare becoming even more venomous as she feels her fingers find her warm slit.")

		saynn("While she draws her claws out.. you just let your digits trace slow, taunting circles around her pussy entrance, rubbing her clit just enough for it to make her sway in place.")

		saynn("[say=pc]You're an awful girl, Mirri. Probably one of the worst ones that I have even seen. And I've seen a lot of bad bitches.. none of them come close. I understand your dad.[/say]")

		saynn("Her jaw clenches, her nostrils flaring as your words hit a nerve. And yet, she doesn't stop you, her breathing coming out faster as you continue to rub her, playing with her sensitive clit.. her flower becoming quite wet by now.")

		saynn("[say=mirri]You don't know ANYTHING about me, you stupid fuck..[/say]")

		saynn("[say=pc]I know enough, probably more than you. You're selling people like they're nothing.. turning lives into profit. No wonder you're so fucked up, you have zero morals.[/say]")

		saynn("Your fingers spread the wet folds and slip inside, exploring Mirri from inside while her mean eyes keep losing and regaining focus. Her breathing hitches, her body trembles ever so slightly.. but she is hiding it.")

		saynn("[say=pc]What? You're just gonna look at me? You just have nothing to say? That's because I'm right. And maybe your dad is right.[/say]")

		saynn("You hear growling.. but you keep going, rubbing and fingering her, feeling her slick inner walls clench around your digits while her hatred collides with her desire.")

		saynn("Mirri begins to lean closer and closer, her fangs are out, aiming to bite you.. her claws dig into your sides.. seemingly ready to pierce and tear..")

		saynn("But then, as if something snaps inside her, Mirri lunges forward, crashing her mouth against yours in a fast, fierce kiss. Her lips are demanding, brushing against yours with a fury, your tongues fighting it out in her mouth with a crazy dance of raw, brutal passion.")

		saynn("A broken gasp escapes her lips as she cums, her pussy pulsing around your digits as she squirms and trembles hard, her claws putting more pressure on your skin, drawing blood.. while you just keep pushing the muffled moans out of her.")

		saynn("After a good minute of pure ecstasy.. she pulls back, her eyes wild, her cheeks flushed, her body still tense..")

		saynn("[say=mirri]You.. f-fuck..[/say]")

		saynn("And just like that, she leaves, still panting softly.")

		saynn("Well, that was interesting.")

		setFlag("SlaveAuctionModule.customMirriGreeting", "I hate that I can't hate you enough.. Find me some slaves..")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "say_crazygirl"):
		saynn("[say=pc]You are.. a crazy girl.[/say]")

		saynn("You get a confused stare from Mirri.")

		saynn("[say=mirri]Is that a compliment?[/say]")

		saynn("[say=pc]It's just that. You're a crazy girl, Mirri.[/say]")

		saynn("[say=mirri]I don't know if crazy can be considered good.[/say]")

		saynn("[say=pc]Why do you act crazy then?[/say]")

		saynn("You hear an annoyed sigh.")

		saynn("[say=mirri]I act how I act, okay?[/say]")

		saynn("She looks at the waterfall.. but something isn't quite the same anymore.")

		saynn("[say=mirri]Whatever.. I will go now, I'm glad I at least got to talk with someone. Someone who thinks I'm a crazy bitch.. but still.[/say]")

		saynn("It's kinda true though.")

		saynn("And so, after one last glance your way, she leaves you alone.")

		setFlag("SlaveAuctionModule.customMirriGreeting", "I hate that I can't hate you enough.. Find me some slaves..")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "say_goodgirl"):
		playAnimation(StageScene.SexLotus, "tease", {pc="mirri", npc="pc"})
		saynn("Slowly, you bring your hand up to brush her ponytail, fingers tracing down along it, slipping between the strands.")

		saynn("[say=pc]Good girl..[/say]")

		saynn("Your voice is barely above a whisper. But it's enough to have an effect on her. Mirri blinks.. and then shifts her body around, nestling herself into your lap, wrapping her legs around your waist and curling her arms around your neck in a possessive embrace.")

		saynn("Her face is close.. her breath warm against your skin.. and you feel the gentle rumble of her purring.")

		saynn("[say=mirri]You really think so?..[/say]")

		saynn("Sounds like she is asking you to repeat it. You oblige, letting the words roll off your tongue as your hands settle on her hips, feeling her press herself closer to you.")

		saynn("[say=pc]You're a good girl.[/say]")

		saynn("Mirri leans in, capturing your lips in a slow.. but intense.. kiss. You can feel how hungry she is through her motions, her lips pressing firmly into yours as she is drinking in every word you're giving her.")

		saynn("Mirri's fingers are tracing gentle patterns across your scalp as her body molds against yours during this moment of pure intimacy..")

		saynn("You deepen the kiss.. and she responds eagerly, a pleased purr vibrating between you and her.Her hips shift in your lap, her tail wrapping around your leg as she snuggles closer, her body swaying rhythmically with every kiss..")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "cancel_date"):
		processTime(3*60)

	if(_action == "waterfall"):
		processTime(3*60)

	if(_action == "waterfall_tp"):
		processTime(3*60)

	if(_action == "cuddle_mirri"):
		processTime(5*60)

	if(_action == "bad_pin"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["lastChoice"] = lastChoice

	return data

func loadData(data):
	.loadData(data)

	lastChoice = SAVE.loadVar(data, "lastChoice", "")
