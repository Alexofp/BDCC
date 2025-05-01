extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ElizaTalkScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["eliza"])):
		endScene()
		return

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="stand"})
		
	if(state == ""):
		if(!GM.main.getModuleFlag("MedicalModule", "Eliza_IntroducedMedical")):
			GM.main.setModuleFlag("MedicalModule", "Eliza_IntroducedMedical", true)
			
			saynn("Medical wing lobby looks bright, the walls are made out of white concrete and are well-lit by many fluorescent lights. Behind the counter you see a doctor, a familiar face, the one who processed you on the day of your arrival. She is sitting on an office chair and sipping coffee. Her mug seems to be a personal one, your gaze catches the words ‘best mom’ written on it.")

			saynn("She yawns and then notices your presence. She shifts in her chair and quickly fixes her loose hair bang.")

			saynn("[say=eliza]Hey there, inmate. Need something?[/say]")

			saynn("[say=pc]Just wandering around.[/say]")

			saynn("[say=eliza]Well this is the medical wing, a place where the inmates get fixed, one way or another. I’m just one of the doctors, name is doctor Quinn in case you forgot.[/say]")

			saynn("You look around, the wide counter separates the lobby itself from the staff-only area. On both ends of the lobby there are two airlocks with panels that seem to require special access. There is also a way to another room.")

			saynn("[say=eliza]Without special permission you’re only allowed to stay in the lobby. And the nursery.[/say]")

			saynn("[say=pc]Nursery?[/say]")

			saynn("[say=eliza]Yeah. Do you need something, inmate?[/say]")
		else:
			saynn("You approach the counter and are greeted by the familiar feline face. The doc seems to always be sipping coffee out of her mug.")

			saynn("[say=eliza]Dr. Quinn here. Need something?[/say]")
		
		if(getModule("ElizaModule").canTFEliza()):
			addButtonAt(14, "TF menu", "Tell Eliza to use or stop using certain transformation drugs!", "openTFMenu")
		
		addButton("Talk", "Ask her some questions", "talk")
		addButton("Appearance", "Take a closer look", "appearance")
		if(getModuleFlag("MedicalModule", "Med_pcKnowsAboutTests")):
			addButton("Research", "You're curious about the experiments", "research")
		else:
			addDisabledButton("Research", "Talk about it with Eliza first")
		if(getModuleFlag("MedicalModule", "Med_pcKnowsAboutMilking")):
			addButton("Milking", "See how you can be milked", "milking_menu")
			
#			if(GM.pc.hasPerk(Perk.MilkNoSoreNipples) || (!getModuleFlag("MedicalModule", "Med_wasMilkedToday", false) && !GM.pc.hasEffect(StatusEffect.SoreNipplesAfterMilking))):
#				addButton("Milking", "Ask to be milked", "milking")
#			else:
#				addDisabledButton("Milking", "Give yourself some rest")
		else:
			addDisabledButton("Milking", "Talk about it with Eliza first")
		
		var isHurt = false
		if(GM.pc.getPainLevel() > 0.5 || GM.pc.hasEffect(StatusEffect.Wounded) || GM.pc.hasEffect(StatusEffect.StretchedPainfullyPussy) || GM.pc.hasEffect(StatusEffect.StretchedPainfullyAnus)):
			isHurt = true
			
		if(isHurt):
			if(!getFlag("MedicalModule.Medical_FirstTimeHealedHappened")):
				addButtonWithChecks("I'm hurt", "Ask for medical help", "firsttimecryo", [], [ButtonChecks.NotGagged])
			else:
				addButtonWithChecks("I'm hurt", "Ask for medical help", "healmenu", [], [ButtonChecks.NotGagged])
		else:
			addDisabledButton("I'm hurt", "You're not hurt enough to ask for medical help")
			
		if(getModule("ElizaModule").canSexEliza()):
			addButton("Sex!", "Have some fun with Eliza", "start_sex_menu")
			
		addButton("Leave", "Do something else", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["eliza"])
		
	if(state == "healmenu"):
		saynn("[say=pc]Uh.. doc. I don’t feel too good. Can you fix me again?[/say]")
		
		saynn("Eliza steps from behind the counter and approaches you, doing a quick visual check.")
		
		saynn("[say=eliza]I can, but.. Only the first time was free I’m afraid.[/say]")
		
		saynn("You raise your brow.")
		
		saynn("[say=eliza]Yeah, it pains me too. But now I will have to take 10 credits for each use of the cryopod. Inmates were abusing free healing too much.[/say]")
		
		saynn("[say=pc]I see.[/say]")
		
		saynn("[say=eliza]But if your damage is only related to your private bits, I can do a different approach. That one only costs 5 credits.[/say]")
		
		if(GM.pc.getCredits() < 10):
			saynn("Eliza takes a quick look at your records through her datapad.")
		
			saynn("[say=eliza]And if you don’t have enough credits still.. I have the permission to make inmate accounts go into the negatives. In case things are very bad.[/say]")
		
		addButton("Cryopod", "Pay 10 credits and receive a cryopod treatment that heals most wounds and damage", "cryopodsimple")
		if(GM.pc.hasEffect(StatusEffect.StretchedPainfullyPussy) || GM.pc.hasEffect(StatusEffect.StretchedPainfullyAnus)):
			addButtonWithChecks("Heal privates", "Pay 5 credits and receive an 'injection' of healing gel into your privates", "healinggel", [], [ButtonChecks.HasReachableAnus])
		else:
			addDisabledButton("Heal privates", "Your private bits didn't sustain any damage")
		addButton("Never mind", "You're fine", "")
		
