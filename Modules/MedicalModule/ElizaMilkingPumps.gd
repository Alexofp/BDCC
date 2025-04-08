extends "res://Scenes/SceneBase.gd"

var howMuchMilked = 0.0

func _init():
	sceneID = "ElizaMilkingPumps"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		# (if low-medium)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 4):
			saynn("[say=pc]I wanna donate my milk.[/say]")

		# (if high)
		else:
			saynn("[say=pc]Please, I really need my udders milked. They start to itch if I don’t.[/say]")

		saynn("[say=eliza]That can be arranged. Follow me, inmate.[/say]")

		saynn("Eliza leaves her counter and gets you on a leash.")

		addButton("Follow", "See where she will bring you", "follow")

	if(state == "follow"):
		aimCamera("med_milkingroom")
		setLocationName("Milking heaven")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={exposedChest=true}})
		
		saynn("You enter the space that is designed for milking activities, Eliza guides you into one of the stalls and ties your leash to one of the metal bars. You look around, the room has a moody warm feel to it, the lighting here is not as bright.")

		# (if tied up)
		if(GM.pc.hasBlockedHands() || GM.pc.hasBoundArms()):
			saynn("Eliza was nice enough to remove your restraints for now.")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("She shows you to hold onto the bar in front of you and you do that while she {pc.undressMessageS}. You’re left to stand naked while she grabs some things.")

		# (else)
		else:
			saynn("She shows you to hold onto the bar in front of you and you do that. She leaves you to stand naked while she grabs some things.")

		saynn("[say=eliza]Hand milking has some charm to it but this is way more efficient~.[/say]")

		saynn("You notice her holding a pair of breast pumps and all the other necessary bits like soft tubes and fittings.")

		# (if low-medium)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 4):
			saynn("[say=pc]Very industrial..[/say]")

			saynn("[say=eliza]If it works for cows, why wouldn’t we use it on humans.[/say]")

		# (if high)
		else:
			saynn("[say=pc]Yes, please, my milky jugs need some good pumping. Moo![/say]")

			saynn("[say=eliza]That’s the spirit.[/say]")

		saynn("You push your chest forward, Eliza starts putting the pumps on your {pc.breasts}, suction cups firmly attach themselves to your nipples, already tugging on them. Then the doctor attaches the tubes and connects them to the pipes that run through the whole room.")

		saynn("[say=eliza]There we go, all you have to do is stand still. But don’t forget to moo~, it helps with the milk quality. Ready?[/say]")

		addButton("Get milked", "Moo!", "get_milked")

	if(state == "get_milked"):
		saynn("You nod to the doc, she switches the pumps on and takes a step back. They start off slow, gently stimulating your nips with a rapid but weak pumping rhythm. It feels very arousing, you hold onto the bar and rub your legs together as the pumps slowly ramp up their strength.")

		# (if low-medium)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 4):
			saynn("[say=pc]Moo-o..[/say]")

		# (if high)
		else:
			saynn("[say=pc]Moo-o![/say]")

		saynn("Eliza bites her lip as she watches you. First few drops of {pc.milk} get collected. The pumps don’t stop, they switch to a more slow mode but each pump is much more deep and powerful, causing a steady flow to establish. You arch your back slightly, subtle moans escape from your lips. Doctor makes sure everything is working and then slides her palm over your {pc.thick} curves. She gives your butt a playful smack.")
#ACEPREGEXPAC - Eliza comments on her pregnant, possibly milky state
		if(getCharacter("eliza").isVisiblyPregnant()):
			saynn("[say=eliza]Good cow~. I wanna hear you moo for me.[/say]")
			saynn("You see eliza rub her rounded out midriff as she seemingly study your reaction as the pumps milk your {pc.breasts}")
			saynn("[say=eliza]I might have to try this later...")
		else:
			saynn("[say=eliza]Good cow~. I wanna hear you moo for me.[/say]")

		saynn("You lean forward and let out a cute moo without controlling it, your mind starts to feel hazy. Pleasure from milking overflows your mind, you squirm and wiggle your butt while the pumps restlessly pump {pc.milk} from your {pc.breasts}.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your wet cunt makes you feel needy, you look around, maybe there is a bull here somewhere that can fuck you senseless. Your wetness drips down from your slit and creates a little puddle underneath you. You came but the orgasm gets lost in that sea of pleasure..")

		saynn("Fuck, it’s so hot, being milked like some kind of farm animal. No thoughts.. No hard decisions.. You feel your mind slipping into bliss.. Stand still and be milked hard, that’s what you want right now.. You open your mouth and stick your tongue out, moaning and panting, every few seconds a moo noise escapes from you, your eyes show lust and desire. You don’t even notice that the doctor is gone to do something else, you just want this to continue.")

		addButton("Moo", "Give in completely..", "moo")

	if(state == "moo"):
		saynn("Time passes.. Who knows how much.. All you hear is the sound of pumps suckling on your {pc.breasts}, slowing down as they start to run out of charge. You are drooling and mooing, feeling completely spaced out.")

		saynn("Eventually the doctor comes back. She snaps her fingers in front of your face.")

		saynn("[say=eliza]Oh yeah, look at you. Such a slut for milking. Let’s see.[/say]")

		saynn("Eliza turns off the pumps and checks how much milk you made.")

		# (if less < 400)
		if(howMuchMilked < 400.0):
			saynn("[say=eliza]Not that much, hmm. Maybe you need bigger melons.[/say]")

		# (if > 400)
		elif(howMuchMilked < 900.0):
			saynn("[say=eliza]Not bad. That will do nicely.[/say]")

		# (if a lot)
		else:
			saynn("[say=eliza]Oh nice, very good. Enough to make some nice profit.[/say]")

		saynn("You moan as she takes off the breast pumps, your nips feel so sensitive. You can hardly stand without holding to something, Eliza clips a leash to your collar and brings you out.")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("She grabs your clothes also and gives them to you.")

		saynn("[say=eliza]You will snap out of it. I’m sure~. Let’s go, little cow.[/say]")

		saynn("[say=pc]Moo..[/say]")

		addButton("Follow", "Moo-o-o..", "follow1")

	if(state == "follow1"):
		aimCamera("med_nearmilking")
		setLocationName("Corridor")
		GM.pc.setLocation("med_nearmilking")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Eliza walks you out of the milking room and unleashes you.")

		saynn("[say=eliza]Gonna go now, my shift is still going. Just find the exit.[/say]")

		saynn("Eliza spanks you lightly and goes on her way.")

		# (scene ends)
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
	
	if(_action == "get_milked"):
		GM.pc.orgasmFrom("eliza")
	
	if(_action == "moo"):
		setModuleFlag("MedicalModule", "Med_wasMilkedToday", true)
		processTime(60*60)
		howMuchMilked = GM.pc.milk()
		
		increaseModuleFlag("MedicalModule", "Med_milkMilked", howMuchMilked)
		increaseModuleFlag("MedicalModule", "Med_milkedMilkTimes")
		GM.main.SCI.handleBountyFluid(GM.pc.getFluidType(FluidSource.Breasts), howMuchMilked)
		
		addMessage(str(round(howMuchMilked / 10.0)*10.0)+" ml of milk was milked from your breasts")

		GM.pc.addSkillExperience(Skill.Milking, 80, "eliza_milkingpumps")
		
		if(howMuchMilked >= 400.0):
			var credits = Util.maxi(1, int(floor(sqrt(howMuchMilked / 100.0) / 2.0)))
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
