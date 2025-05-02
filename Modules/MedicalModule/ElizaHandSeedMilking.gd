extends "res://Scenes/SceneBase.gd"

var howMuchMilked = 0.0

func _init():
	sceneID = "ElizaHandSeedMilking"

func _run():
	if(state == ""):
		addCharacter("eliza")
		
	if(state == ""):
		# (if low level)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 2):
			saynn("[say=pc]What’s the simplest way?[/say]")

			saynn("[say=eliza]Jacking off is.[/say]")

			saynn("[say=pc]Yeah, that.[/say]")

		# (if high level)
		else:
			saynn("[say=pc]I miss a good pair of hands on my cock, balls are full for way too long.[/say]")

			saynn("[say=eliza]Then we better do something about that~.[/say]")

		saynn("Eliza smirks and leaves her counter. She then clips a leash to your collar and walks you through some sterile corridors, you notice many nurses and other doctors around, some guards too.")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		aimCamera("med_milkingroom")
		setLocationName("Milking heaven")
		playAnimation(StageScene.SexHandjob, "tease", {pc="pc", npc="eliza",
			bodyState={exposedCrotch=true,hard=true}
		})
		
		saynn("She brings you to a room that can only be described as a milking heaven. You notice a huge fluid storage tank and quite a few special milking stalls, not for animals but for humans. Eliza guides into one of them, the free one. The stall itself is just some metal pipes, designed to keep the bull or the cow still, Eliza wraps your leash around one of them.")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("[say=eliza]Let’s get your cock out.[/say]")

			saynn("She {pc.undressMessageS}. Then she grabs a milk container can and places it just before you.")

		# (if naked)
		else:
			saynn("[say=eliza]Not a fan of pants, are you, huh~.[/say]")

			saynn("She grabs a milk container can and places it just before you.")

		saynn("[say=eliza]No touching me, hands on the bars.[/say]")

		saynn("Eliza lowers herself to your crotch level and puts her paws on you. They slide across your {pc.masc} legs and hips, the doctor's touch feels nice. She observes your {pc.cock} from so close and gives you a kinky look.")

		saynn("[say=eliza]Bet you’re excited~[/say]")

		saynn("She teases you more but eventually her palms cup your ballsack and give it a little massage. She gives each your orb some attention, kneading and gently squeezing. Then her feline digits shift to the shaft, going over its head, giving it a rub. You get hard quickly, your cock is leaking so much precum already..")

		# (if low milking)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 2):
			saynn("[say=pc]You seem to like doing it.[/say]")

			saynn("[say=eliza]Everything I do is strictly professional. Most of the time.[/say]")

		# (if high)
		else:
			saynn("[say=pc]Fuck, you’re making me so horny.[/say]")

			saynn("[say=eliza]Experience helps~[/say]")

		addButton("Get milked", "It seems you’re in good hands", "get_milked")

	if(state == "get_milked"):
		playAnimation(StageScene.SexHandjob, "sex", {pc="pc", npc="eliza",
			bodyState={exposedCrotch=true,hard=true}
		})
		
		saynn("You stand still in a stall and hold onto a metal bar, exactly like she ordered. The doctor is on her knees before you with the seed container between her legs, ready to collect. She begins to slowly stroke your {pc.penisSize} cock, going over its full length, her second hand is resting for now.")

		saynn("[say=eliza]Do you like that, bull?[/say]")

		saynn("You look down at her and nod, your cock leaking more precum that she is spreading across the full length. Your breathing becomes deeper. Eliza sees that and increases her speed, her palm slides back and forth at a pretty fast pace now, enough for you to open your mouth slightly.")

		saynn("Her second palm joins and starts to knead your balls again. Fuck that feels good, you instinctively thrust your hips forward but the stall prevents your motion. Eliza chuckles and keeps jerking you off.")

		saynn("You feel that you’re close already, you can’t endure such pace for very long. And you don’t really want to, you grip the metal bars harder and let out some muffled moans, your {pc.cock} starts to throb and then explodes with cum a few seconds later. You moan and squirm in the milking stall while Eliza collects your {pc.cum}, being careful not to miss a drop.")

		saynn("[say=eliza]Oh yeah, give it to me, be a good bull.[/say]")

		saynn("Even while you’re in the middle of your orgasm she keeps stroking your cock, just not as fast, her motions are strong and slow, she is trying to milk you of all your seed. Eventually you come down from the peak. Eliza smirks at you.")

		saynn("[say=eliza]Another few loads~?[/say]")

		# (if low)
		if(GM.pc.getSkillLevel(Skill.Milking) <= 2):
			saynn("[say=pc]Ohh, I’m not sure if I have it in me.[/say]")

			saynn("[say=eliza]Just think about something lewd. Like fucking my juicy wet cunt with that cock~. Shoving it deep inside me, pounding at my womb until you stuff it full of that nice sticky cum~. Think about breeding me, giving me a huge litter and then doing it again.. and again..[/say]")

			saynn("Fuck, she really knows what she is doing, your {pc.cock} is not going down, instead it stands as erected as it was, ready to be milked again.")

		# (if high)
		else:
			saynn("[say=pc]Sure, sweetie. I wish I could stuff one or two into your womb.[/say]")

			saynn("[say=eliza]That’s why we’re collecting it~. Not for me exactly but I understand you~. I bet you would love to bend me over right here and shove that cock down my needy wet pussy, pound it nice and rough, break into my womb and stuff it full to the brim with your seed~. Use me as a breeding bitch.. and then again.. and again..[/say]")

			saynn("Fuck, she really knows what she is doing, your {pc.cock} is as hard as it was, begging to be milked again.")

		saynn("Eliza quickly licks her fingers and puts her hands back on your cock. She doesn’t have to prepare you again so she goes full-force on you, stroking you at the full pace. You’re still sensitive down there, you arch your back and moan but that slowly goes away, replaced by a feeling of the next orgasm building up.")

		saynn("[say=eliza]Yeah, I bet you love this. When a woman uses you for your cum. Huh~?[/say]")

		saynn("You breathe deep and fast, moan after moan keeps escaping from your mouth. Eliza plays with your balls, shifting and squeezing them in her hand, she can guess how close you are by how they tense up as she keeps jerking you off.")

		saynn("It doesn’t take too long, less than a minute passes before you arch your back again and cum, your {pc.cock} shooting more waves of {pc.cum} directly into the seed container. She chuckles and keeps the pressure on your cock, again, doing slow but strong motions with her hand, milking your balls dry. The pleasure slowly overtakes your mind..")

		addButton("Give in completely", "Feels good, doesn’t it..", "give_in_completely")

	if(state == "give_in_completely"):
		playAnimation(StageScene.SexHandjob, "fast", {pc="pc", npc="eliza",
			bodyState={exposedCrotch=true,hard=true}
		})
		
		saynn("More than an hour passes, she keeps milking your cock, changing her hands when she is too tired. You came many times.. each one taking longer than the last but she was relentless, constantly reminding how she would love to be bred by you, begging for more of your cum. Eventually your mind switched off.. You just kept holding onto the stall, enjoying the feeling of your balls being emptied.. again and again..")

		saynn("[say=eliza]There we go~. I think I drained you completely. Aren’t you a good bull.[/say]")

		saynn("Eliza looks into the container and giggles.")

		saynn("[say=eliza]Not bad, I think we were quite productive today.[/say]")

		saynn("She puts the lid on the container and puts it aside. Then she stands up and walks up to you before giving you a little kiss on the shoulder. She unties the leash and guides you out of the stall.")

		saynn("[say=eliza]Good bull~. You will come back to your senses soon.[/say]")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("She helps you put your clothes back on.")

		addButton("Follow her", "Wow..", "follow_her")

	if(state == "follow_her"):
		aimCamera("med_nearmilking")
		setLocationName("Corridor")
		GM.pc.setLocation("med_nearmilking")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("You follow the doctor out of the milking room. She removes your leash and offers you a head pat.")

		saynn("[say=eliza]Gonna leave you right here. I trust you can find the exit yourself, I gotta fill some papers.[/say]")

		# (end of scene)
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
		processTime(80*60)
		howMuchMilked = GM.pc.milkSeed()
		GM.pc.orgasmFrom("eliza")
		
		increaseModuleFlag("MedicalModule", "Med_seedMilked", howMuchMilked)
		increaseModuleFlag("MedicalModule", "Med_milkedSeedTimes")
		GM.main.SCI.handleBountyFluid(GM.pc.getFluidType(FluidSource.Penis), howMuchMilked)
		
		addMessage(str(round(howMuchMilked / 10.0)*10.0)+" ml of cum was milked from your cock")

		GM.pc.addSkillExperience(Skill.Milking, 60, "eliza_handseedmilking")
		
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
