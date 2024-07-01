extends "res://Scenes/SceneBase.gd"

var isSuccessful = false
var optionalScenesBadBehaviorAmount = 0
var firstScenesBadBehaviorAmount = 0
var claimedToBeObedient = false
var kneeledBeforeEliza = false
var lickedPussy = false

func _init():
	sceneID = "ForcedChastityScene7"

func _reactInit():
	if(getFlag("MedicalModule.Chastity_Event1Choice1") in ["awful", "why"]):
		firstScenesBadBehaviorAmount += 1
	if(getFlag("MedicalModule.Chastity_Event2Choice1") in ["no"]):
		firstScenesBadBehaviorAmount += 1
	if(getFlag("MedicalModule.Chastity_Event2Choice2") in ["ask_to_stop"]):
		firstScenesBadBehaviorAmount += 1
	if(getFlag("MedicalModule.Chastity_Event3Choice1") in ["clench"]):
		firstScenesBadBehaviorAmount += 1
	if(getFlag("MedicalModule.Chastity_Event3Choice2") in ["refuse"]):
		firstScenesBadBehaviorAmount += 1
	
	
	optionalScenesBadBehaviorAmount = getFlag("MedicalModule.Chastity_OptionalBadBehavourCounter", 0)


	if(getFlag("MedicalModule.Chastity_Event4Choice4", "no") in ["yes"]):
		claimedToBeObedient = true
	kneeledBeforeEliza = getFlag("MedicalModule.Chastity_Event4ObeyedEliza", false)
	lickedPussy = getFlag("MedicalModule.Chastity_Event4LickedPussy", false)

	
	var finalScore = 0
	if(firstScenesBadBehaviorAmount <= 1):
		finalScore += 1
	if(optionalScenesBadBehaviorAmount == 0):
		finalScore += 2
	if(optionalScenesBadBehaviorAmount == 1):
		finalScore += 1
	if(claimedToBeObedient):
		finalScore += 1
	if(kneeledBeforeEliza):
		finalScore += 1
	if(lickedPussy):
		finalScore += 1
	if(getFlag("MedicalModule.Chastity_Event4Choice1", "") == "horsecockdildo"):
		finalScore += 1
	if(getFlag("MedicalModule.Chastity_Event4Choice1", "") == "magicwand"):
		finalScore -= 1
	
	if(finalScore >= 3):
		isSuccessful = true
		setFlag("MedicalModule.Chastity_ExperimentWasSuccessful", true)
	else:
		setFlag("MedicalModule.Chastity_ExperimentWasSuccessful", false)

