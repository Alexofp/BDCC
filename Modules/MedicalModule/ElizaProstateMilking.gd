extends "res://Scenes/SceneBase.gd"

var howMuchMilked = 0.0

func _init():
	sceneID = "ElizaProstateMilking"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		# (if medium-low)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 2):
			saynn("[say=pc]Is it possible to do without touching the cock? Just curious..[/say]")

			saynn("[say=eliza]Hm? Oh. Yeah, there is a way.[/say]")

		# (if high milking)
		else:
			saynn("[say=pc]I want my prostate milked. It’s the best method by far.[/say]")

			saynn("[say=eliza]Can’t say no to that. Let’s not waste any time.[/say]")

		saynn("Eliza steps out of the counter and approaches you with a leash in her hand. She clips it to your collar and walks you in. As you traverse the corridors you notice many nurses and other doctors around, some guards too.")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		aimCamera("med_milkingroom")
		setLocationName("Milking heaven")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={exposedCrotch=true,hard=true}})
		
		saynn("She brings you to a room that can only be described as a milking heaven. You notice a huge fluid storage tank and quite a few special milking stalls, not for animals but for humans. Eliza guides you into one of them. The stall itself is just some metal pipes, designed to keep the bull or the cow still, Eliza tied your leash to the stall’s frame.")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("[say=eliza]Let’s get you undressed.[/say]")

			saynn("She {pc.undressMessageS}. Then she grabs a milk container can and places it just under your {pc.cock}.")

		# (if naked)
		else:
			saynn("[say=eliza]You liked being naked, huh. That’s less work for me~.[/say]")

			saynn("She grabs a milk container can and places it just under your {pc.cock}.")

		# (if locked arms)
		if(GM.pc.hasBlockedHands() || GM.pc.hasBoundArms()):
			saynn("The doctor was nice enough to remove your restraints for now.")

		saynn("Then Eliza produces a bottle of lube. She opens it, gets some on her fingers and walks behind you to observe your rear.")

		saynn("[say=eliza]Spread your butt for me, pretty toy~.[/say]")

		# (if low skill)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 2):
			saynn("The command is a bit humiliating but you obey, you put your hands on your {pc.masc} buttcheeks and part them, offering Eliza the clear view of your {pc.analStretch} pucker.")

		# (if high skill)
		else:
			saynn("You eagerly put your hands on your {pc.masc} buttcheeks and part them, giving Eliza a clear view of your {pc.analStretch} pucker.")

		saynn("Eliza gently pushes on your back to make you lean forward and stick your butt out more. She then carefully traces her lubed up digits around your backdoor, they feel cold but the actions arouses you non the less.")

		saynn("[say=eliza]Remember to not hold back, the more passionate you are the better the final product is~[/say]")

		saynn("She applies lube to the outside of your ring but then she sneaks one finger in, having so much lube makes it effortless for her digit to penetrate you. She makes sure you’re all lubed up inside too before pulling her digit out and quickly cleaning her hands. You put your hands on the metal bar before you bend forward and spread your legs more for the doctor.")

		saynn("[say=eliza]I’m ready. Are you?[/say]")

		addButton("Get milked", "Let’s do this", "get_milked")

	if(state == "get_milked"):
		playAnimation(StageScene.SexStanding, "tease", {pc="eliza", npc="pc",
			npcBodyState={exposedCrotch=true,hard=true}
		})
		
		saynn("You look back and nod softly. Eliza smiles back as she pulls out a little glass dildo, it seems to be slightly curved up, its tip has a sphere shape and it also features a convenient handle.")

		saynn("[say=eliza]This will be plenty for you, don’t worry~[/say]")

		saynn("The doctor walks up closer to you, she stands slightly to the side from you, her right hand holds the dildo and guides it down to your {pc.masc} butt. She begins to gently prod on your ring, seeing how easy it will give in.")

		saynn("Seems like the lube helped a lot, the tip of the dildo stretches your rear hole with ease. You can’t help but to make a little noise of pleasure, your {pc.cock} hardens from so much teasing and anticipation, a drop of precum can be seen on its tip.")

		saynn("Eliza gently wiggles the toy inside you, she rotates it so it curves down and begins to slowly move it back and forth, searching for your pleasure button. It didn’t take too long, as soon as she stumbles upon something that feels different she applies more pressure to it which is met with you arching your back and producing another little moan.")

		saynn("[say=eliza]Oh yeah, there we go~. Feels good, doesn’t it?[/say]")

		# (if low)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 2):
			saynn("[say=pc]Yes..[/say]")

		# (high)
		else:
			saynn("[say=pc]Please don’t stop until I can’t take it anymore. And then some..[/say]")

		saynn("The doctor chuckles softly and gets a better grip on the dildo, she begins to slide it inside you at a modest pace but making sure to hit the same spot again and again, pounding away at your prostate. It only takes some time before your cock starts to leak some white transparent fluid. She hits a very sensitive spot and it feels so arousing, your prostate enlarges a bit and it constantly produces more of that milky fluid that then gets squeezed out with the dildo. And all of it gets collected.")

		saynn("She takes it slow as not to hurt you but fuck it feels good, your whole body starts to shiver, a wave after wave of warmess washes over you, lusty moans begin to escape from your lips. Eliza sees you like this bites her lip, her free hand runs over the curves of your {pc.thick} {pc.masc} body while milking you dry with the other.")

		saynn("She slowly picks up the pace, the dildo hammers at your p-spot with little mercy, the rare leaks are now an almost constant weak stream, the fluid level of the milk container slowly raises. Eliza didn’t touch your {pc.cock} once but you feel something building up, a pleasurable feeling that is so hard to resist. You pant and moan way more often, your legs want to close but you fight that, you stand still, your anus stuffed, hands on the bar, so you can be milked as efficiently as possible.")

		addButton("Give in completely", "Be an obedient little bull for Eliza", "give_in_completely")

	if(state == "give_in_completely"):
		saynn("Your little prostate becomes hard as a rock and the doctor feels it, she doesn’t offer you any escapes now. Your {pc.cock} throbs and pulsates, you feel more of those warm pleasure waves taking over your body, making you dizzy. Eliza suddenly puts her free hand just above your collar, she grabs your neck and pulls you up slightly, her digits apply a bit of pleasure, you can only notice her cunning smile as she keeps milking you.")

		saynn("[say=eliza]Are you a submissive little slut.[/say]")

		saynn("[say=pc]Y-yes!..[/say]")

		saynn("[say=eliza]Say it.[/say]")

		saynn("[say=pc]I’m a subby l-little slut..[/say]")

		saynn("[say=eliza]Are you close?[/say]")

		if(GM.pc.isWearingChastityCage()):
			saynn("The pressure in your chastity cage keeps building up, you are being constantly edged, you feel like you only need a bit more to go over the peak. And it feels so good.")
		else:
			saynn("The pressure in your cock keeps building up, you are being constantly edged, you feel like you only need a bit more to go over the peak. And it feels so good.")

		saynn("[say=pc]Y-yes.. very.. p-please..[/say]")

		saynn("She now also keeps the pressure on your neck. You really want it. Right now your mind has only one thought, to cum from this. To cum from being fucked with this little glass dildo.")

		saynn("[say=eliza]Well then cum for me, little slut[/say]")

		saynn("She pounds at your prostate mercilessly, it only takes a few more seconds after hearing the permission for you to suddenly cum. Your whole body starts to shiver and shake uncontrollably, your {pc.cock} shooting a wave after wave of thick {pc.cum} as it throbs, all of it directly into the container. You moan like a slut, your legs really want to give, the only things keeping you up are the dildo in your butt and doctor’s hand. It overwhelms you, your climax doesn’t want to end, you keep trashing against everything but Eliza keeps you still, dildo pounding at your poor prostate.")

		saynn("[say=eliza]You think that’s it, huh~[/say]")

		saynn("You barely understood her, it only takes you like half a minute before the feeling returns and you suddenly cum again. Your balls get quickly drained by her, many times in a row, your cock squirts more and more of your {pc.cum}. Your breathing is heavy, body exhausted, mind is somewhere else.")

		saynn("She repeats the process a few times, bringing you to the edge and letting you cum, making sure that you’re completely drained. She only stops when she notices that your cock is not leaking anything anymore. She finally pulls out the dildo out of your cute used anus and puts it away.")

		saynn("Fuck…")

		saynn("You feel.. satisfied..")

		saynn("Eliza gives you some time to regain your consciousness and breathing. She takes a look inside the container and then puts a lid on it.")

		saynn("[say=eliza]Not bad~. I think it was worth the effort.[/say]")

		saynn("[say=pc]m-mhm..[/say]")

		saynn("She grabs your leash and tugs you away from the stalls. You can barely walk.")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("She helps you to put your clothes back on.")

		addButton("Follow", "Wow", "follow1")

	if(state == "follow1"):
		aimCamera("med_nearmilking")
		setLocationName("Corridor")
		GM.pc.setLocation("med_nearmilking")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Eliza brings you out into the corridor. She unclips the leash and sends you off.")

		saynn("[say=eliza]Hope you can find the exit~. I need to do some stuff. Come back again soon~[/say]")

		# (scene end)
		addButton("Continue", "Time to go", "endthescene")
		


