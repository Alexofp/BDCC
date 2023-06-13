extends SceneBase

var chanceEasy = 0.0
var chanceMedium = 0.0
var chanceHard = 0.0
var success = false
var earnedCredits = 0
var npc_id = ""

func _init():
	sceneID = "rahiSlaveryKissingBoothTaskScene"

func _reactInit():
	var rahiModule = getModule("RahiModule")
	chanceEasy = rahiModule.getSkillSuccessChance("rahiSkillProstitution", 70, 95)
	chanceMedium = rahiModule.getSkillSuccessChance("rahiSkillProstitution", 30, 95)
	chanceHard = rahiModule.getSkillSuccessChance("rahiSkillProstitution", 2, 95)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npc_id

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("Pick how hard you want the kissing booth task to be for Rahi.")

		saynn("Easy: "+str(Util.roundF(chanceEasy, 1))+"% chance. Rahi only offers hugs for credits.")

		saynn("Medium: "+str(Util.roundF(chanceMedium, 1))+"% chance. Rahi offers kisses and hugs for credits.")

		saynn("Hard: "+str(Util.roundF(chanceHard, 1))+"% chance. Rahi also offers oral sex for credits.")

		addButton("Back", "Pick another task", "endthescene")
		addButton("Easy", "Rahi only offers hugs for credits", "easy_task")
		addButton("Medium", "Rahi offers kisses and hugs for credits", "medium_task")
		addButton("Hard", "Rahi also offers oral sex for credits", "hard_task")
	if(state == "easy_task"):
		saynn("Do you wanna see Rahi do it? Or you can just skip to the outcome.")

		addButton("See it", "See how well Rahi does", "easy_see")
		addButton("Skip", "Skip to the outcome", "skip")
	if(state == "skip"):
		saynn("You decide to stay in the cell and just idle for a bit.")

		if (success):
			saynn("After some time, Rahi returns, looking happy. She succeeded.")

			saynn("She gives you a chip with your share of Rahi's earnings.")

		else:
			saynn("After some time, Rahi returns, looking very sad. She just couldn't bring herself to do it.")

			saynn("She lowers her head.")

		addButton("Continue", "See what happens next", "stop_task")
	if(state == "medium_task"):
		saynn("Do you wanna see Rahi do it? Or you can just skip to the outcome.")

		addButton("See it", "See how well Rahi does", "medium_see")
		addButton("Skip", "Skip to the outcome", "skip")
	if(state == "hard_task"):
		saynn("Do you wanna see Rahi do it? Or you can just skip to the outcome.")

		addButton("See it", "See how well Rahi does", "hard_see")
		addButton("Skip", "Skip to the outcome", "skip")
	if(state == "easy_see"):
		aimCameraAndSetLocName("main_hall_west")
		saynn("You explain to Rahi that she must earn you some credits using her body. You explain that she doesn't have to do any sex, selling something simple like hugs is enough.")

		saynn("She nods understandably and exits the cell, heading somewhere public. You follow.")

		saynn("Rahi finds a random cardboard box and then places it in one of the high-traffic prison places. She produces a black marker and then writes \"Hugs - 1 credit\" on it before sitting behind it and waiting.")

		saynn("It doesn't take long for someone to show up..")

		addButton("Continue", "See what happens next", "easy_someone")
	if(state == "easy_someone"):
		playAnimation(StageScene.Hug, "hug", {pc="rahi", npc=npc_id})
		saynn("Some inmate approaches Rahi and asks her about the hand-made booth. Rahi puts on a fake kind smile and explains everything.")

		saynn("[say=rahi]She is offering hugs for one credit..[/say]")

		saynn("The inmate chuckles and looks around. Then {npc.he} tosses a single credit chip at Rahi.")

		saynn("[say=npc]I suppose I could use a good hug.[/say]")

		if (success):
			saynn("Rahi sees the credit chip and eagerly embraces {npc.him}, wrapping her paws tightly around {npc.his} neck. She squeezes {npc.him} tightly, making the inmate feel the warmth and comfort of her body.")

			saynn("The inmate chuckles and pats Rahi on the back.")

			saynn("[say=npc]Worth every credit.[/say]")

			saynn("Rahi beams with pride and excitement.")

			saynn("Time passes. You watch Rahi hug more inmates.")

			addButton("Continue", "See what happens next", "easy_outcome")
		else:
			saynn("Rahi sees the credit chip and suddenly gets all puzzled and concerned. Then she looks at you.. and the inmate, who's patience is already running out.")

			saynn("[say=rahi]Sorry.. she can't do it..[/say]")

			saynn("{npc.He} shakes {npc.his} head and takes {npc.his} chip back. Sad Rahi approaches and hugs you instead.")

			saynn("[say=rahi]Sorry..[/say]")

			saynn("Wholesome. But still. Rahi failed her task.")

			addButton("Continue", "See what happens next", "stop_task")
	if(state == "easy_outcome"):
		removeCharacter(npc_id)
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		saynn("After everyone gets their hugs from Rahi, she returns to you, looking happy. She succeeded.")

		saynn("She gives you a chip with your share of Rahi's earnings. And then she hugs you too.")

		addButton("Continue", "See what happens next", "stop_task")
	if(state == "medium_see"):
		aimCameraAndSetLocName("main_hall_west")
		saynn("You explain to Rahi that she must earn you some credits using her body. You explain that she doesn't have to do any sex. But you're asking for more than just hugs.")

		saynn("She nods understandably and exits the cell, heading somewhere public. You follow.")

		saynn("Rahi finds a random cardboard box and then places it in one of the high-traffic prison places. She produces a black marker and then writes \"Kisses - 2 credits. Hugs - 1 credit\" on it before sitting behind it and waiting.")

		saynn("It doesn't take long for others to start showing up..")

		addButton("Continue", "See what happens next", "medium_someone")
	if(state == "medium_someone"):
		playAnimation(StageScene.Solo, "stand", {pc="rahi"})
		if (!success):
			saynn("One by one, inmates begin to show. They make a little queue to Rahi's handmade kissing booth. She sees all the lips and cheeks that she will have to kiss.. and gets very nervous.")

			saynn("So nervous that she doesn't end up kissing anyone. She runs up to you and hugs you instead. The crowd gets annoyed with broken promises and slowly disperses.")

			saynn("[say=rahi]Sorry..[/say]")

			saynn("She kisses your cheek. Wholesome. But still. Rahi failed her task.")

			addButton("Continue", "See what happens next", "stop_task")
		else:
			var randVariant = RNG.pick([1,2,3,4,5,6,7])
			if (randVariant == 1):
				saynn("As she sits in her hand-made booth, one of the inmates walks by. He smiles when he sees the cardboard box with written options on it and then approaches Rahi.")

				saynn("He asks for a kiss, obviously. Rahi nods, a bit nervously, the thought of earning credits was enough to push her out of her comfort zone.")

				saynn("The inmate leans in and Rahi meets him halfway, pressing her lips to his. It was a soft, gentle kiss and Rahi couldn't help but blush a bit before pulling away.")

				saynn("The inmate hands Rahi her well-earned two credits and goes on his way.")

			elif (randVariant == 2):
				saynn("As she sits in her hand-made booth, one of the inmates walks by. A kind-looking man. He sees Rahi's booth and decides to approach her.")

				saynn("When he asks for a kiss, Rahi hesitates for a moment before leaning in and planting a soft, comforting kiss on his cheek.")

				saynn("The man's face lights up with a smile, he hands Rahi a chip with two credits, grateful for the small moment of kindness.")

			elif (randVariant == 3):
				saynn("A female inmate approaches Rahi's handmade kissing booth, looking a bit nervous and shy.")

				saynn("When she asks for a kiss, Rahi can sense her hesitation and decides to make a quick peck on her lips. But when their lips meet, Rahi finds herself wanting to linger a bit longer.. dragging the moment for as long as possible.")

				saynn("The female inmate hands her two credits and leaves quickly.")

			elif (randVariant == 4):
				saynn("A group of inmates approaches Rahi's handmade kissing booth, clearly looking to cause trouble. They demand a kiss each but only willing to pay for one time, abusing the fact that the cardboard box says \"Kisses\". Rahi stands her ground and refuses.")

				saynn("But then one of the inmates grabs her arm and pulls her close, trying to force a kiss.")

				saynn("You gotta act! You appear out of nowhere and punch the inmate, sending him sprawling to the ground. The rest of the group scatters, leaving you and Rahi alone.")

				saynn("Rahi couldn't resist giving you a quick little kiss on the lips. Before she returns to working.")

			elif (randVariant == 5):
				saynn("A shy and nervous inmate approaches Rahi's handmade booth, looking like he had never done anything like this before.")

				saynn("Rahi senses his anxiety and decides to make the experience as gentle as possible. As they share a sweet kiss, you can see the tension in the man's body slowly easing away.")

				saynn("When it's over, he hands her a chip with two credits before leaving, now being much more confident in his step.")

			elif (randVariant == 6):
				saynn("A group of female inmates approaches Rahi's handmade kissing booth, giggling and playfully pushing each other forward.")

				saynn("Rahi couldn't help but to smile at their indecisiveness. She leans in and kisses one of them on the cheek. And as she does that, she is suddenly pulled into a group hug.")

				saynn("The girls all giggle and hug her tightly before handing her some credits and running away.")

			elif (randVariant == 7):
				saynn("One of the guards approaches Rahi's handmade kissing booth, looking stern.")

				saynn("But when Rahi offers him a kiss, something softens in his expression, and he leans in to give her a little kiss on the lips.")

				saynn("Before he leaves, he hands Rahi three credits instead of two.")

			saynn("Time passes. You watch Rahi kiss and hug more inmates, intervening when things go too far.")

			addButton("Continue", "See what happens next", "medium_outcome")
	if(state == "medium_outcome"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("After everyone gets their kisses and hugs from Rahi, she returns to you, looking happy. She succeeded.")

		saynn("She gives you a chip with your share of Rahi's earnings. And then she kisses you too while her paws are wrapped around you.")

		addButton("Continue", "See what happens next", "stop_task")
	if(state == "hard_see"):
		aimCameraAndSetLocName("main_hall_west")
		saynn("You explain to Rahi that she must earn you some credits using her body. You explain to her that the best to do so is by using her mouth.")

		saynn("She nods understandably and exits the cell, heading somewhere public. You follow.")

		saynn("Rahi finds a random cardboard box and then places it in one of the high-traffic prison places. She produces a black marker and then writes \"Oral - 3 credits. Kisses - 2 credits. Hugs - 1 credit\" on it before sitting behind it and waiting.")

		saynn("It doesn't take long for others to start showing up..")

		addButton("Continue", "See what happens next", "hard_someone")
	if(state == "hard_someone"):
		if (!success):
			playAnimation(StageScene.Duo, "kneel", {pc="rahi", npc=npc_id, npcBodyState={naked=true, hard=true}})
			saynn("One by one, inmates begin to show. They make a little queue to Rahi's handmade blowjob booth. She sees all the cocks she has to suck and all the pussies she has to lick.. and gets very nervous.")

			saynn("So nervous that she doesn't end up serving anyone. She runs up to you and hugs you instead. The crowd gets annoyed with broken promises and slowly disperses.")

			saynn("[say=rahi]Sorry..[/say]")

			saynn("She kisses your cheek. Wholesome. But still. Rahi failed her task.")

			addButton("Continue", "See what happens next", "stop_task")
		else:
			if (getCharacter(npc_id).hasPenis()):
				playAnimation(StageScene.SexOral, "sex", {npc="rahi", pc=npc_id, bodyState={exposedCrotch=true,hard=true}})
				saynn("One of the inmates approaches the booth. {npc.He} reads the price list and then whips out {npc.his} {npc.penis}, surprising Rahi.")

				saynn("[say=rahi]Three credits for a blowjob..[/say]")

				saynn("{npc.He} hands her the credits and the kitty gets to work. Rahi parts her lips and takes that member deep into her mouth, swirling her tongue around the head, causing the inmate to moan.")

				saynn("Kitty continues to suck {npc.him} off at a gradually increasing pace, using her paws to gently massage {npc.his} balls. All the while {npc.he} reaches down and strokes her ears, causing Rahi to purr and double her efforts, she is determined to make {npc.him} cum.")

				saynn("Finally, the inmate reaches {npc.his} climax. {npc.He} groans while {npc.his} member shoots strings of {npc.cum} directly into Rahi's mouth. She pulls away and eagerly swallows every drop of {npc.his} seed before showing {npc.him} her empty mouth. Rahi wipes her lips that got some of that stuff on them too.")

				saynn("The inmate pats Rahi on the head before putting away {npc.his} cock and walking away.")

			else:
				playAnimation(StageScene.SexOral, "lick", {npc="rahi", pc=npc_id, bodyState={exposedCrotch=true,hard=true}})
				saynn("A female is walking by and then stops to check out Rahi's offerings. The girl seems quite interested. She approaches the kitty and asks about the different services available.")

				saynn("Rahi explains the options and the girl seems intrigued by the oral sex one. She asks about the price even though it's written on the box and then agrees, handing the kitty the creds.")

				saynn("After that, the girl walks behind the booth and pulls her shorts down, exposing her pussy enough for Rahi to slowly lean in and start licking her out.")

				saynn("As Rahi's skilled tongue explored the girl's sensitive areas, she began to moan from pleasure of having every inch of her pussy stimulated. She puts her hand on Rahi's head and begins to grind her crotch into the offered face, spreading her juices.")

				saynn("The girl quickly nears her climax.. And soon enough, the girl tenses up and then proceeds to shiver and shake as her pussy slit showers the kitty with all the lewd juices.")

			saynn("Time passes. You watch Rahi give blowjobs, licks pussies, kiss and hug more inmates, intervening when things go too far.")

			addButton("Continue", "See what happens next", "hard_outcome")
	if(state == "hard_outcome"):
		removeCharacter(npc_id)
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("After everyone gets what they wanted from Rahi, she returns to you, looking happy and satisfied. She succeeded.")

		saynn("She gives you a chip with your share of Rahi's earnings. And then she kisses you on the cheek while her paws are wrapped around you.")

		addButton("Continue", "See what happens next", "stop_task")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "easy_task"):
		if(RNG.chance(chanceEasy)):
			var prostitutionScore = getModule("RahiModule").getSkillScore("rahiSkillProstitution")
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillProstitution", 7)
			earnedCredits = 1 + RNG.randi_range(0, int(prostitutionScore/7))

	if(_action == "medium_task"):
		if(RNG.chance(chanceMedium)):
			var prostitutionScore = getModule("RahiModule").getSkillScore("rahiSkillProstitution")
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillProstitution", 12)
			earnedCredits = RNG.randi_range(1, 2) + RNG.randi_range(0, int(prostitutionScore/5))
		
		#getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("blindfold"))

	if(_action == "hard_task"):
		if(RNG.chance(chanceHard)):
			var prostitutionScore = getModule("RahiModule").getSkillScore("rahiSkillProstitution")
			success = true
			getModule("RahiModule").advanceSkill("rahiSkillProstitution")
			earnedCredits = RNG.randi_range(2, 5)  + RNG.randi_range(0, int(prostitutionScore/5))

	if(_action == "skip"):
		processTime(30*60)
		if(earnedCredits == 1):
			addMessage("You received 1 credit")
		elif(earnedCredits > 1):
			addMessage("You received "+str(earnedCredits)+" credits")
		if(earnedCredits > 0):
			GM.pc.addCredits(earnedCredits)

	if(_action == "stop_task"):
		#getCharacter("rahi").resetEquipment()
		endScene([success])
		return

	if(_action == "easy_someone"):
		processTime(20*60)
		npc_id = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {NpcGen.Level: 10})
		addCharacter(npc_id)

	if(_action == "easy_outcome"):
		processTime(10*60)
		if(earnedCredits == 1):
			addMessage("You received 1 credit")
		elif(earnedCredits > 1):
			addMessage("You received "+str(earnedCredits)+" credits")
		if(earnedCredits > 0):
			GM.pc.addCredits(earnedCredits)

	if(_action == "medium_someone"):
		processTime(20*60)
		#npc_id = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], #InmateGenerator.new(), {NpcGen.Level: 10})
		#addCharacter(npc_id)

	if(_action == "medium_outcome"):
		processTime(10*60)
		if(earnedCredits == 1):
			addMessage("You received 1 credit")
		elif(earnedCredits > 1):
			addMessage("You received "+str(earnedCredits)+" credits")
		if(earnedCredits > 0):
			GM.pc.addCredits(earnedCredits)

	if(_action == "hard_someone"):
		processTime(20*60)
		npc_id = InmateGenerator.new().generate({NpcGen.Gender: RNG.pick([NpcGender.Male, NpcGender.Male, NpcGender.Male, NpcGender.Female, NpcGender.Female, NpcGender.Female, NpcGender.Shemale, NpcGender.Herm]), NpcGen.Temporary: true, NpcGen.NoChastity: true}).getID()
		addCharacter(npc_id)
		if(success):
			if(getCharacter(npc_id).hasPenis()):
				getCharacter("rahi").cummedInMouthBy(npc_id)
			else:
				getCharacter("rahi").cummedInMouthBy(npc_id, FluidSource.Vagina)
				getCharacter("rahi").cummedOnBy(npc_id, FluidSource.Vagina, 0.5)

	if(_action == "hard_outcome"):
		processTime(10*60)
		if(earnedCredits == 1):
			addMessage("You received 1 credit")
		elif(earnedCredits > 1):
			addMessage("You received "+str(earnedCredits)+" credits")
		if(earnedCredits > 0):
			GM.pc.addCredits(earnedCredits)

	setState(_action)

func saveData():
	var data = .saveData()

	data["chanceEasy"] = chanceEasy
	data["chanceMedium"] = chanceMedium
	data["chanceHard"] = chanceHard
	data["success"] = success
	data["earnedCredits"] = earnedCredits
	data["npc_id"] = npc_id

	return data

func loadData(data):
	.loadData(data)

	chanceEasy = SAVE.loadVar(data, "chanceEasy", 0.0)
	chanceMedium = SAVE.loadVar(data, "chanceMedium", 0.0)
	chanceHard = SAVE.loadVar(data, "chanceHard", 0.0)
	success = SAVE.loadVar(data, "success", false)
	earnedCredits = SAVE.loadVar(data, "earnedCredits", 0)
	npc_id = SAVE.loadVar(data, "npc_id", "")