func _run():
	
	if(state == ""):
		aimCameraAndSetLocName("medical_confessionary")
		GM.pc.setLocation("medical_confessionary")
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", bodyState={naked=true}})
		addCharacter("eliza")
		
	if(state == ""):
		saynn("You regain consciousness feeling that someone is chaining your hands above your head. As you open your eyes, you see Eliza’s face from up close while she is focused on your wrists. She is cute, pastel colors really give her that soft look. Slightly blush-y cheeks, careful ponytail, emerald eyes that are worth getting lost in. She is biting her lip, not even realizing that you’re looking at her.")

		saynn("After she is done, doctor Quinn turns around and does a morning stretching routine, arching her back and working her shoulders, shaking slightly, before producing an adorable little moan. She then just sits down on the expensive-looking chair and then just sips her coffee and reads stuff on her datapad.")

		addButton("Make a noise", "Let it be known that you’re awake", "make_a_noise")

	if(state == "make_a_noise"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", npcAction="sit", bodyState={naked=true}})
		
		saynn("[say=pc]Umm.. Good morning?[/say]")

		saynn("Her ears instantly perk in your direction, soon followed by her eyes looking at you.")

		saynn("[say=eliza]Oh, you’re awake. Morning, indeed.[/say]")

		saynn("Eliza takes her time drinking her morning coffee.")

		saynn("[say=pc]What are you gonna do to me today?[/say]")

		saynn("She smiles and puts the mug away before getting up and putting on a serious face.")

		saynn("[say=eliza]Today is The Day, patient. So far this experiment is happening for..[/say]")

		saynn("The doctor goes through her many notes.")

		saynn("[say=eliza]Uh.. at least a month. Wasn’t tracking it to be honest.[/say]")

		saynn("Doctor chuckles softly.")

		saynn("[say=eliza]And believe it or not. This is the last day. Last day of tests. Today you will do exactly what this room was designed for in the first place.[/say]")

		saynn("[say=pc]Huh?[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", bodyState={naked=true}})
		
		saynn("[say=eliza]But first, let me read you the results of this little experiment.[/say]")

		saynn("Eliza pulls out some processed data on her datapad. You’re still chained up and completely helpless.")

		# (if all obedient first choices)
		if(firstScenesBadBehaviorAmount <= 0):
			saynn("[say=eliza]Hm. Even at the start of the experiment your behavior was pretty much perfect. Could mean a few things, maybe this treatment is just that good that just having a cage had an effect on you. Yeah, that must be it.[/say]")

		# (if some obedient first choices)
		elif(firstScenesBadBehaviorAmount <= 1):
			saynn("[say=eliza]Hm. You were showing signs of good behavior but not always. Which is to be expected at the start of the treatment. Still, it was a great starting point to see which direction the dynamic would lead us though.[/say]")

		# (if almost always misbehaved)
		else:
			saynn("[say=eliza]Hm. You misbehaved at pretty much every possible moment. Makes sense since the treatment was forced upon you. What matters is how your behavior changed after that.[/say]")

		saynn("Eliza scrolls down a bit.")

		var firstVisitor = Util.capitalizeFirstLetter(getFlag("MedicalModule.Chastity_FirstChosenPerson", "eliza"))
		var secondVisitor = Util.capitalizeFirstLetter(getFlag("MedicalModule.Chastity_SecondChosenPerson", "risha"))

		# (if optional scenes had zero bad behaviors)
		if(optionalScenesBadBehaviorAmount <= 0):
			saynn("[say=eliza]For your.. visitors.. you have chosen "+str(firstVisitor)+" and "+str(secondVisitor)+". Good choices. And you also misbehaved.. exactly zero times. Nice. Maybe treatments that are specially tailored to each patient are the way to go.[/say]")

		# (if 2 or less)
		elif(optionalScenesBadBehaviorAmount <= 2):
			saynn("[say=eliza]For your.. visitors.. you have chosen "+str(firstVisitor)+" and "+str(secondVisitor)+". Good choices. Although, you didn’t show perfect obedience to them. Hmm. Does that mean that specially tailored treatments are not as effective as I thought?[/say]")

		# (if more)
		else:
			saynn("[say=eliza]For your.. visitors.. you have chosen "+str(firstVisitor)+" and "+str(secondVisitor)+". And.. well.. It didn’t go so well. You were disobeying pretty much the whole time. I thought that specially tailored treatments would have a great effect but clearly I was wrong there.[/say]")

		saynn("She scrolls down some more.")

		if(getFlag("MedicalModule.Chastity_Event4Choice1", "") == "horsecockdildo"):
			saynn("[say=eliza]When I left the toys for you.. you chose the best one. So glad that you did~.[/say]")
		elif(getFlag("MedicalModule.Chastity_Event4Choice1", "") == "magicwand"):
			saynn("[say=eliza]When I left the toys for you.. you chose the magic wand. Which wasn't what I expected at all.[/say]")
		else:
			saynn("[say=eliza]When I left the toys for you.. you decided to ignore them. That's not bad but you missed some fun that you could have had.")

		saynn("She scrolls a bit.")

		# (If said that he is obedient and also licked pussy)
		if(lickedPussy):
			saynn("[say=eliza]And by the end of the tests.. You were extremely obedient~. Makes my heart and some other body parts warm just thinking about it. Good job me. Or, well, us~.[/say]")

		# (if said that he is obedient and kneeled but no pussy)
		elif(kneeledBeforeEliza):
			saynn("[say=eliza]And by the end of the tests.. You were quite obedient. And you were ready to prove it too.. Not as much as me and my body wanted but it's still something~.[/say]")

		# (if said that he is obedient but didn’t prove it)
		elif(claimedToBeObedient):
			saynn("[say=eliza]And by the end of the tests you were.. somewhat obedient. You weren’t ready to prove it when provoked but at least you admitted that it had an effect on you. That should account for something, right?[/say]")

		# (if didn’t obey at all)
		else:
			saynn("[say=eliza]And by the end of the tests you were.. disobedient. Aw. Well, at least those were your words. Your actions can tell a different story.[/say]")

		saynn("Doctor presses some buttons and lets the datapad calculate some stuff.")

		# (if success)
		if(isSuccessful):
			saynn("[say=eliza]So. We did a lot of tests. Collected a lot of data. In the end.. This experiment can be considered.. a success! Yay. Apparently there is a strong correlation between lack of penile orgasms and better obedience levels. These results will prove to be extremely helpful when dealing with the most misbehaving inmates, thank you~.[/say]")

			saynn("Nice, you feel nice.")

		# (if failed)
		else:
			saynn("[say=eliza]So. We did a lot of tests. Collected a lot of data. In the end.. This experiment can be considered.. a failed one. Aww. Well, it was obvious to be honest. Maybe I went too far. Maybe I didn’t go far enough. Or maybe there is just no correlation between blocked penile orgasms and high obedience levels. Oh well. It’s still valuable data.[/say]")

			saynn("Aw. That’s what she gets for forcing chastity on you.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):

		saynn("Eliza puts the datapad away and looks at you. A cunning smile shines on her face as she reaches for her little amulet on her neck.")

		saynn("[say=eliza]And now for the best part of this whole thing.[/say]")

		saynn("She opens the amulet and takes out the little key that was stored inside before presenting it to you.")

		saynn("[say=pc]You’re gonna unlock my dick?[/say]")

		saynn("[say=eliza]Nah~. Well, not so fast.[/say]")

		saynn("She brings the key closer to your face. You can pretty much smell the metal. But with your arms chained and cuffed you can’t reach it even if you really wanted to. Eliza bathes in your desperation. Freedom never was so close. You’re not sure if you want that freedom but it sure is very close..")

		saynn("[say=eliza]You went through a lot. You’ve been taught how to cum from anal. And to be honest, you’re pretty good at it~. It feels great doesn’t it? Being on the receiving end, enjoying the pleasure waves slowly ramping up until you can’t take it anymore.. Until your prostate just gives up and makes you cum.. I wonder.. Do you really need your cage unlocked~?[/say]")

		saynn("Eliza keeps eye contact with you, smirking. She holds the key with both paws, pretending to twist it.")

		saynn("[say=eliza]I’m giving you a choice, {pc.name}. Choice of a lifetime. I can break this key right now. Ensuring that you will never be able to unlock your cage and receive a normal orgasm. You will be forced to only cum from your butt from now on and forever~. You will accept your role as a pure bottom and you will devote yourself and your body to pleasuring other dicks. The girls can peg you to make you cum like a girl too~.[/say]")

		saynn("After that, Eliza moves the key to your crotch, making it hover near your cage.")

		saynn("[say=eliza]Or, alternatively.. I can unlock your cage and take it off. This is the unique unbreakable cage that you can’t acquire anywhere else. And I obviously can’t let you keep it if I unlock it. Your dick will be free. But..[/say]")

		saynn("Eliza tilts her head down, her cheeks blush ever so slightly.")

		saynn("[say=eliza]I will only do it.. If you breed me after. In fact.. I will only do it if you breed me.. Yes.. I will allow you to fuck my pussy and cum inside.[/say]")

		saynn("Her ears droop slightly.")

		saynn("[say=eliza]You must do it.. As a proof.. That you aren’t a bottom. The proof that this experiment didn’t turn you into one. Proof that you are a breeder.. That you are ready to fuck others rather than be a fucktoy yourself..[/say]")

		saynn("[say=pc]What about the kids?..[/say]")

		saynn("[say=eliza]We have many facilities for that, don’t worry..[/say]")

		saynn("Eliza calms her warm deep breathing and takes a step back, you see her lips forming a little smile.")

		saynn("[say=eliza]So? What’s your final decision? Ready to accept your role as a bottom? Or.. the other one?.. I will be happy either way~.[/say]")

		# (Options are Bottom, Breeder)

		addButton("Bottom", "You want this cage to stay on your dick.. forever..", "bottom")
		addButton("Breeder", "Tell Eliza to take off your cage. You will breed her", "breeder")


	if(state == "bottom"):
		setFlag("MedicalModule.Chastity_Event5LockedForever", true)
		playAnimation(StageScene.Hug, "hug", {npc="eliza", bodyState={naked=true}})
		
		saynn("Now it’s your time to blush. You lower your head slightly.")

		saynn("[say=pc]I’m ready to stay bottom forever..[/say]")

		saynn("You only get a glance of Eliza’s wide smile as she suddenly brings the key to your face and applies pressure onto it.. [b]snap[/b]! Like a broken dream.. The key snaps in half in her paws, making a metallic noise that you will never forget.. The key snapped right in the middle of its blade, ensuring that none of its parts can be used to unlock your cage now..")

		saynn("So sudden.. You just can’t help it, you let out a quiet moan as your caged up dick shoots a line of precum through the little hole of its cage..")

		saynn("Eliza puts the broken pieces away and then unchains you from the ceiling. She reaches to hug you before nuzzling your face a lot and purring loudly.")

		saynn("[say=eliza]You did the right thing. We all are looking for our place in life. And I think you just found yours~.[/say]")

		saynn("You are breathing heavily.. Your member.. It puts so much pressure on your cage.. desperately trying to fight it.. But it will never win.. Its destiny is to stay locked forever.. Your destiny.. You hug Eliza back.. Are those tears?..")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={naked=true}})
		
		saynn("About a minute passes.. Time flies.. You finally stop hugging. Your hand reaches out to touch your cage.. yeah, it’s still there..")

		saynn("Eliza is still smiling, she seems to be very happy about your decision. Maybe more than you are..")

		saynn("[say=pc]What.. now?..[/say]")

		saynn("[say=eliza]Well, you continue serving your sentence. You continue living. You’re just.. have to cum from anal now~.[/say]")

		saynn("You nod slightly.")

		saynn("[say=pc]What about.. these.. meetings?[/say]")

		saynn("[say=eliza]No more of them I’m afraid. I think you’re ready anyway~.[/say]")

		saynn("[say=pc]Fair enough..[/say]")

		saynn("She reaches her paw out to scritch you under the chin.")

		saynn("[say=eliza]Enjoy~. Right now I have to go and submit all the data.[/say]")

		saynn("[say=pc]Of course.. of course..[/say]")

		saynn("You grab your clothes and put them on. Eliza is ready to let you out.")

		# (Options are Thank you or Leave)

		addButton("Thank you", "Thank Eliza", "thank_you")
		addButton("Leave", "Time to go", "leave")


	if(state == "thank_you"):
		aimCameraAndSetLocName("medical_nearconfessionary")
		GM.pc.setLocation("medical_nearconfessionary")
		
		saynn("[say=pc]Thank you, doctor..[/say]")

		saynn("Eliza purrs.")

		saynn("[say=eliza]You’re very welcome~.[/say]")

		saynn("She lets you out into the medical corridor. Time to go..")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")

	if(state == "leave"):
		aimCameraAndSetLocName("medical_nearconfessionary")
		GM.pc.setLocation("medical_nearconfessionary")
		
		saynn("She lets you out into the medical corridor. Time to go..")

		saynn("[say=eliza]See you around~.[/say]")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")


	if(state == "breeder"):
		setFlag("MedicalModule.Chastity_Event5LockedForever", false)
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={naked=true, hard=true}})

		saynn("[say=pc]Chastity is not for everyone. And I certainly don’t wanna stay caged forever. I guess I’m a breeder.[/say]")

		saynn("Eliza listens to your words carefully, nodding subtly. She looks slightly to the side.")

		saynn("[say=eliza]Well.. no point in keeping that cage on you then..[/say]")

		saynn("Her paws bring the key down to your cage. She inserts it into the lock and watches you.")

		saynn("A few seconds of silence. She really is beautiful. Such deep eyes.. Little cute snout.. Careful lips.. Eliza leans closer to yours.. Tilting her head slightly.. And leaves you a little kiss while turning the key. There was a satisfying mechanical click as the cage gets unlocked. Her paw grabs onto the first part and begins removing it. The high pressure that your member is experiencing at the moment.. slowly dies down.. Your {pc.cock} is free.. at last. What’s left of the cage is the cockring and soon Eliza takes it off too.")

		saynn("Wow.. No more metal fighting against your erection. You’re leaking pre like it's your first time. Your shaft is throbbing and pulsating. All these days of not being able to use it.. Made you so needy.")

		saynn("Eliza sees your hard member and smiles. She only teasingly rubs the tip but that was enough to make you pant. Her paw gropes your balls too. After that, she reaches out for your chains and undoes them, freeing your hands. She seems to trust you a lot. You reach them out towards Eliza but she gracefully avoids your grasp.")

		saynn("[say=eliza]Not so fast~.[/say]")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "continue3"):
		addCharacter("eliza", ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={naked=true, hard=true}, npcBodyState={underwear=true}})
		
		saynn("Eliza takes a step back from you and begins to undress. Her lab coat hits the couch first. Then she sneaks her claws under her neat top and pulls it up, revealing the nice black bra that encompasses her {eliza.breasts}.")

		saynn("After that she turns away from you, her paws slide down the pastel fur until they stumble upon her knee long skirt. Hips sway to the sides slightly while she is pulling her skirt down, revealing a sexy garter belt with lace patterns and then her panties of a similar design. Her fluffy feline tail is teasingly covering them while she wiggles her butt at you. The contours of her long feline legs are emphasized by the half-transparent tights. The view is quite sexy, you can’t lie.")

		saynn("After that she slowly turns around again, presenting herself and biting her lip. Her paw reaches out for your hand and grabs it. You can feel the textured beans of her palm rubbing against your as she pulls you from under your spot.")

		saynn("[say=eliza]Let me do this first..[/say]")

		saynn("She stands on the same spot as you were standing on for the last many sessions. She reaches up and grabs the cuffs with chains attached to them before locking them around her wrists..")

		addButton("Continue", "See what happens next", "continue4")

	if(state == "continue4"):
		playAnimation(StageScene.HangingDuo, "stand", {pc="eliza", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={underwear=true}})
		
		saynn("The cuffs get locked with an audible click, rendering Eliza completely helpless. She tugs on her cuffs to test them but obviously that’s about all she can do. She directs her gaze at you, blushing deeply. Her underwear is on full display.. her body is..")

		saynn("[say=eliza]Well.. now I’m at your mercy.. breeder..[/say]")

		saynn("Well then, even while being helpless she somehow still manages to get what she wants. But now it's your turn to take. You step closer to her and put your hand on her cheek, gently rubbing her there until you feel purring. While that is happening, you lean closer to her face and deliver a little kiss on her lips. And then another, much longer one. Eliza closes her eyes while you steal her lips for yourself, turning this kiss into a french one, letting your tongue dance against her rough one. Both your hands explore her, going over the cover up mounds and squeezing them before trailing down her sides up and down. You can feel her breathing more and more deeply..")

		saynn("You pull away from the kiss and step around her, the girl must be using quite an expensive perfume because her scent is amazing. But as you get behind her and put your chin on her shoulder, you notice some object on the little round table.. A pill bottle. You give Eliza a curious look but she just stares at your lips.")

		saynn("Interesting, you continue circling Eliza and get a better look at it. Only a single pill inside. Even more curious, you grab the pill bottle and look at the text. It says that these are heat inducing pills, designed to prime a female for a successful impregnation. You look at Eliza but only catch her blushing and tilting her head down.")

		# (Options are Use heat pill, No pill)

		addButton("Use heat pill", "Make Eliza swallow the pill", "use_heat_pill")
		addButton("No pill", "You don’t need that", "no_pill")


	if(state == "use_heat_pill"):
		setFlag("MedicalModule.Chastity_Event5GaveElizaDrug", true)
		
		saynn("Hmm, why not. You grab the pill and slowly approach the helpless feline. You lean in towards her face again, making it seem like you’re about to kiss her again. Eliza parts her lips and invites your tongue in but instead you slip the pill into her mouth and hold your hand on her chin, closing her jaw before watching her reaction carefully. Doctor’s eyes open wide, she holds eye contact with you, blushing constantly, holding the pill on her tongue.")

		saynn("You don’t need to give her any orders though, after a few seconds of deliberating, Eliza closes her eyes and swallows, her throat visibly tensing up and then relaxing.")

		saynn("Seconds pass.. Eliza still holding her eyes closed shut. But her breathing becomes faster. Her scent.. even stronger. You’re pretty sure that this is the scent of a horny feline. A quiet moan escapes past the doctor’s lips. You look down at her lace panties.. and realize how wet they are.. Little drops of her arousal slide down her inner thighs.")

		saynn("Eliza suddenly opens her eyes. They’re full of lust.. She eyes you out, your {pc.masc} body, your {pc.breasts}, your {pc.penis}. Her lips are parted because she can’t stop panting.")

		saynn("It’s time..")

		addButton("Vaginal", "Time to breed the little pussy", "vaginal")

	if(state == "no_pill"):
		setFlag("MedicalModule.Chastity_Event5GaveElizaDrug", false)
		
		saynn("You put the pill bottle back on the table, you’re not gonna follow the obvious bread crumbs that Eliza has left you. You’re here to take things into your own hands. Time to make that kitty fall in heat your own way.")

		saynn("You slowly approach the helpless feline and lean in towards her face again, forcing a deep kiss. Your tongue explores her mouth while your hand jumps on her belly and slides down it and then under the cloth of her panties. One of your digits finds the girl’s little clit and teases, doing little circular motions around the sensitive flesh. That makes Eliza produce a stifled moan into your mouth, her body squirms around your hand, her toes curl up.")

		saynn("You go further, your palm covers her little flower before the two digits spread open her careful petals. She is.. so wet. You capture some of her arousal before spreading it over her pussy lips, rubbing them slowly. Eliza arches her back and moans again while you keep playing with her tongue, bossing around inside her mouth.")

		saynn("After getting her ready, you pull away your wet digits and end the kiss before bringing your hand to her mouth. Eliza instantly knows how to react, closing her lips around your digits and suckling her own arousal off of them. Finally, you pull away.")

		saynn("Her eyes are.. full of lust. She eyes you out, your {pc.masc} body, your {pc.breasts}, your {pc.penis}. She can’t stop panting.")

		saynn("It’s time..")

		addButton("Vaginal", "Time to breed the little pussy", "vaginal")

	if(state == "vaginal"):
		playAnimation(StageScene.HangingSex, "tease", {pc="eliza", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={underwear=true}})
		
		saynn("Breeding was a recruitment to take off your cage but now it feels more like a well-earned reward. You slowly get out of her sight and then take a spot behind her. As your hand touches the girl’s back, little shivers get sent down her spine, the fluffy tail rubs against your exposed bits. You grab it near the base and let the hand slide down it before slowly moving it aside, revealing more of Eliza’s wet panties. You get closer and push your {pc.penis} against the damp cloth, letting the girl feel your hard rod brushing against her covered up kitty.")

		saynn("[say=eliza]Mhmm-m..[/say]")

		saynn("After that little bit of foreplay, Eliza is left wanting you. So why make her wait any longer. You grab the side of her panties and push aside, revealing a beautiful tight-looking flower. Her pink pussy folds are so-so moist, the room quickly feels with an even stronger odor of her arousal.")

		saynn("Your hand guides your member while you slowly push your hips forward, letting the head of your shaft bury itself in that gorgeous slit with ease. Eliza is biting her lip and letting out a quite long noise of passion. Her kitty is tight in just the right spots so you push on, sliding more and more of your length inside while her soft inner walls spread around it.")

		saynn("[say=eliza]I love this.. you..[/say]")

		addButton("Faster", "See what happens next", "faster")

	if(state == "faster"):
		playAnimation(StageScene.HangingSex, "sex", {pc="eliza", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={underwear=true}})
		
		saynn("You don’t rush it but also try to keep things from being too slow by gradually picking up your pace, letting your {pc.cock} slide in and out of Eliza’s dripping kitty. All the while you lean closer to her body and proceed to cover her shoulders and neck with dozens after dozens little kisses. The feline tilts her head to the side slightly, giving you more access to herself. She is mewling quietly as a response, her tail curling up around your belly.")

		saynn("[say=eliza]Yes.. don’t stop.. please..[/say]")

		saynn("Your hands land just under Eliza’s breasts and cup them, your digits slide under the bra and reach for the girl’s perky nipples, teasing them while you continue to gently thrust inside her.")

		saynn("Both lovers pant passionately with Eliza also producing occasional moans. Very soon you find yourself thrusting your hips at a steady rate, avoiding reaching the girl’s natural barricade but focusing on her pleasure spot. Kisses get replaced with little playful bites, a natural progression of things. You find Eliza’s body squirming before you. But the chains keep her mostly still and helpless. It feels so good when people trust each other so much..")

		saynn("[say=eliza]I’m.. I’m close.. ah-h.. Please..[/say]")

		saynn("Eliza tries to look at you, tries to nuzzle your face. You nuzzle her back and continue thrusting inside her needy pussy.")

		saynn("[say=eliza]Make me a woman..[/say]")

		saynn("Her words sound so hot. And paired with her pussy walls getting tighter and kneading your member, you find yourself getting close too. Luckily, there is nothing that can stop you..")

		addButton("Cum inside", "Breed that kitty mew", "cum_inside")

	if(state == "cum_inside"):
		playAnimation(StageScene.HangingSex, "fast", {pc="eliza", npc="pc", pcCum=true, npcCum=true, npcBodyState={naked=true, hard=true}, bodyState={underwear=true}})
		
		saynn("And you don’t plan on stopping too, thrusting faster and faster until your hips begin slapping against the girl’s butt. Your hands squeeze her {eliza.breasts}, your mouth is gently biting her neck to make the kitty feel more at home.")

		saynn("Eliza’s moans become louder and more passionate until she gets pushed over the edge. Her pussy slit pulsates around your cock, making it hard to slide in and out but so much more pleasurable. After a few powerful thrusts you join her, your {pc.cock} bursts with a crazy amount of {pc.cum}, extras that were stored from the days of not getting normal orgasms. And all of that flows inside Eliza, past her cervix, inside her wanting womb.")

		saynn("[say=eliza]Ah~..[/say]")

		saynn("Her pussy walls pretty much milking your balls until they’re dry, many orgasmic waves flash through both lovers' bodies. You cease the hip movements and just enjoy how her warm wet folds treat your member.")

		addButton("Continue", "See what happens next", "continue5")

	if(state == "continue5"):
		playAnimation(StageScene.HangingSex, "tease", {pc="eliza", npc="pc", npcBodyState={naked=true, hard=true}, bodyState={underwear=true}})
		
		saynn("Quiet purring can be heard from Eliza while you hug her, still with your member inside her slit.")

		saynn("[say=eliza]So.. good..[/say]")

		saynn("You leave a few little smooches on her neck before slowly pulling out, letting the {pc.cum} to start slowly oozing out of her cute pussy slit.")

		saynn("You both need some time to catch your breath. You step around her and look into her eyes. Her satisfied cunning eyes.")

		saynn("[say=eliza]This is better than keeping you locked.. Heh..[/say]")

		saynn("You smile and then kiss the doctor on the lips again. Eliza blinks a lot and then closes her eyes, allowing you to lead. After about a minute of making out, you finally pull away from her lips and instead focus on uncuffing her paws. Eliza is purring so much..")

		addButton("Uncuff her", "Keeping her restrained any longer would be rude", "uncuff_her")

	if(state == "uncuff_her"):
		GM.pc.setLocation("medical_nearconfessionary")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="sit", bodyState={naked=true, hard=true}, npcBodyState={underwear=true}})
		
		saynn("You uncuff the feline and support her. But she seems to be doing fine, just with a little extra sway to her motions. Eliza smiles while watching {pc.cum} leaking out of her slit. She just shifts the panties back into their place, allowing them to get messy.")

		saynn("[say=eliza]My shift is just starting.[/say]")

		saynn("She then just plops into the chair and relaxes, still purring quietly.")

		saynn("[say=eliza]Well. You proved that I couldn’t change you. But I got something out of this anyway. So I’m not complaining~.[/say]")

		saynn("Eliza’s cheeky smile shines bright. You go ahead and grab your belongings.")

		saynn("[say=eliza]I guess you’re free to go now. No more sessions with me. How do you feel about that?[/say]")

		saynn("[say=pc]It was worth it in the end.[/say]")

		saynn("She chuckles.")

		saynn("[say=eliza]Of course it was.[/say]")

		saynn("After that Eliza gets up and lets you out into the corridor. Although just before you can leave, she pulls you in for a last little kiss.")

		saynn("[say=eliza]See you around.[/say]")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")
		

