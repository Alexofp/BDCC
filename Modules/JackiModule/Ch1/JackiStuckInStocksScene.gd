extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "JackiStuckInStocksScene"

func _reactInit():
	getCharacter("jacki").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("ballgag"))

func _run():
	if(state == ""):
		addCharacter("jacki")
		addCharacter("femaleguard_feline")
		
	if(state == ""):
		playAnimation(StageScene.StocksSexOral, "tease", {pc="jacki", npc="femaleguard_feline"})
		
		# (Jacki peed in the garden area, behind one of the bushes. Because the bathrooms were both busy with bullies. But she also kinda liked the idea)

		# (A guard has caught her in the act and now wants to punish her with free use)

		# (Jacki is locked into the stocks and also gagged for growling)

		saynn("You decide that now would be a good time to approach. An inmate is forcibly bent forward with their legs spread wide with a metal bar that connects the cuffs on their ankles. Their head and arms are forced into locked metal stocks, rendering the inmate pretty much helpless.")

		saynn("She is that clumsy inmate that has runned into you on that long ago! You take a better look. She is a girl, clearly a wolf. Dark fur with a gray belly and some brown accents. You also spot some white details like her palms, the digi feet as well as the tip of her tail. On her head there is a careful ponytail with the tips of her hair being bright red. She is spotting an inmate uniform with orange trim, designating this particular inmate to be from a general pop block.")

		saynn("Standing beside her is one of the guards, a cat. She seems to be making sure the inmate wolfy is locked tight.")

		saynn("[say=femaleguard_feline]Not so cocky now, huh?[/say]")

		saynn("There is a red rubber ball in the inmate’s mouth preventing her from saying anything, all you hear is some muffled whining.")

		saynn("[say=jacki]Mhfhhf-f..[/say]")

		saynn("What follows after that is a firm smack on the inmate’s fit-looking ass.")

		saynn("[say=femaleguard_feline]Is what I thought. Let’s see who is gonna be first.[/say]")

		saynn("The cat stands up and looks around. Your gazes collide.")

		addButton("Ask", "Ask why the wolfie is locked up", "ask")

	if(state == "ask"):
		playAnimation(StageScene.Duo, "stand", {npc="femaleguard_feline"})
		# (guard offers to fuck jacki)

		# (pc asks why is she locked up)

		# (guard explains some stuff. Then remembers that she wanted to do something)

		# (guard pulls down Jacki’s shorts, exposing the chastity piercings. She then connects a little ‘dildo on a chain’ to jacki’s piercings and forces it into her urethra, punishment for peeing)

		saynn("Before you can ask your question the guard points at you and gestures to come closer.")

		saynn("[say=femaleguard_feline]Hey, you. Inmate number whatever-whatever. Wanna have some fun with this bitch?[/say]")

		saynn("You hear the inmate getting slightly more nervous and fidgety. She is facing away from you so she has to awkwardly try to tilt her head to get even a single glimpse of who is behind her. Her fluffy canine tail is trying to cover her butt.")

		saynn("[say=pc]What did she do?[/say]")

		saynn("The guard catches the girl’s tail before yanking it away so she can deliver another smack on her butt. More muffled whining can be heard.")

		saynn("[say=femaleguard_feline]Don’t hide your ass, girl. She? I was doing my usual patrol when I saw her peeing in the yard. Yeah, can you believe it? The bitch was squating behind a bush with her pants down and her own bush exposed, clearly enjoying herself. Fucking slut.[/say]")

		addButton("Illegal?", "Ask what about it was against the law", "illegal?")

	if(state == "illegal?"):
		playAnimation(StageScene.Stocks, "idle", {pc="jacki", bodyState={exposedCrotch=true}})
		addCharacter("jacki", ["naked"])
		
		saynn("[say=pc]Peeing is illegal now?[/say]")

		saynn("The guard crosses her arms.")

		saynn("[say=femaleguard_feline]In public. Yes, obviously. Would you wanna step into someone’s piss puddle when crawling around on all fours?[/say]")

		saynn("After making the point, the strict cat chuckles to herself.")

		saynn("[say=femaleguard_feline]Hah. I mean, I don’t care if some inmate does that. But the smell. Gross. Oh, you have reminded me of something. I have a little present that would be a perfect punishment for this bitch.[/say]")

		saynn("You just stand nearby and watch as the guard approaches the locked up wolfy and proceeds to pull down her inmate shorts, exposing the nice ass. Wolfy proceeds to react the only way she can, by wiggling and making more muffled noises. Her tail tries to cover her again but the guard yanks on it again, surely causing some discomfort.")

		saynn("The first thing you notice are.. the piercings. Quite a lot of them. In fact, the girl’s slit is pretty much stitched shut with many rows of piercing rings that have little cyan gems on them. One slightly bigger ring is piercing her clit and has a little chain and a dangly cyan ball toy dangling from it. The view is.. quite interesting for sure.")

		saynn("[say=pc]Did you do her like that?[/say]")

		saynn("[say=femaleguard_feline]Oh, I wish. The bitch probably did that to herself so no one would fuck her. But she forgot about the other holes. Including this one.[/say]")

		saynn("The guard produces something that looks like a white rubber knotted dildo. But it’s a very small one. About the size of a pinky finger. The cat licks it once and then presses it against the wolfy’s pussy hole. But not the big one.. the hole that she pisses from, her urethra. The girl arches her back and struggles against the stocks but they don’t offer any give. The cat doesn’t plan on giving up too, she applies more pressure onto that piss hole until it stretches her enough to house the little white dildo, knot included. A loud muffled noise that sounds like a moan escapes from the gagged girl.")

		saynn("[say=jacki]Mff-f-f-f-fff..[/say]")

		saynn("[say=femaleguard_feline]There you fucking go. No peeing for you, bitch.[/say]")

		saynn("The guard chuckles and spanks the girl again which causes her tight-looking tailhole to clench and the little plug to be pushed out slightly but nowhere near enough to escape.")

		saynn("[say=femaleguard_feline]So, wanna fuck her? Free use for everyone, this inmate needs to be taught a lesson. And please, don’t try to be a white knight, the slut knew what she was doing is punishable.[/say]")

		saynn("The kitty firmly plops her paw on the girl’s ass again but squeezes one of the buttcheeks tightly instead of spanking, making the wolfy squeak.")

		saynn("[say=femaleguard_feline]Tell you what. I will even throw a work credit to your inmate number. Good deeds must be rewarded~[/say]")

		# (Options are Anal, Anal Fingering and Lie. There is also Just leave option that disables Jacki content forever)

		addButtonWithChecks("Anal", "(noncon) Use the offered girl for your pleasure", "anal", [], [ButtonChecks.HasReachablePenis])
		addButton("Anal fingering", "Use your fingers to test that girl’s ass", "anal_fingering")
		addButton("Lie", "Attempt to save the girl", "lie")
		addButton("Just leave", "(Removes further Jacki content) You don’t wanna use her or save her", "just_leave")


	if(state == "anal"):
		playAnimation(StageScene.StocksSex, "tease", {pc="jacki", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true}})
		# (needs cock)
		setFlag("JackiModule.Jacki_StocksPunishedByPC", true)
		setFlag("JackiModule.Jacki_StocksFuckedByPC", true)

		saynn("[say=pc]Sure, she looks hot and that ass does need a lesson or two.[/say]")

		saynn("The guard kitty chuckles while you approach the wolfy from behind and expose your {pc.cock}. As you get a grip on her tail and pull it away, you hear the girl whimpering.")

		saynn("[say=femaleguard_feline]Shush, whining won’t save you.[/say]")

		saynn("The guard then looks at you and your dick before biting her lip.")

		saynn("[say=femaleguard_feline]Want me to prepare you maybe? I’m not a slut but you know, no need to go dry on her.[/say]")

		addButton("Sure", "Let the guard suck you", "sure")
		addButton("Spit", "Just spit into that asshole and say it’s enough", "spit")


	if(state == "sure"):
		saynn("[say=pc]Yeah, sure. She should only leak cum and not blood.[/say]")

		saynn("The guard swiftly takes off her gloves before getting on her knees before you. Her naked paw grabs your {pc.cock} and supports it while she starts licking the tip with her rough-textured tongue. As you gradually get hard, she holds your shaft on her tongue while gently kneading your balls. A drop of precum lands on the guard’s tongue and she swallows it. You hear faint purring.")

		saynn("When your cock is fully erected, the guard parts her lips wide before letting your member past her teeth and down her tight throat. All the while the tongue keeps working on your dick, coating it with saliva and making you exhale audibly. You offer the kitty a pat on the head but she only frowns at you before moving her head away.")

		saynn("[say=femaleguard_feline]There, nice and hard. Go rough on that bitch now.[/say]")

		# (continue button here)
		addButton("Continue", "See what happens next", "continue")

	if(state == "spit"):
		saynn("[say=pc]Nah, I know how to lube her up.[/say]")

		saynn("You put your paws on the girl’s ass and spread it wide before spitting directly into her star as she clenches it. That makes the inmate wolfy eek. The sight of her pucker and closed tight-looking cunt is quite arousing, your cock swiftly starts to fill with blood.")

		saynn("[say=femaleguard_feline]I mean, it’s better than nothing~. Let me help.[/say]")

		saynn("While you’re busy getting yourself hard, the guard kitty puts her paws onto that inviting ass and spreads it again before pressing her maw against that tight anus and even kissing before spitting on it and using her tongue to spread the saliva around the clenching star. Wow, that’s hot, your dick hardens fast.")

		saynn("[say=femaleguard_feline]What? I’m just helping. Go rough on that bitch now~.[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.StocksSex, "sex", {pc="jacki", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true}})
		
		saynn("After the ‘lube’ has been applied, it’s time for action. The wolfy trembles and wiggles her ass, trying to struggle against the metal frame. But all it does is make her clit bell jingle.")

		saynn("You get a good grasp on that fluffy tail near the base and move it away while guiding your {pc.cock} towards the clenching tight flesh-colored ring with another. There is no need for foreplay, the tip of your cock kisses that star and proceeds to try to stretch it. The wolfy mumbles something incoherent while her body squirms.")

		saynn("The guard just watches it all happen.")

		saynn("[say=femaleguard_feline]What? Is the bitch really that tight? I won’t believe that she never got fucked in the ass.[/say]")

		saynn("As the pressure on the girl’s asshole increases, her toes begin to curl up, little muffled whines escape from her mouth while she shakes her head a lot, as best as the stocks allow.")

		saynn("But she can’t clench forever, finally you feel her butt giving up and relaxing enough for you to shove your cock deep into her ass in one wide motion. It seems that this sent a powerful impulse of sharp sensations through her whole body, the poor wolfy is whining and shaking while the plug in her urethra shifts back and forth from her clenching. She is tight, her soft inner walls wrap around your shaft and give a pleasurable-feeling massage. Her anus got so stretched that the ring is now looking red, the skin there is irritated.")

		saynn("[say=pc]Fuck, she is tight.[/say]")

		saynn("The guard kitty walks around the stocks and approaches the wolfy from the front. She leans in to scritch the helpless inmate under the chin.")

		saynn("[say=femaleguard_feline]Does it hurt?[/say]")

		saynn("The wolfy nods subtly before tilting her head down.")

		saynn("[say=femaleguard_feline]You need your dirty ass to be trained then~[/say]")

		saynn("After that cute exchange, you let the girl’s tailhole get used to your size before proceeding to retract your cock, leaving empty space. But you don’t pull out completely, instead you thrust your cock deep inside a second later again, causing some more shakiness in the girl’s legs. And then you continue these slow powerful thrusts with your hips, ravaging wolfy’s ass while holding onto her handy tail like it’s a leash.")

		saynn("Her whining eventually subsides, even the most rough thrusts only force a short noise of discomfort out of the girl.")

		saynn("[say=femaleguard_feline]Her eyes are closed, the bitch fucking loves it~. Let me look at your stitched up cunt.[/say]")

		saynn("The guard walks around the stocks again while you continue fucking that inmate in the ass, using her tight fuckhole for your entertaiment. The kitty steps behind you and crouches to look between your legs at the girl’s slit.")

		saynn("[say=femaleguard_feline]Oh yeah, she is fucking wet~. Great view from here.[/say]")

		saynn("Hearing all that probably made the girl feel embarrassed because you feel her ass clenching around your length. But you fight her resistance and shove your cock in and out at a full-force while your balls slap against her piercings and the dangling toy. It all quickly brings you close to your orgasm.")

		addButton("Cum inside", "Stuff that ass with your cum", "cum_inside")
		addButton("Pull out", "Make a mess on that wolfy’s back and ass instead", "pull_out")


	if(state == "cum_inside"):
		playAnimation(StageScene.StocksSex, "fast", {pc="jacki", npc="pc", pcCum=true, npcCum=true, bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true}})
		
		saynn("Your orgasm is close and you welcome it, your hand yanks on that tail hard while you ram your cock as deep as that tight clenching asshole allows. Her inner walls start to milk you while your dick shoots long strings of your warm sticky {pc.cum} deep into her ass, stuffing her guts full of your seed.")

		saynn("[say=femaleguard_feline]Oh yeah, give her that sweet nectar~.[/say]")

		saynn("You hear little muffled moans coming from her gagged maw as her body squirms around your dick hard. She cums so hard that the little rubber plug in her urethra finally gets pushed out followed by a strong stream of her transparent female juices that the guard was lucky enough to avoid.")

		saynn("[say=pc]Nghh..[/say]")

		saynn("[say=jacki]Mmff-f.. mf-f-f..[/say]")

		saynn("[say=femaleguard_feline]Oh, rude. That was a present.[/say]")

		saynn("Some of the seed is already leaking back and dripping onto the girl’s thighs and floor, her dark fur doesn’t hide the mess at all.")

		saynn("After your climax comes to its end, you just quickly pull out, leaving the used asshole to gape and offering you a great view of how her inner walls struggle to close up before finally doing it.")

		# (Continue button here)
		addButton("Continue", "See what happens next", "continue1")

	if(state == "pull_out"):
		playAnimation(StageScene.StocksSex, "tease", {pc="jacki", npc="pc", npcCum=true, bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true}})
		
		saynn("Your orgasm is close and you welcome it. But instead of stuffing the girl’s guts you decide to pull out and cum all over her ass. String of warm sticky {pc.cum} land onto the wolfy’s shirt, back, tail, ass. Some even land on that gaping pulsating star and then drip down over her wet stitched up pussy and messing up her thighs.")

		saynn("[say=femaleguard_feline]Aww. I would have totally stuffed her ass if I could.[/say]")

		saynn("[say=pc]Nghh..[/say]")

		saynn("You hear little muffled moans coming from her gagged maw as her body starts to squirm when the orgasm is finally overwhelming her. She cums so hard that the little rubber plug in her urethra finally gets pushed out followed by a strong stream of her transparent female juices that the guard was lucky enough to avoid.")

		saynn("[say=jacki]Mmff-f.. mf-f-f..[/say]")

		saynn("[say=femaleguard_feline]Oh, rude. That was a present.[/say]")

		saynn("The girl’s dark fur doesn’t hide the {pc.cum} at all, her whole lower part of the body looks extremely messy.")

		saynn("As her orgasm is coming to its end, her used asshole is left to gape while also offering you a great view of how her inner walls struggle to close up before finally doing it.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		saynn("The guard presses a few buttons on her datapad, transferring a work credit.")

		saynn("[say=femaleguard_feline]Good job, you made her such a mess already~[/say]")

		saynn("[say=pc]Yeah, she is a great fuck.[/say]")

		saynn("You put your cock away and prepare to leave. Being curious you look from the other side of the stocks and see the wolfy panting and blushing hard as she notices you. Cute.")

		# (scene ends here)
		addButton("Leave", "Job well done", "endthescene")

	if(state == "anal_fingering"):
		playAnimation(StageScene.StocksSex, "tease", {pc="jacki", npc="pc", bodyState={exposedCrotch=true}})
		# (if pc has no penis)
		setFlag("JackiModule.Jacki_StocksPunishedByPC", true)
		setFlag("JackiModule.Jacki_StocksFingeredByPC", true)
		
		if(!GM.pc.hasPenis()):
			saynn("[say=pc]I don’t really have anything to stuff her ass with, I guess I will use my hands.[/say]")

			saynn("The guard chuckles.")

			saynn("[say=femaleguard_feline]Sure, that works. Want my stun baton stick maybe~?[/say]")

			saynn("Oh that would be too much. You shake your head while the wolfy audibly disagrees with that offer.")

		# (else)
		else:
			saynn("[say=pc]I have a dick but I’d rather use my hand for this one.[/say]")

			saynn("The guard chuckles")
			
			if(GM.pc.isWearingChastityCage()):
				saynn("[say=femaleguard_feline]Are you sure it's not because you're wearing a cage~? But sure. I can offer my stun baton stick~[/say]")
			else:
				saynn("[say=femaleguard_feline]Sure, whatever floats your boat. I can offer my stun baton stick~[/say]")

			saynn("Oh that would be too much. You shake your head while the wolfy audibly disagrees with that offer.")

		# (end if)

		saynn("You take the spot behind the wolf and grab her tail before forcibly moving it out of the way. You lick the fingers of your second hand and move to the girl’s tailhole, gently prodding at it. That makes the inmate wiggle and huff at you so you smack her ass yourself before forcing a single finger into her ass. The sudden sharp sensations make the poor wolfy whine and shake while the plug in her urethra shifts back and forth from her clenching.")

		saynn("[say=pc]She is tight, her dirty ass is basically sucking my finger in.[/say]")

		saynn("[say=femaleguard_feline]Is that so, huh?[/say]")

		saynn("You wiggle your finger inside the girl’s butt and rub your saliva into her soft inner walls, making them slick. You feel the wolfy wiggling her rear less while you explore her ass, she almost stopped whining at this point. Your second digit joins and.. slides in somewhat easy.")

		saynn("But you want more. The third one causes the girl to make some noises of discomfort but you force it in anyway. Her star is looking quite stretched now, the flesh there is somewhat irritated.")

		saynn("The guard kitty walks around the stocks and approaches the wolfy from the front. She leans in to scritch the helpless inmate under the chin.")

		saynn("[say=femaleguard_feline]Do you like it?[/say]")

		saynn("The wolfy doesn’t answer, instead just tilting her head down and avoiding eye contact. You notice that her stitched up slit is getting moist.")

		saynn("[say=femaleguard_feline]You just need your ass trained~[/say]")

		saynn("You begin to shift your digits inside the girl back and forth, gently fingering her tight ass and making her insides more slick. Your other hand lets go of the tail to see what it will do. It keeps itself to the side, giving you full freedom. You use that free hand to play with the dangling bell. You tug on it slightly and are met with little muffled moans coming from the girl’s gagged mouth.")

		saynn("[say=femaleguard_feline]Her eyes are closed, the bitch fucking loves it~.[/say]")

		saynn("You continue pushing your digits in and out while the girl makes more noises of pleasure, your free digits land on her clit directly and play with it by rubbing in small circular motions. Very soon the girl starts panting more and more, her pussy dripping juices onto the floor.")

		addButton("Make her cum", "Let her enjoy her anal orgasm", "make_her_cum")

	if(state == "make_her_cum"):
		saynn("You continue pumping your digits in and out, abusing that tight fuckhole so much that it starts to make wet noises. The girl tries to clench but you push through while also playing with her sensitive clit. But when you feel that the wolfy is getting close, you pull your digits away from her pussy, stealing that source of pleasure while focusing on fingering her ass harder.")

		saynn("That confuses the wolfy, she still makes muffled lusty noises while her body wants to squirm. She is so close that she seems desperate for some attention to her locked away pussy. But you give her no easy way out and manage to push her over the edge with only the anal fingering. The wolfy lets out some very passionate muffled moans while she drools and her locked legs shiver. She cums so hard that the little rubber plug in her urethra finally gets pushed out followed by a strong stream of her transparent female juices.")

		saynn("[say=jacki]Mmff-f.. mf-f-f..[/say]")

		saynn("[say=femaleguard_feline]Oh, rude. That was a present.[/say]")

		saynn("You keep your digits inside while she cums and feel how the inner walls close tight around them, like they are trying to milk a cock. After her orgasm fades out, you pull your digits out and rub your hands dry against that fluffy butt before giving it the last few smacks. The wolfy wiggles her slightly red ass while panting heavily into her gag, her tailhole quickly closes after you retractring your digits.")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		saynn("The guard presses a few buttons on her datapad, transferring a work credit to your inmate account.")

		saynn("[say=femaleguard_feline]Finger-fucking is fucking in my book, you still made her look like a mess. Good job, inmate[/say]")

		saynn("[say=pc]Yeah, thanks, it was fun teaching her.[/say]")

		saynn("You prepare to leave. Being curious you look from the other side of the stocks and see the wolfy panting and blushing hard as she notices you. Cute.")

		# (scene ends here)
		addButton("Leave", "Job well done", "endthescene")


	if(state == "lie"):
		setFlag("JackiModule.Jacki_StocksPCLied", true)
		removeCharacter("femaleguard_feline")
		
		# (You say that you will just watch for now.)

		# (The guard leaves to find some inmates)

		# (You ungag jacki and try to get her out of the stocks)

		# (Suddenly a few inmates show up, they wanna fuck Jacki)

		# (you fight)

		# (if lost - you can just leave or watch them spitroast jacki)

		# (if won - you escape with Jacki. She thanks you)

		saynn("You scratch behind your head and look away, thinking. You gotta save the girl somehow.")

		saynn("[say=pc]I think I will just watch for now.[/say]")

		saynn("The guard chuckles while watching your unsure posture.")

		saynn("[say=femaleguard_feline]Oh, you are one of them, huh~? Sure, you can watch.[/say]")

		saynn("Some time passes but luckily there are not that many inmates around, maybe the time is bad. The guard is getting somewhat annoyed.")

		saynn("[say=femaleguard_feline]Well shit. I will just go find some walking dicks to fuck her. Lazy fuckers probably still sleeping.[/say]")

		saynn("That might be your chance! The guard kitty leaves the stocks area and heads towards the cellblock. The wolfy in the stocks sighs audibly.")

		addButton("Help", "Try to unlock the girl", "help")

	if(state == "help"):
		playAnimation(StageScene.StocksSexOral, "tease", {pc="jacki", npc="pc", bodyState={exposedCrotch=true}})
		
		addCharacter("jacki")
		saynn("You act fast, the first thing you do is run up to the locked wolfy and crouch behind her. Your hands quickly removed the wide metal rod that held the girl’s legs spread, it didn’t require a key luckily. Wolfy produces a confused noise while you pull her pants back up to cover her cute butt.")

		saynn("Then you walk around and try to take off the ball gag. Luckily that one is also just held by some straps and buckles. When the wolfy gets her drooling maw free, she closes and opens it a few times.")

		saynn("[say=jacki]Uh.. you sure it’s a good idea?[/say]")

		saynn("[say=pc]You’d rather get passed around?[/say]")

		saynn("She doesn’t answer, just kinda looking to the side.")

		addButton("Stocks", "Gotta get those unlocked somehow", "stocks")

	if(state == "stocks"):
		addCharacter("gymbully")
		addCharacter("gymbully2")
		
		saynn("The metal stocks. You tug on the frame but it doesn’t even budge. You try to break the lock that holds the two pieces locked together but that one doesn’t give too. Finally you begin to make progress when you find a little hinge that doesn’t seem to be properly screwed in.")

		saynn("[say=gymbully]Wha’cha doin’ there, kiddo?[/say]")

		# (if toilet bullies scene happened)
		if(getFlag("JackiModule.BathroomBulliesSceneHappened")):
			saynn("Oh shit. These are the same two inmates that you saw in the bathroom, the same gang but missing the crazy girl this time.")

		# (else)
		else:
			saynn("Oh shit. The first two inmates have arrived, both are from a red block and they also seem to be from the same gang too.")

		saynn("[say=pc]Not your problem, go away.[/say]")

		saynn("[say=gymbully]Why would I? We got a word that a girl here needs to be punished. But it seems somebody wants to be a hero?[/say]")

		saynn("You try to rip off the hinge but you need more time. And time is what you’re lacking.")

		saynn("[say=gymbully]Well, ‘trying’ is a better word. And failing at that. How ‘bout you step aside, pal.[/say]")

		# (Options are Attack, Break stocks (needs str 10+), Use a restraint key, Seduce and kick in the balls (sexiness 6+))

		addButton("Intimidate", "That seems like the best way of handling it", "attack")
		addButtonWithChecks("Break stocks", "Use your raw strength", "break_stocks", [], [[ButtonChecks.StatCheck, Stat.Strength, 10]])
		if(GM.pc.getInventory().hasItemID("restraintkey")):
			addButton("Use a restraint key", "Unlock the stocks with the universal key that you have", "use_a_restraint_key")
		else:
			addDisabledButton("Use a restraint key", "You don't have one")
		addButtonWithChecks("Seduce", "Use your prettiness to get close to them and kick them in the balls", "seduce", [], [[ButtonChecks.StatCheck, Stat.Sexiness, 6]])


	if(state == "attack"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully"})
		
		saynn("Well, since they are clearly not gonna fuck off that easy, you stop tinkering with the stocks and then stand in their path.")

		saynn("[say=pc]I’m not gonna let you touch her.[/say]")

		saynn("The guy chuckles. The one behind him chuckles too but silently. The wolfy in stocks perks at the conversation behind.")

		saynn("[say=gymbully]Big mistake, buddy. You’re going against the whole prison AND its inhabitants. Just so you can hog the girl for yourself? Brave. And stupid. But very brave.[/say]")

		saynn("He raises his hands and clenches his fists.")

		saynn("[say=gymbully]Well, bring it on then. We will fuck the girl when you lose. Sounds fair?[/say]")

		addButton("Fight", "Begin the fight", "startfight")
		if(getFlag("JackiModule.Jacki_ch2GotEnslaved")):
			addButton("Skip fight", "(Memories) Skip the fight and pretend that you won", "if_won")



	if(state == "if_won"):
		setFlag("JackiModule.Jacki_StocksPCWonFight", true)
		setFlag("JackiModule.Jacki_StocksSavedByPC", true)
		
		saynn("The guy hits the floor, unable to continue fighting. His friend shows his fangs and seems to be ready to pick the fight but the main guy stops him.")

		saynn("[say=gymbully]Let {pc.him} have the girl. There is a huge chance that {pc.he} {pc.is} making a mistake.[/say]")

		saynn("The defeated guy slowly gets up and swipes dust from himself.")

		saynn("[say=gymbully]You will see, pal. There is a reason why people end up here, in this prison.[/say]")

		saynn("[say=pc]I’m not your pal, get the fuck out of here.[/say]")

		saynn("He nods and leaves you two alone. His friend follows. Finally, some time.")

		addButton("Help", "You gotta save her before more come", "help1")

	if(state == "help1"):
		removeCharacter("gymbully")
		removeCharacter("gymbully2")
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		addCharacter("jacki")
		
		# (knows name = true)
		setFlag("JackiModule.Jacki_PCKnowsName", true)

		saynn("You return to the stocks and continue trying to open them.")

		saynn("[say=jacki]Uh.. thanks.[/say]")

		saynn("[say=pc]Don’t mention it.[/say]")

		saynn("Finally the stocks give in enough for the girl to free her arms and head. She straightens her posture and looks at you. A few seconds of silence.")

		saynn("[say=jacki]I’m Jacki. These guys were blocking the path to the bathroom so I had to..[/say]")

		saynn("[say=pc]It’s okay. You should run, Jacki. Before the guard or more inmates show up.[/say]")

		saynn("She looks around.")

		saynn("[say=jacki]I guess you’re right.[/say]")

		saynn("Jacki quickly jogs away. What a day.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

	if(state == "if_lost"):
		playAnimation(StageScene.StocksSpitroast, "tease", {pc="jacki", npc="gymbully", npc2="gymbully2", bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		setFlag("JackiModule.Jacki_StocksPCLostFight", true)
		
		saynn("You lost the fight. Unable to continue, you drop to your knees while the guy looks down at you.")

		saynn("[say=gymbully]Well. Don’t be sad. It was gonna happen, sooner or later.[/say]")

		saynn("The wolfy whimpers in the background, knowing what comes next.")

		saynn("[say=gymbully]I will give you a chance to leave, how ‘bout that.[/say]")

		addButton("Leave", "You don’t wanna watch it", "leave")
		addButton("Stay", "(noncon) See what happens next", "stay")


	if(state == "leave"):
		saynn("You don’t have enough strength in you to continue fighting so you have to just slowly get up and leave the scene.")

		saynn("At least you know that you did your best.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

	if(state == "stay"):
		addCharacter("jacki", ["naked"])
		
		setFlag("JackiModule.Jacki_StocksPCLostFightAndWatched", true)
		#playAnimation(StageScene.Stocks, "idle", {pc="jacki", bodyState={exposedCrotch=true}})
		playAnimation(StageScene.StocksSpitroast, "sex", {pc="jacki", npc="gymbully", npc2="gymbully2", bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		
		# (dudes approach Jacki. One pulls her shorts down and complains about piercings.)

		# (One fucks her mouth while another uses her ass)

		# (after sex you save her)

		saynn("Well, might as well see what they will do with the girl. You crawl closer to the stocks and look at her face. She is obviously terrified.")

		saynn("[say=jacki]Uh..[/say]")

		saynn("The main guy approaches the wolfy and unceremoniously yanks her shorts down, exposing the tight looking tailhole and a stitched up pussy. Wolfy eeks.")

		saynn("[say=gymbully]Oh yeah, the cat wasn’t bullshitting, her cunt is useless. I will fuck her throat and you pound her ass then. She is hot but I’m not touching her dirty hole.[/say]")

		saynn("The second dude replaces the first and pulls his canine dick out, already rubbing it between the girl’s slim buttcheeks. While the first dude reaches under and yanks on the shirt next, ripping it open and exposing the girl’s b-cup breasts and pierced nipples.")

		saynn("[say=gymbully]Why are your tits so small, girl.[/say]")

		saynn("But before she can answer that question, the guy exposes his cock and pushes it into her face, brushing his veiny shaft against the fur of her cheeks and leaking pre onto her forehead.")

		saynn("[say=gymbully]Open your mouth, girl. Don’t make it difficult for yourself.[/say]")

		saynn("Of course she doesn’t. She shakes her head and shows off her fangs to the guy. But at the same time the guy behind her aligns his cock with her hole and starts to apply pressure, trying to penetrate her ass. That makes the wolfy extremely wiggly, she whines and whimpers while helplessly thrashing against the metal stocks.")

		saynn("[say=gymbully]I guess you like it rough.[/say]")

		saynn("The guy wraps his paws around the girl’s muzzle and holds her nostrils blocked. At the same time the guy behind her forces himself in, his cock manages to stretch that tight asshole enough to slide in which makes the wolfy gasp. But her opening her mouth is soon followed by another knotted cock getting shoved past her teeth and down her throat.")

		saynn("[say=jacki]Mhf-f-f!..[/say]")

		saynn("[say=gymbully]Yeah, biting will end badly for ya. How is her ass feeling? Tight as well?[/say]")

		saynn("The silent guy nods while proceeding to fuck her ass, rocking his hips back and forth while his cock stretches her poor star so much that it looks red-ish.")

		saynn("The first guy starts to move his hips too while still holding his paws above and under the girl’s muzzle, applying some pressure. You notice little tears already streaming down the wolfy’s cheeks as she is being spitroasted, she can’t stop gagging and choking while a cock gets rammed down her throat time after time. She is still mostly dry, her pussy is only slightly moist and the little dildo in her pisshole sometimes shifts a little.")

		saynn("[say=gymbully]Gag around my dick more, girl. Make me cum.[/say]")

		addButton("Continue", "See what happens next", "bullies_cum")

	if(state == "bullies_cum"):
		playAnimation(StageScene.StocksSpitroast, "fast", {pc="jacki", npc="gymbully", npc2="gymbully2", pcCum=true, npcCum=true, bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		
		saynn("You notice their knots inflating and they both struggle to force them in. The girl’s ass is being stretched too much already, to the point of the soft flesh looking irritated. And her jaw can’t open wide enough. But they both continue pounding her holes until the orgasms overwhelm them roughly at the same time.")

		saynn("The main guy rams his cock as deep as that girl’s throat allows before proceeding to grunt while his cock starts to visibly pulsate inside her mouth and shoot cum deep down it. At the same time the guy behind arches his back and thrusts his cock deep inside too and cums while the girl’s tailhole tries to clench around it, milking it for all its cum. You see bright red blush on that poor wolfy’s cheeks.")

		saynn("[say=gymbully]Nghh. So fucking tight.[/say]")

		saynn("[say=jacki]Mhfff-f-ff!!..[/say]")

		saynn("She is being pumped with so much cum that some already starts to leak back, dripping from her chin and ass. After the guys are done fucking her, they pull their cocks out, leaving the wolfy to gasp and cough while her used tailhole tries to quickly close up. A smack on the ass makes it twitch and shoot a small string of that sticky stuff out. Lewd.")

		saynn("[say=gymbully]I’m spent. Let’s leave this doggy for others to fuck.[/say]")

		saynn("And just like that, they leave the wolfy alone. She is panting heavily.")

		addButton("Help her", "Well, you should be able to save her now", "help_her")

	if(state == "help_her"):
		removeCharacter("gymbully")
		removeCharacter("gymbully2")
		addCharacter("jacki")
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		
		saynn("You get up and approach the stocks. You’re still feeling weak after losing but you just about manage to unlock the stocks and open them. The wolfy slides down onto her knees and coughs more. You help her put her shorts on, they are ruined with cum already anyway.")

		saynn("[say=pc]You’re alright?[/say]")

		saynn("She catches her breath a little and glances at you.")

		saynn("[say=jacki]Yeah.. They were so rough.[/say]")

		saynn("You nod and help her to get up.")

		saynn("[say=pc]You gotta run before more come.[/say]")

		saynn("[say=jacki]I guess you’re right. Thanks for helping.[/say]")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

	if(state == "break_stocks"):
		# (needs 10 str)
		addCharacter("jacki")
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})

		saynn("You’re not letting some fuckers use this wolfy, you tense your muscles up and begin applying pressure onto the top parts of the stocks, brute-forcing the problem. You let out an angry intimidating scream while the metal slowly starts to bend. The wolfy manages to free her paw, then her head, and then another paw.")

		saynn("The gang members watch you with opened mouths while you look at them and flex your arms.")

		saynn("[say=gymbully]Yeah, fuck that.[/say]")

		saynn("The guys quickly flee while you bring the girl into the nearest private place.")

		addButton("Bathroom", "Bring her into the safe place", "bathroom")

	if(state == "bathroom"):
		removeCharacter("gymbully")
		removeCharacter("gymbully2")
		aimCameraAndSetLocName("main_bathroom1")
		GM.pc.setLocation("main_bathroom1")
		setFlag("JackiModule.Jacki_StocksSavedByPC", true)
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		# (knows name = true)
		setFlag("JackiModule.Jacki_PCKnowsName", true)

		saynn("You and the wolfy enter the bathroom. There is no one around. She looks at you.")

		saynn("[say=jacki]Thank you, I think they would have fucked me. I’m Jacki.[/say]")

		saynn("[say=pc]Don’t mention it. You’re okay?[/say]")

		saynn("[say=jacki]Yeah. They were blocking the bathroom before so I had to..[/say]")

		saynn("[say=pc]It’s okay. Avoid this area for now.[/say]")

		saynn("She nods and carefully leaves the bathroom before jogging away. What a day.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")


	if(state == "use_a_restraint_key"):
		# (needs and uses a key)
		addCharacter("jacki")
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})

		saynn("You think fast and realize that you have a key that is universal for any restraint. You quickly produce one and stuff it into the padlock that holds the stocks together before unlocking them. The key breaks in the process but you manage to free the girl.")

		saynn("The guys are still there and they aren’t happy. So you swiftly grab the wolfy and run with her towards the nearest safe place. No time to talk.")

		# (bathroom button)
		addButton("Bathroom", "Bring her into the safe place", "bathroom")


	if(state == "seduce"):
		# (needs sexiness 6+)
		addCharacter("jacki")
		playAnimation(StageScene.Duo, "stand", {npc="gymbully"})

		saynn("[say=pc]Why don’t you guys use me instead~[/say]")

		saynn("You step towards them and try to show off your {pc.masc} body. Their eyes are glued to you and you do notice their shorts bulging so you must be on the right track. The main guy looks at the silent one.")

		saynn("[say=gymbully]Wha’cha think? We can lock {pc.him} in the stocks too, there are free ones.[/say]")

		saynn("The other guy nods but before they turn their heads back, you dash forward and kick the main dude in the balls. He cries out from pain and flops onto his knees while holding onto his crotch.")

		saynn("[say=gymbully]B-Bitch! Fuck![/say]")

		saynn("And before the second one can react you do the same to him, dropping him to his knees too. That brought you just enough time to unlock the stocks and free the wolfy. You both quickly run towards the nearest private place.")

		# (bathroom button here)
		addButton("Bathroom", "Bring her into the safe place", "bathroom")


	if(state == "just_leave"):
		setFlag("JackiModule.Jacki_ContentDisabled", true)
		
		saynn("[say=pc]Nah, I will let someone else do it. Not my type.[/say]")

		saynn("The guard shrugs.")

		saynn("[say=femaleguard_feline]Sure, whatever you say.[/say]")

		saynn("You nod and leave them be.")

		# (end scene)
		addButton("Continue", "Time to go", "endthescene")


func _react(_action: String, _args):
	if(_action in ["just_leave", "ask", "cum_inside", "continue", "make_her_cum", "lie", "help", "stocks", "attack", "help1", "bullies_cum", "help_her", "break_stocks", "bathroom", "use_a_restraint_key", "seduce"]):
		processTime(RNG.randi_range(1,5) * 60)
	
	if(_action in ["anal", "anal_fingering", "stay"]):
		processTime(20 * 60)
	
	if(_action in ["continue1", "continue2"]):
		if(!getFlag("JackiModule.Jacki_ch2GotEnslaved")):
			addExperienceToPlayer(50)
			GM.pc.addCredits(1)
	
	if(_action == "cum_inside"):
		getCharacter("jacki").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("jacki")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)
		
	if(_action == "pull_out"):
		GM.pc.orgasmFrom("jacki")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)
	
	if(_action == "make_her_cum"):
		GM.pc.addLust(20)
		GM.pc.addSkillExperience(Skill.SexSlave, 30)
	
	if(_action == "help"):
		getCharacter("jacki").resetEquipment()
		
	if(_action == "startfight"):
		runScene("FightScene", ["gymbully"], "gymbullyjackistocksfight")
		
	if(_action == "use_a_restraint_key"):
		GM.pc.getInventory().removeXOfOrDestroy("restraintkey", 1)
	
	if(_action == "bullies_cum"):
		GM.pc.addLust(30)
		var jacki = getCharacter("jacki")
		jacki.cummedInMouthBy("gymbully")
		jacki.cummedInAnusBy("gymbully2")
		GM.pc.addSkillExperience(Skill.SexSlave, 10)
	
	if(_action == "endthescene"):
		getCharacter("jacki").removeAllRestraints()
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "gymbullyjackistocksfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(50)
		else:
			setState("if_lost")

func getDevCommentary():
	return "Jacki is a good bean ^^. I asked her if I could use her wolfie character and she said yes ^^. Looking back at it, its kinda obvious why x3. But that's just my thoughts\n\nWhy did I add a female character who has a 'stitched-up' vagina? Well.. why not? Isn't that kind of an interesting concept x3. Males usually have prostates that can be easily stimulated. Girls don't. So if you take away that pussy, how is she gonna get her lust satisfied?\n\nI'm very busy with writing so I can't expand her content right now ;-;. But I really want to, I just need to find a good direction for her character to go in. Jacki's content would be about forced corruption. Basically, about her going from a shy kind girl into an unwilling grade A exhibionist buttslut. Kinda like Rahi but waaaay more slutty and forced. She is also still has that urethra, who knows how much a desperate girl can get that one stretched x3. But that's not for everyone, I know, I'm won't force that stuff on anyone"

func hasDevCommentary():
	return true
