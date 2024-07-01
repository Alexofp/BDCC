extends "res://Scenes/SceneBase.gd"

var bornChildAmount: int = 0
var bornChildString = ""
var receivedApple = false

func _init():
	sceneID = "NurseryTalkScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["nurse"])):
		endScene()
		return
		
	if(GM.pc.hasPerk(Perk.FertilityProudMom) && !getFlag("MedicalModule.Nursery_hadFreeAppleFromPerkToday", false)):
		var theApple = GlobalRegistry.createItem("appleitem")
		theApple.setIsLegal(true)
		GM.pc.getInventory().addItem(theApple)
		addMessage("You recieved an apple")
		setFlag("MedicalModule.Nursery_hadFreeAppleFromPerkToday", true)
		receivedApple = true

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "sit", {pc = "nurse", npc="pc", npcAction="stand"})
		addCharacter("nurse")
		
	if(state == ""):
		if(!GM.main.getModuleFlag("MedicalModule", "Nursery_Introduced")):
			GM.main.setModuleFlag("MedicalModule", "Nursery_Introduced", true)
			
			saynn("You approach the nurse and try to get her attention. She drags her gaze away from the screen and looks at you.")

			saynn("[say=pc]What’s this room for?[/say]")

			saynn("[say=nurse]This is a nursery, inmate. A place for the prison’s mothers.[/say]")

			# (if player is visibly pregnant)
			if(GM.pc.isVisiblyPregnant()):
				saynn("She then eyes you out and notices your pregnant belly.")

				saynn("[say=nurse]And it seems like you are carrying. Then you will need me very soon.[/say]")

				# (end)

			saynn("Well then. You look around. It looks more like a lobby, a few benches are placed near the white walls. You notice a few pictures there and there, all of them clearly drawn by someone young. There are two other doors, apart from the one that you walked in through.")

		else:
			saynn("You approach the nurse and try to get her attention. She drags her gaze away from the screen and looks at you.")

			# (if player has the perk FertilityProudMom and didn't get an apple today)
			if(receivedApple):
				saynn("[say=nurse]Oh it's you again! I try to make sure that every mom here stays on the healthy side, take this[/say]")
				saynn("She gives you an apple.")
				
			# (if ready to give birth)
			elif(GM.pc.isVisiblyPregnant()):
				saynn("[say=nurse]Came to give birth?[/say]")

			# (else)
			else:
				saynn("[say=nurse]Need something, inmate?[/say]")
		
		
		addButton("How works", "Ask her how everything works", "how_works")
		
		if(getModuleFlag("MedicalModule", "Nursery_AskedHowWorks", false)):
			if(!getModuleFlag("MedicalModule", "Nursery_AskedDatabase", false)):
				addButton("Database", "Is there really no way to interact with them", "children")
			else:
				addButton("Database", "Take a look at your children", "database")
		
		if(GM.pc.isVisiblyPregnant()):
			if(!GM.pc.isReadyToGiveBirth()):
				addButton("Induce birth", "Ask to speed up the process", "induce_birth")
				addDisabledButton("Give birth", "Too early for this")
			else:
				addDisabledButton("Induce birth", "You already can give birth")
				addButton("Give birth", "You think it’s time (if fully developed)", "give_birth")
		else:
			addDisabledButton("Induce birth", "You need to be pregnant to do that")
			addDisabledButton("Give birth", "You need to be pregnant to do that")
			
		addButton("Leave", "Time to go", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["nurse"])

	if(state == "how_works"):
		setModuleFlag("MedicalModule", "Nursery_AskedHowWorks", true)
		
		saynn("[say=pc]How does this all work?[/say]")

		saynn("The nurse points at one of the doors.")

		saynn("[say=nurse]Inmates get pregnant. They come here and we look after them here until they give birth.[/say]")

		saynn("[say=pc]What happens to the children?[/say]")

		saynn("[say=nurse]Inmates aren’t allowed to interact with them until the end of their sentence. Too dangerous. Don’t worry, here they get proper treatment, daycare, school, everything.[/say]")

		saynn("Huh. It seems they have the whole system figured out for this.")

		saynn("[say=pc]Why let inmates get pregnant in the first place? Isn’t that kinda bad.[/say]")

		saynn("[say=nurse]That’s AlphaCorp’s policy regarding demography. And besides, the latest experimental drug therapy allowed us to speed up the gestation significantly while making sure that the baby is completely safe inside the mother's womb.[/say]")

		# (if has any womb)

		saynn("You raise your brow.")

		saynn("[say=pc]Wait. But I don’t remember going through any therapies.[/say]")

		saynn("The nurse looks at your inmate number and starts punching buttons on her old clicky keyboard.")

		saynn("[say=nurse]Let me see.. inmate number.. {pc.inmateNumber}. Yes, you went through one during your intake process. It was done by.. Doctor Quinn.[/say]")

		saynn("You remember being injected with something. But that was for something else. Did dr. Quinn lied to you?")

		saynn("[say=pc]Well okay then.[/say]")

		saynn("[say=nurse]Like I said, it has proven to be very efficient. The baby will be protected even during the heavy physical activities and any kind of sex. At the cost of the mother’s stamina.[/say]")

		saynn("Sounds very handy. You rub your chin and look down at your belly.")

		addButton("Continue", "That's nice", "")

	if(state == "children"):
		setModuleFlag("MedicalModule", "Nursery_AskedDatabase", true)
		
		saynn("[say=pc]Is there really no way to check my children?[/say]")

		saynn("[say=nurse]Not directly, no. Each time you give a birth or someone else does to your baby, we add them to the database under your name. I can show you your records.[/say]")

		addButton("Database", "Take a look at your children", "database")

	if(state == "database"):
		saynn("You ask the nurse to show you the database records. She quickly punches some buttons and turns the screen towards you.")
		
		if(GM.CS.getChildren().size() == 0):
			sayn(" - Nothing found, get to breeding!")
		else:
			saynn("- Total records found "+str(calculateAmount(true))+":")
			# (Your children here)
			printChildren(true)
		
			var other = calculateAmount(false)
			if(other > 0):
				sayn("")
				saynn("- Unrelated records found "+str(calculateAmount(false))+":")
			
				printChildren(false)
			
		
		addButton("Continue", "That's nice", "")
		
		

	if(state == "induce_birth"):
		saynn("[say=pc]Is there a way to speed up the pregnancy even more?[/say]")

		saynn("The nurse nods and then leaves her table before walking up to you with a leash in her hand.")

		saynn("[say=nurse]Follow me.[/say]")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		saynn("She clips the leash to your collar and convoys you into one of the doors. You see a long corridor connecting many rooms. The nurse walks you into one of them, it looks like any ordinary hospital chamber. A bed, a few light sources and some machinery.")

		saynn("You sit down on the bed and the nurse leashes you to it. Then she produces a loaded injector, it looks like a huge pen but with a needle.")

		saynn("[say=nurse]This will speed up the processes in your womb. You will feel very tired so you will be preserved here until tomorrow. After that, I will come and help you give birth.[/say]")

		saynn("That seems reasonable. You tilt your head to the side and let her inject you. Ow. The injector hisses as it muddies your bloodstream with some unknown to you drug.")

		saynn("[say=nurse]Now get some sleep. Don’t worry, the therapy you went through prevents you from giving birth without it being specifically induced.[/say]")

		saynn("That feels very questionable to you but you already feel the drug effects. You lay down on the bed and try to get some rest. It feels very warm down there, it’s like your womb is sucking all the energy out of you.")

		addButton("Sleep", "A nap sounds great about now", "sleep")

	if(state == "sleep"):
		saynn("You sleep in the patient’s bed. It’s not the comfiest but it’s better than nothing.")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence")

		saynn("As you open your eyes.. you see the huge belly. There is no denying it, you are ready to give birth. You can barely sit down.")

		saynn("In a few minutes the nurse comes in and takes you into some other room.")

		addButton("Continue", "Time to create life", "startbirth")

	if(state == "give_birth"):
		saynn("[say=pc]I think I’m ready.[/say]")

		saynn("The nurse gives your belly a quick look and then nods.")

		saynn("[say=nurse]Well then, follow me.[/say]")

		saynn("She takes you through one of the doors into some corridor and then into some room.")

		addButton("Continue", "Time to create life", "startbirth")

	if(state == "startbirth"):
		playAnimation(StageScene.GivingBirth, "birth", {bodyState={naked=true}})
		
		saynn("You enter the birthing room. It’s spacious and has a special bed in the middle, the one that is designed to keep your legs spread. You lay down and await your fate.")

		saynn("The nurse prepares herself, puts on all the equipment and then walks up to you. You follow all the procedures that she is giving to you.")

		saynn("She induces the birthing process to begin. Your waters break and you go into labor. You begin feeling yourself stretched out. For some reason nature likes to make us feel discomfort. And oh boy do you feel it.")

		saynn("Who said life is easy. After about an hour of painful contractions, struggling and suffering you feel like you’re about to pass out..")

		# (if more than one child)
		if(bornChildAmount > 1):
			saynn("But things aren’t always that easy. Even after giving birth to the first child your belly only deflates slightly, you’re clearly not done yet. And so the pain continues..")

		addButton("Continue", "See what happens", "continue1")

	if(state == "continue1"):
		playAnimation(StageScene.GivingBirth, "idle", {bodyState={naked=true}})
		
		var childStr = "child"
		if(bornChildAmount > 1):
			childStr = "children"
		
		saynn("You gave birth to "+str(bornChildAmount)+" "+childStr+"! The nurse congratulates you.")

		# (Who)
		sayn(bornChildString)

		saynn("You only get to spend a few minutes with your "+childStr+" before you have to go.")

		addButton("Leave", "Time to go", "endthescene")