func _react(_action: String, _args):
	if(true):
		processTime(RNG.randi_range(3,8)*60)

	if(_action == "bottom"):
		GM.pc.addExperience(300)

	if(_action == "breeder"):
		GM.pc.addExperience(300)
		if(GM.pc.isWearingChastityCage()):
			GM.pc.getInventory().removeItemFromSlot(InventorySlot.Penis)

	if(_action == "use_heat_pill"):
		var eliza = getCharacter("eliza")
		eliza.forceIntoHeat()
	
	if(_action == "cum_inside"):
		getCharacter("eliza").cummedInVaginaBy("pc")

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["isSuccessful"] = isSuccessful
	data["optionalScenesBadBehaviorAmount"] = optionalScenesBadBehaviorAmount
	data["firstScenesBadBehaviorAmount"] = firstScenesBadBehaviorAmount
	data["claimedToBeObedient"] = claimedToBeObedient
	data["kneeledBeforeEliza"] = kneeledBeforeEliza
	data["lickedPussy"] = lickedPussy
	
	return data
	
func loadData(data):
	.loadData(data)
	
	isSuccessful = SAVE.loadVar(data, "isSuccessful", false)
	optionalScenesBadBehaviorAmount = SAVE.loadVar(data, "optionalScenesBadBehaviorAmount", 0)
	firstScenesBadBehaviorAmount = SAVE.loadVar(data, "firstScenesBadBehaviorAmount", 0)
	claimedToBeObedient = SAVE.loadVar(data, "claimedToBeObedient", false)
	kneeledBeforeEliza = SAVE.loadVar(data, "kneeledBeforeEliza", false)
	lickedPussy = SAVE.loadVar(data, "lickedPussy", false)

func getDevCommentary():
	return "Bottom or Breeder. I know, these two aren't the exact opposites. You can be a top but not want to breed. But why are you playing through this content then x3. That's like, the exact opposite of who it was designed for. At least I didn't go for Bottom vs Sissy choice, that'd be even more fun x3\n\nBut yeah, the breeder choice is there just so you can take off the cage and continue playing as normal. Would it be cool to able to switch between caged and not-caged when you want? Yeah, probably. But other characters can have such functions. Or Eliza's dedicated content if that's ever gets written x3.\n\nWill there be a way to remove the permanent cage in the future without save editing? Maybe. The easiest way would be through transformation. Make your dick smaller until the cage just slips off x3"

func hasDevCommentary():
	return true