#ACEPREGEXPAC - Eliza has pregnancy descriptors if you oogle her
#I might change this depending on whats in Eliza content but until then, whatever.
#that "make me a woman" line at the breeder ending of chastity content has to be a hint, right?
	if(state == "appearance"):
		if(getCharacter("eliza").isHeavilyPregnant()):
			saynn("Doctor Eliza Quinn is a tired looking doctor, standing tall for a feline at around 1.8 meters tall. Her fur colors are pastel yellow with some white and pink accents, long hair tied back into a pony tail. She wears glasses with a white lab coat pinned with her name badge and an underlayer of a green top and black knee length skirt held with a belt of medical equipment.")
			
			saynn("Her top gives an effort to at least cover her late term pregnancy but still rides up to give a small view of her tummy at a glance. Her enlarged breasts also strain against the fabic of her top.")
			
			saynn("You’re too afraid to stick your head under her skirt but there isnt a bulge concealed betweem her legs...")
			
			saynn("Overall, she looks like a cute feline doctor.")
		elif(getCharacter("eliza").isVisiblyPregnant()):
			saynn("Doctor Quinn looks like your typical doctor, she is pretty tall for a feline, about 1.8 meters tall, her fur is of a pastel yellow color with some white and pink accents. Her long hair is made into a ponytail. She is wearing glasses and a white labcoat with her badge attached to it. Under it you can spot a green top and a black knee length skirt. You do spot her wearing some dark transparent tights. She seems to be carrying quite a bit of equipment in her pockets and on her belt, mostly medical stuff but also a shock remote.")
			
			saynn("All the covering of her clothing can't hide the roundness of her belly giving away that she's pregnant, with a bust that's starting to stretch the limits of a D-cup.")
			
			saynn("You’re too afraid to stick your head under her skirt but you can’t see a bulge between her legs.")
			
			saynn("Overall, she looks like a cute feline doctor.")
		else:
			saynn("Doctor Quinn looks like your typical doctor, she is pretty tall for a feline, about 1.8 meters tall, her fur is of a pastel yellow color with some white and pink accents. Her long hair is made into a ponytail. She is wearing glasses and a white labcoat with her badge attached to it. Under it you can spot a green top and a black knee length skirt. You do spot her wearing some dark transparent tights. She seems to be carrying quite a bit of equipment in her pockets and on her belt, mostly medical stuff but also a shock remote.")

			saynn("Covered by all that clothing you can guess that her bust is a modest C-cup.")

			saynn("You’re too afraid to stick your head under her skirt but you can’t see a bulge between her legs.")

			saynn("Overall, she looks like a cute feline doctor.")
		
		addButton("Back", "Go back", "")
		
	if(state == "talk"):
		saynn("[say=pc]Can I ask you something?[/say]")

		saynn("Doctor shifts in her chair slightly and looks at you.")

		saynn("[say=eliza]Go ahead, inmate.[/say]")
		
		addButton("Best mom?", "Ask her why she has that mug", "best_mom?")
		addButton("Work", "What kind of stuff happens here", "work")
		if(getModuleFlag("MedicalModule", "Med_pcKnowsAboutWork")):
			addButton("Pregnancies", "Ask about how the childbirth is handled", "pregnancies")
			addButton("Research", "Ask about what are they researching here", "talkresearch")
		else:
			addDisabledButton("Pregnancies", "You don't know about this yet")
			addDisabledButton("Research", "You don't know about this yet")
		if(getModuleFlag("MedicalModule", "Med_pcKnowsAboutBreeding")):
			addButton("Milking", "What’s up with that", "talkmilking")
		else:
			addDisabledButton("Milking", "You don't know about this yet")

		addButton("Back", "Go back", "")

