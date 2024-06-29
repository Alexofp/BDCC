extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "Ch2t3TaviDrugsScene"

func _reactInit():
	addExperienceToPlayer(50)

func _run():
	if(state == ""):
		addCharacter("tavi")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})

		saynn("You show Tavi the few vials that you stole from the medical wing.")

		saynn("[say=pc]I got them, Miss Tavi. Just like you wanted.[/say]")

		saynn("The tall feline smiles and fetches the vials from you before giving you a pat on the head.")

		saynn("[say=tavi]Good job, cutie. You saved your miss from being brainwashed. Was it hard?[/say]")

		# (if did bad stuff to eliza)
		if(getFlag("TaviModule.ch2PCDidBadThingsToEliza")):
			saynn("[say=pc]It wasn’t. But I had to teach the doctor a lesson.[/say]")

			saynn("Tavi raises her brow.")

			saynn("[say=tavi]Huh. I should be scared of you~.[/say]")

		# (if held them inside)
		elif(getFlag("TaviModule.ch2PCPutDrugsInsideSelf")):
			saynn("[say=pc]Ehh, well. Just don’t sniff them too much.[/say]")

			saynn("Tavi chuckles.")

			saynn("[say=tavi]I see what you mean~.[/say]")

		# (if found them)
		else:
			saynn("[say=pc]It was. Had to steal them from the storage room.[/say]")

			saynn("Tavi nods.")

			saynn("[say=tavi]Your efforts didn’t go to waste, that’s for sure~.[/say]")

		# (ends)

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("Tavi moves one of the vials to her face and looks at the bubbling red fluid inside.")

		saynn("[say=tavi]Never seen a drug like this. Sure it’s the right one? The one that can melt minds apparently.[/say]")

		saynn("[say=pc]It must be. These vials were stored in a special crate. What else can it be.[/say]")

		saynn("Tavi scratches her feline nose for a bit, thinking.")

		saynn("[say=tavi]We will only have one chance at this, cutie. I just.. wanna make sure.[/say]")

		saynn("She looks at you. And she does it quite intently. A cunning smile appears on her face, the same one that got imprinted into your mind from the first time you met.")

		saynn("[say=pc]W-wha.. what do you mean?[/say]")

		saynn("Tavi tilts her head slightly and rotates the vial in her hand.")

		saynn("[say=tavi]We gotta test it. You know, the announcement said that even just sniffing it will produce an effect.. Didn’t it?[/say]")

		saynn("You nod but then try to back away. Tavi’s free paw catches your collar and pulls you towards her. She still sounds kind but also very cunning.")

		saynn("[say=tavi]I trust you completely, cutie. But I don’t trust them, I don’t trust their drugs. Just one little sniff. I will be in control of everything and help you if you need it. Do you trust me?[/say]")

		addButton("Agree", "(drugs, noncon, violence) Agree to test the drug that you stole", "agree")
		addButton("No trust", "You really don’t wanna test the drugs", "no_trust")

	if(state == "no_trust"):
		saynn("You don’t try to break free but you also don’t come any closer.")

		saynn("[say=pc]I’m very positive these are the drugs, Tavi. One hundred percent.[/say]")

		saynn("Tavi hums to herself. A few seconds of loud silence get dragged on for too long.")

		saynn("[say=tavi]I understand your concerns, cutie~. I hope you’re right. Or we won’t be able to put an end to this.[/say]")

		saynn("Your miss puts the vials away.")

		saynn("[say=tavi]Well, do you at least want a reward?[/say]")

		saynn("Tavi lets go of your collar and takes a comfy seat on one of the crates before spreading her legs, offering you a view of her inmate shorts that cover her crotch. Her paws grab onto the short’s ribbon and tug, making the fabric dig into her slit, revealing the shape of her sensitive folds.")

		saynn("[say=tavi]On your knees, cutie~.[/say]")

		addButton("Nah", "You don’t wanna do it", "nah")
		addButton("Kneel", "Get on your knees before her legs", "kneel")


	if(state == "nah"):
		saynn("[say=pc]Maybe not today, Tavi.[/say]")

		saynn("Tavi chuckles softly.")

		saynn("[say=tavi]Aww, now you’re disappointing me, cutie. And it’s Miss Tavi for you, mhm?[/say]")

		saynn("You nod once. But that’s not enough for her, Tavi stands up and reaches for your collar again, her voice becomes intimidating.")

		saynn("[say=tavi]Say it.[/say]")

		saynn("[say=pc]My bad, Miss Tavi.[/say]")

		saynn("Tall kitty smiles and scritches you under the chin.")

		saynn("[say=tavi]Good. Yeah, you saved me, thank you. But don’t forget your place.[/say]")

		saynn("She let’s go of your collar.")

		saynn("[say=tavi]Now we just need to somehow get to the transmitter and send a message directly from there.[/say]")

		# (Scene ends)
		addButton("Continue", "Time to go", "endthescene")
		

	if(state == "kneel"):
		playAnimation(StageScene.SexOral, "start", {pc="tavi",npc="pc"})
		
		saynn("You don’t mind that kind of reward, you welcome it, stepping closer and getting down to your knees, obeying the girl’s words. Your hands reach out for Tavi’s thighs but she swiftly slaps them away.")

		saynn("[say=tavi]Bad~. Hands behind your back.[/say]")

		saynn("[say=pc]Yes, Miss Tavi..[/say]")

		saynn("You move your hands behind you and keep them there. Then you lean forward and feel Tavi putting her paw on the back of your head before pressing your face into her shorts.")

		saynn("[say=tavi]There we go~. Take a deep breath, pet.[/say]")

		saynn("You obey and rub your nose into the girl’s crotch before inhaling deeply and smelling her nice scent. Tavi chuckles and gets a better grasp on your head before proceeding to slide her butt back and forth, grinding your face with her crotch and leaving you starved for oxygen.")

		saynn("[say=tavi]Such a good little toy, letting me use their face any way I want~.[/say]")

		saynn("After some teasing she pulls you away from her crotch.")

		saynn("[say=tavi]Take off my shorts.[/say]")

		saynn("Instinctevely you try to reach for her shorts with your hands but she smacks them away again.")

		saynn("[say=tavi]No~.[/say]")

		saynn("You sigh realizing what Tavi wants you to do, your hands return behind your back.")

		addButton("Teeth", "Use your teeth to pull down Tavi’s shorts", "teeth")

	if(state == "teeth"):
		# (cover pc with fluids)
		playAnimation(StageScene.SexOral, "lick", {pc="tavi",npc="pc",
			bodyState={exposedCrotch=true,},
		})
		addCharacter("tavi", ["naked"])

		saynn("You move your head to the short’s ribbon and open your mouth before carefully grabbing it with your teeth.Tavi giggles while you are pulling down her shorts, revealing her careful neat flower of a bright green color, just like the spots on her body. Your mouth starts to make saliva just from looking at it.")

		saynn("[say=tavi]Lick~. But no penetration with your tongue. Got it?[/say]")

		saynn("You nod and swallow audibly before exposing your tongue and getting to work. At first, you just play with her clit, circling around and pushing at it with the tip of your organ. Tavi moans softly and giggles soon after, she just idly sits on the crate with her legs spread, letting you do all the work. She clearly does like it, her folds become more moist and start to produce more of the nice female scent.")

		saynn("Your tongue slides down to the girl’s pussy lips and gives them a good lick, gathering most of the wetness. Each time your tongue touches Tavi’s sensitive petals, you feel her shivering and squirming under you. To see her like that is so arousing. Such a nice change of pace unlike that time when she was grinding your face.")

		saynn("[say=tavi]Pretty good~..[/say]")

		saynn("Her tailhole reacts too, you notice Tavi clenching hard while you lap at her pussy more and more. Eventually her little moans begin to be more loud and passionate, her lusty eyes flash with desire. She still keeps her paw on the back of your head but just to make sure you don’t back away now. You tense your tongue up and prod at her moist hole a few times without penetrating it, just teasing the girl.")

		saynn("Then you wrap your lips around her clit again and start licking it many times. That seems to be the spot because very soon Tavi throws her head back and lets out a lustful moan while her pussy showers you with her fluids.")

		saynn("[say=tavi]Oh fuck~. My bad.[/say]")

		saynn("You eagerly lap up all the juices you can reach with your mouth before swallowing it all while she watches.")

		saynn("[say=tavi]Good jo-o-ob~.[/say]")

		addButton("Continue", "That’s enough fun for now", "continue1")
		addButtonWithChecks("Mark me", "Ask Tavi to piss over you", "mark_me", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])


	if(state == "continue1"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		addCharacter("tavi")
		
		saynn("You get up from your knees while Tavi puts her shorts back on.")

		saynn("[say=tavi]I’m still a little sad that we didn’t test if the drugs are correct but what can you do..[/say]")

		saynn("She purrs and carefully pats you on the head.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

	if(state == "mark_me"):
		# (watersports content)
		playAnimation(StageScene.SexOral, "start", {pc="tavi",npc="pc",
			bodyState={exposedCrotch=true,},
		})
		# (cover with piss)

		saynn("You become so horny from this that you want more.")

		saynn("[say=pc]Can Miss Tavi.. mark her pet?..[/say]")

		saynn("Tavi’s face expression quickly changes, she looks very pleasantly surprised.")

		saynn("[say=tavi]Oh~? My little precious plaything wants to carry the scent of her Miss? Even more of it than you do now I mean~.[/say]")

		saynn("[say=pc]Yes, Miss Tavi..[/say]")

		saynn("Her cheeky smile is shining bright. She suddenly gets a good grasp on your head before standing up and putting one leg up on the crate, offering you an even greater view of her wet pussy.")

		saynn("[say=tavi]That’s great~. Look up at me while I do this.[/say]")

		saynn("You raise your chin and watch Tavi’s face while she tries to force her urge. Her mouth is slightly opened, lips are parted like she is about to moan again. And a few seconds later she does while a stream of warm gross piss emerges from her urethra. You close your eyes while the golden shower starts washing all over you, starting from the face and going down, forcing its scent into your shoulder, body, {pc.breasts}, belly..")

		saynn("[say=tavi]Ah~.. Yeah~. I love marking my pets.[/say]")

		saynn("She is pissing on you for at least half a minute, it seems she had a full bladder saved up for this very moment. Even though the smell is gross and nothing about this is sexy.. it’s still kinda is.. the idea of giving up control so much, idea of letting someone mark you like you are their property.. It's arousing..")

		saynn("Eventually the flow dies down. You feel the piss dripping down from your chin, so warm..")

		saynn("[say=tavi]Too afraid to taste it~? C’mon, it’s just pee, it won’t melt your mind~.[/say]")

		saynn("You sit still, blushing hard. Eventually you are able to open your eyes again. You look down at you and see.. that you are wet and sitting in a puddle of Tavi’s urine. Lewd.")

		saynn("[say=tavi]Go get a shower, cutie~. As much as I love how you look, others might not.[/say]")

		saynn("You carefully get up and silently nod to your miss.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "agree"):
		playAnimation(StageScene.Duo, "sit", {npc="tavi"})
		
		saynn("You tilt your head down but Tavi catches your chin and offers support.")

		saynn("[say=tavi]I know it’s not easy for you. But it’s really important.[/say]")

		saynn("[say=pc]I trust you, Miss Tavi.[/say]")

		saynn("[say=tavi]Thank you.[/say]")

		saynn("You take a seat near her and try to prepare, both mentally and physically.")

		saynn("[say=tavi]If we drug the captain with these. And they don’t have any effect on him. We’re dead, cutie.[/say]")

		saynn("Tavi holds one of the vials at a fair distance from her and carefully unscrews the lead.")

		saynn("[say=pc]You’re right. I’m ready.[/say]")

		saynn("[say=tavi]Just one small sniff. It might not even do anything.[/say]")

		saynn("She grabs your hand and puts it under hers, letting you control everything. You inhale deeply and slowly guide her paw towards your nose.")

		addButton("Sniff", "See what happens..", "sniff")

	if(state == "sniff"):
		saynn("You catch the glimpse of the drug’s smell before Tavi pulls it away. It burns slightly. It’s like your receptors are all being activated. Such a strange feeling.")

		saynn("[say=tavi]Talk to me, cutie.[/say]")

		saynn("You look at Tavi. Everything seems normal. You watch her screw the lead back on.. for a while already. It’s like the world is.. slowing down. But you are disconnected from it. And your brain really doesn’t like it. Oops.. there goes your consciousness.")

		saynn("Darkness.. Scary darkness. And yet, it’s very calming.")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		playAnimation(StageScene.Solo, "stand")
		removeCharacter("tavi")
		
		saynn("(( Do you like futas? ))")

		addButton("Yes", "You like dickgirls", "yes_futas")
		addButton("No", "You prefer girls without extras", "no_futas")


	if(state in ["yes_futas", "no_futas"]):
		saynn("(( Good, carry on ))")

		addButton("Wake up", "See what happens next", "wake_up")

	if(state == "wake_up"):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "defeat", {npc="tavi"})
		
		saynn("You slowly open your eyes. Ow. Head hurts a little. But that’s about it.")

		saynn("You’re in the same space as you were, on the cold floor. And Tavi is still there too, standing nearby, being quite upset for some reason.")

		saynn("[say=tavi]Why.. It was our only chance..[/say]")

		saynn("You rub your head a bit and try to get up. But Tavi notices that you are awake, she suddenly turns towards you and kicks you down, making you do an arc before crash-landing onto the crates. That really hurt. And you’re still waking up, unable to process everything.")

		saynn("[say=pc]Ugh.. Wha-a?[/say]")

		saynn("Tavi’s eyes show hatred towards you. She shows off her sharp fangs as she starts slowly stepping towards you, making sure to put extra sway into her hips.")

		saynn("[say=pc]What hap-..[/say]")

		saynn("Before you can finish your question, the tall cat jumps onto you and pulls away from the crates before throwing your carcass into the nearby wall. You hit the cold metal before falling flat, grunting.")

		saynn("[say=tavi]You ruined everything! Stupid pet.[/say]")

		saynn("Tavi is clearly furious and you have no idea why. She is scary. You soon realize what happened.")

		saynn("You crawl back away from the crazy bitch and grab onto the wall behind you. You sit down by supporting yourself against it. You notice.. lots of broken glass near the crates. And the red drug.. spilled onto the floor.. You must have broken them somehow when losing consciousness.")

		saynn("[say=tavi]You killed us both. But that won’t stop me from murdering you first. And I will surely enjoy breaking your mind and your every bone. Like a little sheep that you are.[/say]")

		saynn("Tavi’s evil eyes flash brightly as her paws extend some quite impressive sharp claws. They must have grown more since the last time you saw them.")

		addButton("Run", "You’re in no shape to fight her", "run")

	if(state == "run"):
		saynn("Tavi is not being reasonable, It’s like she snapped after losing the drugs. You must escape before she does get to you.")

		saynn("[say=tavi]You’re still alive? What a pathetic display.[/say]")

		saynn("You quickly get up using the wall while she starts slowly creeping up towards you, for some reason being extra feminine with her walk again.")

		saynn("She is blocking off your only exit so you must go through her somehow, there is not much time left.")

		addButton("Shove", "Use your strength to overpower her and escape", "shove")
		addButton("Avoid", "Use your agility to escape her grasp", "avoid")

	if(state == "shove"):
		playAnimation(StageScene.Duo, "shove", {npc="tavi"})
		
		saynn("You quickly gather all your strength and lash out at crazy Tavi, trying to push her back. And you manage to do it! Your attack connects perfectly and makes the tall cat hiss as she loses balance and collapses onto the floor.")

		saynn("That gives you enough time to escape! You take off and sprint towards the exit, not even looking back.")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "avoid"):
		playAnimation(StageScene.Duo, "dodge", {npc="tavi"})
		
		saynn("You swiftly inhale and dash towards the crazy Tavi. But instead of attacking her, you slide just past her so she can’t grab you by the hair even if she wanted to. Success! Tavi growls as she misses the window to catch you.")

		saynn("That gives you enough time to escape! You take off and sprint towards the exit, not even looking back.")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "continue3"):
		saynn("But maybe you should have looked back. Because Tavi’s paw suddenly grabs the back of your collar and stops you. You feel her sharp claws digging into your neck. Ow. Somehow she managed to catch up with you and get such a strong grasp on your collar that you can’t even take a step.")

		saynn("Actually, you don’t feel the floor underneath you at all.")

		saynn("[say=tavi]Jumping into lava won’t save you, silly pet.[/say]")

		saynn("What? What lava? Oh shit. You look down and instead of finding the prison floor tiles, you see [b]literal molten lava[/b] flowing right underneath your feet. Tavi holds you above it by your collar alone.")

		saynn("[say=pc]What the..[/say]")

		addButton("Continue", "See what happens next...", "continue4")

	if(state == "continue4"):
		playAnimation(StageScene.Duo, "defeat", {npc="tavi"})
		
		saynn("But before you can react fully, Tavi just throws you back a few meters, she surely got stronger since last time you met. But that’s the least of your concerns. Because suddenly the whole prison around you began.. melting down. The walls slowly sink under the floor, revealing.. a hellish landscape behind.")

		saynn("You and Tavi are literally stranded on a little piece of prison floor that’s left. What surrounds it is an ocean of lava with red burning hills in the distance, a literal hell.")

		saynn("[say=pc]T-this can’t be real..[/say]")

		saynn("A few moments of silence. Followed by Tavi’s laugh. She just stands there on the opposite side of the little island and laughs.")

		saynn("[say=tavi]Hahaha. You look so terrified. Such an adorable little thing.[/say]")

		saynn("[say=pc]Where the fuck are we? Am I hallucinating?[/say]")

		saynn("Tavi spreads her arms around like she is about to hug the air.")

		saynn("[say=tavi]You’re in my world, pretty thing. Tavi’s world of pain and suffering.[/say]")

		saynn("She doesn’t sound like herself. She looks like Tavi but her voice is intimidating and dark, way more dark than usually.")

		saynn("[say=pc]Y-you’re not Tavi.. Who.. What.. even are you?[/say]")

		addButton("Continue", "This is crazy..", "continue5")

	if(state == "continue5"):
		saynn("[say=tavi]Ohh, make no mistake, little toy. I Am Tavi! Your Miss. You unleashed my best side, broke the chains that were holding me back.[/say]")

		saynn("She takes a feminine standing pose, showing off the curves of her girly hips that are still covered by an inmate uniform.")

		saynn("After that, her paw reaches for her own inmate collar. She gets a good grasp on it and then just.. snaps it in half.. effortlessly.. Like it was made out of plastic. Tavi throws the broken restraint into the lava and then rubs her free neck.")

		saynn("At the same time, her highsec block uniform somehow catches fire. Tavi is literally burning and shows no reaction to it. This fire is special though, it’s [color=green]green[/color]! It engulfs her completely, you only see her creepy smile before she disappears in it.")

		saynn("You’re too terrified to even move..")

		addButton("Continue", "Is that it?..", "continue6")

	if(state == "continue6"):
		removeCharacter("tavi")
		if(getFlag("TaviModule.ch2DrugsPickedFuta")):
			addCharacter("taviDemonFuta", ["naked"])
			playAnimation(StageScene.Duo, "kneel", {
				npc="taviDemonFuta",
				bodyState={naked=true,hard=true},
				npcBodyState={hard=true},
			})
		else:
			addCharacter("taviDemon", ["naked"])
			playAnimation(StageScene.Duo, "kneel", {
				npc="taviDemon",
				bodyState={naked=true,hard=true},
				npcBodyState={hard=true},
			})
		
		saynn("A few moments later Tavi steps out of the green fire. New Tavi..")

		saynn("The first thing that you notice.. she is much taller, taller than any person that you have seen. Two demonic horns are sticking out of her head. Her differently-colored eyes produce a powerful glow. Her tail is that of some demonic creature, her digitigrade feet are now powerful hoofs that leave a burning trail behind.")

		saynn("She is naked and clearly not ashamed of it. Her tits are so much bigger, they are at least F-cup with green perky nipples. Her hips are wider too to accomodate for that fact. All the glowing spots on her fur are now shining even brighter, giving her a more intimidating look.")

		# (if futa)
		if(getFlag("TaviModule.ch2DrugsPickedFuta")):
			saynn("But the most obvious thing.. is between her legs. What stares at you is a giant green glowing shaft of a horsecock. Tavi is hard, her equine dick is already leaking thick-looking precum. Her big hanging balls are sometimes twitching together with the shaft, she seems to be very eager.")

		# (else)
		else:
			saynn("Between her legs is her green inviting slit. Her pussy folds glow just like the rest of her green bits. You notice her petals twitching as a string of thick juices drools down, Tavi seems to be quite eager.")

		saynn("[say=tavi]And now I will reward you for your work. By enslaving you for eternity. HAHAHAHA![/say]")

		saynn("Her voice sounds demonic, a deep evil echo follows behind. It’s like your soul is vibrating together with her laugh. Tavi looks hot, literally.. But this can’t be real. It must be a dream!")

		saynn("[say=pc]T-this is insane.. It must be the drug. I’m under the influence, none of this is real![/say]")

		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("Two giant wings sprawl from behind Tavi’s back. She hops towards you with their help and pins you into the floor with her hoof. The hoof that starts burning any clothes that you are wearing, leaving you quite exposed. Her green flames don’t seem to be hurting you though.")

		# (else)
		else:
			saynn("Two giant wings sprawl from behind Tavi’s back. She hops towards you with their help and pins you into the floor with her hoof. Your naked chest looks like it’s on fire but her green flames don’t seem to be hurting you though.")

		saynn("[say=tavi]Haha. You think this is just a dream? But who says that you will wake up? SILLY THING.[/say]")

		saynn("She leans down while applying more pressure onto your chest with her hoof, bringing quite a bit of discomfort. Even if it’s a dream, you feel everything like it’s happening for real. Tavi’s voice is resonating with its echo, making it ten times more scary.")

		saynn("[say=tavi]I WILL ENSLAVE YOUR SOUL. AND YOU WILL SERVE YOUR MISS HERE FOREVER, IN MY REALM.[/say]")

		saynn("She grabs onto your inmate collar and effortlessly breaks it in half too before tossing it away. She then snaps her fingers and some kind of magic collar takes its place. It looks like a red ritual pentagram that’s guarding a red magic ring around your neck and it feels quite solid despite how it might look. You tug on it and realize that it's not going anywhere.")

		saynn("[say=tavi]THE FIRST SNAP HAS TRAPPED YOUR SPIRIT. THE SECOND SNAP WILL TRAP YOUR BODY. AND THE LAST SNAP WILL TRAP YOUR SOUL.[/say]")

		saynn("The first out of three snaps already happened, you’re not looking good. But maybe you want it?.. Maybe being her eternal servant isn’t such a bad idea.. No, that can’t be right..")

		addButton("Continue", "See what happens next", "continue7")

	if(state == "continue7"):
		if(getFlag("TaviModule.ch2DrugsPickedFuta")):
			saynn("Tavi pulls her hoof away from your chest and takes a step back, her massive hard horsecock sways a lot from each movement.")
		else:
			saynn("Tavi pulls her hoof away from your chest and takes a step back.")
		
		saynn("[say=tavi]Now. On your knees, servant.[/say]")

		saynn("You swipe off the ash that her hoof left on your exposed chest and obey her order. Your wounds still remind you about themselves so you can’t help but to grunt from pain.")

		saynn("[say=tavi]Pathetic. Mortal flesh is so weak.[/say]")

		saynn("[say=pc]You threw me..[/say]")

		saynn("Tavi lets out a demonic growl before your magic collar suddenly gets tighter around your neck, suffocating you. You try to grab onto it but the pentagram zaps your digits each time, leaving you completely helpless under it.")

		saynn("[say=pc]S-sorr..ry..[/say]")

		saynn("Demonic Tavi approaches you and plops her flared member onto your forehead, letting it drip hot glowing precum onto your head and back.")

		saynn("[say=tavi]Sorry who?[/say]")

		saynn("The collar gives you some breathing room while also preventing you from backing off.")

		saynn("[say=pc]Sorry, Miss Tavi. Your servant is really sorry.[/say]")

		# (if futa)

		# (options are get fucked annally or vaginally, depending on bits)

		# (if not futa)

		# (options are fuck Tavi if has penis and licking+tailfuck if vagina/nothing)

		if(getFlag("TaviModule.ch2DrugsPickedFuta")):
			addButton("Get fucked", "Time to serve as Tavi’s cockslave", "get_fucked")
		else:
			addButtonWithChecks("Fucking", "Serve as Tavi’s playtoy", "fucking", [], [ButtonChecks.HasReachablePenis])
			addButton("Lick+Tailfuck", "That tail Tavi has is quite pointy..", "lick_tailfuck")

	if(state == "get_fucked"):
		# (only futa tavi)
		playAnimation(StageScene.SexStart, "start", {
			npc="pc", pc="taviDemonFuta",
			bodyState={hard=true},
			npcBodyState={naked=true,caged=true},
		})

		saynn("Tavi tilts her head slightly before moving her cock back and shoving it into your face, letting you see the inflated glands on its flared tip. And the scent it.. so arousing. You nuzzle the offered cock and give it a little smooch.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("All the while your own cock is getting harder. Tavi sees that and smirks.")

		# (else if has pussy)
		else:
			saynn("All the while your pussy slit is getting needy, arousal drips from your sex onto the last piece of land.")

		saynn("[say=tavi]You will be corrupted by this cock. Gradually. Day after day of constant breeding will make you start craving for it. For its seed.[/say]")

		saynn("Tavi makes a gesture with her hand and the collar starts pulling your head onto her shaft. It’s too big to take without your jaw getting dislocated but your lips are pressing against its hole and feel as dickgirl’s precum starts oozing past them and dripping onto your tongue.")

		saynn("[say=tavi]You will swallow anything that my cock leaks into your mouth like a good servant.[/say]")

		saynn("You look up at Tavi and audibly swallow her precum. It’s thick and salty.. But also so nice. You feel it numbing your pain away, instead replacing it with.. a desire. Your mind is racing wild.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cock} is throbbing and leaking pre more. Tavi sees your cage but it seems she doesn’t like its look so she grabs onto it and breaks the lock with ease. She then motions with her hand again and one of the metal rods gets ripped out of the metal floor before twisting into a little arched spiral. It starts pressing on your cock’s head, battling your erection before another rod bends around your balls and welds together with the first, creating a little neat chastity cage.")
			
			saynn("[say=tavi]What? Thought I would release it? No~. You’re getting a proper cage. You don’t need that useless dick with me, cutie~.[/say]")
			
			saynn("What? Your hands reach out for your crotch but quickly realize that the cage is there. And that it doesn’t have a keyhole or any other ways to take it off. Tavi chuckles with her demonic voice.")
			
			saynn("[say=tavi]Miss it already? Such a shame that it’s permanent~.[/say]")
		elif(GM.pc.hasPenis()):
			
			saynn("Your {pc.cock} is throbbing and leaking pre more. Tavi finally decides to take action against that. She motions with her hand again and one of the metal rods gets ripped out of the metal floor before twisting into a little arched spiral. It starts pressing on your cock’s head, battling your erection before another rod bends around your balls and welds together with the first, creating a little neat chastity cage.")

			saynn("[say=tavi]You don’t need that useless dick with me either way, cutie~.[/say]")

			saynn("What? Your hands reach out for your crotch but quickly realize that the cage is there. And that it doesn’t have a keyhole or any other ways to take it off. Tavi chuckles with her demonic voice.")

			saynn("[say=tavi]Miss it already? Such a shame that it’s permanent~.[/say]")

		# (ends)

		addButton("Continue", "See what happens next", "continue8")

	if(state == "continue8"):
		playAnimation(StageScene.SexMissionary, "sex", {
			npc="pc", pc="taviDemonFuta",
			bodyState={hard=true},
			npcBodyState={naked=true,caged=true},
		})
		
		saynn("After letting you swallow her precum for a bit, Tavi suddenly grabs you under your armpits and lifts you up. She is strong, way stronger than you.")

		saynn("[say=tavi]Time to show you your place, my servant.[/say]")

		saynn("The magic collar acts like a third point of support, keeping you still while your Miss walks behind you and puts her paws on your legs. She then lifts you while forcing your knees up to your shoulder level, putting you into a full nelson position. Her paws lock behind your head and force you to look straight while she starts lowering you onto her monster of a cock.")

		saynn("[say=pc]Uh.. it w-won’t fit.[/say]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("The tip of Tavi’s cock finds your pussy slit and starts rubbing against it, trying to catch the pussy hole. It slips past a few times before Tavi finally finds a good position where the flared tip is pressed directly against your slit. One rough thrust and Tavi shoves her horsecock deep inside your sex, the petals get forcibly spread wide by her flat tip, making you cry out a loud moan.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your trapped dick desperately tries to get hard but the metal cage is keeping it completely flaccid for your Miss.")

			saynn("[say=tavi]Oh yeah? Nghh, such a tight hole.[/say]")

			saynn("You notice a nice glowing bump on your belly already, Tavi’s dick is shining through your flesh. She doesn’t stop there, already beginning to pull her horsedick out just to ram it deep inside you again, smashing your cervix and forcing another moan out of you.")

			saynn("[say=tavi]Nothing stops me. I will turn you into my breeding stock. You're gonna give birth to so many imps. Enough to conquer the world.[/say]")

			saynn("Fuck it feels good, your pussy gets really tight around her veiny cock but she continues to push through and stretching your hole out while pounding it hard. Her huge balls slap against your crotch while she quickly picks up the pace and increases the onslaught.")

			saynn("Your mind is overwhelmed by the amount of pleasure, your eyes already want to roll up while your first orgasm creeps up on you. A few more thrusts and you start squirming in Tavi’s hands, your poor stretched pussy squirting its fluids from so much stimulation. It feels so good that you wanna scream.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your useless cock shoots a few weak strings of {pc.cum} past the permanent cage.")

			saynn("[say=pc]Y-yes!.. Ah~.. Miss Tavi! Make me yours![/say]")

			saynn("You feel very strong vibrations as Tavi lets out a grunt, your orgasm is making her more eager, she starts fucking you faster and faster. You suddenly hear a snap of her fingers behind your head.. While she relentlessly abuses your pussy, something starts happening to you. [b]You look down and notice a tattoo appearing on your lower part of the belly. A purple womb tattoo..[/b]")

			saynn("[say=tavi]My mark on your crotch. It claims your mortal body as mine. Mine to command and.. Breed forever.[/say]")

			saynn("That tattoo sends out a warm wave all over your body. Your previous orgasm didn’t even have enough time to fade before another starts closing in. And it seems that Tavi is close too.. So many dirty thoughts appear in your head suddenly.. But all of them are so pleasing.")

			saynn("[say=pc]Yes-yes!! Ple-ease! Breed your needy servant slut![/say]")

		# (if NO PUSSY)
		else:
			saynn("The tip of Tavi’s cock finds your tailhole and starts prodding at it, testing how tight your backdoor is. It slips past the hole a few times before Tavi finally finds a good position where the flared tip is pressed directly against your anus. One rough thrust and Tavi shoves her horsecock deep inside your sex, the soft flesh gets forcibly spread wide by her flat tip, making you cry out a loud moan.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your trapped dick desperately tries to get hard but the metal cage is keeping it completely flaccid for your Miss.")

			saynn("[say=tavi]Oh yeah? Nghh, such a tight hole.[/say]")

			saynn("You notice a nice glowing bump on your belly already, Tavi’s dick is shining through. She doesn’t stop there, already beginning to pull her horsedick out just to ram it deep inside you again, smashing your pleasure spot and forcing another moan out of you.")

			saynn("[say=tavi]Nothing stops me. I will turn you into my breeding stock. You gonna give birth to so many imps.[/say]")

			saynn("What does she mean by that? But fuck it feels good, your ring gets really tight around her veiny cock but she continues to push through and stretching your hole out while pounding it hard. Her huge balls slap against your crotch while she quickly picks up the pace and increases the onslaught.")

			saynn("Your mind is overwhelmed by the amount of pleasure, your eyes already want to roll up while your first orgasm creeps up on you. A few more thrusts and you start squirming in Tavi’s hands, your poor stretched tailhole pulsating so much stimulation. It feels so good that you wanna scream.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your useless cock shoots a few weak strings of {pc.cum} past the permanent cage.")

			saynn("[say=pc]Y-yes!.. Ah~.. Miss Tavi! Make me yours![/say]")

			saynn("You feel very strong vibrations as Tavi lets out a grunt, your orgasm is making her more eager, she starts fucking you faster and faster. You suddenly hear a snap of her fingers behind your head.. While she relentlessly abuses your butt, something starts happening to you. [b]You look down and notice a tattoo appearing on your lower part of the belly. A purple womb tattoo..[/b]")

			saynn("[say=tavi]My mark on your crotch. It claims your mortal body as mine. Mine to command and.. Breed forever. It allows you to be impregnated~.[/say]")

			saynn("What!? That tattoo sends out a warm wave all over your body. Your previous orgasm didn’t even have enough time to fade before another starts closing in. And it seems that Tavi is close too.. So many dirty thoughts appear in your head suddenly.. But all of them are so pleasing. Being able to be bred from anal sex sounds so kinky..")

			saynn("[say=pc]Yes-yes!! Ple-ease! Breed your needy servant slut![/say]")

		addButton("Continue", "See how she will enslave your soul..", "continue9")

	if(state == "continue9"):
		playAnimation(StageScene.SexMissionary, "fast", {
			npc="pc", pc="taviDemonFuta", pcCum=true, npcCum=true,
			bodyState={hard=true},
			npcBodyState={naked=true,caged=true},
		})
		
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Tavi switches to slow powerful thrusts before finally shoving her flared cock balls deep inside you, causing the bump on your belly to be even bigger. As she does that, you cum hard, arching your back as much as Tavi’s paws allow and moaning like a slut for her. Your pussy clenches around her shaft, trying to milk it. And after a few grunts from Tavi, her balls start tensing up as a load after load of hot magma-like seed begin flowing into your womb and instantly stuffing it to the brim.")

			saynn("[say=tavi]Take it all my servant! That’s the last day of you not being pregnant with my imps![/say]")

			saynn("[say=pc]Oh fuck! Fuck-fuck-fuck~. Thank you! Fuck all of your cum into me![/say]")

			saynn("You look down and notice that the womb tattoo is glowing brightly, a little symbol appears on it that signifies the successful impregnation.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("All the while your cock twitches against the tight metal cage and wastes another pathetic load onto the floor.")

			saynn("And the cum just doesn’t stop, Tavi’s cock keeps throbbing and shooting more and more of her seed directly inside you, extending your own orgasm. Demonic grunts escape from the tall cat as she enjoys your pussy draining her balls.")

			saynn("After that good breeding, Tavi pulls her cock out and lets your used cunt leak.")

			saynn("[say=tavi]Your Miss can breed you many times more.[/say]")

		# (if NO pussy)
		else:
			saynn("Tavi switches to slow powerful thrusts before finally shoving her flared cock balls deep inside you, causing the bump on your belly to be even bigger. As she does that, you cum hard, arching your back as much as Tavi’s paws allow and moaning like a slut for her. Your tailhole clenches around her shaft, trying to milk it. And after a few grunts from Tavi, her balls start tensing up as a load after load of hot magma-like seed begin flowing into your butt pussy and instantly stuffing it to the brim.")

			saynn("[say=tavi]Take it all my servant! That’s the last day of you not being pregnant with my imps![/say]")

			saynn("[say=pc]Oh fuck! Fuck-fuck-fuck~. Thank you! Fuck all of your cum into me![/say]")

			saynn("You look down and notice that the womb tattoo is glowing brightly, a little symbol appears on it that signifies the successful impregnation.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("All the while your cock twitches against the tight metal cage and wastes another pathetic load onto the floor.")

			saynn("And the cum just doesn’t stop, Tavi’s cock keeps throbbing and shooting more and more of her seed directly inside you, extending your own orgasm. Demonic grunts escape from the tall cat as she enjoys your butt draining her balls.")

			saynn("After that good breeding, Tavi pulls her cock out and lets your used fucktole leak.")

			saynn("[say=tavi]Your Miss can breed you many times more.[/say]")

			saynn("Tavi gently lowers you to the ground. You get on your knees and happily grope your inflated belly. You look up at your Miss and see that her messy cock soon springs back into action, leaking more precum already.")

		addButton("Continue", "See what happens next", "finalsnapquestion")

	if(state == "finalsnapquestion"):
		if(getFlag("TaviModule.ch2DrugsPickedFuta")):
			playAnimation(StageScene.SexStart, "start", {
				npc="pc", pc="taviDemonFuta",
				bodyState={hard=true},
				npcBodyState={naked=true,caged=true},
			})
		else:
			playAnimation(StageScene.SexStart, "start", {
				npc="pc", pc="taviDemon",
				bodyState={hard=true},
				npcBodyState={naked=true,},
			})
			
		saynn("[say=tavi]But before we continue.. We gotta seal your fate. Make you mine forever.[/say]")

		saynn("Tavi raises her right hand and moves her digits, preparing to do a snap. A snap that will trap your soul here for eternity.")

		saynn("[say=tavi]Ready~?[/say]")

		addButton("Nod", "You don’t mind this", "nod")
		addButton("Shake head", "You don’t want this", "shake_head")

	if(state == "nod"):
		setFlag("TaviModule.ch2DrugsSaidYesToDemonTavi", true)
		saynn("You tilt your head down and nod once.")

		saynn("That doesn’t seem to be enough for Tavi, she catches your chin and makes you look up at her.")

		saynn("[say=tavi]Say it, servant.[/say]")

		saynn("[say=pc]Please.. make me yours forever, Miss Tavi..[/say]")

		saynn("A low growly purring escapes from the demonical cat. She pats you once.")

		saynn("[say=tavi]You will make such.. a great.. slave..[/say]")


	if(state == "shake_head"):
		setFlag("TaviModule.ch2DrugsSaidYesToDemonTavi", false)
		saynn("You tilt your head down.. and then shake it. Being an internal servant in hell.. is too much.")

		saynn("Tavi catches your chin and makes you look up at her.")

		saynn("[say=tavi]Well. It’s not like you have a choice, sweetie.[/say]")

		saynn("A low growly purring escapes from the demonical cat. She scriches you under your chin while you look at her with your terrified eyes.")

		saynn("[say=tavi]You will make such.. a great.. slave..[/say]")

		# (same from here)
	
	if(state in ["nod", "shake_head"]):
		saynn("Time starts to slow down.. Is that the adrenaline?.. Wait.. What.. The prison walls! You see them rising up from lava, displacing it. And Tavi sees them too, she quickly gets mad.")

		saynn("[say=tavi]What?! This is impossible! Well, it doesn’t matter now. It’s too late for this.[/say]")

		saynn("Tavi snaps her fingers.. and nothing happens.. The walls keep moving into their old places, the lava begins to dry up. Tavi sees that.. Her eyes shine with horror. And hatred.")

		saynn("[say=tavi]NO! I was so close! BITCH. YOU WILL PAY FOR THIS.[/say]")

		saynn("She growls loudly and lashes out at you. But before she can sink her sharp claws into you, a metal chain catches her paw and wraps around her wrist before yanking her arm back, saving you.")

		saynn("[say=tavi]WHAT IS THIS MADNESS?[/say]")

		saynn("Tavi rips that chain with ease but another two catch her other hand. And before she can wind up a kick, the chains yank the demonic Tavi away from you into more chains that wrap around her every limb, including the tail and her horns. All the while the prison keeps rebuilding itself around you.")

		saynn("[say=tavi]I WILL FIND YOU. THIS ISN’T OVER. NOT IN A SLIGHTEST.[/say]")

		saynn("Tavi starts laughing hysterically while ripping more chains into shreds just for them to be replaced by new ones.")

		saynn("[say=tavi]HAHAHA! Because I’m here. I’m always very close. I’m in YOUR HEAD. YOU CAN’T ESCAPE ME. AHAHAHAHA.[/say]")

		saynn("And the same moment that the last metal panels and airlocks find their spots, the lights turn on with a loud click. And you fall unconscious.")

		saynn("Thump.")

		addButton("...", "...", "...")

	if(state == "..."):
		removeCharacter("taviDemonFuta")
		removeCharacter("taviDemon")
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "sit", {npc="tavi"})
		
		saynn("You gasp as you open your eyes. You’re sitting on a crate. Tavi has her paws wrapped around you, hugging you tightly. She jumps from your sudden reaction. There is a used medical injector on the floor.")

		saynn("[say=tavi]Oh, finally. You had me so-so worried. Are you alright?[/say]")

		saynn("Tavi seems normal, you don’t find any horns, wings or hoofs on her.")

		saynn("[say=pc]A-are the drugs okay?..[/say]")

		saynn("[say=tavi]Yeah, of course they are. I have them safe. I thought your heart stopped, cutie..[/say]")

		saynn("She pulls you onto her lap and starts cuddling you and nuzzling your face.")

		saynn("[say=pc]I saw a.. a nightmare.. I think..[/say]")

		saynn("You look around yourself. It’s the same space as you were before you sniffed the drug. And Tavi is normal.. So it must have been just a nightmare..")

		saynn("[say=tavi]A nightmare? Tell me about it.[/say]")

		addButton("Tell her", "explain her what you saw", "tell_her")

	if(state == "tell_her"):
		saynn("You explain to Tavi everything that you remember, the broken drugs, the hellish environment and how Tavi looked and acted.")

		saynn("[say=tavi]Really? That doesn’t sound like a nightmare to me~. You probably enjoyed seeing the demonic me. Do the horns and hoofs fit me?[/say]")

		saynn("[say=pc]It was.. terrifying..[/say]")

		saynn("[say=tavi]Aww.[/say]")

		saynn("She leans in to smooch you on the head.")

		saynn("[say=tavi]Well. At least we know these are the right drugs. You think a full dose of these would pacify the captain?[/say]")

		saynn("[say=pc]If he will see what I saw.. And no one helps him.. He is screwed.. Do you wanna kill him though?[/say]")

		saynn("Tavi looks away for a second while resting her chin on your shoulder.")

		saynn("[say=tavi]I don’t know, cutie.. I don’t wanna kill anyone.. Except for the people who made me. They must suffer the same way that I did. Every last one of them..[/say]")

		saynn("That went kinda grim real fast. You decide not to bug your miss with more questions and just cuddle with her. You really need that rest after what you saw.")

		addButton("Cuddle", "Spend some time with Tavi", "cuddle")

	if(state == "cuddle"):
		saynn("You rest in Tavi’s paws for some time. You almost hear her start snoozing. But she catches herself.")

		saynn("[say=tavi]Well. Thank you for helping me, cutie. It means a lot.[/say]")

		saynn("[say=pc]Thank you for saving me, Miss Tavi. I should go now.[/say]")

		saynn("She nods and lets you get up and leave.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "fucking"):
		# (needs a penis)
		playAnimation(StageScene.SexOral, "lick", {
			npc="pc", pc="taviDemon",
			bodyState={hard=true},
			npcBodyState={naked=true,hard=true},
		})

		# (only non futa tavi)

		saynn("Tavi tilts her head before spreading her strong legs more, offering a greater view of her slick-looking pussy. She then makes a gesture with her hand that pulls your collar closer to her female crotch, your lips pressing against her enticing sensitive folds. All the while your exposed cock is getting visibly harder, just feeling the scent of her pussy makes you aroused.")

		# (else if has pussy)
		if(GM.pc.hasVagina()):
			saynn("All the while your own pussy slit is getting needy too, arousal drips from your sex onto the last piece of land.")

		saynn("[say=tavi]I would lock your cock away forever. But. I think there is some fun to be had. Lick, servant.[/say]")

		saynn("That demonic scent.. It’s so good. Your tongue rolls out and lands on Tavi’s slit, giving her glowing clit a few licks. You wrap your lips around it and suckle for a bit before shifting your attention down to her folds. Your tongue starts doing little laps around the sensitive flesh, gathering all the nectar just to swallow it a second later. Tavi’s pussy reacts by twitching ever so slightly and becoming even more moist.")

		saynn("[say=tavi]My juices will gradually corrupt your mind. Get you addicted to me. You won’t be able to live a day without worshiping my body~.[/say]")

		saynn("You look up at Tavi and gather more of her female fluids before audibly swallowing it all. Tavi tastes.. so sweet. Better than other pussy.. You feel her juices numbing your pain away, instead replacing it with.. a desire. Your mind is racing wild, you keep playing with Tavi’s clit and lapping at her pussy lips while she purrs with a low demonic tone.")

		addButton("Continue", "See what happens next", "continue11")

	if(state == "continue11"):
		playAnimation(StageScene.SexCowgirl, "sex", {
			pc="pc", npc="taviDemon",
			bodyState={naked=true,hard=true},
			npcBodyState={hard=true},
		})
		
		saynn("[say=tavi]Enough~[/say]")

		saynn("Tavi pulls your head away from her slit just so she can press her burning hoof into your chest and make you fall onto your back. It was rough but it didn’t hurt, strangely enough. Your Miss puts her hoof onto your {pc.cock} and gently presses it into your belly. Having your cock under her hoof feels a bit humiliating.. but also so nice, you can’t stop leaking pre.")

		saynn("[say=tavi]Breeding me is a huge honor for someone like you. You will have to really satisfy me~. Understand?[/say]")

		saynn("You nod a few times while Tavi keeps your twitching cock trapped between her hoof and your belly, stroking it like that. After that, she pulls her hoof away and straddles you, slowly lowering herself onto your dick until the moment her elegant pussy kisses the tip of your cock. You’re so eager to just thrust inside her..")

		saynn("[say=pc]Yes, Miss Tavi.. I’d love to breed you. Please![/say]")

		saynn("Tavi chuckles as she starts grinding your dick, coating it with her hot sweet juices. But eventually your cock finds her pussy hole and one motion from Tavi later your shaft spreads the moist folds and enters her slit. She is.. surprisingly tight, her inner walls apply a fair amount of pressure on your length while she continues to lower herself, smirking.")

		saynn("[say=tavi]Yes~. We’re gonna have so many imps, you and I. Enough to conquer the whole world~.[/say]")

		saynn("Tavi’s massive thighs land on your crotch as you feel your {pc.cock} meeting her womb entrance. She grinds your crotch for a bit, little noises of pleasure escape from her as she bits her lip. And after that, she starts sliding up and down along your dick, riding you. You can’t help but to moan too watching her huge tits bouncing in your view. One of your hands boldly reaches out to grope it. Tavi feels that and lets out another moan while your fingers squeeze one of her stiff nips.")

		saynn("[say=tavi]So-o.. playful~. Let me show how I play.[/say]")

		addButton("Continue", "See what happens next", "continue12")

	if(state == "continue12"):
		saynn("Tavi raises her hand and snaps her fingers for the second time. Suddenly your arms get forced behind your back before another magic ring appears around them, keeping them bound. And at the same time, you notice something appearing on Tavi.. above her pussy there is a purple womb tattoo materializing out of nothing. All the while she keeps slowly fucking your cock with her slit, letting it smooch her cervix each time before almost pulling out.")

		saynn("[say=tavi]Much better. I didn’t give you a right to touch me, servant. I need your cum, not touch.[/say]")

		saynn("[say=pc]My bad, Miss Tavi. Your body is just too tempting.[/say]")

		saynn("Tavi smirks before leaning back and putting her paws on your legs for support while picking up the pace and bouncing on your dick harder. You actually feel her slick pussy getting slightly more tight each time she moans, you both seem to be getting quite close to your peaks.")

		saynn("[say=pc]I’m gonna..[/say]")

		saynn("[say=tavi]Yes, me too. I want you to breed me, servant.. Stuff my demonic womb full of your mortal seed~.[/say]")

		saynn("She leans forward instead and puts her paws onto your shoulders. You feel her claws digging into your flesh, leaving countless marks. But you don’t care, you’re swimming in a sea of pleasure. Tavi rides you so hard that her pussy makes wet noises together with a soft clap each time her thighs connect with your hips. You can’t endure it anymore..")

		addButton("Cum inside", "Breed your Miss", "cum_inside")

	if(state == "cum_inside"):
		playAnimation(StageScene.SexCowgirl, "fast", {
			pc="pc", npc="taviDemon", pcCum=true, npcCum=true,
			bodyState={naked=true,hard=true},
			npcBodyState={hard=true},
		})
		
		saynn("You throw your head back and grunt while your {pc.cock} starts shooting waves after waves of {pc.cum} deep inside the demonic Tavi. At the same time, she brings herself down onto your length for the last time before letting out a growly moan, her glowing slit starts milking your dick for all seed that it can. The tip of your dick is prodding directly at her womb, allowing the {pc.cum} to freely flow inside her babymaker.")

		saynn("And as that happens, Tavi’s womb tattoo begins to shine brightly, a little symbol appears in the middle of it that signifies the successful impregnation.")

		saynn("[say=tavi]Yes-yes-s~. Empty your balls inside me, servant. I want all of your imps.[/say]")

		saynn("Before you even had time to recover, she grinds her slit into your crotch while your cock shifts inside her, extending your climax. By the end of it, you feel completely spent, all of your {pc.cum} is deep inside your Miss.")

		saynn("[say=pc]T-thank you, Miss. T-thanks for letting me breed you.[/say]")

		saynn("[say=tavi]Oh, it’s not over yet, servant~. You will cum inside me many more times today.[/say]")

		saynn("She waits until your balls are dry before getting up. Her bred pussy is already leaking the excess of your seed back.")

		# (Continue button here)
		addButton("Continue", "See what happens next", "finalsnapquestion")


	if(state == "lick_tailfuck"):
		playAnimation(StageScene.SexOral, "lick", {
			npc="pc", pc="taviDemon",
			bodyState={hard=true},
			npcBodyState={naked=true,caged=true},
		})
		
		saynn("Tavi tilts her head before spreading her strong legs more, offering a greater view of her slick-looking pussy. She then makes a gesture with her hand that pulls your collar closer to her female crotch, your lips pressing against her enticing sensitive folds.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("All the while your exposed cock is getting visibly harder, just feeling the scent of her pussy makes you aroused.")

		# (else if has pussy)
		elif(GM.pc.hasVagina()):
			saynn("All the while your own pussy slit is getting needy too, arousal drips from your sex onto the last piece of land.")

		saynn("Tavi’s demon tail springs into action, reaching for your chin and giving you some scritches with its pointy tip. And when you try to avoid its attention, it gently slaps you on the cheek.")

		saynn("[say=tavi]You like my tail~? It has a mind of its own, I barely control it myself. Now lick me, servant~.[/say]")

		saynn("You decide to ignore and focus on the offered pussy.. That demonic scent.. It’s so good. Your tongue rolls out and lands on Tavi’s slit, giving her glowing clit a few licks. You wrap your lips around it and suckle for a bit before shifting your attention down to her folds. Your tongue starts doing little laps around the sensitive flesh, gathering all the nectar just to swallow it a second later. Tavi’s pussy reacts by twitching ever so slightly and becoming even more moist.")

		saynn("[say=tavi]My juices will gradually corrupt your mind. Get you addicted to me. You won’t be able to live a day without worshiping my body~.[/say]")

		saynn("You look up at Tavi and gather more of her female fluids before audibly swallowing it all. Tavi tastes.. so sweet. Better than other pussy.. You feel her juices numbing your pain away, instead replacing it with.. a desire. Your mind is racing wild, you keep playing with Tavi’s clit and lapping at her pussy lips while she purrs with a low demonic tone.")

		saynn("All the while Tavi’s tail shifts down to your chest and tickles your {pc.breasts} before poking each nipple, teasing you until you squirm. Such a bratty tail.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cock} is throbbing and leaking pre more. Tavi sees your cage but it seems she doesn’t like its look so she grabs onto it and breaks the lock with ease. She then motions with her hand again and one of the metal rods gets ripped out of the metal floor before twisting into a little arched spiral. It starts pressing on your cock’s head, battling your erection before another rod bends around your balls and welds together with the first, creating a little neat chastity cage.")
			
			saynn("[say=tavi]What? Thought I would release it? No~. You’re getting a proper cage. You don’t need that useless dick with me, cutie~.[/say]")
			
			saynn("What? Your hands reach out for your crotch but quickly realize that the cage is there. And that it doesn’t have a keyhole or any other ways to take it off. Tavi chuckles with her demonic voice.")
			
			saynn("[say=tavi]Miss it already? Can’t remove it without me, it’s permanent~.[/say]")
		
		elif(GM.pc.hasPenis()):
			
			saynn("Your {pc.cock} is throbbing and leaking pre more. Tavi finally decides to take action against that. She motions with her hand again and one of the metal rods gets ripped out of the metal floor before twisting into a little arched spiral. It starts pressing on your cock’s head, battling your erection before another rod bends around your balls and welds together with the first, creating a little neat chastity cage.")

			saynn("[say=tavi]You don’t need it right now, cutie~.[/say]")

			saynn("What? Your hands reach out for your crotch but quickly realize that the cage is there. And that it doesn’t have a keyhole or any other ways to take it off. Tavi chuckles with her demonic voice.")

			saynn("[say=tavi]Miss it already? Can’t remove it without me, it’s permanent~.[/say]")

		# (ends)

		addButton("Continue", "See what happens next", "continue13")

	if(state == "continue13"):
		playAnimation(StageScene.SexFaceSitting, "sit", {
			npc="pc", pc="taviDemon",
			bodyState={hard=true},
			npcBodyState={naked=true,caged=true},
		})
		
		saynn("[say=tavi]I want more~[/say]")

		saynn("Tavi pulls your head away from her slit just so she can press her burning hoof into your chest and make you fall onto your back. It was rough but it didn’t hurt, strangely enough. After that, she pulls her hoof away and straddles you, slowly lowering herself onto your head until your cheeks are trapped between her girly thighs. Her gorgeous pussy is right there.. you can smell the inviting slit but unable to reach it with your tongue, instead just breathing warmly and feeling it drip juices onto your face.")

		saynn("[say=tavi]You're gonna be my personal pussy licker, servant.[/say]")

		saynn("[say=pc]Yes, Miss Tavi.. Please..[/say]")

		saynn("You hear Tavi chuckle at your begging attempts before she suddenly pushes her gorgeous moist slit into your face when sitting on it. You quickly continue pleasuring Tavi’s flower, dragging your tongue over her sex and rubbing the clit with the tip.")

		saynn("At the same time you feel Tavi’s demon tail creeping down to your crotch. It pokes your inner thighs a few times, asking you to spread your legs but you close them shut instead.")

		saynn("That clearly angers it, the tail suddenly wraps around one of your legs and forcibly spreads it before delivering a little slap on your thigh. Ow. This time you obey and spread your other leg too.")

		saynn("Tavi looks behind her and giggles, seeing what her tail does to you.")

		saynn("[say=tavi]My tail is a part of me, you must respect it the same. Or you get punished~.[/say]")

		saynn("She lowers herself onto your face even more, your nostrils and mouth are both covered by her sensitive folds, making you suffocate slightly while you pleasure her. Without the ability to talk, you just quickly nod a few times, causing your nose to rub against her slit. That forces a moan out of Tavi, she chuckles and lets you breathe.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("The tail is acting more bold now that it has Tavi’s protection, the pointy tip finds your {pc.pussyStretch} pussy and rubs against it, a very unusual feeling. But it feels nice, the tail gets coated in your juices before prodding a few times at the hole itself. Oh no, is it gonna do it? You can’t even react fast enough before the tail stretches your folds open wide and slips inside you.")

			saynn("Little muffled noises begin to escape from you while the tail explores your insides. It finds the g-spot and presses at it a few times, making you clench your whole body as a huge spike of pleasure washes over it.")

		# (else)
		else:
			saynn("The tail is acting more bold now that it has Tavi’s protection, the pointy tip finds your {pc.analStretch} tailhole and rubs against it, a very unusual feeling. But it feels nice, the tail plays with your ring before prodding a few times at it. Oh no, is it gonna do it? You can’t even react fast enough before the tail stretches your star open wide and slips inside you.")

			saynn("Little muffled noises begin to escape from you while the tail explores your insides. It finds the  pleasure spot and presses at it a few times, making you clench your whole body as a huge spike of pleasure washes over it.")

		# (end)

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your trapped dick desperately tries to get hard but the metal cage is keeping it completely flaccid for your Miss.")

		addButton("Continue", "See what happens next", "continue14")

	if(state == "continue14"):
		playAnimation(StageScene.SexFaceSitting, "grind", {
			npc="pc", pc="taviDemon",
			bodyState={hard=true},
			npcBodyState={naked=true,caged=true},
		})
		
		saynn("It feels so strange, your hand tries to reach for Tavi’s tail and pull it out but she notices it and suddenly snaps her fingers for the second time. This snap forces your arms behind your back before another magic ring appears and binds them together.")

		saynn("[say=tavi]Bad servant. If my tail wants to fuck you, you will let it fuck you. Now get back to work.[/say]")

		saynn("Tavi starts grinding you with her wet pussy, more little moans escape from her while she coats your face with her juices. You just stick your tongue out and let the demon cat slide back and forth over it.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("The tail inside your pussy hears Tavi and indeed begins to act like a cock, retracting a bit just to ram itself deep inside you a second later. The pointy tip smashes your cervix and starts pounding you hard! You can’t help but to produce more muffled moans, you can’t endure this for very long!")

		# (else)
		else:
			saynn("The tail inside your butt hears Tavi and indeed begins to act like a cock, retracting a bit just to ram itself deep inside you a second later. The pointy tip smashes your pleasure spot and starts pounding you hard! You can’t help but to produce more muffled moans, you can’t endure this for very long!")

		saynn("Tavi grinds your face faster and faster, you feel her pussy lips twitching and leaving more juices on you that have that strong demon scent. Her legs shiver a lot, she must be close too. You’re bound, licking Tavi’s slit while she tailfucks you, your mind is about to go blank.")

		saynn("[say=tavi]I’m gonna cum all over you~. Mark you~[/say]")

		addButton("Continue", "See what happens next", "continue15")

	if(state == "continue15"):
		playAnimation(StageScene.SexFaceSitting, "grind", {
			npc="pc", pc="taviDemon", npcCum=true,
			bodyState={hard=true},
			npcBodyState={naked=true,caged=true},
		})
		
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("The tail quickly brings you over the line, you try to arch your back and moan but Tavi has you pinned into the floor. Not being able to squirm only makes you cum harder, your slit clenches around the flexible demon tail and squirts from overstimulation.")

		# (else)
		else:
			saynn("The tail quickly brings you over the line, you try to arch your back and moan but Tavi has you pinned into the floor. Not being able to squirm only makes you cum harder, your tailhole clenches around the flexible demon tail and pulsates from overstimulation.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your useless cock shoots a few weak strings of {pc.cum} past the permanent cage.")

		saynn("And at the same time, Tavi closes her thighs around your head tighter while producing a few long growly moans in a row, her slit twitches and squirts juices all over your face. Some of her fluids land onto your tongue and into your mouth, leaving a sweet taste.")

		saynn("[say=tavi]Yes~.. Such a good toy, worshiping my slit so well.[/say]")

		saynn("You pant heavily into Tavi’s pussy while she rests on top of you. The tail gently retracts out of your fuckhole and returns to its spot.")

		saynn("[say=pc]T-thank you, Miss Tavi.. It was a pleasure..[/say]")

		saynn("[say=tavi]Oh, I’m not done grinding your face yet, I will return to it very soon~[/say]")

		saynn("Tavi slowly raises herself before taking a step back. You look like a wet mess. But you love being Tavi’s wet mess.")

		# (Continue button here)
		addButton("Continue", "See what happens next", "finalsnapquestion")


func _react(_action: String, _args):
	if(_action == "no_trust"):
		setFlag("TaviModule.ch2DrugsAgreedToTest", false)
	if(_action == "agree"):
		setFlag("TaviModule.ch2DrugsAgreedToTest", true)
	if(_action == "yes_futas"):
		setFlag("TaviModule.ch2DrugsPickedFuta", true)
	if(_action == "no_futas"):
		setFlag("TaviModule.ch2DrugsPickedFuta", false)
	
	if(_action == "..."):
		processTime(3*60*60)
	
	if(_action == "teeth"):
		processTime(10*60)
		GM.pc.cummedOnBy("tavi")

	if(_action == "mark_me"):
		processTime(10*60)
		GM.pc.pissedOnBy("tavi")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

