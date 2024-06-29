extends SceneBase

func _init():
	sceneID = "Ch5s7MedicalTortureScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("Darkness.. All you see is yourself. "+str("Still wearing your uniform.. " if !GM.pc.isFullyNaked() else "")+"Still wearing that firm collar around your neck.")

		saynn("You look down at your hands and see them covered in bruises, little cuts, wounds..")

		saynn("Was it worth it?")

		saynn("[say=pc]Body will heal. I can't stop now.[/say]")

		saynn("It's not about giving up.. It's about accepting yourself..")

		saynn("[say=pc]Who are you?[/say]")

		saynn("No reaction.. Oops, the ground under your feet has disappeared, causing you to start falling.. into the deep abyss..")

		addButton("Wake up", "Only dead sleep forever", "do_wakeup")
	if(state == "do_wakeup"):
		playAnimation(StageScene.HangingSexFuckmachine, "tease", {bodyState={naked=true}})
		addCharacter("eliza")
		addCharacter("tavi", ["naked"])
		saynn("You slowly open your eyes.. but the darkness doesn't go away. You're blindfolded.. and also chained to the ceiling..")

		saynn("[say=tavi]Ngh-h.. ah..[/say]")

		saynn("You hear moans.. a very familiar voice..")

		saynn("[say=pc]Tavi? What's happening?[/say]")

		saynn("No response, just more moans. You begin to feel very concerned.")

		saynn("[say=pc]Tavi?![/say]")

		saynn("Someone's latex glove brushes over your cheek.")

		saynn("[say=eliza]She can't hear you, don't worry.. Your Tavi is being reeducated as we speak.. She is gonna be such a good girl..[/say]")

		saynn("You try to shake off the blindfold but it sits too tightly.. And the chains leave you zero wiggle room.. makes you wonder why some restraints have obvious exploitable flaws but these don't..")

		saynn("[say=pc]What are you doing to her?[/say]")

		saynn("[say=eliza]Experimental tech. We don't have a second one for you so we will use something else..[/say]")

		saynn("What is she talking about? You try to say something but Eliza shoves a rubber ball into your mouth as soon as you open your mouth.")

		saynn("[say=eliza]No need for words. Just moan for me, patient~.[/say]")

		saynn("Things are happening very fast.. You hear some kind of machine turning on behind you..")

		if (GM.pc.hasReachableVagina()):
			addButton("Continue", "See what happens next", "pc_punishment_vag")
		else:
			addButton("Continue", "See what happens next", "pc_punishment_anal")
	if(state == "pc_punishment_vag"):
		playAnimation(StageScene.HangingSexFuckmachine, "sex", {pcCum=true, bodyState={naked=true, hard=true}})
		saynn("One second everything is fine and the next your pussy suddenly gets penetrated by some rubber dildo! Without mercy, some kind of machine starts thrusting that toy in and out of your slit, each one sending unexpected shockwaves of pleasure mixed with a tingle of pain through your body.")

		saynn("Gasps and muffled moans escape from your lips, harmonizing with Tavi's.")

		saynn("[say=eliza]That works~. Do you know why we are doing that?[/say]")

		saynn("Obviously they just wanna torture you and Tavi.. But the toy is angled in such a way that you can't ignore it, your g-spot is being pounded hard, causing your folds to get wet and your inner walls to clench around the rubber shaft.")

		saynn("[say=tavi]F-fu-u.. c-ck.. Ah-h!.. Nh-h-h..[/say]")

		saynn("[say=eliza]Feelings can motivate us. Feelings like fear, pain or pleasure, doesn't matter.[/say]")

		saynn("Blindfolded, gagged and chained up, you are completely helpless, forced to endure the constant onslaught on your pussy.. while you can't do anything about it..")

		saynn("[say=eliza]A small constant amount of it makes us get used to it. We get numb if you will.[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Even though you have no say in any of this.. you can't deny that it feels too good.. So good that your caged up cock is leaking precum. Eliza catches some of it onto her paw and does something to it.")

			saynn("[say=eliza]Tasty~. I love leaky patients. Caged-up ones especially~.[/say]")

		elif (GM.pc.hasReachablePenis()):
			saynn("Even though you have no say in any of this.. you can't deny that it feels too good.. So good that your {pc.penis} is leaking precum. Eliza catches some of it onto her paw and does something to it.")

			saynn("[say=eliza]Tasty~. I love leaky patients.[/say]")

		saynn("Your body is quickly pushed to the brink of ecstasy. Your muscles clenching tightly around the invading object.. as an explosive release rocks through you, causing a muffled loud scream of pleasure to escape your gagged mouth.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Weak strings of {pc.cum} leak out of your locked up dick as it twitches and throbs behind the cage, struggling to get hard.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Strong strings of {pc.cum} fly from the tip of your cock as it twitches and throbs, leaving quite a mess. Probably..")

		saynn("[say=eliza]A spike of sensations at the right time can cause.. a change~. Ohh~. Already.[/say]")

		saynn("You're squirming hard after that orgasm.. but the machine didn't stop fucking you.. Oh no..")

		addButton("Continue", "See what happens next", "pc_punishment_vag_more")
	if(state == "pc_punishment_vag_more"):
		playAnimation(StageScene.HangingSexFuckmachine, "fast", {pcCum=true, bodyState={naked=true, hard=true}})
		saynn("You reached your peak.. but the machine didn't. It suddenly began pounding you even harder, forceful thrusts drove you further, overstimulating you to the point of your pussy suddenly squirting, spawning a rush of fluids that makes the floor wet.")

		saynn("[say=eliza]Will it be a good change? Hard to predict. That's why I love experimenting~. It's so exciting.[/say]")

		saynn("That wasn't exactly an orgasm.. you realize that when a real second one begins building up inside you again. You feel Eliza's digits stimulating your nipples slightly, adding to the ocean of feelings. Your muffled noises of love become so passionate that they suppress any thought in your head. All you can think about is.. overwhelming pleasure..")

		saynn("Doesn't take long for your body to start quivering yet again, your pussy grasping that rubber rod tightly as it pushes you over the edge. It's too much, your petals spasm uncontrollably as another rush of your transparent fluids gushes forth, making the floor even more wet.")

		saynn("[say=eliza]We're just getting started~.[/say]")

		saynn("Fuck.. in these moments you begin wonder if all of this was worth it even.. Maybe just sitting still on your ass was always the right choice.. This feels so good though.. So good it's torture..")

		addButton("Continue", "See what happens next", "pc_punishment_vag_blur")
	if(state == "pc_punishment_vag_blur"):
		saynn("It all quickly becomes a blur.. Orgasm after orgasm, that rubber cock is destroying your sense of self.. just like it's destroying your pussy.")

		saynn("You're drooling uncontrollably.. while you can't.. do.. anything.. but to let your pussy be fucked relentlessly..")

		saynn("Tavi's moans get engraved in your brain. You were so close.. to freedom.. But now it's.. just.. Rough sex.. Being abused.. Breeding or being bred..")

		saynn("All your nerves are getting overstimulated.. Making it impossible to think straight.. Please help me.. I wanna cum again and again..")

		addButton("Continue", "See what happens next", "pc_punishment_vag_sybian")
	if(state == "pc_punishment_vag_sybian"):
		playAnimation(StageScene.Sybian, "ride", {bodyState={naked=true,hard=true}})
		saynn("At some point Eliza offers you some mercy.. by switching the fuckmachine to a sybian.. Constant thrusting got replaced by non-stop intense vibrations against your sensitive folds.")

		saynn("As you teeter on the brink of another climax, Eliza leans in close, their voice has hints of both command and adoration.")

		saynn("[say=eliza]Surrender to the pleasure and let it consume you~.[/say]")

		saynn("With a muffled cry, your body shatters into a million fragments of pleasure. Wave after wave of ecstasy crashing over you as your muscles are tensing up and your body arching.")

		saynn("At some point you begin to think that you're about to black out..")

		saynn("Poof..")

		saynn("The cold floor hugs you and presses close.")

		addButton("Continue", "See what happens next", "skip_to_next_day")
	if(state == "pc_punishment_anal"):
		playAnimation(StageScene.HangingSexFuckmachine, "sex", {pcCum=true, bodyState={naked=true, hard=true}})
		saynn("One second everything is fine and the next your ass suddenly gets penetrated by some rubber dildo! Without mercy, some kind of machine starts thrusting that toy in and out of your star, each one sending unexpected shockwaves of pleasure mixed with a tingle of pain through your body.")

		saynn("Gasps and muffled moans escape from your lips, harmonizing with Tavi's.")

		saynn("[say=eliza]That works~. Do you know why we are doing that?[/say]")

		saynn("Obviously they just wanna torture you and Tavi.. But the toy is angled in such a way that you can't ignore it, your pleasure spot is being pounded hard, causing your inner walls to clench around the rubber shaft.")

		saynn("[say=tavi]F-fu-u.. c-ck.. Ah-h!.. Nh-h-h..[/say]")

		saynn("[say=eliza]Feelings can motivate us. Feelings like fear, pain or pleasure, doesn't matter.[/say]")

		saynn("Blindfolded, gagged and chained up, you are completely helpless, forced to endure the constant onslaught on your tailhole.. while you can't do anything about it..")

		saynn("[say=eliza]A small constant amount of it makes us get used to it. We get numb if you will.[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Even though you have no say in any of this.. you can't deny that it feels too good.. So good that your caged up cock is leaking precum. Eliza catches some of it onto her paw and does something to it.")

			saynn("[say=eliza]Tasty~. I love leaky patients. Caged-up ones especially~.[/say]")

		elif (GM.pc.hasReachablePenis()):
			saynn("Even though you have no say in any of this.. you can't deny that it feels too good.. So good that your {pc.penis} is leaking precum. Eliza catches some of it onto her paw and does something to it.")

			saynn("[say=eliza]Tasty~. I love leaky patients.[/say]")

		saynn("Your body is quickly pushed to the brink of ecstasy. Your muscles clenching tightly around the invading object.. as an explosive release rocks through you, causing a muffled loud scream of pleasure to escape your gagged mouth.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Weak strings of {pc.cum} leak out of your locked up dick as it twitches and throbs behind the cage, struggling to get hard.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Strong strings of {pc.cum} fly from the tip of your cock as it twitches and throbs, leaving quite a mess. Probably..")

		saynn("[say=eliza]A spike of sensations at the right time can cause.. a change~. Ohh~. Already.[/say]")

		saynn("You're squirming hard after that orgasm.. but the machine didn't stop fucking you.. Oh no..")

		addButton("Continue", "See what happens next", "pc_punishment_anal_more")
	if(state == "pc_punishment_anal_more"):
		playAnimation(StageScene.HangingSexFuckmachine, "fast", {pcCum=true, bodyState={naked=true, hard=true}})
		saynn("You reached your peak.. but the machine didn't. It suddenly began pounding you even harder, forceful thrusts drove you further, overstimulating you.")

		saynn("[say=eliza]Will it be a good change? Hard to predict. That's why I love experimenting~. It's so exciting.[/say]")

		saynn("That wasn't exactly an orgasm.. you realize that when a real second one begins building up inside you again. You feel Eliza's digits stimulating your nipples slightly, adding to the ocean of feelings. Your muffled noises of love become so passionate that they suppress any thought in your head. All you can think about is.. overwhelming pleasure..")

		saynn("Doesn't take long for your body to start quivering yet again, your inner walls grasping that rubber rod tightly as it pushes you over the edge. It's too much, your anal muscles spasm uncontrollably.")

		saynn("[say=eliza]We're just getting started~.[/say]")

		saynn("Fuck.. in these moments you begin wonder if all of this was worth it even.. Maybe just sitting still on your ass was always the right choice.. This feels so good though.. So good it's torture..")

		addButton("Continue", "See what happens next", "pc_punishment_anal_blur")
	if(state == "pc_punishment_anal_blur"):
		saynn("It all quickly becomes a blur.. Orgasm after orgasm, that rubber cock is destroying your sense of self.. just like it's destroying your tailhole.")

		saynn("You're drooling uncontrollably.. while you can't.. do.. anything.. but to let your ass be fucked relentlessly..")

		saynn("Tavi's moans get engraved in your brain. You were so close.. to freedom.. But now it's.. just.. Rough sex.. Being abused.. Breeding or being bred..")

		saynn("All your nerves are getting overstimulated.. Making it impossible to think straight.. Please help me.. I wanna cum again and again..")

		addButton("Continue", "See what happens next", "pc_punishment_anal_sybian")
	if(state == "pc_punishment_anal_sybian"):
		playAnimation(StageScene.Sybian, "ride", {bodyState={naked=true,hard=true}})
		saynn("At some point Eliza offers you some mercy.. by switching the fuckmachine to a sybian.. Constant thrusting got replaced by non-stop intense vibrations against your taint and sensitive star.")

		saynn("As you teeter on the brink of another climax, Eliza leans in close, their voice has hints of both command and adoration.")

		saynn("[say=eliza]Surrender to the pleasure and let it consume you~.[/say]")

		saynn("With a muffled cry, your body shatters into a million fragments of pleasure. Wave after wave of ecstasy crashing over you as your muscles are tensing up and your body arching.")

		saynn("At some point you begin to think that you're about to black out..")

		saynn("Poof..")

		saynn("The cold floor hugs you and presses close.")

		addButton("Continue", "See what happens next", "skip_to_next_day")
	if(state == "skip_to_next_day"):
		playAnimation(StageScene.Sleeping, "idle", {bodyState={naked=true}})
		removeCharacter("eliza")
		removeCharacter("tavi")
		GM.pc.setLocation(GM.pc.getCellLocation())
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		saynn("You open your eyes.. And actually see something this time. It's your cell.")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence!")

		saynn("They probably didn't let Tavi go. Whatever they were testing on her, it was working.")

		addButton("Get up", "Time to do something", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_wakeup"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		processTime(60*83)
		GM.pc.removeAllRestraints()
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("blindfold"))
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("inmatewristcuffs"))
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "pc_punishment_vag"):
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("ballgag"))
		processTime(2*60)
		GM.pc.orgasmFrom("eliza")

	if(_action == "pc_punishment_anal"):
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("ballgag"))
		processTime(2*60)
		GM.pc.orgasmFrom("eliza")

	if(_action == "pc_punishment_vag_more"):
		processTime(3*60)
		GM.pc.orgasmFrom("eliza")
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina, 30)

	if(_action == "pc_punishment_vag_blur"):
		processTime(30*60)
		GM.pc.orgasmFrom("eliza")
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina, 30)

	if(_action == "pc_punishment_vag_sybian"):
		processTime(30*60)
		GM.pc.orgasmFrom("eliza")

	if(_action == "skip_to_next_day"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		GM.pc.removeAllRestraints()

	if(_action == "pc_punishment_anal_more"):
		processTime(3*60)
		GM.pc.orgasmFrom("eliza")
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)

	if(_action == "pc_punishment_anal_blur"):
		processTime(30*60)
		GM.pc.orgasmFrom("eliza")
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)

	if(_action == "pc_punishment_anal_sybian"):
		processTime(30*60)
		GM.pc.orgasmFrom("eliza")

	setState(_action)