func calculateAmount(pcKids = true):
	var amount = 0
	
	for ch in GM.CS.getChildren():
		var child: Child = ch
		if(pcKids && child.fatherID != "pc" && child.motherID != "pc"):
			continue
		if(!pcKids && (child.fatherID == "pc" || child.motherID == "pc")):
			continue
		amount += 1
	return amount

func printChildren(pcKids = true):
	var resultTable = "[table=7][cell]Name[/cell][cell]Gender[/cell][cell]Species[/cell][cell]Age[/cell][cell]Mother[/cell][cell]Father[/cell][cell]Additional[/cell]"
	
	for ch in GM.CS.getChildren():
		var child: Child = ch
		if(pcKids && child.fatherID != "pc" && child.motherID != "pc"):
			continue
		if(!pcKids && (child.fatherID == "pc" || child.motherID == "pc")):
			continue
		
		var birthDay = child.birthDay
		var daysPassed = GM.main.getDays() - birthDay
		var yearsOld:int = daysPassed / 365
		var daysOld:int = daysPassed - yearsOld * 365
		var ageStr = str(daysOld)+" days"
		if(daysOld == 1):
			ageStr = str(daysOld)+" day"
		
		if(yearsOld < 1):
			pass
		elif(yearsOld == 1):	
			ageStr = "1 year "+ageStr
		else:
			ageStr = str(yearsOld)+" years "+ageStr
		
		resultTable += "[cell]"+child.name+"[/cell]"
		resultTable += "[cell]"+"[color="+NpcGender.getColorString(child.gender)+"]"+ NpcGender.getVisibleName(child.gender)+"[/color]"+"[/cell]"
		resultTable += "[cell]"+Util.getSpeciesName(child.species)+"[/cell]"
		resultTable += "[cell]"+ageStr+"[/cell]"
		resultTable += "[cell]"+child.getMotherName()+"[/cell]"
		resultTable += "[cell]"+child.getFatherName()+"[/cell]"
		resultTable += "[cell]"+child.getMonozygotic()+"[/cell]"
		
	resultTable += "[/table]"
	saynn(resultTable)

