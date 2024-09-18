extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "CaughtOffLimitsByNovaScene"

func _run():
	if(state == ""):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="stand"})
		
	if(state == ""):
		GM.main.setModuleFlag("NovaModule", "Nova_SawPC", true)
		
		saynn("You hear someone’s footsteps behind, sounds like heavy boots. You decide to hide behind the nearest wall and hope not to be spotted. You hear a female voice.")

		saynn("[say=nova]I know you’re there, you can come out[/say]")

		saynn("Seems like the gig is up, you sigh and show yourself to the guard, she seems quite surprised.")

		saynn("[say=nova]Wow, did that actually work this time? Just kidding~[/say]")

		saynn("You see a husky, about 1.7 meters tall, gray fur, gray short hair with a few strands being bright blue. Perky ears, long canine muzzle, yellow eyes. Her body looks fit and has visible musculature. Behind her is a curled tail, native to most huskies. Her uniform suggests that she is a guard, she seems to be wearing some kind of light power armor that doesn’t help to hide her curvy breasts and a bulge between her legs but that’s hidden by her short black skirt. Her badge says that her name is Nova.")

		saynn("She keeps a hand on her stun baton, ready to grab and use it seemingly at any point.")

		saynn("[say=nova]So-o~. Inmate number {pc.inmateNumber}.. What are you doing here?[/say]")

		addButton("Got lost", "Lie that you ended up here by accident", "got_lost")
		addButton("Surrender", "Surrender to the Husky", "submit")
		addButton("Attack", "Fight the husky", "attack")

	if(state == "got_lost"):
		saynn("[say=pc]The prison is quite big, I just got lost.[/say]")

		saynn("You shrug and try to look dumb. Nova hears that and begins to close the distance to you.")

		saynn("[say=nova]Really now~. And you didn’t see all the staff-only markings on the floor? Someone is gotta be pretty blind to not see those.[/say]")

		saynn("She is almost in hand-reaching distance but she stops still, blocking the exit. Nova offers you a cunning smile.")

		saynn("[say=nova]But I think the truth is that your words are a lie~. And I don’t like when others lie to me~[/say]")

		saynn("You try to step back but your action is quickly met with Nova’s words.")

		saynn("[say=nova]Bad idea~ I can press one button and you will be licking the floor in a second.[/say]")

		saynn("Seems like running isn’t an option.")

		addButton("Submit", "Surrender to the Husky", "submit")
		addButton("Attack", "Fight the husky", "attack")

	if(state == "submit"):
		saynn("You raise your hands and show that you mean no trouble.")

		saynn("[say=pc]You got me.[/say]")

		saynn("Nova chuckles and walks up to you, her hand taps on your cheeks a few times.")

		saynn("[say=pc]Ow. Can you just show me where to go now?[/say]")

		saynn("[say=nova]Not so fast. You will turn around, lean against a wall and I will do a little body search to make sure you’re not carrying anything illegal~.[/say]")

		# (options are Fine, Offer self, Attack)

		addButton("Fine", "Submit to the search", "submittosearch")
		addButton("Offer self", "Nova seems to have a dick, maybe you can take advantage of that", "offer_self")
		addButton("Attack", "Fight the husky", "attack")

	if(state == "submittosearch"):
		playAnimation(StageScene.SexStanding, "tease", {
			pc="nova",npc="pc",
			bodyState={},
			npcBodyState={},
		})
		
		saynn("You do as she says, walking up to the nearest wall and leaning forwards, waiting to be frisked.")

		# (if girl)
		if(GM.pc.getGender() != Gender.Male):
			saynn("[say=nova]Good girl~ Now stand still while I work on you.[/say]")
		else:
			# (if boy)
			saynn("[say=nova]Good boy~ Now stand still while I work on you.[/say]")

		saynn("Nova stops behind and puts her hands on you.")

		if(!GM.pc.isFullyNaked()):
			saynn("She starts with the obvious, her palms run along your outer garments, from top to bottom. She checks the back, chest, armpits, belt, hips, legs, making sure to go through all the pockets you might have.")
		else:
			saynn("Even though you’re naked, she still runs her paws along the curves of your body, checking everywhere, under your armpits, your back and chest areas, your lower half. Nova crouches and does a visual check too.")

		# (if has something)
		if(GM.pc.hasIllegalItems()):
			saynn("[say=nova]Ohh~ I will be taking that. That is some contraband you have there, cutie~[/say]")
		else:
			# (if found nothing)
			saynn("Nova doesn’t seem to take anything away. She also gives you a head pat.")

			saynn("[say=nova]Very good~[/say]")

		# (if has non-flat breasts):
		if(GM.pc.hasNonFlatBreasts()):
			saynn("Her paws land on your breasts, digits slowly trace along and around them, getting a feel for your mounds. You think that this is part of the procedure but then Nova’s hands switch to straight-up groping, you can’t feel but to moan when you feel your breasts being squeezed and fondled. It feels like she is trying to milk you.")

			saynn("[say=nova]Someone seems a little excited~[/say]")
		# (endif)
		
		saynn("Nova’s hands slide down along your back and then squeeze your butt. You gasp but let her continue. She gives you a firm spank to see how bouncy it is which makes you shift away. But she pulls you back and force-spreads your legs.")

		saynn("[say=nova]Stand still~, you naughty inmate[/say]")

		saynn("You lean forward and stick out your butt for her as she continues to work on you.")

		saynn("[say=nova]I’m a naughty brat. I misbehaved. I deserve to be punished. Say it~[/say]")

		saynn("You try to argue but you are quickly met with another firm spank, forcing a painful moan out of you.")

		saynn("[say=pc]Ah.. Yes, I’m a naughty brat.. I misbehaved..[/say]")

		saynn("[say=nova]Oh yes, yes you are~[/say]")

		saynn("She delivers a spank after spank, sending your butt to bounce a lot and leaving a bright spot. You begin to pant heavily, your legs shiver.")

		saynn("[say=pc]I deserve to be punished![/say]")

		saynn("[say=nova]There you go, wasn’t too hard was it?[/say]")

		if(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("Nova then crouches behind you and puts her hand on your crotch, feeling your chastity cage that seems to be leaking pre and your pair of balls. It’s quite arousing.")
			else:
				saynn("Nova then crouches behind you and puts her hand on your crotch, feeling your hard shaft that seems to be leaking pre and your pair of balls. It's quite arousing.")

			if(GM.pc.hasReachableVagina()):
				saynn("Then Nova’s paw shifts down to your wet cunt and brushes against it too, feeling its wetness,  you shiver and try to hide your moans when Nova finds your clit and gives it a rub.")

			saynn("[say=nova]Such a cute little slut~[/say]")

		elif(GM.pc.hasReachableVagina()):
			saynn("Nova then crouches behind you and puts her hand to your crotch. You’re aroused and the guard feels that. Your wet pussy is wet even through your uniform, you shiver and try to hide your moans when Nova finds your clit and gives it a rub.")

			saynn("[say=nova]Such a cute little slut~[/say]")

		saynn("What she does feels very humiliating but it also turns you on so much. Finally, Nova gives your butt a final squeeze before standing up.")

		saynn("[say=nova]Now go. Don’t let me catch you here again~[/say]")

		addButton("Leave", "Probably not the worst thing that happened to you", "endthesceneStealItems")

	if(state == "offer_self"):
		saynn("[say=pc]Does it matter much? How about you let me go if I offer you something in return[/say]")

		saynn("Nova hums eagerly and scratches her chin while eyeing you out, her other paw tugging on her skirt, teasing her bulge.")

		# (Probably gonna be random between sucking cock and fucking)

		saynn("[say=nova]I do feel quite horny today~. Suck my cock and we will see. If you do it well I might as well let this slide~.[/say]")

		# (options are Agree or Attack)

		addButton("Agree", "Suck Nova’s cock", "agree_to_suck")
		addButton("Attack", "Fight the husky", "attack")


		

	if(state == "attack"):
		saynn("[say=pc]You should just let me go. It’s in your best interests, really[/say]")

		saynn("Nova notices your intimidating tone and steps back, her hand pulls out a classic stun baton, the blue trim lines on her armor light up. She is smiling.")

		saynn("[say=nova]Make me~[/say]")

		saynn("Seems like it’s a fight.")

		addButton("Fight", "Start the fight", "fight")
		
	if(state == "lost_fight"):
		saynn("Defeated, you lie on the cold floor. There is no strength left to fight.")

		# (random big punishment starts here, it could be Nova fucking you or locking restraints onto you or bringing you to the punishment area and locking into stocks or something)
		
		addButton("Punishment", "Well, time to be punished", "punishment")


	if(state == "won_fight"):
		saynn("Nova drops onto her knees, her stun baton on the floor. Her armor lost all of its charge and doesn’t protect her anymore, she pants heavily and glares at you.")

		saynn("[say=nova]You’re such a slut..[/say]")

	if(state == "won_fight_lust"):
		saynn("Nova got so turned on she drops onto her knees and touches herself in your clear view. You can see desire in her eyes.")

		saynn("[say=nova]Huff.. You can’t just leave me like that..[/say]")

		# (Player is wanted by guards)

	# (Humiliate Nova, Fuck Nova, Ride Nova, Leave)
	if(state == "won_fight" || state == "won_fight_lust"):
		addButton("Leave", "Don't do anything", "endthescene")
		addButtonWithChecks("Humiliate Nova", "Use her stun baton to mess with her", "humiliateAngel", [], [ButtonChecks.NotHandsBlocked])
		addButtonWithChecks("Ride Nova", "Use the herm’s cock for your pleasure", "rideSubbyAngel", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Fuck Nova", "She is a herm so why not use her pussy", "fuckSubbyAngel", [], [ButtonChecks.HasReachablePenis])

	if(state == "punishment"):
		saynn("Nova walks up to you and uses her armored boot to pin you in-place. She then crouches before you and clips a leash to your collar.")

		saynn("[say=nova]Well, you tried. You should change your ways, being a slut works better for you.[/say]")

		saynn("You huff at her mean words.")

		saynn("[say=pc]What are you gonna do now?[/say]")

		saynn("[say=nova]You will see~[/say]")

		if(!GM.pc.isFullyNaked()):
			saynn("Nova begins stripping your clothes. You notice that and try to resist but she is clearly overpowering you. Before long all your privates are exposed.")

			saynn("[say=pc]Hey![/say]")

		# (if not restrained)
		if(!GM.pc.hasBoundArms()):
			saynn("She catches your arms and wrenches them behind your back before restraining you with bulky metal cuffs.")

			saynn("[say=nova]That will make sure you don’t do anything silly~[/say]")

		# (else)
		else:
			saynn("[say=nova]Ohh, I don’t even have to restrain you. Good~[/say]")

		saynn("Nova stands up and starts tugging on the leash, inviting you to do the same. With your restraints it's a pretty tricky task but your collar choking you works as a good motivation. You manage to get on your knees without your hands and then up to your feet from there. Nova smirks and gives you a smack on your naked butt. Your privates are completely exposed and you can’t even cover yourself, it feels humiliating.")

		saynn("[say=pc]So easy to bully an inmate..[/say]")

		saynn("[say=nova]All you had to do is obey~. But it’s okay, some time in the stocks should improve your behavior~[/say]")

		saynn("Nova then begins to parade you through the cellblock, tugging on the leash more when you stop or take too long. You step behind her, your head tilted down. You try to avoid all the glances that you get from other inmates, some giggle, some eye you out, probably imagining having sex with you and some just stay quiet.")


		saynn(RNG.pick(["[sayMale]Let me try that mouth![/sayMale]", "[sayMale]I’m gonna be first[/sayMale]", "[sayMale]Look, what a slave![/sayMale]"]))

		if(RNG.chance(50)):
			saynn("Some other guard approaches you, a tall guard that looks like a lynx with cyan fur. She gives your butt a firm smack and chuckles.")

			saynn("[say=risha]Very breedable[/say]")

		addButton("Continue", "You’re on a leash", "beleashedtostocks")

	if(state == "beleashedtostocks"):
		saynn("Finally you arrive at the main platform where all the public punishment devices are. You walk up the stairs and follow the husky to one of the pillories, inmates around are enjoying the show. Nova opens the stocks for you and points.")

		saynn("[say=nova]Get in there~[/say]")

		saynn("You hesitate. But it seems like there is no choice, you bend forward and place your neck in the middle hole. Nova then unlocks your cuffs and places your hands where they need to be before closing and locking the stocks, rendering you completely helpless. You test how sturdy they are and can’t even move your neck, you’re stuck in a very compromising position where your private bits are visible to anyone. Stocks are made out of a metal unlockable frame, a rubber pad underneath and some chains on the bottom that Nova uses to make you spread your legs more.")

		# (if only has cock)
		if(GM.pc.hasPenis() && !GM.pc.hasReachableVagina()):
			if(GM.pc.isWearingChastityCage()):
				saynn("Nova puts her hand on your balls and gives them a gentle squeeze. She then rubs the tip of your chastity cage and tries to get you hard. She then licks one of her digits and then prods at your backdoor. She manages to slide one in and then feels your prostate, causing you to start leaking pre.")
			else:
				saynn("Nova puts her hand on your balls and gives them a gentle squeeze. She then rubs the head of your cock and strokes you until you become hard. She also licks one of her digits and then prods at your backdoor. She manages to slide one in and then feels your prostate, causing you to start leaking pre.")

			saynn("[say=nova]Hope you like being a buttslut~. Prepare to be used a lot[/say]")

		# (if has vagina)
		
		if(!GM.pc.hasPenis() && GM.pc.hasReachableVagina()):
			saynn("Nova puts her hand on your exposed slit and gives it a rub, she uses her digit to trace along your sensitive lips and then spreads them open before giving you a spank.")

			saynn("[say=nova]Hope you like being fucked without a rubber~. Prepare to be used a lot[/say]")

		# (if has both)
		if(GM.pc.hasPenis() && GM.pc.hasReachableVagina()):
			if(GM.pc.isWearingChastityCage()):
				saynn("Nova puts her hand on your balls and gives them a gentle squeeze, she then rubs both your caged up cock and your cunt until you become aroused and needy. She also manages to slip one of her digits down your backdoor where she prods at your prostate, making you leak pre.")
			else:
				saynn("Nova puts her hand on your balls and gives them a gentle squeeze, she then rubs both your cock and your cunt until you become aroused and needy. She also manages to slip one of her digits down your backdoor where she prods at your prostate, making you leak pre.")

			saynn("[say=nova]Cock will probably be useless but the cunt and ass will get a lot of use~[/say]")

		saynn("Nova eyes you out for the last time and then leaves you alone in the stocks.")

		saynn("[say=nova]I hope I won’t forget about you~[/say]")

		# (Scene ends, punished in stocks scene starts)
		addButton("Continue", "You're in stocks", "startstocks")


		

func _react(_action: String, _args):

	if(_action == "submittosearch"):
		GM.pc.addLust(20)
		
		for item in GM.pc.getInventory().getItemsWithTag(ItemTag.Illegal):
			addMessage(item.getStackName()+" was taken away")
		for item in GM.pc.getInventory().getEquippedItemsWithTag(ItemTag.Illegal):
			addMessage(item.getStackName()+" was taken away")

	if(_action == "humiliateAngel"):
		runScene("HumiliateNovaScene")
		GM.main.setModuleFlag("NovaModule", "Nova_GotHumiliatedByPC", true)
		endScene()
		return
		
	if(_action == "rideSubbyAngel"):
		runScene("RideSubbyNovaScene")
		GM.main.setModuleFlag("NovaModule", "Nova_GotHumiliatedByPC", true)
		endScene()
		return
		
	if(_action == "fuckSubbyAngel"):
		runScene("FuckSubbyNovaScene")
		GM.main.setModuleFlag("NovaModule", "Nova_GotHumiliatedByPC", true)
		endScene()
		return
		
	if(_action == "agree_to_suck"):
		if(GM.pc.freeMouthDeleteAll()):
			addMessage("Nova was nice enough to remove your gag before this")
		runScene("SuckNovaCockScene")
		endScene()
		return

	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "endthesceneStealItems"):
		GM.pc.getInventory().removeItemsList(GM.pc.getInventory().getItemsWithTag(ItemTag.Illegal))
		GM.pc.getInventory().removeEquippedItemsList(GM.pc.getInventory().getEquippedItemsWithTag(ItemTag.Illegal))
		
		endScene()
		return
		
	if(_action == "fight"):
		runScene("FightScene", ["nova"], "novafight")
	
	if(_action == "beleashedtostocks"):
		runScene("ParadedOnALeashScene", ["nova", GM.pc.getLocation(), "main_punishment_spot", [
			"I love parading bratty cuties around~",
			"Everyone's looking at you~",
			"I like leashes, don't you?",
			"Just giving my cutie some walkies~",
			"Stocks are waiting, let's hurry~",
			"Did you thought this would happen before stealing?",
			"This is gonna be such a good lesson for you~",
			"I'm walking you like you're a pet~",
		]])
	
	if(_action == "startstocks"):
		#runScene("StocksPunishmentScene", ["nova"])
		endScene()
		GM.main.IS.startInteraction("InStocks", {inmate="pc"})
		return
		
	if(_action == "punishment"):
		GM.pc.getInventory().unequipSlotUnlessRestraint(InventorySlot.Body)
		GM.pc.getInventory().unequipSlotUnlessRestraint(InventorySlot.UnderwearBottom)
		GM.pc.getInventory().unequipSlotUnlessRestraint(InventorySlot.UnderwearTop)
	
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "novafight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		var wonHow = _result[1]
		
		if(battlestate == "win"):
			if(wonHow == "lust"):
				setState("won_fight_lust")
			else:
				setState("won_fight")
			addExperienceToPlayer(30)
		else:
			setState("lost_fight")
			addExperienceToPlayer(5)

func getDevCommentary():
	return "Probably one of the first.. encounter scenes.. that I wrote. Has one of the most earliest lewd scenes too in the game ^^. So if they suck - thats why x3. Before, the idea was to have every encounter type have many scenes like this one.. with a unique character and stuff.. But after writing one such scene I was like.. nope x3 we doing something simpler or we doin nothing!"

func hasDevCommentary():
	return true
