extends "res://Scenes/SceneBase.gd"

var howMuchMilked = 0.0

func _init():
	sceneID = "ElizaHandMilking"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		# (if milking level low)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 1):
			saynn("[say=pc]Um. The simplest way? I don’t have much experience.[/say]")

		# (if milking level medium)
		elif(GM.pc.getSkillLevel(Skill.Milking) <= 4):
			saynn("[say=pc]I wanna be milked by your hand.[/say]")

		# (if high)
		else:
			saynn("[say=pc]My breasts are too swollen, milk me like a cow that I am, moo![/say]")

		saynn("[say=eliza]Well then. Follow me~[/say]")

		saynn("Eliza leaves her counter and approaches you. She then attaches a leash to your collar and walks you through some sterile corridors, you notice many nurses and other doctors around, some guards too. Deep inside you feel excited for what’s next.")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		aimCamera("med_milkingroom")
		setLocationName("Milking heaven")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={exposedChest=true}})
		
		saynn("She brings you to a room that can only be described as a milking heaven. You notice a huge milk storage tank and quite a few special milking stalls, not for animals but for humans. Eliza guides into one of them, the free one. The stall itself is just some metal pipes, designed to keep the cow still, Eliza wraps your leash around one of them.")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("[say=eliza]There we go. I will need access to your breasts obviously.[/say]")

			saynn("She {pc.undressMessageS}. Then she grabs a stool and a milk container can. She sits just before you.")
		# (if naked)
		else:
			saynn("[say=eliza]There we go. Don’t have to strip you even, such a well-prepared cow.[/say]")

			saynn("She grabs a stool and a milk container can. Then she sits just before you.")

		saynn("Eliza takes a good look at your bare chest and then traces her hands over your {pc.breasts}, full of milk.")

		saynn("[say=eliza]You know, the research shows that if you moo during this the milk tastes better~.[/say]")

		# (if low milking)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 1):
			saynn("[say=pc]I’m not sure that’s how it works..[/say]")

			saynn("[say=eliza]Aww. But it’s fun~[/say]")

		# (if medium milking)
		elif(GM.pc.getSkillLevel(Skill.Milking) <= 4):
			saynn("[say=pc]Um.. Moo?[/say]")

			saynn("[say=eliza]Yes, put more effort into it, like a good cow.[/say]")
		else:
		# (if high milking)

			saynn("You wiggle your upper body and moo enthusiastically for the doctor.")

			saynn("[say=pc]Moo! Moo-o![/say]")

			saynn("[say=eliza]Now that’s a good cow.[/say]")

		addButton("Be milked", "Time for the fun part", "be_milked")

	if(state == "be_milked"):
		saynn("You grab onto the metal bar before you and stand still, slightly leaning forward and pushing your {pc.breasts} out. Eliza starts by gently groping them, making them bounce and jiggle. She traces her digits around your areolas and rubs each nipple, you can feel them becoming stiff. Eliza squeezes one between her fingers and some {pc.milk} comes out.")

		saynn("[say=eliza]Very good~.[/say]")

		# (if high milking)
		if(GM.pc.getSkillLevel(Skill.Milking) > 4):
			saynn("[say=pc]Moo![/say]")

		saynn("It feels good, Eliza starts to knead your breasts like a kitten would to its mommy. You part your lips and moan softly. Then Eliza applies more pressure to squeeze your milky jugs and watches them squirt with more {pc.milk}! She is careful to catch most of it into the milk container.")

		# (if low milking)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 1):
			saynn("[say=pc]Feels so strange to be doing this..[/say]")

			saynn("[say=eliza]But it feels good, right? Just give in, cows don’t need to think, all they need to focus is on pleasure~[/say]")
		elif(GM.pc.getSkillLevel(Skill.Milking) <= 4):
		# (if medium milking)

			saynn("[say=pc]Moo-o..[/say]")

			saynn("[say=eliza]Yes, focus on being milked.[/say]")

		# (if high milking)
		else:
			saynn("[say=pc]Moo~![/say]")

			saynn("[say=eliza]No thoughts, no problems, just milking. Such a good cow.[/say]")

		saynn("Her hands continue milking you, gently kneading and massaging your {pc.breasts} before switching to firm squeezing, catching more of your {pc.milk}. You feel aroused, standing in a stall and being milked like some animal feels unbelievable. The doctor’s hands squeeze more and more {pc.milk} out of your jugs, you moan a lot, while the milk level in the container steadily rises.")

		# (if has vagina)
		if(GM.pc.hasVagina()):
			saynn("You feel very horny, your pussy is so wet you feel like you can cum any second without any stimulation.. But you don’t.. You ride that wave, constant pleasure from milking slowly corrupting your mind..")

		addButton("Give in completely", "Moo..", "give_in_completely")

	if(state == "give_in_completely"):
		saynn("Eliza keeps milking you on the stall and you stand still for her, your {pc.breasts}")

		# (if had > 4 liters)
		if(howMuchMilked >= 2500.0):
			saynn("At least an hour passes, and the milk container is practically full.")

			saynn("[say=eliza]Great~. That’s gonna make my coffee way more tasty.[/say]")

		# (if had > 2 liters)
		elif(howMuchMilked >= 900.0):
			saynn("At least an hour passes, and the milk container is about half-full.")

			saynn("[say=eliza]Not bad. We can always milk you more another time.[/say]")

		# (if had > 1 liters)
		elif(howMuchMilked >= 400.0):
			saynn("At least an hour passes, and the milk container is less than half-full but it’s still something.")

			saynn("[say=eliza]About 1 liter. Maybe we should give you bigger udders~[/say]")

		# (else)
		else:
			saynn("At least an hour passes, and the milk container’s level is quite low.")

			saynn("[say=eliza]Hmm. Make sure you wait some time, you were almost dry.[/say]")

		saynn("Eliza says something but you find it hard to pay attention, you can only think about milk.. The doctor notices that your eyes look spaced out and chuckles.")

		saynn("[say=pc]Moo..[/say]")

		saynn("[say=eliza]Alright, let me help you~[/say]")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("She puts your clothes back on and grabs the leash. Then she guides you out of the stall.")

		# (else)
		else:
			saynn("She grabs your leash and guides you out of the stall.")

		addButton("Follow", "You’re such an obedient cow", "follow1")

	if(state == "follow1"):
		aimCamera("med_nearmilking")
		setLocationName("Corridor")
		GM.pc.setLocation("med_nearmilking")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Eliza brings you out of the milking room into the main corridor.")

		saynn("[say=eliza]I’m sure you will find your way out. Come back soon~[/say]")

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
	
	if(_action == "give_in_completely"):
		setModuleFlag("MedicalModule", "Med_wasMilkedToday", true)
		processTime(60*60)
		howMuchMilked = GM.pc.milk()
		GM.pc.addLust(40)
		
		increaseModuleFlag("MedicalModule", "Med_milkMilked", howMuchMilked)
		increaseModuleFlag("MedicalModule", "Med_milkedMilkTimes")
		GM.main.SCI.handleBountyFluid(GM.pc.getFluidType(FluidSource.Breasts), howMuchMilked)
		
		addMessage(str(round(howMuchMilked / 10.0)*10.0)+" ml of milk was milked from your breasts")

		GM.pc.addSkillExperience(Skill.Milking, 60, "eliza_handmilking")
		
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