func _react(_action: String, _args):
	if(_action == "follow"):
		runScene("ParadedOnALeashScene", ["eliza", GM.pc.getLocation(), "med_milkingroom", [
			"Almost there, inmate",
			"Feeling excited? You should be~",
			"Thanks for participating in our program, inmate",
			"We have the best milking equipment and staff here~",
			"The leash is for your own safety, really~",
		]])
	
	if(_action == "give_in_completely"):
		setModuleFlag("MedicalModule", "Med_wasMilkedToday", true)
		processTime(60*60)
		howMuchMilked = GM.pc.milkSeed()
		GM.pc.orgasmFrom("eliza")
		GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 10.0)
		
		increaseModuleFlag("MedicalModule", "Med_seedMilked", howMuchMilked)
		increaseModuleFlag("MedicalModule", "Med_milkedSeedTimes")
		GM.main.SCI.handleBountyFluid(GM.pc.getFluidType(FluidSource.Penis), howMuchMilked)
		
		addMessage(str(round(howMuchMilked / 10.0)*10.0)+" ml of cum was milked from your cock")

		GM.pc.addSkillExperience(Skill.Milking, 60, "eliza_prostatemilking")
		
		if(howMuchMilked >= 60.0):
			var credits = Util.maxi(1, int(floor(sqrt(howMuchMilked / 50.0) / 1.0)))
			GM.pc.addCredits(credits)
			addMessage("You received "+str(credits)+" work "+Util.multipleOrSingularEnding(credits, "credit")+"!")

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["howMuchMilked"] = howMuchMilked
	
	return data
	
func loadData(data):
	.loadData(data)
	
	howMuchMilked = SAVE.loadVar(data, "howMuchMilked", 0.0)