#ACEPREGEXPAC - Eliza gives a different response if you comment on her best mom mug
	if(state == "best_mom?"):
		if (getCharacter("eliza").isVisiblyPregnant()):
			saynn("[say=pc]Your mug. Are you a mother?[/say]")
			
			saynn("Eliza looks at her own coffee mug and sighs audibly.")
			
			saynn("[say=eliza]For now, at least. I'll try to enjoy it while I can.[/say]")
			
			saynn("That sounded... not the best. Probably not a good idea to keep bringing it up.")
			
			#addMessage("[Whatever Rahi has planned for Eliza's content, I dont know it. Sorry. -Ace]")
			
			addButton("Continue", "Continue talking", "talk")
		elif(GM.CS.getChildrenAmountOfOnlyMother("eliza") > 0):
			saynn("[say=pc]Your mug. Are you a mother?[/say]")

			saynn("Doctor looks at her own coffee mug and sighs audibly.")

			saynn("[say=eliza]Obviously not.. wait. I guess I am now. Hah. I had this mug before.[/say]")

			saynn("Seems like that item is related to some sad memories.")

			addButton("Continue", "Continue talking", "talk")
		else:
			saynn("[say=pc]Your mug. Are you a mother?[/say]")

			saynn("Doctor looks at her own coffee mug and sighs audibly.")

			saynn("[say=eliza]Kinda rude to ask that. But.. No, I’m not. And it’s a long story.[/say]")

			saynn("Seems like that item is related to some sad memories.")

			addButton("Continue", "Continue talking", "talk")

	if(state == "work"):
		setModuleFlag("MedicalModule", "Med_pcKnowsAboutWork", true)
		
		saynn("[say=pc]Inmates that are beaten up badly end up here?[/say]")

		saynn("Doctor fixes her glasses position with a single finger.")

		saynn("[say=eliza]Well, yeah. We do treat physical traumas here but also much more than that. We do surgeries, dental work, taking care of the pregnancies and the kids. We have a mental ward for the ones who need that kind of help. And we also do research work here as a side business.[/say]")

		saynn("Wow, that’s quite a lot.")

		addButton("Continue", "Continue talking", "talk")

	if(state == "pregnancies"):
		setModuleFlag("MedicalModule", "Med_pcKnowsAboutBreeding", true)
		
		saynn("[say=pc]What happens to the inmates that become pregnant?[/say]")

		saynn("[say=eliza]Inmates are allowed to give birth but they can’t keep their children. For obvious reasons. We can help to accelerate the development of the child, modern tech allows for that. After the birth, they are taken away. But they do receive proper treatment. Care, education, work, all of that. They get a chance for a normal life.[/say]")

		saynn("Doctor looks away at a wall for a second, her face shows little emotion.")

		saynn("[say=eliza]You don’t have to worry about any of that, inmate. Inmates that are lactating can help donate their milk here if they want to.[/say]")

		saynn("[say=pc]So you’re saying inmates can be fucked and bred and it’s not discouraged?[/say]")

		saynn("Doctor frowns at you.")

		saynn("[say=eliza]You lost any human rights when you ended up here, inmate. Sterilizing everyone would be too costly.[/say]")

		saynn("Now that’s a system, of course inmates are gonna breed with each other if given the chance. And it doesn’t seem like the prison has any financial problems from what you can tell.")

		addButton("Continue", "Continue talking", "talk")

	if(state == "talkresearch"):
		setModuleFlag("MedicalModule", "Med_pcKnowsAboutTests", true)
		
		saynn("[say=pc]What types of research are you doing here?[/say]")

		saynn("Doctor’s eyes show excitement after that question.")

		saynn("[say=eliza]Many in fact. Here, in the lab, we synthesize new types of medicine and medical drugs. That is actually my job primarily. But we also do prototype tech testing and other kinds of experiments that are usually banned in normal environments.[/say]")

		saynn("You take a second to process all that. Drugs? Tests? All of that sounds very concerning.")

		saynn("[say=pc]What do you mean banned? You talking about using inmates as guinea pigs? How safe is all that?[/say]")

		saynn("Doctor exhales and sips some more coffee before answering.")

		saynn("[say=eliza]We have all the paperwork, everything is fully legal. AlphaCorp pays top coin for any breakthroughs. Safety and morality concerns are not your problems, inmate. For each successful test you will be paid with work credits, enough to cover the risks.[/say]")

		saynn("Well at least it’s not for free, you will be paid with currency that has no value literally anywhere else, wow!")

		addButton("Continue", "Continue talking", "talk")

	if(state == "talkmilking"):
		setModuleFlag("MedicalModule", "Med_pcKnowsAboutMilking", true)
		
		saynn("[say=pc]If I’m lactating I can donate milk here?[/say]")

		saynn("Doctor smiles.")

		saynn("[say=eliza]Yes, we have an array of milking stations here. We can collect milk, seed, male and female pre-ejaculate. You will be paid of course but some do it just cause they enjoy it.[/say]")

		saynn("[say=pc]Well, that’s nice, I guess.[/say]")

		addButton("Continue", "Continue talking", "talk")
		
	if(state == "research"):
		saynn("[say=pc]So how can I help?[/say]")

		saynn("Eliza chuckles.")

		saynn("[say=eliza]By offering yourself, of course. Because I do need some test subjects. Here is the list of what types of research we are doing.[/say]")

		saynn("Eliza shows you a list with options.")
		
		#addDisabledButton("Drug testing", "Test a random drug with random effect. The paper says that these shouldn't have any long-lasting effects.")
		addButton("Induce lactation", "She will probably use some kind of drug on you. At least it’s free", "induce_lactation")
		addButton("Experiments", "Ask to be experimented on. This will probably include being a test subject for medical drugs that have unknown properties and also testing new prototypes (Warning, the scenes will include a lot of drug use, non-permanent transformations and mind-altering experiences)", "startexperiments")
		
		if(!getFlag("MedicalModule.PC_ReceivedPermanentCage")):
			if(!GM.pc.hasReachablePenis()):
				addDisabledButton("Obedience training", "(forced chastity content) You need a reachable penis to be able to start this program")
			else:
				addButton("Obedience training", "(forced chastity content) One of the booklets says that there is a new research going on that claims to improve low obedience levels of inmates", "startobedient")
		else:
			addDisabledButton("Obedience training", "(forced chastity content) You're already enrolled into this program")
		
		if(!getFlag("ElizaModule.s0hap")):
			addButton("Lab Assistant", "Ask to become Eliza's lab assistant, maybe she could use one", "startlabassist")
		
		#addDisabledButton("Prototype testing", "Test bleeding-edge hi-tech machines or devices")
		addButton("Back", "You're not interested", "")


	if(state == "milking_menu"):
		saynn("[say=pc]I’m interested. You were talking about the possibility of donating milk and cum?[/say]")

		saynn("The feline puts the mug away and stands up from the chair.")

		saynn("[say=eliza]Yes, we can always use more. How would you like to be milked.[/say]")
		
		if(getModule("ElizaModule").hasLabAccess()):
			sayTanksVolume()
		
		if(!GM.pc.hasSoreNipples()):
			if(GM.pc.canBeMilked()):
				if(canBeMilked()):
					addButton("Milk..", "Show the ways Eliza can milk your breasts", "milk_breasts_menu")
				else:
					addDisabledButton("Milk..", "Your breasts are not full enough to be milked")
			else:
				addDisabledButton("Milk..", "Your breasts can't be milked")
		else:
			addDisabledButton("Milk..", "Your nips are sore, give your breasts a rest!")
		if(GM.pc.canBeSeedMilked()):
			if(canBeSeedMilked()):
				addButton("Seed..", "Show the ways Eliza can milk your penis", "milk_penis_menu")
			else:
				addDisabledButton("Seed..", "Your balls are not full enough to be seed-milked")
		else:
			addDisabledButton("Seed..", "There is no way to seed-milk you..")
		if(GM.pc.hasReachableVagina()):
			if(!getFlag("MedicalModule.Milked_Pussy", false)):
				addButton("Girlcum..", "Show the ways Eliza can milk your pussy", "milk_vagina_menu")
			else:
				addDisabledButton("Girlcum..", "You already milked your pussy today, give it a break!")
		else:
			addDisabledButton("Girlcum..", "You don't have a reachable vagina in order for Eliza to milk it")
		if(GM.main.SCI.hasMilkingTier3()):
			if(!getFlag("MedicalModule.Milked_Breasts", false) && !getFlag("MedicalModule.Milked_Penis", false) && !getFlag("MedicalModule.Milked_Pussy", false)):
				addButton("Quick milking", "Ask Eliza to milk everything at once and fast!", "do_start_milking_scene_quick")
			else:
				addDisabledButton("Quick milking", "You can only use this option if you haven't been milked any other way today")
		else:
			addDisabledButton("Quick milking", "You need to become Eliza's assistant and upgrade the lab enough to use this option.")
		
		addButton("Back", "Go back", "")

	if(state == "milk_breasts_menu"):
		saynn("How do you want Eliza to milk your {pc.breasts}?")
		
		if(getModule("ElizaModule").hasLabAccess()):
			sayTanksVolume()

		addButton("Hand-milking", "Let Eliza milk your breasts with her hands", "do_start_milking_scene_breasts", ["ElizaMilkingBreastsHandScene"])
		if(GM.main.SCI.hasMilkingTier1()):
			addButton("Stall Hand-milking", "Let Eliza milk your breasts with her hands while in a milking stall", "do_start_milking_scene_breasts", ["ElizaMilkingBreastsStallScene"])
			addButton("Breast pumps", "Let Eliza use industrial breast pumps on you", "do_start_milking_scene_breasts", ["ElizaMilkingBreastsPumpsScene"])
		else:
			addDisabledButton("Stall Hand-milking", "You need to become Eliza's assistant and upgrade the lab enough to use this option.")
			addDisabledButton("Breast pumps", "You need to become Eliza's assistant and upgrade the lab enough to use this option.")
		if(GM.main.SCI.hasMilkingTier2()):
			addButton("Milking machine", "Let Eliza use a milking machine to milk your breasts", "do_start_milking_scene_breasts", ["ElizaMilkingBreastsBDSMMachineScene"])
		else:
			addDisabledButton("Milking machine", "You need to become Eliza's assistant and upgrade the lab enough to use this option.")
		
		addButton("Back", "Go back", "milking_menu")

	if(state == "milk_penis_menu"):
		saynn("How do you want Eliza to milk your {pc.penis}?")
		
		if(getModule("ElizaModule").hasLabAccess()):
			sayTanksVolume()
			
		addButtonWithChecks("Hand-milking", "Let Eliza milk your cock with her hands", "do_start_milking_scene_seed", ["ElizaMilkingSeedHandScene"], [[ButtonChecks.HasReachablePenis]])
		addButton("Prostate milking", "Let Eliza milk your cock by milking your prostate directly with her fingers", "do_start_milking_scene_seed", ["ElizaMilkingProstateHandScene"])
		if(GM.main.SCI.hasMilkingTier1()):
			addButtonWithChecks("Penis pump", "Let Eliza milk your cock with an industrial penis pump", "do_start_milking_scene_seed", ["ElizaMilkingSeedPumpScene"], [[ButtonChecks.HasReachablePenis]])
			addButton("Strapon milking", "Let Eliza milk your cock by pegging your butt with a strapon, milking your prostate that way", "do_start_milking_scene_seed", ["ElizaMilkingProstateStraponScene"])
		else:
			addDisabledButton("Penis pump", "You need to become Eliza's assistant and upgrade the lab enough to use this option.")
			addDisabledButton("Strapon milking", "You need to become Eliza's assistant and upgrade the lab enough to use this option.")
		if(GM.main.SCI.hasMilkingTier2()):
			addButtonWithChecks("Pawjob", "Let Eliza milk your cock by with her hind paws", "do_start_milking_scene_seed", ["ElizaMilkingSeedPawjobScene"], [[ButtonChecks.HasReachablePenis]])
			if(getFlag("SocketModule.h5completed", false)):
				addButtonWithChecks("Fleshlight", "Let Eliza invite someone else to milk your cock with a fleshlight", "do_start_milking_scene_seed", ["ElizaMilkingSeedFleshlightScene"], [[ButtonChecks.HasReachablePenis]])
			else:
				addDisabledButton("Fleshlight", "You need to complete Socket's storyline to unlock this option. You will also need your cock to be reachable")
			addButton("Milking machine", "Let Eliza milk your cock with milking machine. Includes prostate stimulation", "do_start_milking_scene_seed", ["ElizaMilkingSeedBDSMMachineScene"])
		else:
			addDisabledButton("Pawjob", "You need to become Eliza's assistant and upgrade the lab enough to use this option.")
			addDisabledButton("Fleshlight", "You need to become Eliza's assistant and upgrade the lab enough to use this option.")
			addDisabledButton("Milking machine", "You need to become Eliza's assistant and upgrade the lab enough to use this option.")
			
		addButton("Back", "Go back", "milking_menu")

	if(state == "milk_vagina_menu"):
		saynn("How do you want Eliza to milk your pussy?")
		
		if(getModule("ElizaModule").hasLabAccess()):
			sayTanksVolume()
		
		addButton("Sybian", "Let Eliza use a sybian machine to extract girlcum out of your pussy", "do_start_milking_scene_girlcum", ["ElizaMilkingGirlcumSybianScene"])
		
		addButton("Back", "Go back", "milking_menu")

	if(state == "milk"):
		# (First time scene)
		if(!getModuleFlag("MedicalModule", "Med_milkingMilkFirstTime")):
			setModuleFlag("MedicalModule", "Med_milkingMilkFirstTime", true)
			saynn("[say=pc]I want my breasts to be milked..[/say]")

			saynn("The doctor steps away from the counter and walks behind some wall just to appear a few seconds later from one of the airlocks. She walks up to you and starts observing you.")

			# (if has forever flat breasts)
			if(!GM.pc.hasNonFlatBreasts()):
				saynn("[say=eliza]Sadly I can’t really milk you, your {pc.breasts} have too small milk production glands. You would need your breasts enlarged first.[/say]")

				saynn("Aww.")

				addButton("Continue", "Okay", "")
				return
			# (scene ends)

			# (if has breasts)

			saynn("[say=eliza]Hmm.. May I?[/say]")

			saynn("You don’t quite understand what she means but you nod anyway. Eliza puts her hands under your {pc.breasts} and gets a feel for their weight. Then she starts to firmly squeeze them. You can’t help but to let out a little moan.")

			var breasts:BodypartBreasts = GM.pc.getBodypart(BodypartSlot.Breasts)
			# (if lactating and clothed)
			
			if(breasts.getProducedFluidAmount() > 0.1):
				if(!GM.pc.isFullyNaked()):
					saynn("Her efforts weren’t useless, after a bit of breast kneading, you notice two little damp spots appearing on your clothing roughly where your nips are.")

					saynn("[say=eliza]Oh yes. These are some juicy milk jugs you got there. We can do it.[/say]")

				# (if lactating and naked)
				else:
					saynn("Her efforts weren’t useless, after a bit of breast kneading, you notice your nipples starting to leak milk.")

					saynn("[say=eliza]Oh yes. These are some juicy milk jugs you got there. We can do it.[/say]")
			else:
			# (if not lactating)

				saynn("But no matter how hard she tried she couldn’t squeeze a single drop of milk. Though your nipples feel perky stiff now.")

				saynn("[say=eliza]Well, you’re not lactating right now so it would be a waste of effort. But. You have options. Pregnancy is an obvious choice. While pregnant your breasts will increase in size and start to lactate on their own. If you don’t like that or can’t get pregnant - we can always induce it. With some meds. You know, even males can lactate.[/say]")
				
				addButton("Continue", "Okay", "")
				return
		else:
			# (not first time)
			var breasts:BodypartBreasts = GM.pc.getBodypart(BodypartSlot.Breasts)

			saynn("[say=pc]I want my breasts to be milked..[/say]")

			saynn("Eliza takes a quick look at you.")

			# (if not lactating and empty breasts)
			if(breasts.getProducedFluidAmount() < 0.1):
				saynn("[say=eliza]Well, you gotta be lactating for that I’m afraid.[/say]")
				addButton("Continue", "Okay", "")
				return
			# (scene end)

			# (if has milk)

			saynn("[say=eliza]Alright, inmate. Any preferences?[/say]")
			
			sayn("Amount of milk donated: "+str(floor(getModuleFlag("MedicalModule", "Med_milkMilked", 0.0)))+" ml")
			saynn("Amount of times milked: "+str(getModuleFlag("MedicalModule", "Med_milkedMilkTimes", 0)))
			
		if(GM.pc.canBeMilked()):
			addButton("Hand milking", "You’re not very picky, the old-fashioned way will do just fine", "milk_handmilk")
		else:
			addDisabledButton("Hand milking", "You can't be milked right now")
		if(getModuleFlag("MedicalModule", "Med_milkedMilkTimes", 0) >= 1 && getModuleFlag("MedicalModule", "Med_milkMilked", 0.0) > 0.0):
			if(GM.pc.canBeMilked()):
				addButton("Milking pumps", "An automated way of milking sounds nice", "milk_pumps")
			else:
				addDisabledButton("Milking pumps", "You can't be milked right now")
		addDisabledButton("Milking (Vaginal)", "not done")
		addDisabledButton("Milking (Anal)", "not done")
		addDisabledButton("Extreme milking", "not done")
		addButton("Never mind", "You changed your mind", "")

		

	if(state == "seed"):
		# (first time)
		if(!getModuleFlag("MedicalModule", "Med_milkingSeedFirstTime")):
			setModuleFlag("MedicalModule", "Med_milkingSeedFirstTime", true)
			saynn("[say=pc]I wanna be cock-milked.[/say]")

			saynn("The doctor steps away from the counter and walks behind some wall just to appear a few seconds later from one of the airlocks. She walks up to you and starts observing you, focusing mostly on your crotch.")

			# (if has reachable cock)
			if(GM.pc.hasReachablePenis()):
				saynn("[say=eliza]Yes, that can be arranged, we always need more genetic material.[/say]")

				saynn("She offers you a cheeky smile.")
			else:
				# (if has non-reachable cock)

				saynn("[say=eliza]I see that you’re wearing chastity. That limits the options but we can still do it, the stimulation is just gonna be.. indirect.. if you know what I mean.[/say]")

				saynn("She offers you a cheeky smile.")
		else:
			# (if not first time)

			saynn("[say=pc]I wanna be cock-milked.[/say]")

			saynn("Eliza gives you a quick look.")

			saynn("[say=eliza]We can certainly do that~.[/say]")
			
			sayn("Amount of seed donated: "+str(floor(getModuleFlag("MedicalModule", "Med_seedMilked", 0.0)))+" ml")
			saynn("Amount of times seed milked: "+str(getModuleFlag("MedicalModule", "Med_milkedSeedTimes", 0)))
			
			
		if(GM.pc.canBeSeedMilked()):
			if(GM.pc.hasReachablePenis()):
				addButton("Hand milking", "Why deny the woman’s touch..", "milk_handseedmilk")
			else:
				addDisabledButton("Hand milking", "You need your cock to be free for this..")
			
			addButton("Prostate milking", "Alternative method that doesn’t even require free access to your dick..", "milk_prostatemilking")
		else:
			addDisabledButton("Hand milking", "You can't be milked right now")
			addDisabledButton("Prostate milking", "You can't be milked right now")
		addDisabledButton("Pump", "not done")
		addButton("Never mind", "You changed your mind", "")

