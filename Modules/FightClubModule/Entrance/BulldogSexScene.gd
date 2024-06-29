extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "BulldogSexScene"

func _run():
	if(state == ""):
		addCharacter("bulldog")
		playAnimation(StageScene.SexStanding, "sex", {
			pc="bulldog", npc="pc",
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true},
		})

	if(state == ""):
		saynn("Maybe the guy will let you through if you make him feel good. You tilt your head down and slowly close the distance, swaying your {pc.masc} thighs as you do. Your hand reaches for the bulldog’s chest and traces down with a single digit.")

		saynn("[say=pc]You look so strong and manly, maybe we can work something out, you and I..[/say]")

		saynn("The guy only chuckles once and crosses his arms. You can’t help but to notice that his muscle structure is quite well developed. You decide to tease him further and slowly turn around for him. Then you teasingly press your {pc.thick} rear against his crotch and playfully rub his cock through the shorts. The more you do it, the louder animalistic roar that is coming out from the guy’s mouth. You feel his cock poking out of its sheath and prodding your butt.")

		saynn("[say=pc]You want it? Come and get it~.[/say]")

		saynn("Your teasing seems to have an effect on him, very good effect in fact. Only a second passes before he grabs you by the collar and forces your body against the nearby wall, rendering you helpless. It honestly kinda excites you.")

		# (if naked and has pussy)
		if(GM.pc.isFullyNaked() && GM.pc.hasVagina()):
			saynn("You are naked, all your privates are exposed, including your cute {pc.pussyStretch} pussy, which slowly gets wetter from arousal..")

		# (if naked and no pussy)
		if(GM.pc.isFullyNaked() && !GM.pc.hasVagina()):
			saynn("You are naked, all your privates are exposed, including your cute {pc.analStretch} tailhole. The guy spits on his finger and rubs around your star, the only lube that you gonna get.")

		# (if no naked and has pussy)
		if(!GM.pc.isFullyNaked() && GM.pc.hasVagina()):
			saynn("He quickly {pc.undressMessageS}. All your privates are now exposed, including your cute {pc.pussyStretch} pussy, which slowly gets wetter from arousal..")

		# (if no naked and has no pussy)
		if(!GM.pc.isFullyNaked() && !GM.pc.hasVagina()):
			saynn("He quickly {pc.undressMessageS}. All your privates are exposed, including your cute {pc.analStretch} tailhole. The guy spits on his finger and rubs around your star, the only lube that you gonna get.")

		saynn("[say=pc]So eager to fuck me.. Do me rough,[/say]")

		saynn("You feel his hard animal dick brushing against your {pc.masc} thighs. The bulldog pins your head into the wall harder and moves his muzzle to your ear.")

		saynn("[say=bulldog]I don’t fuck. I breed.[/say]")

		saynn("Point taken. Your body instinctively shivers even from just feeling his warmth breath on your skin. His foot taps on your legs, forcing them to open more, giving even more access to your privates. You’re basically begging to be used.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("He isn’t very gentle with you, his cock gets directed towards your needy kitty slit, it’s pointy head brushing against your sensitive folds, then spreading them open and prodding at the entrance itself. One rough thrust and he shoves his canine cock inside! You let out a passionate moan as your cunt gets stretched and stuffed full of his member.")

			saynn("He doesn’t stop there, his hand is still pinning you to the wall while he starts fucking your slit, shoving his dick in and out. You can only squirm under his onslaught, your pussy is coating his cock with your juices.")

		# (if no pussy)
		if(!GM.pc.hasVagina()):
			saynn("He isn’t very gentle with you, his cock gets directed towards your needy tailhole, it’s pointy head brushing against your {pc.analStretch} star, then spreading it slightly open and prodding more. One rough thrust and he shoves his canine cock inside! You let out a passionate moan as your fuckhole gets stretched and stuffed full of his member.")

			saynn("He doesn’t stop there, his hand is still pinning you to the wall while he starts fucking your backhole, shoving his dick in and out. You can only squirm under his onslaught, the inners of your anal gets coated with his precum.")

		# (has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cock} throbs and leaks pre through your little chastity cage as you’re getting railed, balls swinging and touching with his when he rams his dick deep inside.")
		elif(GM.pc.hasPenis()):
			saynn("Your {pc.cock} throbs and leaks pre as you’re getting railed, balls swinging and touching with his when he rams his dick deep inside.")

		saynn("He works up his rhythm to a fast steady one, thrusting his hips with full force, making them slap against your {pc.thick} buttcheeks. His knot begins to inflate with blood making it harder to shove it inside you until the moment he can’t do it anymore. Between your moans, you find a time to be a little bratty with him.")

		saynn("[say=pc]You’re being awfully gentle for such a t-tough guy![/say]")

		saynn("That made him angry. He stops pinning your head to the wall but instead shoves a few of her digits inside your cocky mouth. You gasp and try to look back at him while he still ravages your fuckhole. Blush shows up on your face as you sukle on his digits, moans still escape from you, they just sound way more muffled.")

		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("The more he pounds at your cervix, the closer you are to your orgasm, your eyes glow with pleasure and desire, your g-spot being rubbed so much makes your pussy drip more juices, spawning a little puddle underneath.")

		# (if no pussy but has cock)
		if(!GM.pc.hasVagina() && GM.pc.hasPenis()):
			saynn("The more he smashes your prostate, the closer you are to your orgasm, your eyes glow with pleasure and desire, your p-spot being rubbed so much makes your cock drip even more, spawning a little puddle underneath.")

		# (if no pussy and no cock)
		if(GM.pc.hasVagina() && !GM.pc.hasPenis()):
			saynn("The more he pounds your ass, the closer you are to your orgasm, your eyes glow with pleasure and desire, your pleasure spot being rubbed so much makes you squirm harder.")

		saynn("The guy is relentless, he presses you harder against the wall and starts trying to shove his knot in! As you recoil back from each his thrust, he starts meeting you half-way with an even stronger motion, causing the fat orb to slowly stretch your fuckhole more! Your legs are shaking, you’re gonna cum!")

		addButton("Cum!", "Let it happen", "cum!")

	if(state == "cum!"):
		playAnimation(StageScene.SexStanding, "fast", {
			pc="bulldog", npc="pc",
			pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("After a few tries, the bulldog gathers all of his strength for an even more powerful series of thrusts. At the last one your fuckhole gets force-stretched enough to let the knot slip in! The guy’s full length is inside you, it only takes you a few moments before the sensations overwhelm your body, sending a crazy amount of ecstatic pleasure spikes through you. You arch your back and let out many lewd muffled moans while drooling and passionately sucking on the fingers in your mouth.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("And as your pussy starts squirting and pulsating around the guy’s member, he groans and cums too! His cock breaks into your womb and starts stuffing you full of his virile cum. All the while you’re helplessly stuck on his knot, forced to be his breeding bitch. With nowhere to go, all the cum makes your belly look slightly inflated. Your orgasm gets extended multiple times, your slit keeps squirting juices from overstimulation.")

		# (if no pussy)
		if(!GM.pc.hasVagina()):
			saynn("And as your ring starts clenching and pulsating around the guy’s member, he groans and cums too! His cock is shoved deep inside you and starts stuffing you full of his virile cum. All the while you’re helplessly stuck on his knot, forced to be his breeding bitch. With nowhere to go, all the cum makes your belly look slightly inflated. Your orgasm gets extended multiple times, you can’t stop squirming and shivering.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cock} pulsates strongly against the chastity cage and shoots weak strings of {pc.cum} at the wall before you, creating such a mess! His knot completely drains your balls, you feel spent.")
		elif(GM.pc.hasPenis()):
			saynn("Your {pc.cock} throbs and starts shooting {pc.cum} at the wall before you, such a mess! His knot completely drains your balls, you feel spent.")

		saynn("Eventually you both calm down from your orgasms. The guy pulls out his wet fingers. Your breathing is still heavy, you keep moaning as your hole is stretched to the extreme.")

		saynn("[say=pc]A-Am I worthy?..[/say]")

		saynn("The guy chuckles while waiting for his knot to deflate.")

		saynn("[say=bulldog]Sure thing. You earned yourself a 25 credit discount.[/say]")

		saynn("[say=pc]Wai-.. What?[/say]")

		saynn("As you try to process what happened, the guy forcefully pulls his cock out, causing you to let out another high-pitched moan! Cum starts gushing out of your used hole and down your {pc.masc} thighs. The guy quickly puts his cock away and pins you to the wall again.")

		saynn("[say=bulldog]Not satisfied? I know who can help.[/say]")

		saynn("He gets a strong grasp on your collar and pulls you away from the wall, forcing you to follow his hand.")

		addButton("Continue", "See what happens next..", "afterFirstFuck")

	if(state == "afterFirstFuck"):
		aimCameraAndSetLocName("gym_yoga")
		addCharacter("inmateCrowd")
		playAnimation(StageScene.Solo, "defeat", {
			bodyState={exposedCrotch=true},
		})
		
		saynn("Bulldog tugs you by the collar back into the gym area. Oh no. You see many inmates there, minding their own business, lifting weights, doing exercises. All the while you are completely naked with cum leaking out of your used hole.")

		saynn("He shoves you into the middle of the area, causing you to trip and fall.")

		saynn("[say=pc]Ow.. fucker..[/say]")

		saynn("You look at him. He smiles and nods towards all the inmates around before going back, leaving you alone. Oh..")

		saynn("You look around. Many hungry inmate gazes are directed directly at you. Most of them have stopped doing their thing and instead carefully watch you. Some are already creeping..")

		addButton("Run away!", "Escape before anything happens", "run_away!")
		addButton("Uhh..", "(Non-con, Group, Drug use) Try to reason? You have a strong feeling that it won’t work..", "uhh..")
		addButton("Random", "You are panicking. Let fate decide what happens.", "do_random")

	if(state == "run_away!"):
		saynn("Feeling very exposed, you decide to run away. You swiftly get up and your privates as best as you can before making your escape, leaving a trail of sticky stuff behind you.")

		# (scene ends)
		addButton("Continue", "That was a thing", "endthescene")


	if(state == "uhh.."):
		# (should be lots of tallymarks and bodywritings)
		removeCharacter("bulldog")
		
		saynn("Time to use your natural charisma. The longer you stay still, the more inmates crowd around, you can count at least 7. You offer everyone a very nervous smile, still covering yourself.")

		saynn("[say=pc]M-Maybe we can sort this out?[/say]")

		saynn("Someone chuckles. Your smile slowly slides off your face as some of the inmates expose their cocks, the view of a fucked inmate is certainly a hot one for them.")

		saynn("[sayMale]This slut has a pretty mouth.[/sayMale]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("[sayMale]Wow, {pc.his} cunt is mine![/sayMale]")

			saynn("[sayMale]Fuck off, everyone will get a turn.[/sayMale]")

		# (if no pussy)
		else:
			saynn("[sayMale]Wow, {pc.his} butt is mine![/sayMale]")

			saynn("[sayMale]Fuck off, everyone will get a turn.[/sayMale]")

		saynn("A few dickgirls are around too, already stroking themselves hard. The wall of inmates around you prevents most of the light, you slowly raise from the floor and turn around, desperately trying to find a way out. Giggling nervously is the best you can do.")

		addButton("Continue", "See what happens to you next", "heatdrug")

	if(state == "heatdrug"):
		saynn("Somebody spanks your {pc.thick} ass, making it bounce. Ow! You rub your rear and turn around to see inmates chuckle and cheer while stroking their cocks, all sorts of cocks, some have a knot, some are barbed.")

		saynn("[sayMale]How quickly will {pc.he} break?[/sayMale]")

		saynn("Panic settles into your head, you keep turning around and covering yourself. Suddenly someone sneaks to you from behind and catches both of your arms before wrenching them behind your back! Oh no, you try to break free but someone else joins him, holding you still and your arms wrenched.")

		# (if has pussy and cock)
		if(GM.pc.hasVagina() && GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("You’re exposed! Your {pc.pussyStretch} stuffed pussy, {pc.breasts}, {pc.cock} and the chastity cage that’s on it, beautiful naked {pc.masc} body are all visible to everyone.")
			else:
				saynn("You’re exposed! Your {pc.pussyStretch} stuffed pussy, {pc.breasts}, {pc.cock}, beautiful naked {pc.masc} body are all visible to everyone.")

		# (if has pussy and no cock)
		if(GM.pc.hasVagina() && !GM.pc.hasPenis()):
			saynn("You’re exposed! Your {pc.pussyStretch} stuffed pussy, {pc.breasts}, beautiful naked {pc.masc} body are all visible to everyone.")

		# (if has no pussy and cock)
		if(!GM.pc.hasVagina() && GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("You’re exposed! Your {pc.analStretch} backdoor leaking with cum, your {pc.breasts}, {pc.cock} and the chastity cage that’s on it, beautiful naked {pc.masc} body are all visible to everyone.")
			else:
				saynn("You’re exposed! Your {pc.analStretch} backdoor leaking with cum, your {pc.breasts}, {pc.cock}, beautiful naked {pc.masc} body are all visible to everyone.")

		# (if has no pussy and no cock)
		if(!GM.pc.hasVagina() && !GM.pc.hasPenis()):
			saynn("You’re exposed! Your {pc.analStretch} backdoor leaking with cum, your {pc.breasts}, beautiful naked {pc.masc} body are all visible to everyone.")

		saynn("[say=pc]L-Let go..[/say]")

		saynn("You manage to free one of your arms and shove one of the inmates away but two more take his place, keeping you helpless. You feel dicks rubbing your bare body, precum dripping down from your curves.. they are marking you with their scents already.")

		saynn("[sayMale]We got an unwilling slut! Somebody has a pill?[/sayMale]")

		saynn("You keep struggling when you see someone holding an unknown kind of drug near your lips. You shake your head and keep your mouth shut. The onslaught is unbearable, their hands grope your {pc.breasts}, some give your {pc.thick} ass firm smacks, some sneak down to your used fuckhole and rub it. Eventually you slip up and open your mouth enough for someone to shove a pill past your teeth and force you to swallow it..")

		saynn("Slowly, a very warm fuzzy feeling arises inside you. It feels so good, your privates are itching for attention. Your resistance lowers as a strong feeling of desire starts to mess with your mind. You enjoy all these dicks rubbing against your {pc.masc} thighs and your {pc.thick} butt. You open your mouth and begin dropping noises of pleasure for everyone to hear..")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("They don’t even want to cover with your arms anymore, you are eagerly letting everyone see you and your used dripping pussy.")

		# (if no pussy)
		else:
			saynn("They don’t even want to cover with your arms anymore, you are eagerly letting everyone see you and your used dripping tailhole.")

		saynn("[sayMale]Fuck yeah, {pc.he} is slipping into heat. The pill was mine, I fuck {pc.him} first![/sayMale]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You feel somebody forcibly bending you forward before grabbing your hands and pulling them behind your back. You obey the rough grasp and let out a passionate moan as you feel some canine cock penetrating your cunt! Your slit is getting stretched and fucked again, you moan and spread your legs for them more, your {pc.breasts} are bouncing up and down as your soft inner walls get wet with your juices. Feels so good to be fucked in front of everyone!")

		# (if no pussy)
		else:
			saynn("You feel somebody forcibly bending you forward before grabbing your hands and pulling them behind your back. You obey the rough grasp and let out a passionate moan as you feel some canine cock penetrating your anal ring! Your star is getting stretched and fucked again, you moan and spread your legs for them more, your {pc.breasts} are bouncing up and down as your soft inner walls close around the shaft, providing more friction. Feels so good to be fucked in front of everyone!")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cock} is trying to get hard in its little cage and leaking a lot while you’re getting used. Obviously it won’t get used by it’s fun to look at..")
		elif(GM.pc.hasPenis()):
			saynn("Your {pc.cock} is hard and leaking a lot while you’re getting used. You feel like it won’t get used at all..")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You don’t even care anymore, your eyes show how big of a slut you are, eager moans escape from your lips as the inmate suddenly starts to cum. Your body squirms and shivers, slit squirts as a knot spreads your petals wide and slips inside. You are being knotted while the cock breaks through the cervix and stuff your womb full of cum. There is just no space for it, some sticky jizz starts leaking back out of your fuckhole. All the while inmates jerking off all around you to such a hot view.")

		# (if no pussy)
		else:
			saynn("You don’t even care anymore, your eyes show how big of a slut you are, eager moans escape from your lips as the inmate suddenly starts to cum. Your body squirms and shivers, tailhole clenches as a knot spreads your star open wide and forces its way inside. You are being knotted while the cock stuffs your butt full of his cum. There is just no space for it, some sticky jizz starts leaking back out of your fuckhole. All the while inmates jerking off all around you to such a hot view.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your useless cock is bouncing up and down while shooting little lines of {pc.cum} through the chastity cage, your balls are being emptied without attention to them!")
		elif(GM.pc.hasPenis()):
			saynn("Your neglected cock is bouncing up and down while shooting little lines of {pc.cum}, your balls are being emptied without attention to them!")

		# (tally mark, bodywriting)

		addButton("Continue", "First load. There will be many more..", "inmatesFirstLoad")

	if(state == "inmatesFirstLoad"):
		saynn("As the guy pulls his cock out, cum starts gushing out of your stretched hole. With no support, you drop down to your knees while the crowd tightens around you. There is no shortage of dicks there, inmates chuckle and keep stroking themselves while you hungrily eye them out, your desire is still as strong as it was!")

		saynn("[say=pc]One at a time, boys~~[/say]")

		saynn("One of the inmates steps even closer. He puts his hands on your head and shoves his feline cock between your lips. Oh fuck, its barbed head hits the back of your mouth and goes down your {pc.throatStretch} throat, stretching it. He starts face-fucking you, his balls slapping against your chin as your mouth makes wet sloppy noises.")

		saynn("All the while two inmates around grab your hand each and put them on their cocks. Your fingers instinctevely wrap around their shafts and begin stroking them at a steady pace. Fuck, you look like such a whore, eagerly serving cocks left and right.")

		saynn("[sayMale]Oh fuck~[/sayMale]")

		saynn("Inmates around begin to cum onto you. One after another, throbbing cocks begin shooting their loads onto your face, hair, {pc.masc} arms, {pc.breasts}, {pc.thick} body. You have to keep one of your eyes closed because one of the sticky strings is covering it. As people cum, the cocks inside your hands are switching up, one moment you are stroking two dog cocks and the next time you know it one of them is already a horse dick.")

		saynn("Your mind starts to get hazy from the lack of oxygen, your slutty eyes roll up while your throat is being used for the guy’s pleasure. Suddenly, he starts panting as he gets close. It only takes a few more seconds before he cums and stuffing your belly full of his semen, the spikes on his dick keep you nice and still.")

		saynn("Though, that’s not it for you. As the cock gets pulled out of your throat, another one takes its place. This one isn't as rough with you as the previous one but that only gives you the opportunity to start eagerly deep throat it yourself. You stick your tongue out and start passionately forcing yourself onto the shaft, each time trying to get it a little further.")

		saynn("So much mess on you, even more cum lands on your face as your hands cause more inmates to climax. It’s hard to think, all the thoughts in your head are focused on how to pleasure the inmates around you the best. Mind gets even more hazy, you begin to space out..")

		addButton("Continue", "After some more loads..", "inmatesSecondLoad")

	if(state == "inmatesSecondLoad"):
		saynn("You realize that you have blanked for a second there. While your mind was out, your body and tongue kept working on making sure everyone walks away satisfied, the constant taste of cum in your mouth makes you feel like a cum whore. And you still can't have enough!")

		saynn("As the current lover cums down your throat, you fall to the floor, feeling quite exhausted. But some of the inmates aren’t..")

		saynn("[sayMale]Hey, you are not full of my cum yet.[/sayMale]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Some strong guy picks you up from the floor and slides under you. You’re standing on all fours while he directs his animal dick down your used cunt. You follow his hands and lower your butt onto his cock, letting its tip penetrate your pussy and stretch you out again. Moans begin to escape from your cum-stuffed mouth as he starts fucking you, making you bounce on his member. You sit more vertically as other inmates approach you and put your hands on their dicks again.")

			saynn("[sayFemale]Let me pass, boys. I wanna get a piece of that pie too.[/sayFemale]")

			saynn("A buffed-up dickgirl positions herself behind you and lowers herself to the knees, her knotted cock has ribs along its length. She presses a hand into your back and guides her cock down your tailhole. Your {pc.analStretch} star clenches but that only makes the moment when she forces her shaft inside more intense. You cry out a louder noise as two inmates start using both your holes at the same time, double penetrating you.")

			saynn("[sayFemale]Oh yeah, {pc.he} is much tighter like this. Take it, slut.[/sayFemale]")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("Your {pc.cock} is leaking again as the lady’s cock smashes your prostate each time she stretches you out.")
			elif(GM.pc.hasPenis()):
				saynn("Your {pc.cock} is rock-hard and leaking again as the lady’s cock smashes your prostate each time she stretches you out.")

		# (if no pussy)
		else:
			saynn("Some strong guy picks you up from the floor and slides under you. You’re standing on all fours while he directs his animal dick down your used tailhole. You follow his hands and lower your butt onto his cock, letting its tip penetrate and stretch you out again. Moans begin to escape from your cum-stuffed mouth as he starts fucking you, making you bounce on his member. You sit more vertically as other inmates approach you and put your hands on their dicks again.")

			saynn("[sayFemale]Let me pass, boys. I wanna get a piece of that pie too.[/sayFemale]")

			saynn("A buffed-up dickgirl positions herself behind you and lowers herself to the knees, her knotted cock has ribs along its length. She presses a hand into your back and guides her cock between your buttcheeks, trying to shove it into the occupied hole. Your {pc.analStretch} star clenches harder, the discomfort feeling quickly rises but bit by bit your butt gives in until the moment when she forces her shaft inside fully. You cry out a louder noise as two cocks are stretching your anal at the same time, double penetrating you.")

			saynn("[sayFemale]Oh yeah, {pc.he} is much tighter like this. Take it, slut.[/sayFemale]")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("Your {pc.cock} is leaking again as their cocks smash your prostate each they both thrust inside.")
			elif(GM.pc.hasPenis()):
				saynn("Your {pc.cock} is rock-hard and leaking again as their cocks smash your prostate each they both thrust inside.")

		saynn("You keep riding both dicks at the same time while other inmates keep stroking themselves past their peaks and covering you with more layers of sticky stuff, you make sure to catch some of it into your opened mouth.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You can't endure this for very long, a spike of pleasure hits your mind like a brick, you arch your back and start moaning loudly like a slut while your body shivers and shakes. Your stretched pussy squirts with juices and clenches around the cock that’s using it, your tailhole too. Somebody grabs you by the head again and stuffs into your mouth a huge cock that is about to cum. You eagerly suck it and lick the shaft while it starts throbbing and shooting cum. Fuck yeah.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("As you’re getting fucked, your member throbs a lot but shoots only a few very weak strings of {pc.cum} past its cage, way less than before, seems like your balls got seriously drained during your fun time here.")
			elif(GM.pc.hasPenis()):
				saynn("As you’re getting fucked, your member throbs a lot but shoots only a few weak strings of {pc.cum}, way less than before, seems like your balls got seriously drained during your fun time here.")

			saynn("Even through your orgasm, you keep bouncing on two cocks until the inmates under and behind you begin cumming too! Your eyes roll up completely, you look fucked silly while your womb and butt are being stuffed again and again. Your belly gets visibly inflated, some cum already starts spilling out of your holes. It’s too much pleasure, you feel like you’re about to pass out any second.")

			saynn("As they pull their dicks out, the flow of time seems to slow down for you, corners of your vision become black.. You still produce moans of pleasure as cum starts gushing out of your used holes. Someone very strong catches you before you fall and instead picks you up, he quickly guides his cock and penetrates your poor ass while someone else joins from the front and holds your legs spread while pounding your cunt.")

		# (if no pussy)
		else:
			saynn("You can't endure this for very long, a spike of pleasure hits your mind like a brick, you arch your back and start moaning loudly like a slut while your body shivers and shakes. Your stretched anal ring clenches hard around the cocks that are using it. Somebody grabs you by the head again and stuffs into your mouth a huge cock that is about to cum. You eagerly suck it and lick the shaft while it starts throbbing and shooting cum. Fuck yeah.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("As you’re getting fucked, your member throbs a lot but shoots only a few very weak strings of {pc.cum} past its cage, way less than before, seems like your balls got seriously drained during your fun time here.")
			elif(GM.pc.hasPenis()):
				saynn("As you’re getting fucked, your member throbs a lot but shoots only a few weak strings of {pc.cum}, way less than before, seems like your balls got seriously drained during your fun time here.")

			saynn("Even through your orgasm, you keep bouncing on two cocks until the inmates under and behind you begin cumming too! Your eyes roll up completely, you look fucked silly while your butt is being stuffed again and again. Your belly gets visibly inflated, some cum already starts spilling out of your hole. It’s too much pleasure, you feel like you’re about to pass out any second.")

			saynn("As they pull their dicks out, the flow of time seems to slow down for you, corners of your vision become black.. You still produce moans of pleasure as cum starts gushing out of your used hole. Someone very strong catches you before you fall and instead picks you up, he quickly guides his cock and penetrates your poor ass while someone else joins from the front and holds your legs spread while joining him, shoving his dick into the same hole again.")

		saynn("You start blacking out again and again before finally losing consciousness completely..")

		addButton("Sleep time", "Ohhhhhh..", "sleep_time")

	if(state == "sleep_time"):
		removeCharacter("inmateCrowd")
		
		saynn("Head.. ow.. so dehydrated.. you slowly open your eyes. It’s very late.. There is no one around. You are lying in a puddle of cum.. So it wasn’t a dream..")

		saynn("You slowly get up but you quickly fall again. Ow. Your legs barely move. All of that.. for a discount..")

		saynn("You make sure to support yourself with your arms but they are weak after stroking for so long. You finally manage to get up, some sticky stuff starts dripping down your thighs.")

		saynn("Maybe you should do it again sometime..")

		# (scene ends)
		addButton("Continue", "That was a thing", "endthescene")


func _react(_action: String, _args):
	if(_action == "do_random"):
		_action = RNG.pick(["run_away!", "uhh.."])
	
	if(_action in ["cum!", "run_away!", "uhh..", "heatdrug", "inmatesFirstLoad", "inmatesSecondLoad"]):
		processTime(RNG.randi_range(5, 10) * 60)
	
	if(_action == "cum!"):
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("bulldog")
			GM.pc.cummedInVaginaBy("bulldog")
			
			GM.pc.addTallymarkCrotch()
		else:
			GM.pc.gotAnusFuckedBy("bulldog")
			GM.pc.cummedInAnusBy("bulldog")
			
			GM.pc.addTallymarkButt()
		GM.pc.addSkillExperience(Skill.SexSlave, 50)
		GM.pc.orgasmFrom("bulldog")
		addMessage("Bulldog left a tally mark on you..")
	
	if(_action == "heatdrug"):
		GM.pc.forceIntoHeat()
		
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("inmateMale")
			GM.pc.cummedInVaginaBy("inmateMale")
			
			GM.pc.addTallymarkCrotch()
		else:
			GM.pc.gotAnusFuckedBy("inmateMale")
			GM.pc.cummedInAnusBy("inmateMale")
			
			GM.pc.addTallymarkButt()
		GM.pc.addSkillExperience(Skill.SexSlave, 50)
		GM.pc.orgasmFrom("inmateMale")
		
		addMessage("The inmate left a tally mark on your body..")
		
		if(RNG.chance(100)):
			var zone = BodyWritingsZone.getRandomZone()
			GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
			addMessage("Somebody also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")
			
		
		GM.pc.addLust(100)
		
	if(_action == "inmatesFirstLoad"):
		GM.pc.cummedOnBy("inmateMale")
		GM.pc.cummedOnBy("inmateMale")
		GM.pc.cummedOnBy("inmateShemale")
		GM.pc.gotThroatFuckedBy("inmateMale")
		GM.pc.cummedInMouthBy("inmateMale")
		GM.pc.cummedInMouthBy("inmateMale")
		
		GM.pc.addTallymarkFace()
		GM.pc.addTallymarkFace()
		
		addMessage("More tally marks are drawn on you, yay")
		if(RNG.chance(100)):
			var zone = BodyWritingsZone.getRandomZone()
			GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
			addMessage("Somebody also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")
			
	if(_action == "inmatesSecondLoad"):
		GM.pc.cummedOnBy("inmateMale")
		GM.pc.gotThroatFuckedBy("inmateMale")
		GM.pc.cummedInMouthBy("inmateMale")
		GM.pc.addTallymarkFace()
		
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("inmateMale")
			GM.pc.cummedInVaginaBy("inmateMale")
			GM.pc.gotAnusFuckedBy("inmateShemale")
			GM.pc.cummedInAnusBy("inmateShemale")
			
			GM.pc.addTallymarkCrotch()
			GM.pc.addTallymarkButt()
		else:
			GM.pc.gotAnusFuckedBy("inmateMale")
			GM.pc.cummedInAnusBy("inmateMale")
			GM.pc.gotAnusFuckedBy("inmateShemale")
			GM.pc.cummedInAnusBy("inmateShemale")
			
			GM.pc.addTallymarkButt()
			GM.pc.addTallymarkButt()
		GM.pc.addSkillExperience(Skill.SexSlave, 50)
		GM.pc.orgasmFrom("inmateMale")
		GM.pc.addLust(200)
		
		for _i in range(2):
			var zone = BodyWritingsZone.getRandomZone()
			GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
		addMessage("Inmates draw more tally marks and body writings on your body..")
			
	if(_action == "sleep_time"):
		GM.pc.orgasmFrom("inmateMale")
		
		for _i in range(5):
			var thing = RNG.randf_range(0.0, 50.0)
			if(thing < 10.0):
				GM.pc.cummedInMouthBy(RNG.pick(["inmateMale", "inmateMale2", "inmateMale3", "inmateShemale"]))
				GM.pc.addTallymarkFace()
			elif(thing < 20.0 && GM.pc.hasVagina()):
				GM.pc.cummedInVaginaBy(RNG.pick(["inmateMale", "inmateMale2", "inmateMale3", "inmateShemale"]))
				GM.pc.addTallymarkCrotch()
			elif(thing < 30.0):
				GM.pc.cummedInAnusBy(RNG.pick(["inmateMale", "inmateMale2", "inmateMale3", "inmateShemale"]))
				GM.pc.addTallymarkButt()
			elif(thing < 40.0):
				GM.pc.cummedOnBy(RNG.pick(["inmateMale", "inmateMale2", "inmateMale3", "inmateShemale"]))
			else:
				var zone = BodyWritingsZone.getRandomZone()
				GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
		
		GM.main.processTimeUntil(23*60*60)
	
	if(_action == "afterFirstFuck"):
		GM.pc.setLocation("gym_yoga")
	
	if(_action == "starttalk"):
		runScene("BulldogTalkScene")
		endScene()
		return
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func getDevCommentary():
	return "I can't really display gangbangs because I lack the animations so you will have to use your imagination during these (more than usually x3). But yeah, it's probably one of the first gang-bangs.. and there are probably not that many of them?..\n\nI don't really remember anything about writing this one x3. But my usual approach is to start pulling down on the details when more than 2 characters are fucking. Otherwise.. takes too long to write, takes too long to read, etc. But it's still more than 'you got gangbanged, try harder next time, lol'. Hopefully these are hot, I don't even know, I rarely get aroused from my own writing.. Sometimes I do ^^ when the situation is just too good/hot"

func hasDevCommentary():
	return true