func _react(_action: String, _args):
	if(_action == "sleep"):
		GM.main.startNewDay()
		if(GM.pc.getMenstrualCycle() != null):
			GM.pc.getMenstrualCycle().speedUpPregnancy()
		GM.pc.afterSleepingInBed()
	
	if(_action == "startbirth"):
		var bornChildren = GM.pc.giveBirth()
		bornChildAmount = bornChildren.size()
		
		bornChildString = ""
		for child in bornChildren:
			var fatherObject = GlobalRegistry.getCharacter(child.fatherID)
			var fatherName = "unknown"
			if(fatherObject != null):
				fatherName = fatherObject.getName()
			
			bornChildString += child.name+" - "+"[color="+NpcGender.getColorString(child.gender)+"]"+ NpcGender.getVisibleName(child.gender)+"[/color]"+" - "+Util.getSpeciesName(child.species)+" - "+"Father: "+fatherName +" [color="+"#f0dd61"+"]"+child.bornFromMonozygotic+"[/color]" +"\n"
		processTime(60*60)
		
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["bornChildAmount"] = bornChildAmount
	data["bornChildString"] = bornChildString
	data["receivedApple"] = receivedApple
	
	return data
	
func loadData(data):
	.loadData(data)
	
	bornChildAmount = SAVE.loadVar(data, "bornChildAmount", 0)
	bornChildString = SAVE.loadVar(data, "bornChildString", "")
	receivedApple = SAVE.loadVar(data, "receivedApple", false)
