extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ElizaInducingLactation"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		saynn("You walk closer to the doctor and lean against the counter.")

		saynn("[say=pc]I wanna lactate more..[/say]")

		saynn("Eliza smiles.")

		saynn("[say=eliza]Wanna be a good cow, huh~? We can try something.[/say]")

		saynn("Eliza pressed some button under the table and one of the airlocks opened up.")

		saynn("[say=pc]Come in, cutie. I will leash you for safety.[/say]")

		saynn("Without much thought you walk into the staff-only zone. Eliza quickly meets you, clicks a leash to your collar and walks you through the corridors into one of the labs.")

		addButton("Follow", "See where that brings you", "follow")

	if(state == "follow"):
		aimCamera("med_researchlab")
		setLocationName("Research lab")
		playAnimation(StageScene.Solo, "sit")
		
		saynn("You enter a bright white room, this is clearly where testing is done. You spot something that looks like a chemistry table, many lockers and a special table. This table is actually a part of a machine, you spot some kind of sensors on it, a screen with a keyboard and iron hooks that can be used to chain inmates to. Eliza brings to it and attaches the other end of the leash to its hooks, limiting your available reach by a lot.")

		saynn("[say=eliza]Take a seat.[/say]")

		# (if hands or arms blocked)
		if(GM.pc.hasBlockedHands() || GM.pc.hasBoundArms()):
			saynn("She is nice enough to remove your arm restraints for now.")

		saynn("Eliza walks towards one of the lockers and starts preparing. You sit on the cold table and watch the doctor. She grabs clean white latex gloves and a respirator-like mask and puts them on. She catches your concerned gaze.")

		saynn("[say=eliza]Don’t worry, inmate. Everything we do here should be safe. Safe enough.[/say]")

		saynn("It’s not like you were worried but maybe now you should be. Doctor walks up to one of the stations and starts working. She mixes a few unknown chemicals in the beaker, then adds some water and starts heating it up. The fluid inside slowly turns cyan, the lab is filled with a scent of freshness, it’s almost like you can feel the cold breeze wash over your body.")

		# (if red)
		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=eliza]Quite strange for a red to be doing this willingly.[/say]")

			saynn("[say=pc]It’s not really your business.[/say]")

			saynn("[say=eliza]It is. I’m the one who controls this, don’t forget.[/say]")

		# (if general or pink)
		else:
			saynn("[say=eliza]Just curious. Do you feel excited? Is that why you’re here?[/say]")

			saynn("[say=pc]I guess I like experimenting.[/say]")

			saynn("[say=eliza]Life is too short, right? Yeah, that’s my motto too.[/say]")

		saynn("Eventually the brewing is complete, Eliza puts it aside and lets it cool down a bit. Then she filters the result through some kind of mesh and fills a clean single-use syringe with it. She makes sure there are no air bubbles in it and then walks back to you.")

		saynn("[say=eliza]Ready? This should be safe. It’s only gonna make your body produce way more prolactin. It’s the lactation hormone. Well, maybe I also added some aphrodisiacs in the mix. But that’s nothing to worry about.[/say]")

		addButton("Sure", "Allow to be injected with some unknown drug", "sure")

	if(state == "sure"):
		playAnimation(StageScene.Duo, "sit", {npc="eliza", bodyState={exposedChest=true}})
		
		saynn("You nod softly and offer the doctor your shoulder. She quickly disinfects the area just under your collar and moves the syringe close to it. You feel the doctor's breath through the mask.")

		saynn("[say=eliza]Don’t move, inmate.[/say]")

		saynn("You feel a sudden prick, the sharp needle pierces your skin with ease. Ow. You sit still as she slowly increases the pressure on the back of the syringe, injecting more of the glowing cyan drug into your bloodstream. At first you feel normal, just a slight warm feeling but it slowly starts to ramp up. Eliza carefully observes you.")

		saynn("[say=eliza]Doing alright?[/say]")

		saynn("[say=pc]Yeah..[/say]")

		# (if has vagina)
		if(GM.pc.hasReachableVagina()):
			saynn("Your hand moves down to your crotch. Wow, you’re wet. You sneakily tease yourself, your digits rubbing your clit, trying to battle that warm feeling.")

		# (if has cock)
		elif(GM.pc.hasReachablePenis()):
			saynn("Wow, you feel your {pc.cock} becoming harder, you sneakily stroke yourself, trying to battle that warm feeling.")

		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("Your free hand jumps onto your chest, you can feel your {pc.breasts} becoming.. heavier.. nipples.. itching.. Eliza watches as you cup your breasts with your palms, perky stiff nips rub against your hands through the clothing, you notice small wet spots appearing on it.")

		# (else)
		else:
			saynn("Your free hand jumps onto your chest, you can feel your {pc.breasts} becoming.. heavier.. nipples.. itching.. Eliza watches as you cup your breasts with your palms, perky stiff nips rub against your hands.")

		saynn("The warm feeling turns into full blown heat.. You squirm and shift around on that table, you grope yourself more, little moans escape from you. You can’t tell exactly but you think you see a slight smirk on the doctor's face through the mask.")

		saynn("[say=eliza]Seems like it’s working~. Gotta make sure.[/say]")

		saynn("You breathe deeply, the doctor grabs your hands and pulls them away, exposing your heavy chest. The itching feeling in your nipples returns..")

		saynn("[say=pc]It does.. it works too well..[/say]")

		saynn("[say=eliza]Oh yeah? You wanna be milked like a silly cow that you are~? Gonna moo for me~?[/say]")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("You blush hard and are unable to hide it. You can feel your full {pc.breasts} leaking through the clothing, a few drops of {pc.milk} slide down the cloth. And that’s without being touched.")

		# (else)
		else:
			saynn("You blush hard and are unable to hide it. You can feel your full {pc.breasts} leaking, a few drops of {pc.milk} slide down your bare chest. And that’s without being touched.")

		saynn("[say=eliza]Well, I call that a great success. The heat should pass in a few hours. You will stop lactating if you don’t get milked at least once every few days. Mhm?[/say]")

		saynn("Eliza throws away the used syringe in the special bin, then takes off her gloves and the mask. She grabs your leash again. You can’t sit still, rubbing your crotch against the corner of the table..")

		saynn("[say=pc]Thank you..[/say]")

		saynn("[say=eliza]Don’t mention it~[/say]")

		addButton("Leave", "Seems like you’re done here", "leave")

	if(state == "leave"):
		playAnimation(StageScene.Solo, "walk")
		aimCamera("med_nearlab")
		GM.pc.setLocation("med_nearlab")
		setLocationName("Med corridor")
		
		saynn("Eliza brings you out of the lab and then unleashes you.")

		saynn("[say=eliza]I promise you will find the exit yourself, I gotta go fill some papers.[/say]")

		# (scene ends)

		addButton("Continue", "Time to go", "endthescene")
		


func _react(_action: String, _args):
	if(_action == "follow"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "med_researchlab", [
			"Almost there, inmate",
			"Full breasts will start to itch if you don't milk them, don't forget~",
			"We have a zero accidents reported policy, you should be fine",
			"The leash is for your own safety, really~",
		]])
	
	if(_action == "sure"):
		processTime(29*60)
		var breasts:BodypartBreasts = GM.pc.getBodypart(BodypartSlot.Breasts)
		breasts.induceLactation()
		
		GM.pc.addIntoxication(0.5)
		GM.pc.addLust(50)
		processTime(60)
		addMessage("You're lactating! The drug has intoxicated you")

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
