extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "Ch2e1MedicalCheckup"


func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("You look around and scratch your head, unsure of how to start the conversation.")

		saynn("[say=pc]Uh..[/say]")

		saynn("Eliza quickly picks up on that, she puts her mug away and stares at you.")

		saynn("[say=eliza]Something is wrong?[/say]")

		saynn("[say=pc]I don’t know.[/say]")

		saynn("[say=eliza]Stay there, inmate.[/say]")

		saynn("Eliza stands up and leaves her counter before leaving out of sight just to appear from one of the staff-only airlocks. The doctor approaches you and gives you what looks like a visual check.")

		saynn("[say=eliza]I can tell that you’re hiding something. Need a medical checkup?[/say]")

		saynn("That might be your chance. At least you will be alone with Eliza.")

		saynn("[say=pc]Yeah, my head hurts a little..[/say]")

		saynn("[say=eliza]Are you sure it’s just the head? Some inmates are too embaressed to admit they had rough sex and are now bleeding down there. Tell you what, let's go to the lab.[/say]")

		saynn("You nod softly. But then you see Eliza producing a chain leash.")

		saynn("[say=eliza]Safety measures.[/say]")

		saynn("Well it’s too late to say no now. Doctor clips the leash to your collar before proceeding to walk you towards one of the staff doors.")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		aimCameraAndSetLocName("med_researchlab")
		playAnimation(StageScene.Duo, "sit", {npc="eliza"})
		# (also launches a parading scene towards the lab)

		saynn("You enter the sterile lab with doctor Quinn. As you step in, the fluorescent lamps turn on automatically, blinding you. You squint and let your eyes adjust while you are being brought further into the room where the medical table is.")

		saynn("[say=eliza]Take a seat, patient.[/say]")

		saynn("It’s not your normal table, it seems to have a built-in computer and a few tools which you can only guess are some kind of scanners. Either way, you sit on the edge and let the doctor remove the leash.")

		saynn("[say=eliza]I trust you not to do anything silly like stealing or escaping.[/say]")

		saynn("[say=pc]Thanks.[/say]")

		saynn("[say=eliza]So, you have a migraine?[/say]")

		addButton("Headache", "Go along with the flow and see what happens", "headache")

	if(state == "headache"):
		saynn("[say=pc]More of a headache I guess.. can’t focus.[/say]")

		saynn("[say=eliza]Let me see.[/say]")

		saynn("Doctor fixes her glasses and leans in close to your face, offering you a great view of her top. She looks for any obvious injuries and then focuses on your eyes.")

		# (if has pain)
		if(GM.pc.getPain() > 0):
			saynn("[say=eliza]Yeah, it seems you had a fight. Or a good impact play session~. I will find some painkillers.[/say]")

		# (else if high)
		elif(GM.pc.getIntoxicationLevel() > 0.1):
			saynn("[say=eliza]Hmm. Your pupils are quite dilated. It seems you are under the influence. Or drank too much. I will look around for some detox pills.[/say]")

		# (else if horny)
		elif(GM.pc.getLust() > 0):
			saynn("[say=eliza]Your eyes show more lust than anything~. Horny thoughts prevent you from focusing. I will look for an anaphrodisiac, should help you calm down.[/say]")

		# (else)
		else:
			saynn("[say=eliza]You seem healthy to me. No bruises, no lustness, not under the influence.[/say]")

			saynn("Her words make you feel nervous, is she suspecting something already?")

			saynn("[say=eliza]I can give you some painkillers just in case I guess.[/say]")

			# (end)

		saynn("Eliza takes a step back and searches through some cabinets.")

		saynn("[say=pc]Everything is alright lately? You know, anything interesting happened?[/say]")

		saynn("[say=eliza]With me? Not really. My days of being adventurous ended when I blew up my dad's chemistry lab by accident. Now I’m stuck here in this prison. But you know, at least I can still do science. Who cares about ranks.[/say]")

		saynn("You nod. Eliza finds the pill bottle she was looking for. She hands you one pill and a glass of water.")

		addButton("Take pill", "Might as well", "take_pill")

	if(state == "take_pill"):
		saynn("You swallow the offered pill. Hard to tell but it seems it did actually help you somewhat. Eliza just crosses her arms and looks at you.")

		saynn("Suddenly the doors open and a nurse walks in, carrying some kind of small crate.")

		saynn("[say=nurse]Where can I leave this, doctor Quinn?[/say]")

		saynn("[say=eliza]Give it to me. I will check the contents and carry it to the storage later.[/say]")

		saynn("Is that what you think it is? Eliza grabs the crate and puts it on her chemistry station. She unlocks the crate and presses a button that begins the opening sequence. The crate makes a hissing noise as it depressurizes itself and presents its contents to the doctor.")

		saynn("You try to peek inside but the doctor’s back blocks the view, you only catch a glimpse of a few vials that contain bright red fluid. You’re pretty sure that’s what you need to steal.")

		saynn("[say=pc]What’s that?[/say]")

		saynn("[say=eliza]It’s for later.[/say]")

		saynn("Eliza sends the nurse off and then turns around before walking up to you again, arms crossed.")

		saynn("[say=eliza]How are you doing anyway?[/say]")

		saynn("You rub your head some more.")

		saynn("[say=pc]I’m alright, the pill is working I thi-..[/say]")

		saynn("Eliza cuts you off.")

		saynn("[say=eliza]I heard you and another inmate broke into the captain’s office? Quite brave.[/say]")

		saynn("You tilt your head down and shrug, avoiding Eliza’s drilling gaze.")

		saynn("[say=eliza]Just wondering. Was it your idea?[/say]")

		addButton("Yes!", "Lie to Eliza", "yes!")
		addButton("No", "Admit that you were made to do so", "no")

	if(state == "yes!"):
		saynn("You nod slightly and try to look Eliza into the eyes.")

		saynn("[say=pc]Yeah, I need to escape from this place.[/say]")

		saynn("The doctor raises a brow and tilts her head slightly.")

		saynn("[say=pc]What? Gonna shock me?[/say]")

		saynn("[say=eliza]No, just surprised. Well, I understand you somewhat but I disagree. Look around, this space station has everything, place to sleep, food, medical care, sex. No politics, no wars, no problems.[/say]")

		saynn("You frown but then chuckle.")

		saynn("[say=pc]Makes me wonder why they didn’t call this station ‘Heaven’. These are primal needs you are describing, doctor.[/say]")

		saynn("[say=eliza]What else do you need to be happy?[/say]")

		saynn("[say=pc]Have you ever had a dream?[/say]")

		saynn("[say=eliza]Uh..[/say]")

		saynn("Eliza looks puzzled, her gaze avoids yours.")

		saynn("[say=eliza]What’s your point?[/say]")

		saynn("[say=pc]Imagine knowing that you will never be able to fulfill it. Your dreams will just stay there, in your head, as fantasies. When you realize that, something real inside you dies, breaks.[/say]")

		saynn("Eliza looks at you silently for a few seconds, pondering. And then frowns.")

		saynn("[say=eliza]Shouldn’t have disobeyed the law then. You wasted your chance. Anyway, let’s continue.[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "no"):
		saynn("You shake your head slightly and look Eliza into the eyes. She raises a brow and tilts her head slightly, intently waiting. Eventually she breaks the tense silence herself.")

		saynn("[say=eliza]So it was Tavi then. Makes sense. And you’re trying to help her?[/say]")

		saynn("You stay silent. You have a strange feeling, like you’re being interrogated again.")

		saynn("[say=eliza]Well. I would think about it more if I were you. This place has everything, place to sleep, food, medical care, sex. No politics, no wars, no problems.[/say]")

		saynn("You stay silent still. Your hand reaches to tug on your collar.")

		saynn("[say=eliza]You have potential, you know. Would be a shame to waste it. Anyway, let’s continue.[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("Eliza straightens her posture and pulls out a tablet. She presses a few buttons and the table engages one of its tools, a scanner that traces your curves from the toes to the tip of your head.")

		saynn("[say=eliza]Vitals seem alright. Any other complaints?[/say]")

		saynn("You shrug.")

		saynn("[say=eliza]How are the genitals?[/say]")

		saynn("[say=pc]What about them?[/say]")

		saynn("[say=eliza]Bruises, itching, tearing, bleeding? We don’t want inmates to have scars on their vaginas here.[/say]")

		saynn("[say=pc]It’s fine.[/say]")

		saynn("Eliza puts the tablet away and leans in.")

		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("[say=eliza]Are you sure? Undress completely, patient, I will examine you.[/say]")

		# (else)
		else:
			saynn("[say=eliza]Are you sure? Spread your legs, patient, I will examine you.[/say]")

		saynn("[say=pc]No need.[/say]")

		saynn("Doctor’s voice becomes more strict.")

		saynn("[say=eliza]Are you sure?[/say]")

		addButton("Decline", "This will probably prevent you from stealing the drugs now", "decline")
		addButton("Attack", "Now seems to be the best time to attack Eliza and steal the drugs", "attack")
		addButton("Obey", "Do as told and present your naked body", "obey")


	if(state == "decline"):
		saynn("[say=pc]I’m fine, really.[/say]")

		saynn("Eliza doesn’t say anything for a few seconds. And then she shrugs.")

		saynn("[say=eliza]Well, that’s it then. Come here if you’re ever not feeling well.[/say]")

		saynn("You nod to her. Eliza turns towards the crate with the drugs.")

		saynn("[say=eliza]Everything seems to be alright here.[/say]")

		saynn("She presses the button that makes the crate close and lock itself. She grabs it by the handle and invites you to leave the lab.")

		addButton("Leave", "Follow Eliza", "leave")

	if(state == "leave"):
		GM.pc.setLocation("med_nearlab")
		aimCameraAndSetLocName("med_nearlab")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("She presses a button that closes the airlock behind.")

		saynn("[say=eliza]I trust you will find the exit yourself, I need to store this somewhere safe~[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("Seems now you will have to find their storage room to steal the drugs.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")


	if(state == "attack"):
		saynn("Suddenly you lash out at Eliza and shove her back before trying to pin her to the nearest wall.")

		saynn("[say=eliza]Argh![/say]")

		saynn("She tries to pull out a shock remote but you easily slap it out of her hand before grabbing her by the neck and applying some pressure to try to make her resist less.")

		saynn("[say=pc]Don’t make it difficult. I’m only here for one thing. And it’s not you.[/say]")

		saynn("You can see very little fear in Eliza’s eyes, suddenly she frees a hand and pulls out some kind of injector before trying to stick it into you. You make her drop it too but while doing so she manages to break free and escape your grasp, without even losing her glasses.")

		saynn("[say=eliza]I’m not gonna let some junkie treat my medbay as a drug store, you better give up now.[/say]")

		saynn("Seems it's a fight.")

		# (fight)
		addButton("Fight!", "Time to show how is the boss here", "fight")

	if(state == "if_won"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="defeat"})
		
		saynn("Eliza is unable to fight any longer but just before she can hit the floor, you pin her against the wall again. All she can do is weakly try to pry your hands off of her neck.")

		saynn("[say=eliza]L-let go..[/say]")

		saynn("[say=pc]I can’t, pussy cat.[/say]")

		saynn("[say=eliza]Gr-r..h-h..[/say]")

		# (Options are knock her out and Injector)

		addButton("Knock her out", "She shouldn’t see you stealing the drugs", "knock_her_out")
		addButton("Injector", "Use the unknown injector on Eliza", "injector")
		

	if(state == "knock_her_out"):
		playAnimation(StageScene.SexStart, "defeated", {
			npc="eliza", pc="pc", 
			bodyState={},
			npcBodyState={},
		})
		
		saynn("You start to apply more pressure onto the doctor’s neck until her resistance becomes even more weaker. Eventually, Eliza loses consciousness and you slowly make her slide down the wall before letting go of her neck.")

		saynn("You grab the vials with the red drug, all of them. To make sure no one notices their disappearance, you replace the ones you stole with random ones that have roughly the same color.")

		saynn("Time to run. You crouch before Eliza and steal her badge for a second to open the door out of the lab. She should be fine, you see her chest breathing.")

		addButton("Escape", "Time to go", "escape")

	if(state == "escape"):
		removeCharacter("eliza")
		GM.pc.setLocation("med_nearlab")
		aimCameraAndSetLocName("med_nearlab")
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You enter the corridor and close the door behind you. You stole the mind-melting drug, Tavi should be safe now.")

		# (task updated)

		# (scene ends)
		addButton("Continue", "You got the drugs!", "endthescene")

	if(state == "injector"):
		playAnimation(StageScene.SexStart, "start", {
			npc="eliza", pc="pc", 
			bodyState={},
			npcBodyState={},
		})
		
		saynn("You reach out and pick up the injector that Eliza dropped. You’re not sure what it is but might as well test it on the doctor.")

		saynn("[say=eliza]H-hey! Don’t you dare.[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("Eliza puts up a very weak defense, wrapping her paws around your hands with the injector and keeping it away from her as best as she can. Fear and panic settles into her as she begins to lose, seeing the thing creeping closer and closer to her neck.")

		saynn("[say=eliza]I w-won’t tell anyone! I promise![/say]")

		saynn("[say=pc]Why should I trust a scared pussy.[/say]")

		saynn("Eventually you overpower the weak doctor and stick the injector into her neck. The thing injects an unknown substance into Eliza’s bloodstream and becomes spent so you throw it away and just watch what happens next.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		saynn("Eliza stops resisting completely, she presses her paws against you but seems to be unable to push you away. The drug seems to be some kind of strong sedative, making it so she can’t tense up her muscles or even yell at you anymore.")

		saynn("[say=eliza]Why..[/say]")

		saynn("You take off her belt and throw onto the floor. You notice that one of the pouches has a chain that she uses to leash you around and some other restraints.")

		saynn("[say=pc]If you weren’t such a bitch, things would have been different.[/say]")

		# (bind and leave, undress and gag with panties, whip with the chain, breed, grind with pussy)

		addButton("Bind and leave", "She doesn’t possess any threat anymore, might just leave her be", "bind_and_leave")
		addButton("Be rough", "(Brutal noncon) Time to teach that girl a good lesson", "be_rough")


	if(state == "bind_and_leave"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("You grab the long chain that Eliza usually uses as a leash. You figure that it might work pretty well as a rope and begin tying the doctor's legs with it, making it so she can’t walk or even just spread her legs.")

		saynn("[say=eliza]Hey..[/say]")

		saynn("You focus your attention on her body. You take off her lab coat but leave the top and the long skirt that she has. The chain then gets wrapped around her hips and waist before going over her crotch, digging into her lace panties and making her skirt lift up which exposes her sexy garter and the underwear.")

		saynn("[say=eliza]Anyone? H-help!..[/say]")

		saynn("[say=pc]I’m sick of that mouth.[/say]")

		saynn("You quickly wrap the chain around the girl’s chest and use the rest of it to tie her paws together, rendering Eliza helpless. Then you fumble through her pouches more and find a ball gag and a blindfold. The doctor sees them and starts to shake her head a lot.")

		saynn("[say=pc]What? You’d rather have me beat you senseless before doing it? Open your mouth.[/say]")

		saynn("Eliza tilts her head down but doesn’t obey. So you slip your hand under her chains and tug, causing them to dig into the girl’s fur and also her sensitive parts. That makes her let out a desperate moan that you use for your advantage by shoving the red ball into her mouth and securing the straps behind her head.")

		saynn("[say=eliza]Mh-hh-f..[/say]")

		saynn("The blindfold comes soon after, you wrap it around the girl’s eyes and tie it up, completing the kinky outfit.")

		saynn("[say=pc]Much better.[/say]")

		saynn("Eliza huffs softly. You grab her by the chain harness and tug towards the table, making her hop around awkwardly. A little push and she falls onto it with a muffled annoyed noise coming soon after. You tickle the bound doctor and see her squirming and wiggling which makes her chains dig into the sensitive spots more, forcing out noises again.")

		saynn("[say=pc]Enjoy trying to get out of this.[/say]")

		saynn("After that you just grab the vials with the bright red drug and store them before replacing them with the ones she has lying around with of the same color.")

		# (Escape, Time to go)
		addButton("Escape", "Time to go", "resetElizaAndescape")

	if(state == "be_rough"):
		addCharacter("eliza", ["naked"])
		
		saynn("Even though Eliza is drugged up with sedatives, she is still trying to resist. Which is so bad after what she tried to do with you. With Eliza still being pinned against the wall, your hands reach out for her lab coat and begin yanking it off. It seems to be made out of a tough material, Eliza is holding on to it the best she can before receiving a punch in the gut. That makes her gasp and finally let go of it, her glasses fall onto the floor and break. You throw her coat away and pin her against the wall again, can’t have her collapsing on you now.")

		saynn("[say=eliza]Gh-h..[/say]")

		saynn("The next item is her fancy short-sleeve top. Taking it off normally would take more time so you just tear it off with your hands, ruining it and exposing the girl’s black lace bra that supports her C-cup tits.")

		saynn("Eliza tries to sink her sharp feline claws into your flesh but you easily catch her paw and make her drag her own claws against her neck, leaving a few shallow scratch marks. She hisses from the pain and retracts her claws willingly.")

		saynn("[say=pc]Bitch, you’re not walking away unscared today. No one's gonna save your ass.[/say]")

		saynn("You press your forearm into the doctor’s neck and watch her angry eyes as you forcibly pull down her skirt, exposing her garter and black lace panties.")

		saynn("[say=eliza]F-fuck y-you..[/say]")

		saynn("[say=pc]Is that how you’re gonna talk?[/say]")

		saynn("You leave the garter alone but grab her panties before yanking them off. The cloth digs into her pussy before finally ripping and exposing her careful pink folds. You give the bitch another punch in the stomach to stun her enough for you to shove her own ruined underwear into her mouth, using it as a makeshift gag.")

		saynn("[say=pc]Much better.[/say]")

		saynn("Though, she spits it out soon after so you slap her face before stuffing the wet black panties into her mouth again and using some medical tape to hold it there.")

		saynn("Eliza looks rough, lots of bruises and scratches are now decorating her pastel yellow fur. She is coughing and holding onto her stomach. She tries to look away but you grab her by the ponytail and force eye contact. The naked doctor is hissing and wincing at your roughness, she doesn’t look so rebellious anymore. In fact, first tears appear on her cheeks, messing up the make up.")

		addButton("Whip her", "(Brutal) Use her chain leash to whip her ass and more", "whip_her")
		addButtonWithChecks("Breed her", "(noncon) Her little pussy is just too appealing to pass up", "breed_her", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Scissoring", "(noncon) Rub pussies with Eliza", "scissoring", [], [ButtonChecks.HasReachableVagina])


	if(state == "whip_her"):
		playAnimation(StageScene.SexStart, "defeated", {
			npc="eliza", pc="pc", 
			bodyState={},
			npcBodyState={},
		})
		
		saynn("[say=pc]What? Think your crying will make me stop?[/say]")

		saynn("You reach down and grab a chain that Eliza uses to leash inmates around. You wrap one end of it around your hand, making it look like a makeshift whip. Then you pull the unwilling scared doctor towards the middle of the room before bending her over the table. Your free hand lands on her cute fit ass and gives it a rough smack. She is already wiggling but you pin her in place.")

		saynn("You raise the hand with the chain whip, preparing to strike. Eliza closes her eyes and braces.")

		saynn("[say=pc]Such a bad slut. This will teach you.[/say]")

		saynn("With one swift motion, you bring the whip down and whip her ass, leaving a few bruises already. Eliza arches her back and lets out a muffled painful noise through the panties.")

		saynn("You don’t stop, the next strike comes soon after, leaving another set of wounds on both her buttcheeks and making her wiggle around desperately.")

		saynn("[say=pc]Yeah, how does it feel to be on the receiving end?[/say]")

		saynn("The chain rattles as you raise it again just to whip that poor doctor’s butt again. She surely won’t be able to sit on it for a while, you already notice some wounds bleeding. Muffled cries escape from her, she tries to cover her ass but you just whip her paws away, leaving a few painful marks on them too.")

		saynn("[say=pc]If you tell anyone, I will make a proper painslut out of you. Hear me?[/say]")

		saynn("Eliza just cries and rubs her wounded paws against her body so you whip her again, making her ass look very wounded. After some yelping and squirming, she starts to eagerly nod at you.")

		saynn("[say=pc]I don’t think I can trust you.[/say]")

		saynn("You whip her thighs for a change and that sends a much powerful reaction, Eliza arches her back hard while her legs shake and shiver.")

		saynn("[say=eliza]p-phhe-evse… s-stoh-hp..[/say]")

		saynn("She is a crying whining mess, her ass that was looking pristine not that long ago is now full of little bleeding marks that the chain links left.")

		saynn("You put your hands on her asscheeks and spread them. Her pink pussy is dry and the careful little tailhole visible clenching, probably from all the pain. You decide that her sensitive parts need to be taught a lesson too.")

		saynn("You hold her legs spread before whipping her for the last time, aiming directly for her slit. The reaction was powerful, a sudden shock overwhelms Eliza, her pink cunt receives a few good wounds and is pulsating as waves of pain make the girl squirm and quiver harder than before. Poor doctor is whining and crying, her paws holding onto her bleeding pussy but that only makes it more painful.")

		saynn("You turn her onto her back and grab her by the neck. You see fear and desperation in her eyes.")

		saynn("[say=pc]Did I make myself clear?[/say]")

		saynn("She nods many times.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("You let go of her neck and she falls off the table, probably hurting her back in the process too.")

		addButton("Continue", "Grab the drugs and leave", "continue2")

	if(state == "continue2"):
		saynn("While Eliza is busy looking for any painkillers in her pouches, you grab the vials with bright red fluid and replace them with random ones you find in her chemistry station that have roughly the right color.")

		saynn("Then you fetch the badge so you can open the door and leave.")

		# (Escape, Time to go)
		addButton("Escape", "Time to go", "escape")


	if(state == "breed_her"):
		# (needs reachable penis)
		playAnimation(StageScene.SexStanding, "tease", {
			npc="eliza", pc="pc", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true},
		})

		saynn("Eliza is still trying to desperately push you away, you catch both her paws with one hand and force them above her head while your second hand lands on the girl’s bra and is groping her tits.")

		saynn("[say=pc]Don’t cry, kitty. You’re beatiful and so I just wanna fuck you.[/say]")

		saynn("Her eyes open wide, she tries to mumble something but the panties in her mouth only make her drool more.")

		saynn("Eliza’s body is gorgeous, sexy clean curves all around with the black lingerie really emphasizing that. Her short pastel-colored fur feels so soft when you brush your hand over it. Although Eliza twitches each time she feels your touch, probably because of all the bruises that you left on her.")

		saynn("Your hand slides down over that fit belly and reaches her crotch, your digits find the little sensitive bean and play with it, making Eliza squirm and try to pull away.")

		saynn("[say=pc]No? I guess I will have to take you the hard way.[/say]")

		saynn("Her sorry eyes track your hand as you expose your {pc.cock} and present it to her. It’s already hard, twitching and leaking precum onto the floor. She stands on her toes and looks at you pleadingly while keeping her legs shut close. You do notice that she is blushing a lot.")

		addButton("Continue", "Enough foreplay", "continue3")

	if(state == "continue3"):
		playAnimation(StageScene.SexStanding, "sex", {
			npc="eliza", pc="pc", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true},
		})
		
		saynn("Eliza makes muffled noises as you turn her around and pin against the wall, the hand that was holding her paws is now forcing her head into the cold concrete while the second pulls on that convenient feline tail to make her bend forward. And it works, her inner thighs trap your shaft between them.")

		saynn("But you didn’t come here to fuck her thighs, you pull back a little and guide your cock directly towards her sex that seems to be mostly dry, missing any arousal juices. You press the tip of your dick against her slit and lean in to whisper her into the ear.")

		saynn("[say=pc]Soon you will get addicted to having my litter inside you.[/say]")

		saynn("But Eliza didn’t yet stop showing her protest, she was mumbling and struggling against your pin until you suddenly thrust inside her, spreading her pussy petals aside and stretching her hole enough for your cock to slide inside. The girl lets out a painful moan as you leave bruises on her soft inner walls due to the lack of any lube. But the extra friction only makes the forced intercourse feel so much better, she is clenching her tight pussy around your dick and visibly shivering.")

		saynn("[say=pc]So tight~[/say]")

		saynn("You don’t stop there, you begin moving your hips back and forth, leaving empty space inside that slit just to stuff it with your cock moments later. You notice some signs of blood on your shaft from all the roughness but you push through, fucking that cute pink slutty cunt for your please and forcing more noises out of your breeding toy.")

		saynn("Eventually her body starts to betray her, detecting the intercourse and making her wet against her will. Now your cock can finally stop tearing her inner walls and begin sliding against them. And soon enough, the doctor starts to squirm and convulse before you, her pussy pulsating and squirting out lots of her femcum, her legs really want to give up.")

		saynn("[say=pc]Cumming already, huh~? Such a dirty girl.[/say]")

		saynn("Since the slut can’t stand very well, you pull her away from the wall and bend her body over the table that’s in the middle of the room. Your cock quickly finds the familiar slit and starts pounding it raw. More little muffled moans escape from the doctor as your cock finds her g-spot and starts hammering at. You lean forward and grab both of her hands before pulling them behind her back and using them to yank the girl towards you while thrusting inside her wet slit.")

		saynn("Her needy pussy quickly starts to get tight around your {pc.cock} again, Eliza is cumming and squirting all over the table while her tits bounce each time you force yourself deep inside her and pound at her cervix. All that is pushing you quite close to your own peak too, her slit is just begging for your seed.")

		saynn("[say=pc]Ready to bear kittens from me?[/say]")

		addButton("Cum inside", "Finish the job", "cum_inside")
		addButton("Pull out", "She clearly doesn’t want it, might as well have some mercy", "pull_out")

	if(state == "cum_inside"):
		playAnimation(StageScene.SexStanding, "fast", {
			npc="eliza", pc="pc", pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true},
		})
		
		saynn("The feline under you doesn’t seem to be against it much, only her tail is wagging sporadically. You bend forward and support against the table with your hands while doing powerful thrusts with your hips, ramming that cock deep inside her and breaking into her womb. That’s when the tightness shoots you over the edge, grunts escape from your lips while your {pc.cock} bursts with multiple waves of your virile {pc.cum} that quickly stuffs the girl’s babymaker full.")

		saynn("[say=pc]There we go~.[/say]")

		saynn("Eliza has given up at this point, just sobbing quietly while your {pc.cum} drips down her girly thighs. You lay down on her and playfully bite her ear before pulling out and leaving her used pink slit to leak.")

		saynn("After that, you just quickly clean yourself and grab the vials from the special crate before replacing them with some random ones Eliza has around that have roughly the same color, the girl is too busy crying to notice you doing all of that anyways.")

		# (escape button here)
		addButton("Escape", "Time to go", "escape")


	if(state == "pull_out"):
		playAnimation(StageScene.SexStanding, "tease", {
			npc="eliza", pc="pc", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true},
		})
		
		saynn("The feline under you doesn’t seem to care much about her fate, only her tail is wagging sporadically. You keep railing that slutty pussy, bringing your peak closer. But in the end, you decide to be merciful and pull your cock out moments before it bursts with waves of your {pc.cum}. Instead of stuffing her babymaker, you leave her slit to gape and just cum all over her ass and back.")

		saynn("[say=pc]Consider yourself lucky.[/say]")

		saynn("Eliza is just sobbing quietly while your {pc.cum} drips down from her curves. You smack her cute butt and clean your messy cock against her thighs.")

		saynn("After that, you just quickly grab the vials from the special crate before replacing them with some random ones Eliza has around that have roughly the same color, the girl is too busy crying to notice you doing all of that anyways.")

		# (escape button here)
		addButton("Escape", "Time to go", "escape")


	if(state == "scissoring"):
		playAnimation(StageScene.SexTribadism, "sex", {
			npc="eliza", pc="pc", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true},
		})
		# (needs pussy)

		# (ideally should have a way to steal cum)

		saynn("Eliza is still trying to desperately push you away, you catch both her paws with one hand and force them above her head while your second hand lands on the girl’s bra and is groping her tits.")

		saynn("[say=pc]Don’t cry, kitty. You’re a beautiful woman.[/say]")

		saynn("She tries to mumble something but the panties in her mouth only make her drool more.")

		saynn("Eliza’s body is gorgeous, sexy clean curves all around with the black lingerie really emphasizing that. Her short pastel-colored fur feels so soft when you brush your hand over it. Although Eliza twitches each time she feels your touch, probably because of all the bruises that you left on her.")

		saynn("Your hand slides down over that fit belly and reaches her crotch, your digits find the little sensitive bean and play with it, making Eliza squirm and try to pull away.")

		saynn("[say=pc]No? I guess I will have to take you the hard way.[/say]")

		saynn("You grab the girl by her ponytail and pull her towards the medical table, making her hiss. Then you push her to sit on it and expose your {pc.pussyStretch} pussy that is quite wet from excitement already. Eliza tries to pull away but you pull her back and catch one of her legs before raising it so you can press your crotch against hers.")

		saynn("[say=pc]Ever done this before~?[/say]")

		saynn("Crying Eliza looks at you and at her pussy before shaking her head and looking away. She is dry down there but you quickly make her folds wetter by eagerly rubbing your slit against hers, little moans already begin escaping from you. When Eliza tries to stop you, your hand reaches out and grabs her by the neck.")

		saynn("[say=pc]Quit resisting and enjoy being pussy-fucked.[/say]")

		saynn("You pick up the pace, letting your petals grind against the girl’s slit harder and exchanging transparent fluids in the process. Eliza’s body seems to be betraying her, she is still shaking her head but the muffled noises that she makes are quite lewd. Very soon her pussy starts to pulsate and squirt femcum all over yours, her body is squirming a lot while she is cumming.")

		saynn("[say=pc]Such a good girl~.[/say]")

		saynn("You feel yourself getting close too.")

		addButton("Cum", "Keep grinding her until you cum", "tribcum")

	if(state == "tribcum"):
		playAnimation(StageScene.SexTribadism, "fast", {
			npc="eliza", pc="pc", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true},
		})
		
		saynn("Even though the doctor’s pussy is probably quite sensitive after the climax, you keep grinding and overstimulating it, causing the girl to squirt again soon after. Her folds are massaging yours by twitching and pulsating which makes you cum too, your legs start to shake, your slit showering Eliza’s crotch with your juices.")

		saynn("[say=pc]F-fuck yeah~[/say]")

		saynn("After riding the last of your orgasmic waves, you pull your crotch away, leaving the girl’s irritated pussy alone. Eliza just kinda becomes limp on the table, pretty much giving up completely.")

		saynn("After that you just quickly clean yourself and grab the vials from the special crate before replacing them with some random ones Eliza has around that have roughly the same color, the girl is too busy crying to notice you doing all of that anyways.")

		# (escape button here)

		addButton("Escape", "Time to go", "escape")

	if(state == "if_lost"):
		saynn("You fall to your knees and pant heavily. Eliza picks up the injector she dropped.")

		saynn("[say=eliza]Big mistake. But I know how to extract some value out of you.[/say]")

		saynn("She sticks the injector into your neck, making you grunt. It seems to be some kind of sedative because you can’t even get up anymore. But then she injects you with something else. Very soon you begin to feel the world spinning around you.")

		saynn("The last thing you see is Eliza closing the crate with the drugs before losing consciousness.")

		saynn("[say=eliza]Bye-bye~.[/say]")

		addButton("Nap", "Time to sleep", "nap")

	if(state == "nap"):
		aimCameraAndSetLocName("medical_paddedcell_player")
		GM.pc.setLocation("medical_paddedcell_player")
		playAnimation(StageScene.Solo, "kneel")
		
		saynn("You sleep for a few hours. When you wake up, you notice something. The floor is.. soft. Yes, it’s a very soft floor, you almost don’t wanna open your eyes.")

		saynn("But when you do, you realize that the floor is actually padded. And walls too. Oh. No.")

		saynn("You try to sit down but quickly realize that you can’t use arms, they are bound! You’re wearing a straitjacket!")

		saynn("[say=pc]Oh…[/say]")

		saynn("You sit down without using your arms and look around. You’re in a small padded room with a single door and nothing else.")

		saynn("[say=pc]Anyone?[/say]")

		saynn("Did she send you into an asylum?")

		saynn("A few seconds later you hear the noise coming through a very bad intercom speaker.")

		saynn("[say=eliza]Came to your senses?[/say]")

		saynn("[say=pc]What did you do?[/say]")

		saynn("[say=eliza]Me? I haven't done anything yet. But you need help, your behavior clearly shows that you’re not doing well, mental wise.[/say]")

		saynn("[say=pc]Let me out.[/say]")

		saynn("You hear her giggling which comes through with a lot of static, making it sound even worse.")

		saynn("[say=eliza]Not until your behavior changes and you become sane again.[/say]")

		saynn("[say=pc]I’m not insane![/say]")

		saynn("[say=eliza]Your records say otherwise. But you should be excited actually, we will be doing some experiments on you. To help you of course. For now, have a good rest.[/say]")

		saynn("[say=pc]Experiments? What?[/say]")

		saynn("But just before you can voice all your protests, the small room begins to fill with thick pink mist. Breathing it makes you drowsy and sleepy.")

		saynn("The padded floor suddenly feels quite.. comfy. Keeping your eyes open is so hard.. Your body gives up on you..")

		addButton("Sleep", "Second time today", "sleep")

	if(state == "sleep"):
		removeCharacter("eliza")
		saynn("You get some good sleep. You open your eyes and realize that this wasn't a dream. You can't pinch your skin with that straitjacket on but everything is real, you're indeed stuck in a padded cell..")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence")

		# (sleep, end scene)
		addButton("Continue", "What now?", "startMentalWard")


	if(state == "obey"):
		playAnimation(StageScene.Duo, "sit", {npc="eliza",
			bodyState={naked=true,},
		})
		
		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("You {pc.undressMessage}, leaving yourself fully naked with just the collar on. Eliza takes your clothing and neatly packs it away for now. She then puts on some latex gloves and walks up to you.")

		saynn("[say=eliza]I will just check if you have any internal damage. Spread your legs for me like a good patient. It won’t hurt, promise.[/say]")

		# (if has pussy and cock)
		if(GM.pc.hasPenis() && GM.pc.hasVagina()):
			saynn("You obey the doctor and spread your legs slightly, offering a great view of your {pc.cock} and {pc.pussyStretch} pussy. There is also a {pc.analStretch} tailhole hiding behind your balls.")

			saynn("You blush slightly as Eliza leans down to do a visual check of your private bits. Her paw reaches out to brush over your shaft and cup the balls. After that, her digits land on your pussy slit and spread it open.")

		# (else if has cock)
		elif(GM.pc.hasPenis()):
			saynn("You obey the doctor and spread your legs slightly, offering a great view of your {pc.cock}. There is also a {pc.analStretch} tailhole hiding behind your balls.")

			saynn("You blush slightly as Eliza leans down to do a visual check of your private bits. Her paw reaches out to brush over your shaft and cup the balls. After that, her digits sneak further and land on your tailhole before prodding it a few times.")

		# (else if has pussy)
		elif(GM.pc.hasVagina()):
			saynn("You obey the doctor and spread your legs slightly, offering a great view of your {pc.pussyStretch} pussy. There is also a {pc.analStretch} tailhole hiding behind your slit.")

			saynn("You blush slightly as Eliza leans down to do a visual check of your private bits. Her paw reaches out to brush over your sex. After that, her digits land on your pussy petals and spread them open.")

		# (else)
		else:
			saynn("You obey the doctor and spread your legs slightly, offering a great view of your crotch. There is also a {pc.analStretch} tailhole.")

			saynn("You blush slightly as Eliza leans down to do a visual check of your private bits. Her paw reaches out to brush over your crotch. After that, her digits sneak further and land on your tailhole before prodding it a few times.")

		# (if both are tight)
		if(GM.pc.hasTightHoles()):
			saynn("[say=eliza]Pretty nice, I see barely any wear and tear. You don’t have much intercourses. Unless you use lube of course~.[/say]")

			saynn("You blush even harder hearing Eliza comment on your sex life.")

			saynn("[say=eliza]Either way, let me find some.[/say]")

		# (else)
		else:
			saynn("[say=eliza]Hmm, I do see some wear and tear, maybe you should be using more lube.[/say]")

			saynn("You blush even harder hearing Eliza comment on your sex life.")

			saynn("[say=eliza]Yeah, let me find some.[/say]")

		saynn("Doctor turns away and heads for some lockers to try to find something. This might be your best chance.")

		addButton("Sneak", "Stand up and grab the drugs", "sneak")

	if(state == "sneak"):
		saynn("You make sure Eliza is not looking at you before silently leaving your spot and approaching the chemistry station. You grab every vial with the bright red drug and replace them with random ones that Eliza has around with roughly the same color.")

		saynn("But then you realize..")

		saynn("You’re completely naked, where are you gonna hide them? Eliza is about to turn and look at you.")

		saynn("You look down at yourself. The more you think about it, the more you realize it, there is only one way to smuggle them out..")

		addButton("Uh..", "Panic?", "uh..")
		addButton("Inside", "Hide them inside you..", "inside")

	if(state == "uh.."):
		saynn("You waste most of your time panicking and just put your hand with the drugs behind your back.")

		saynn("Eliza sees you standing near the table and squints.")

		saynn("[say=eliza]Why are you standing exactly, inmate?[/say]")

		saynn("[say=pc]Uh[/say]")

		saynn("She turns towards you and frowns.")

		saynn("[say=eliza]And what’s that in your hand?[/say]")

		saynn("[say=pc]Nothing?[/say]")

		saynn("She starts creeping towards you, her paw reaches for the remote. You gotta do something!")

		# (choices are attack and explain)

		addButton("Explain", "Try to talk it through", "explain")
		addButton("Attack", "Now seems to be the best time to attack Eliza and steal the drugs", "attack")


	if(state == "explain"):
		playAnimation(StageScene.Duo, "defeat", {npc="eliza"})
		
		saynn("[say=pc]I can explain.[/say]")

		saynn("[say=eliza]Can you?[/say]")

		saynn("Eliza finds the shock remote and presses the button that sends a powerful shock through your body. You cry out from pain and fall to your knees, your hand drops the vials.")

		saynn("[say=eliza]You’re just a junkie. You think this is a drug shop? But I can help you with your addictions.[/say]")

		saynn("She doesn’t even give you time to catch your breath before sending another shock in. The pain makes you collapse and squirm around on the floor. Eliza then just walks up to you and sticks some kind of injector into your neck before grabbing the red vials from you and storing them into the crate.")

		saynn("Very soon you begin to feel the world spinning around you.")

		saynn("The last thing you see is Eliza closing the crate with the drugs before losing consciousness.")

		saynn("[say=eliza]Bye-bye~.[/say]")

		# (if lost stuff starts here)
		addButton("Nap", "Time to sleep", "nap")

	if(state == "inside"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		# (if has pussy)
		if(GM.pc.hasReachableVagina()):
			saynn("There is no time, you move the vials down to your slit and slide them inside one by one, hoping that the internal friction will be enough to keep them from falling out.")

		# (else)
		else:
			saynn("There is no time, you move the vials down to your butt and slide them inside one by one, hoping that the internal friction will be enough to keep them from falling out.")

		saynn("Then you quickly sit on the table again and clench as much as you can. Eliza finds what she was looking for and walks up to you, seemingly unaware of what just happened.")

		saynn("[say=eliza]There you go, some lube. Can buy more with your credits if you ever need it.[/say]")

		saynn("You smile nervously and grab the offered lube.")

		saynn("[say=pc]Thanks..[/say]")

		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("Eliza raises her brow at you. But then she just grabs your uniform and gives it to you. You carefully put your stuff on while she approaches her chemistry station and makes sure everything is okay there before closing the crate.")

		# (else)
		else:
			saynn("Eliza raises her brow at you. But then she just approaches her chemistry station and makes sure everything is okay there before closing the crate.")

		saynn("[say=eliza]Now we can go, inmate.[/say]")

		addButton("Leave", "You’re almost free!", "leave1")

	if(state == "leave1"):
		GM.pc.setLocation("med_nearlab")
		aimCameraAndSetLocName("med_nearlab")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Eliza opens the door that leads to the corridor. You get up and begin to step towards it. You do walk a little funny but luckily Eliza doesn’t spot it.")

		saynn("[say=eliza]I need to store this in a safe place. I believe you will find the exit yourself?[/say]")

		saynn("You nod and watch Eliza leave you alone. Now you finally can pull out the drugs.. out of yourself. But hey, at least you have them now. Clean job. Mostly.. Tavi should be happy.")

		# (Task completed)

		# (scene ends)
		
		addButton("Continue", "See what happens next", "endthescene")


func _react(_action: String, _args):
	if(_action == "follow"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "med_researchlab", [
			"Do you like the leash~?",
			"We will fix you real soon",
			"Smile to the nurses",
		]])
		
	if(_action == "take_pill"):
		if(GM.pc.getPain() > 0):
			GM.pc.addPain(-100)
		elif(GM.pc.getIntoxicationLevel() > 0.1):
			GM.pc.addIntoxication(-1.0)
		elif(GM.pc.getLust() > 0):
			GM.pc.addLust(-100)
		else:
			GM.pc.addPain(-100)
	
	if(_action == "fight"):
		setFlag("TaviModule.ch2PCAttackedEliza", true)
		runScene("FightScene", ["eliza"], "elizafight")
	
	if(_action == "leave"):
		processTime(20*60)
		setFlag("TaviModule.ch2ElizaDeclinedFullCheckup", true)
		setFlag("TaviModule.ch2PCFailedToStealDuringCheckup", true)
		addMessage("Task updated")
		addExperienceToPlayer(20)

	if(_action == "resetElizaAndescape"):
		getCharacter("eliza").resetEquipment()
		_action = "escape"

	if(_action == "escape"):
		setFlag("TaviModule.ch2PCStoleDrugs", true)
		addMessage("Task completed!")
		addExperienceToPlayer(100)
		setFlag("MedicalModule.Eliza_BusyDays", 2)
		
	if(_action == "leave1"):
		setFlag("TaviModule.ch2PCStoleDrugs", true)
		setFlag("TaviModule.ch2PCPutDrugsInsideSelf", true)
		addMessage("Task completed!")
		addExperienceToPlayer(100)

	if(_action == "be_rough"):
		setFlag("TaviModule.ch2PCDidBadThingsToEliza", true)
	
	if(_action == "cum_inside"):
		getCharacter("eliza").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("eliza")
		
	if(_action == "pull_out"):
		GM.pc.orgasmFrom("eliza")
	
	if(_action == "tribcum"):
		GM.pc.rubsVaginasWith("eliza")
		GM.pc.orgasmFrom("eliza")
		
	if(_action == "nap"):
		setFlag("TaviModule.ch2PCGotPutIntoMentalByEliza", true)
		getModule("MedicalModule").preparePCForMentalWard()
	
	if(_action == "sleep"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
	
	if(_action == "explain"):
		GM.pc.addPain(100)
		
	if(_action == "inside"):
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("lube"))
	
	if(_action == "startMentalWard"):
		runScene("MentalWardScene")
		setFlag("TaviModule.ch2PCFailedToStealDuringCheckup", true)
		endScene()
		return
	
	if(_action == "bind_and_leave"):
		var eliza:Character = getCharacter("eliza")
		eliza.getInventory().equipItem(GlobalRegistry.createItem("blindfold"))
		eliza.getInventory().equipItem(GlobalRegistry.createItem("ropeharness"))
		eliza.getInventory().equipItem(GlobalRegistry.createItem("inmatewristcuffs"))
		eliza.getInventory().equipItem(GlobalRegistry.createItem("inmateanklecuffs"))
		eliza.getInventory().equipItem(GlobalRegistry.createItem("ballgag"))
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "elizafight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won")
			setFlag("TaviModule.ch2PCAttackedElizaAndWon", true)
			addExperienceToPlayer(50)
		else:
			setState("if_lost")
			addExperienceToPlayer(20)