func sayTanksVolume():
	var storedFluids:Dictionary = GM.main.SCI.getStoredFluidsWithDefauls()
	
	sayn("Fluid tanks contents:")
	for fluidID in storedFluids:
		var fluidAmount:float = storedFluids[fluidID]
		var fluidLimit:float = GM.main.SCI.getStoredFluidLimit(fluidID)
		var fluidName:String = "Unknown fluid"
		
		var fluid:FluidBase = GlobalRegistry.getFluid(fluidID)
		if(fluid != null):
			fluidName = fluid.getVisibleName()
		
		sayn("- "+fluidName+": "+str(Util.roundF(fluidAmount, 1))+"/"+str(Util.roundF(fluidLimit, 1))+"ml")
	sayn("")

func _react(_action: String, _args):
	if(_action == "induce_lactation"):
		runScene("ElizaInducingLactation")
		endScene()
		return
	
	if(_action == "milk_handmilk"):
		runScene("ElizaHandMilking")
		endScene()
		return
		
	if(_action == "milk_handseedmilk"):
		runScene("ElizaHandSeedMilking")
		endScene()
		return
		
	if(_action == "milk_pumps"):
		runScene("ElizaMilkingPumps")
		endScene()
		return
		
	if(_action == "milk_prostatemilking"):
		runScene("ElizaProstateMilking")
		endScene()
		return
	
	if(_action == "startobedient"):
		runScene("ForcedChastityMedbayStartScene")
		endScene()
		return
	
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "startexperiments"):
		runScene("ElizaGetIntoMentalWard")
		endScene()
		return
	
	if(_action == "firsttimecryo"):
		setFlag("MedicalModule.Medical_FirstTimeHealedHappened", true)
		runScene("MedicalHealCryopodFirstTime")
		endScene()
		return
	
	if(_action == "cryopodsimple"):
		GM.pc.addCredits(-10)
		runScene("MedicalHealCryopodScene")
		endScene()
		return
	
	if(_action == "healinggel"):
		GM.pc.addCredits(-5)
		runScene("MedicalHealingGelScene")
		endScene()
		return
	
	if(_action == "startlabassist"):
		setFlag("ElizaModule.s0hap", true)
		runScene("Eliza0AskJobScene")
		endScene()
		return
		
	if(_action == "start_sex_menu"):
		runScene("ElizaSexMenuScene")
		endScene()
		return
		
	if(_action == "do_start_milking_scene_breasts"):
		setFlag("MedicalModule.Milked_Breasts", true)
		runScene(_args[0])
		endScene()
		return
		
	if(_action == "do_start_milking_scene_seed"):
		setFlag("MedicalModule.Milked_Penis", true)
		runScene(_args[0])
		endScene()
		return
		
	if(_action == "do_start_milking_scene_girlcum"):
		setFlag("MedicalModule.Milked_Pussy", true)
		runScene(_args[0])
		endScene()
		return
		
	if(_action == "do_start_milking_scene_quick"):
		setFlag("MedicalModule.Milked_Breasts", true)
		setFlag("MedicalModule.Milked_Penis", true)
		setFlag("MedicalModule.Milked_Pussy", true)
		runScene("ElizaQuickMilkingScene")
		return
	
	if(_action == "openTFMenu"):
		runScene("ElizaTFHerScene")
		return
	
	setState(_action)


func canBeMilked() -> bool:
	if(!GM.pc.hasBodypart(BodypartSlot.Breasts)):
		return false
	var breasts: BodypartBreasts = GM.pc.getBodypart(BodypartSlot.Breasts)
	var production: FluidProduction = breasts.getFluidProduction()
	if(production == null):
		return false
	return production.getFluidAmount() >= 300.0 || production.getFluidLevel() >= 0.4

func canBeSeedMilked() -> bool:
	if(!GM.pc.hasBodypart(BodypartSlot.Penis)):
		return false
	var penis: BodypartPenis = GM.pc.getBodypart(BodypartSlot.Penis)
	var production: FluidProduction = penis.getFluidProduction()
	if(production == null):
		return false
	return production.getFluidAmount() >= 100.0 || production.getFluidLevel() >= 0.8
