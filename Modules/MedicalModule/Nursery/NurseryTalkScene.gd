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
			
#			saynn("You approach the nurse and try to get her attention. She drags her gaze away from the screen and looks at you.")
			
			saynn("You wander over to the nurse's desk, the little name placard says her name is 'Minuette'.")

			saynn("[say=pc]What’s this room for?[/say]")

			saynn("The nurse barely looks up from her work on her reception computer.")
			saynn("[say=nurse]This is a nursery, inmate. A place for the prison’s mothers.[/say]")
			saynn("It's only then the nurse decides to look you over. Making brief eye contact.")

			if(GM.pc.isHeavilyPregnant()):
				saynn("She then eyes you out and notices your pregnant belly.")
				saynn("[say=nurse]Yeah, you'll need to come here soon enough.[/say]")
				if(GM.pc.getInmateType() == InmateType.HighSec):
					saynn("[say=nurse]And, please do me a favor and don't smash the place like the other Red Block inmates. Please and Thank you.[/say]")
			elif(GM.pc.isVisiblyPregnant()):
				saynn("She then eyes you out and notices your pregnant belly.")
				
				saynn("[say=nurse]You're too late for birth control and you're too early to deliver. You'll need to see me sometime later.[/say]")
				if(GM.pc.getInmateType() == InmateType.HighSec):
					saynn("[say=nurse]And, please do me a favor and don't smash the place like the other Red Block inmates. Please and Thank you.[/say]")

			if(GM.pc.isReadyToGiveBirth()):
				saynn("She then eyes you out and notices your pregnant belly.")
				saynn("[say=nurse]You look ready to drop already, if you wanna get that over with just let me know.[/say]")
				if(GM.pc.getInmateType() == InmateType.HighSec):
					saynn("[say=nurse]And, please do me a favor and don't smash the place like the other Red Block inmates. Please and Thank you.[/say]")
			saynn("Well then. You look around. It looks more like a lobby, a few benches are placed near the white walls. You notice a few pictures there and there, all of them clearly drawn by someone young. There are two other doors, apart from the one that you walked in through.")

		else:
			saynn("You approach the nurse's desk again, the same name placard of 'Minuette' stands atop it. She drags her gaze away from the screen and looks at you.")

			# (if player has the perk FertilityProudMom and didn't get an apple today)
			if(receivedApple):
				saynn("[say=nurse]Oh hey, your name is on my nice list, I try to make sure that every mom on there gets some kind of benefit in this place, take this.[/say]")
				saynn("She pulls a fresh apple from under her desk somewhere and hands it off to you.")
			
			elif(GM.pc.isReadyToGiveBirth()):
				saynn("[say=nurse]You look ready to drop, wanna get that over with?[/say]")
			
			elif(GM.pc.isHeavilyPregnant()):
				saynn("[say=nurse]Came to give birth?[/say]")
			
			# (if ready to give birth)
			elif(GM.pc.isVisiblyPregnant()):
				saynn("[say=nurse]If you want help with your pregnancy, let me know.[/say]")
			
			# (else)
			else:
				saynn("[say=nurse]Need something, inmate?[/say]")
		
		
		addButton("How works", "Ask her how everything works", "how_works")
		addButton("Working here", "Ask her what it's like working here.", "nursework")
		
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

		saynn("[say=nurse]Inmates get pregnant. We offer help as best we can, and when the time comes, inmates deliver through there.[/say]")

		saynn("[say=pc]What happens to all the children?[/say]")

		saynn("[say=nurse]Inmates aren’t allowed to interact with them until their sentence is over and someone clears them to meet them. Too dangerous otherwise. Don’t worry, here they get proper treatment, daycare, school, everything.[/say]")

		saynn("Huh. It seems they have the whole system figured out for this.")

		saynn("[say=pc]Why let inmates get pregnant in the first place? Isn’t that kinda bad?[/say]")

		saynn("[say=nurse]That’s AlphaCorp’s policy regarding demography. And besides, the latest experimental drug therapy makes everything perfectly safe.[/say]")

		# (if has any womb)

		saynn("You raise your brow.")

		saynn("[say=pc]Wait. But I don’t remember going through any therapies.[/say]")

		saynn("The nurse looks at your inmate number and starts punching buttons on her old clicky keyboard.")

		saynn("[say=nurse]Let me see.. inmate number.. {pc.inmateNumber}. Yes, you went through one during your intake process. It was done by.. Doctor Quinn.[/say]")

		saynn("You remember being injected with something. But that was for something else. Did dr. Quinn lie to you?")

		saynn("[say=pc]What [i]exactly[/i] did I get?[/say]")

		saynn("[say=nurse]Well... I'm not [i]supposed[/i] to tell an inmate like you... but you know, with the amount of crazy and belligerent inmates I have to deal with when they suddenly show and start yelling about a 'certain' fight they lost or what's happening to them. It makes my job rather difficult.[/say]")
		saynn("[say=nurse]And I just so happen to let the information slip in the hopes it makes my job slightly easier...[/say]")
		
		saynn("She motions to lean in closer so she can quickly whisper the answer to you.")
		
		saynn("[say=nurse]You got one the experimental variants of AlphaCorp's Fertility drugs, it should've completed by the time you woke up on your first day.[/say]")
		saynn("[say=nurse]Don't worry about something [i]entirely[/i] weird happening to you, it still has benefits if you don't have a uterus, and all the staff get the same treatment for working in deep space, like this prison.[/say]")
		saynn("[say=nurse]Namely, it should have massively boosted physical protection of your womb and any offspring you make, to the point anything in your womb will survive anything this place will throw at you.[/say]")
		saynn("[say=nurse]And secondly, it will have altered how your offspring develops, progressing at a rate set by a Corporate Medical Officer. And as much as Corporate is full of idiots, they're smart enough to not let inmates give birth at random. Once someone starts feeling false contractions, they'll have to come here to get induced.[/say]")

		saynn("The nurse pushes you away and returns to her normal voice.")
		saynn("[say=nurse]That should be everything, inmate[/say]")

		saynn("Curious... You rub your chin and look down at your belly.")

		addButton("Continue", "That's nice", "")

	if(state == "nursework"):
		saynn("[say=pc]So, what is like working here?[/say]")
		saynn("The nurse looks up at you with tired eyes, clearly mulling over how she should answer your question.")
		saynn("[say=nurse]I work Labor and Delivery in a prison with already violent and degenerate inmates. A lot of inmates do not handle pregnancy well. Do you need more to get the idea?[/say]")
		saynn("[say=pc]Uh, No thanks, I get it...[/say]")
		saynn("[say=nurse]It's certainly not everyone that comes through here, but I can tell you I've seen the worst fights in this place.[/say]")
		saynn("The nurse returns to her computer work while you mull over her words...")

		addButton("Continue", "", "")
	if(state == "children"):
		setModuleFlag("MedicalModule", "Nursery_AskedDatabase", true)
		
		saynn("[say=pc]Is there really no way to check my children?[/say]")

		saynn("[say=nurse]Not directly, no. Each time you give a birth or someone else does to your baby, we do add them to the database under your name. I can show you your records.[/say]")

		addButton("Database", "Take a look at your children", "database")

	if(state == "database"):
		saynn("You ask the nurse to show you the database records. She quickly punches some buttons and turns the screen towards you.")
		
		if(OPTIONS.getMaxKeepPCKids() > 0 || !OPTIONS.shouldOptimizeKids()):
			if(GM.CS.getChildren().size() == 0):
				sayn(" - Nothing found, get to breeding!")
			else:
				saynn("- Total records found "+str(calculateAmount(true))+":")
				# (Your children here)
				printChildren(true)
			
		var archivedAmount:int = GM.CS.getArchiveChildCountMotherOrFather("pc")
		if(archivedAmount <= 0 && !(OPTIONS.getMaxKeepPCKids() > 0 || !OPTIONS.shouldOptimizeKids())):
			sayn(" - Nothing found, get to breeding!")
		elif(archivedAmount > 0):
			sayn("")
			sayn("Archived records ("+str(archivedAmount)+"):")
			
			var resultTable:String = "[font=res://Fonts/normalconsolefont.tres][table=3][cell]Mother[/cell][cell]Father[/cell][cell]Amount[/cell]"
			
			for recordKey in GM.CS.archive:
				var splitData:Array = recordKey.split(";")
				if(splitData.size() < 2):
					continue
				var motherID:String = splitData[0]
				var fatherID:String = splitData[1]
				
				if(motherID == "pc" || fatherID == "pc"):
					var motherChar = getCharacter(motherID)
					var fatherChar = getCharacter(fatherID)
					var motherName:String = motherChar.getName() if motherChar != null else "unknown"
					var fatherName:String = fatherChar.getName() if fatherChar != null else "unknown"
					var kidAmount:int = GM.CS.archive[recordKey]
					
					resultTable += "[cell]"+motherName+"[/cell][cell]"+fatherName+"[/cell][cell]"+str(kidAmount)+"[/cell]"
					
			resultTable += "[/table][/font]"
			sayn(resultTable)
					
			var other = calculateAmount(false)
			if(other > 0):
				sayn("")
				saynn("- Unrelated records found "+str(calculateAmount(false))+":")
			
				printChildren(false)
			
		var archivedNPCAmount:int = GM.CS.getArchiveChildCountNonPC()
		if(archivedNPCAmount > 0):
			sayn("")
			sayn("Unrelated archived records ("+str(archivedNPCAmount)+"):")
			
			var resultTable:String = "[font=res://Fonts/normalconsolefont.tres][table=3][cell]Mother[/cell][cell]Father[/cell][cell]Amount[/cell]"
			
			for recordKey in GM.CS.archive:
				var splitData:Array = recordKey.split(";")
				if(splitData.size() < 2):
					continue
				var motherID:String = splitData[0]
				var fatherID:String = splitData[1]
				
				if(motherID != "pc" && fatherID != "pc"):
					var motherChar = getCharacter(motherID)
					var fatherChar = getCharacter(fatherID)
					var motherName:String = motherChar.getName() if motherChar != null else "unknown"
					var fatherName:String = fatherChar.getName() if fatherChar != null else "unknown"
					var kidAmount:int = GM.CS.archive[recordKey]
					
					resultTable += "[cell]"+motherName+"[/cell][cell]"+fatherName+"[/cell][cell]"+str(kidAmount)+"[/cell]"
					
			resultTable += "[/table][/font]"
			sayn(resultTable)
			
		
		addButton("Continue", "That's nice", "")
		
		

	if(state == "induce_birth"):
		saynn("[say=pc]Is there a way to speed up the pregnancy even more?[/say]")

		saynn("The nurse nods and then leaves her table, taking an inmate leash from her belt before walking up to you with the clip open.")

		saynn("[say=nurse]Follow me.[/say]")

		addButton("Follow", "See where she brings you", "follow")

	if(state == "follow"):
		playAnimation(StageScene.Sleeping, "sleeping")
		saynn("She clips the leash to your collar and convoys you into one of the doors. You see a long corridor connecting many rooms. The nurse walks you into one of them, it looks like any ordinary hospital chamber. A bed, a few light sources and some machinery.")

		saynn("You sit down on the bed and the nurse leashes you to it. Then she produces a loaded injector, it looks like a huge pen but with a needle.")

		saynn("[say=nurse]This will speed up the processes in your womb. You will feel very tired so you will be preserved here until tomorrow. After that, I will come and help you give birth.[/say]")

		saynn("That seems reasonable. You tilt your head to the side and let her inject you. Ow. The injector hisses as it muddies your bloodstream with some unknown to you drug.")

		saynn("[say=nurse]Now get some sleep. Don’t worry, the therapy you went through prevents you from giving birth without it being specifically induced.[/say]")

		saynn("The nurse helps you get settled, putting one of those heart monitors on your finger while another gets wrapped around your bare stomach. She continues to work but since she doesnt do anything directly to you again you lose all interest.")

		saynn("[say=nurse]All set, get some good rest...[/say]")

		saynn("That feels very questionable to you but you already feel the drug effects. You lay down on the bed and try to get some rest. It feels very warm down there, it’s like your womb is sucking all the energy out of you.")

		addButton("Sleep", "A nap sounds great about now", "sleep")

	if(state == "sleep"):
		playAnimation(StageScene.GivingBirth, "idle", {bodyState={naked=true}})
		saynn("You sleep in the patient’s bed. It’s not the comfiest but it’s better than nothing.")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence")

		saynn("As you open your eyes.. you see your own huge belly. Your eyes widen as you give it a explorative touch, and you blink in surprise when you feel it, amazed at just how fast this must have happened. There is no denying it, you are ready to give birth. You can barely sit down.")

		saynn("Unsure of what to really do aside from listen to the beeping heart montiors, you simply cradle your large middle with both hands, and simply wait for whatever nurse to show up.")

		saynn("A dull ache in your belly gets worse as you wait, simply enduring it until the same nurse enters your room once again.")
		
		saynn("[say=nurse]Hello again, Time to go, come on, I'll help you.[/say]")

		addButton("Continue", "Time to create life", "startbirth")

	if(state == "give_birth"):
		saynn("[say=pc]I think I’m ready.[/say]")

		saynn("The nurse gives your belly a quick look and then nods.")

		saynn("[say=nurse]Well then, follow me.[/say]")

		saynn("She takes you through one of the doors into some corridor and then into some room.")

		addButton("Continue", "Time to create life", "startbirth")

	if(state == "startbirth"):
		playAnimation(StageScene.GivingBirth, "birth", {bodyState={naked=true}})
		
		saynn("You enter the birthing room with the help of the nurse. It’s spacious and has a special bed in the middle, the one that is designed to keep your legs spread. A few nurses come in and out to prepare as you get your collar clipped to the bed. You lay down and await your fate.")

		saynn("The main nurse gets the birthing process started as soon as it's confirmed you're on the appropriate painkillers, letting things get going as the last preperations are made and the majority of the other nurses leave again.")
		
		saynn("Your content to just let them do their work while you lay there and take deep breaths while your belly has its first cramps. Someone asks if they need to use the heavy restraints on you but someone else dismisses them.")
		
		saynn("Once your waters break everyone gets settled in. You follow the instructions the main delivery nurse gives you as nature takes it's course. And 'Nature' means incredible pain and discomfort.")
		
		saynn("It feels like many hours as you work to push out your offspring, gradually stretching yourself out... Life certainly isnt easy and you feel like you're about to pass out...")
		
		# (if more than one child)
		if(bornChildAmount > 1):
			saynn("But things aren’t always that easy. Even after giving birth to the first child your belly only deflates slightly, still feeling the pain of contractions and the protesting movement of your remaining progeny, you’re clearly not done yet. Huffing and groaning as the pain continues..")

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
	var resultTable = "[font=res://Fonts/normalconsolefont.tres][table=7][cell]Name[/cell][cell]Gender[/cell][cell]Species[/cell][cell]Age[/cell][cell]Mother[/cell][cell]Father[/cell][cell]Extra[/cell]"
	
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
		
	resultTable += "[/table][/font]"
	sayn(resultTable)

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

func getSceneCreator():
	return "Rahi & AverageAce"
