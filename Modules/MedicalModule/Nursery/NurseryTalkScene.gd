extends "res://Scenes/SceneBase.gd"

var bornChildAmount = 0
var bornChildString = ""

func _init():
	sceneID = "NurseryTalkScene"

func _run():
	if(state == ""):
		GM.main.playAnimation(StageScene.Duo, "sit", {pc = "nurse", npc="pc", npcAction="stand"})
		addCharacter("nurse")
		
	if(state == ""):
		if(!GM.main.getFlag(MedicalModule.Nursery_Introduced)):
			GM.main.setFlag(MedicalModule.Nursery_Introduced, true)
			
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

			# (if ready to give birth)
			if(GM.pc.isVisiblyPregnant()):
				saynn("[say=nurse]Came to give birth?[/say]")

			# (else)
			else:
				saynn("[say=nurse]Need something, inmate?[/say]")
		
		
		addButton("How works", "Ask her how everything works", "how_works")
		
		if(getFlag(MedicalModule.Nursery_AskedHowWorks, false)):
			if(!getFlag(MedicalModule.Nursery_AskedDatabase, false)):
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

	if(state == "how_works"):
		setFlag(MedicalModule.Nursery_AskedHowWorks, true)
		
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
		setFlag(MedicalModule.Nursery_AskedDatabase, true)
		
		saynn("[say=pc]Is there really no way to check my children?[/say]")

		saynn("[say=nurse]Not directly, no. Each time you give a birth or someone else does to your baby, we add them to the database under your name. I can show you your records.[/say]")

		addButton("Database", "Take a look at your children", "database")

	if(state == "database"):
		saynn("You ask the nurse to show you the database records. She quickly punches some buttons and turns the screen towards you.")
		
		if(GM.CS.getChildren().size() == 0):
			sayn(" - Nothing found, get to breeding!")
		else:
			saynn("- Total records found "+str(GM.CS.getChildren().size())+":")
		# (Your children here)
		for ch in GM.CS.getChildren():
			var child: Child = ch
			
			var birthDay = child.birthDay
			var daysPassed = GM.main.getDays() - birthDay
			var yearsOld:int = daysPassed / 365
			var daysOld:int = daysPassed - yearsOld * 365
			var ageStr = str(daysOld)+" days old"
			if(daysOld == 1):
				ageStr = str(daysOld)+" day old"
			
			if(yearsOld == 1):	
				ageStr = "1 year "+ageStr
			else:
				ageStr = str(yearsOld)+" years "+ageStr
			
			var resultString = "[color="+ChildGender.getColorString(child.gender)+"]"+ ChildGender.getVisibleName(child.gender)+"[/color]"+" - "
			resultString += Util.getSpeciesName(child.species)+" - "
			resultString += ageStr+" - "
			
			var fatherObject = GlobalRegistry.getCharacter(child.fatherID)
			var motherObject = GlobalRegistry.getCharacter(child.motherID)
			var fatherName = "unknown"
			var motherName = "unknown"
			if(fatherObject != null):
				fatherName = fatherObject.getName()
			if(motherObject != null):
				motherName = motherObject.getName()
			
			resultString += "Mother: "+motherName+", Father: "+fatherName
			
			sayn(resultString)
			
		
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
		saynn("You enter the birthing room. It’s spacious and has a special bed in the middle, the one that is designed to keep your legs spread. You lay down and await your faith.")

		saynn("The nurse prepares herself, puts on all the equipment and then walks up to you. You follow all the procedures that she is giving to you.")

		saynn("She induces the birthing process to begin. Your waters break and you go into labor. You begin feeling yourself stretched out. For some reason nature likes to make us feel discomfort. And oh boy do you feel it.")

		saynn("Who said life is easy. After about an hour of painful contractions, struggling and suffering you feel like you’re about to pass out..")

		# (if more than one child)
		if(bornChildAmount > 1):
			saynn("But things aren’t always that easy. Even after giving birth to the first child your belly only deflates slightly, you’re clearly not done yet. And so the pain continues..")

		addButton("Continue", "See what happens", "continue1")

	if(state == "continue1"):
		var childStr = "child"
		if(bornChildAmount > 1):
			childStr = "children"
		
		saynn("You gave birth to "+str(bornChildAmount)+" "+childStr+"! The nurse congratulates you.")

		# (Who)
		sayn(bornChildString)

		saynn("You only get to spend a few minutes with your "+childStr+" before you have to go.")

		addButton("Leave", "Time to go", "endthescene")


func _react(_action: String, _args):
	if(_action == "sleep"):
		GM.main.startNewDay()
		if(GM.pc.getMenstrualCycle() != null):
			GM.pc.getMenstrualCycle().speedUpPregnancy()
		GM.pc.afterSleepingInBed()
	
	if(_action == "startbirth"):
		GM.pc.clearOrificeFluids()
		if(GM.pc.getMenstrualCycle() != null):
			var bornChildren = GM.pc.getMenstrualCycle().giveBirth()
			bornChildAmount = bornChildren.size()
			bornChildString = ""
			
			for child in bornChildren:
				GM.CS.addChild(child)
				
				var fatherObject = GlobalRegistry.getCharacter(child.fatherID)
				var fatherName = "unknown"
				if(fatherObject != null):
					fatherName = fatherObject.getName()
				
				bornChildString += "[color="+ChildGender.getColorString(child.gender)+"]"+ ChildGender.getVisibleName(child.gender)+"[/color]"+" - "+Util.getSpeciesName(child.species)+" - "+"Father: "+fatherName+"\n"
		processTime(60*60)
		
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["bornChildAmount"] = bornChildAmount
	data["bornChildString"] = bornChildString
	
	return data
	
func loadData(data):
	.loadData(data)
	
	bornChildAmount = SAVE.loadVar(data, "bornChildAmount", 0)
	bornChildString = SAVE.loadVar(data, "bornChildString", "")
