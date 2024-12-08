extends SceneBase

var lastChoice = ""
var isStrapon = false

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
		
		saynn("[say=mirri]Oh yeah, here is a thought, I got access to some slave candies.[/say]")

		saynn("[say=pc]Slave candies?[/say]")

		saynn("[say=mirri]Perfect for a slave like you.[/say]")

		saynn("Looks like she is not in the mood to explain what they are.")

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

		saynn("[say=mirri]..I always assumed that he is giving me such a hard time because he wants me to be the very best I can be. But why is he so rude about it..[/say]")

		saynn("The Blacktail family does seem to have a fairly high bar.")

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

		saynn("[say=mirri]I'm trying to. I'm simply doing my best, you know? Clearly, it's not enough for my dad..[/say]")

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

		saynn("You deepen the kiss.. and she responds eagerly, a pleased purr vibrating between you and her. Catgirl's hips shift in your lap, her tail wrapping around your leg as she snuggles closer, her body swaying rhythmically with every kiss..")

		if (!GM.pc.hasReachablePenis()):
			saynn("She loses your kiss for a second to whisper something.")

			saynn("[say=mirri]..I brought a strapon.. if you want..[/say]")

			saynn("Looks like she wants you to wear it.")

		else:
			saynn("The way she rubs her clothed crotch against your erection.. makes it seem like she would rather not be clothed..")

			saynn("[say=mirri]..I have a few condoms..[/say]")

		addButton("Just kiss", "Sex will only ruin this moment", "no_sex")
		addButton("Sex", "Let Mirri ride you..", "do_sex")
	if(state == "no_sex"):
		saynn("You just continue the long passionate kiss on Mirri's lips, enjoying the close moment with a crazy Syndicate undercover agent in an AlphaCorp space station prison..")

		saynn("The more you whisper how much of a good girl Mirri is, the more she melts into you, her breath deep and warm, her purring growing louder.")

		saynn("More little kisses land on her cheeks, chin, neck.. anywhere you can reach..")

		saynn("[say=mirri]I bet you treat every girl like that..[/say]")

		saynn("[say=pc]You deserve it. But what if I do?[/say]")

		saynn("The corners of her lips twitch, almost forming a smirk, but that melts too under the onslaught of your continued little smooches. Her claws lightly graze your shoulders..")

		saynn("[say=mirri]Then.. I might just have to kill them.. So I can be your only good girl..[/say]")

		saynn("You're not sure if she is serious, her words are both chilling and affectionate, her paws drift down your arms, tracing the {pc.masc} curves with the claws..")

		saynn("[say=pc]You don't have to do that.[/say]")

		saynn("Her blue eyes shiny with mischief, her smirk fully forming this time.")

		saynn("[say=mirri]Don't I? I guess I don't.. As long as I get you all to myself..[/say]")

		saynn("Her purring returns as you scritch her under the chin. You place another kiss on her lips, a quick one this time.")

		saynn("[say=pc]Hate to break it to ya.. I'm not from Syndicate.[/say]")

		saynn("[say=mirri]Syndicate-Schmidicate..[/say]")

		saynn("Her giggle is cute.. her eyes show a little vulnerability.")

		saynn("[say=mirri]You really are something else, AlphaCorp slave..[/say]")

		saynn("You don't answer, instead pressing another kiss to her forehead. Her arms wrap tightly around your neck, pulling you into an embrace that's almost suffocating, her tail curling around your waist like a makeshift leash.")

		saynn("[say=mirri]Don't count this moment of weakness as me being weak..[/say]")

		saynn("[say=pc]You're always been pretty soft, to be honest.[/say]")

		saynn("Ow. You can feel her fangs on your neck.")

		saynn("[say=mirri]..bitch..[/say]")

		saynn("Your moment to laugh.")

		saynn("[say=mirri]I need to show dad that he is wrong.. Will you help me?[/say]")

		saynn("[say=pc]I will do my best.[/say]")

		saynn("She nods subtly.")

		saynn("[say=mirri]Once I will become the best slaver.. he will understand.. he will accept me..[/say]")

		saynn("Station guards begin to give you strange looks while walking past during their patrols.")

		saynn("[say=mirri]I love you, {pc.name}.. Please don't break my heart.. I really don't wanna kill you..[/say]")

		saynn("An awkward silence settles after her words.")

		saynn("[say=mirri]See you later..[/say]")

		saynn("Mirri cats her way out of your embrace.. and then gets up.")

		saynn("One last look back.. and she is gone.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_sex"):
		playAnimation(StageScene.SexLotus, "inside", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true, condom=!isStrapon}})
		if (!isStrapon):
			saynn("As she shows you the wrapped condom.. you take it.")

			saynn("Her breath hitches as you do that, her warmth spreads over you through the thin fabric of her panties. Mirri leans forward, brushing her lips softly along your neck, lingering just a little longer each time.")

			saynn("She helps you to put on the rubber, concealing your hard member behind a thin layer of latex. Then, with a teasing smirk, she slides her hand between you both, hooking her fingers around the edge of her panties.. and pulling them to the side. She meets your gaze, a playful, almost daring look in her eyes.. before she wraps her digits around your {pc.penis} and lowers herself slowly onto it.")

		else:
			saynn("Why not.. you let her secure her toy around your waist. A nice, hefty canine cock is now hanging between your legs.")

			saynn("Her breath hitches just from seeing it, the thin fabric of her panties visibly getting wet. Mirri leans forward, brushing her lips softly along your neck, lingering just a little longer each time.")

			saynn("Then, with a teasing smirk, she slides her hand between you both, hooking her fingers around the edge of her panties.. and pulling them to the side. She meets your gaze, a playful, almost daring look in her eyes.. before she wraps her digits around your new member.. and lowers herself slowly onto it.")

		saynn("Her soft gasp and the way her body shudders as she takes you in make it impossible to look away..")

		addButton("Continue", "See what happens next", "do_sex_sex")
	if(state == "do_sex_sex"):
		playAnimation(StageScene.SexLotus, "sex", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true, condom=!isStrapon}})
		saynn("Her hips begin to rock slowly, savoring each moment, her body pressed tightly against yours with every sway. Her arms wrap around your shoulders, holding onto you as she rides you in a slow, sensual rhythm. Mirri's inner walls are quite inviting, "+str("the slick tunnel kneads your shaft in all the right ways.." if !isStrapon else "the slick tunnel kneads your rubber shaft.. putting some pleasurable pressure on your crotch as well..")+"")

		saynn("Her movements are intimate, almost hypnotic, each rise and fall of her hips drawing you deeper into her wet sex. No words are exchanged.. but her breathing grows heavier, mingling with your own, her purring filling the space between each breath as she rides you, her claws occasionally digging gently into your shoulders.")

		addButton("Continue", "See what happens next", "do_sex_fast")
	if(state == "do_sex_fast"):
		playAnimation(StageScene.SexLotus, "fast", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true, condom=!isStrapon}})
		saynn("Gradually, her rhythm picks up, her body moving faster, making your "+str("cock" if !isStrapon else "strapon")+" brush up against the organic barrier inside her each time. Her tail sways erratically, her body trembling with building pleasure.")

		saynn("She holds eye contact with you, her expression a mixture of pleasure and satisfaction, her breath hitching every time you meet her pace. Her hands hold your shoulders, her claws biting into your skin as she rides you faster, chasing the high. The way she gets tight around you again and again.. she is close..")

		if (!isStrapon):
			saynn("But so are you..")

		addButton("Continue", "See what happens next..", "do_sex_cum")
	if(state == "do_sex_cum"):
		playAnimation(StageScene.SexLotus, "inside", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true, condom=!isStrapon}})
		saynn("Her hips stutter suddenly, her rhythm faltering as her orgasm overtakes her. Mirri throws her head back and lets out a quiet muffled moan, her entire body shaking in your arms. Her pussy clenches down hard around your"+str(" rubber" if isStrapon else "")+" cock, pulsing a lot, her inner muscles gripping you as if refusing to let go.")

		saynn("Her tail flicks wildly, her ears flattening with her head as she loses herself in the moment..")

		if (!isStrapon):
			saynn("Her climax pulls you to the edge too.. and moments later, your own body succumbs to the pleasure. Your cock throbs inside her.. and the condom tightens as your {pc.cum} begins to fill it full. Each pulse of your orgasm makes you pump more seed into that rubber.. until your balls run dry. But even then, Mirri's pussy continues to clench and quiver around you, as if milking every last drop.")

		else:
			saynn("Your toy can't really cum inside her.. but you so wish that it could. You watch Mirri as her pussy continues to clench and quiver around you.. as if trying to milk your rubber shaft..")

		saynn("Mirri leans forward, her forehead resting against yours, her breathing ragged and uneven.")

		saynn("[say=mirri]I bet you treat every girl like that..[/say]")

		saynn("[say=pc]You deserve it. But what if I do?[/say]")

		saynn("The corners of her lips twitch, almost forming a smirk, but that melts when you give her some little smooches. Her claws lightly graze your shoulders..")

		saynn("[say=mirri]Then.. I might just have to kill them.. So I can be your only good girl..[/say]")

		saynn("You're not sure if she is serious, her words are both chilling and affectionate, her paws drift down your arms, tracing the {pc.masc} curves with the claws.. still with your "+str("cock" if !isStrapon else "rubber member")+" inside her..")

		saynn("[say=pc]You don't have to do that.[/say]")

		saynn("Her blue eyes shiny with mischief, her smirk fully forming this time.")

		saynn("[say=mirri]Don't I? I guess I don't.. As long as I get you all to myself..[/say]")

		saynn("Her purring returns as you scritch her under the chin. You place another kiss on her lips, a quick one.")

		saynn("[say=pc]Hate to break it to ya.. I'm not from Syndicate.[/say]")

		saynn("[say=mirri]Syndicate-Schmidicate..[/say]")

		saynn("Her giggle is cute.. her eyes show a little vulnerability.")

		saynn("[say=mirri]You really are something else, AlphaCorp slave..[/say]")

		saynn("You don't answer, instead pressing another kiss to her forehead. Her arms wrap tightly around your neck, pulling you into an embrace that's almost suffocating, her tail curling around your waist like a makeshift leash.")

		saynn("[say=mirri]Don't count this moment of weakness as me being weak..[/say]")

		saynn("[say=pc]You're always been pretty soft, to be honest.[/say]")

		saynn("Ow. You can feel her fangs on your neck.")

		saynn("[say=mirri]..bitch..[/say]")

		saynn("Your moment to laugh.")

		saynn("[say=mirri]I need to show dad that he is wrong.. Will you help me?[/say]")

		saynn("[say=pc]I will do my best.[/say]")

		saynn("She nods subtly.")
		
		saynn("[say=mirri]I got access to some Slave Candies on the black market, should make your work easier..[/say]")

		saynn("Slave candies, huh.. Makes you wonder what they do.")

		saynn("[say=mirri]Once I will become the best slaver.. he will understand.. he will accept me..[/say]")

		saynn("Station guards begin to give you strange looks while walking past during their patrols.")

		saynn("[say=mirri]I love you, {pc.name}.. Please don't break my heart.. I really don't wanna kill you..[/say]")

		saynn("An awkward silence settles after her words.")

		saynn("[say=mirri]See you later..[/say]")

		saynn("She gives a final, trembling roll of her hips.. before lifting herself off you. The slick, wet sound as you slip out of her is accompanied by her quiet gasp."+str(" She helps to take off the strapon harness.." if isStrapon else "")+"")

		saynn("One last look back.. and she is gone.")

		addButton("Continue", "See what happens next", "endthescene_removestrapon")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "cancel_date"):
		processTime(3*60)

	if(_action == "waterfall"):
		processTime(3*60)
		getModule("SlaveAuctionModule").addMirriAffection(0.1)

	if(_action == "waterfall_tp"):
		processTime(3*60)

	if(_action == "cuddle_mirri"):
		processTime(5*60)

	if(_action == "say_goodgirl"):
		getModule("SlaveAuctionModule").addMirriAffection(0.2)

	if(_action == "say_crazygirl"):
		getModule("SlaveAuctionModule").addMirriAffection(-0.2)

	if(_action == "bad_pin"):
		processTime(5*60)

	if(_action == "bad_shoveaway"):
		getModule("SlaveAuctionModule").addMirriAffection(-0.5)

	if(_action == "bad_panties"):
		getModule("SlaveAuctionModule").addMirriAffection(0.2)

	if(_action == "do_sex"):
		getModule("SlaveAuctionModule").addMirriAffection(0.1)
		if(!GM.pc.hasReachablePenis()):
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("StraponCanine"))
			isStrapon = true

	if(_action == "do_sex_sex"):
		processTime(5*60)

	if(_action == "do_sex_fast"):
		processTime(3*60)

	if(_action == "do_sex_cum"):
		processTime(5*60)
		if(!isStrapon):
			addFilledCondomToLootIfPerk(getCharacter("pc").createFilledCondom())
		GM.pc.orgasmFrom("mirri")

	if(_action == "endthescene_removestrapon"):
		GM.pc.removeStrapon()
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["lastChoice"] = lastChoice
	data["isStrapon"] = isStrapon

	return data

func loadData(data):
	.loadData(data)

	lastChoice = SAVE.loadVar(data, "lastChoice", "")
	isStrapon = SAVE.loadVar(data, "isStrapon", false)
