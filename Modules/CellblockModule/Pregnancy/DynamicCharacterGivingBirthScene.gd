extends SceneBase

var npcID = ""
var npcType = "kind"
var isStaff = true
var charType = "staff member"
var charTypes = "staff members"
var decidedToHit = false
var bornString = ""
var bornChildAmount = 0

func _init():
	sceneID = "DynamicCharacterGivingBirthScene"

func _initScene(_args = []):
	npcID = _args[0]
	addCharacter(npcID)
	
	npcType = "kind"
	var npc = GlobalRegistry.getCharacter(npcID)
	var personality:Personality = npc.getPersonality()
	if(personality.getStat(PersonalityStat.Mean) > 0.3 || personality.getStat(PersonalityStat.Subby) < -0.6):
		npcType = "mean"
	if(personality.getStat(PersonalityStat.Subby) > 0.6 || personality.getStat(PersonalityStat.Coward) > 0.8):
		npcType = "subby"
	
	if(npc.getCharacterType() == CharacterType.Inmate):
		isStaff = false
		charType = "inmate"
		charTypes = "inmates"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		if (npcType == "kind"):
			saynn("As you wander around the prison, you notice a familiar figure. It's {npc.name}, one of the "+str(charTypes)+" that you got pregnant.. {npc.He} spots you and hurries towards you, {npc.his} face shows a mixture of excitement and worry.")

			var randomNpcLine = RNG.pick(["Hey, it's you. I've been looking for you everywhere. I.. I need your help. With this..", "I've been searching for you, hoping you would assist me. I need your help now more than ever.", "Can you please help me? It's kinda urgent..", "Oh, I finally found you. I really need your help.", "I'm sorry for approaching you like this but I don't have anyone else."])
			saynn("[say=npc]"+str(randomNpcLine)+"[/say]")

			saynn("{npc.He} shows you {npc.his} swollen pregnant belly. And, it seems, {npc.he} is ready to give birth..")

			var randomNpcLine2 = RNG.pick(["I think it's happening, I keep feeling contractions..", "I'm pregnant and I can't do this alone. I think it's already happening.. Will you please help me?", "I'm scared and I don't know what to do..", "I feel the contractions.. I'm scared.."])
			saynn("[say=npc]"+str(randomNpcLine2)+"[/say]")

		elif (npcType == "mean"):
			saynn("As you wander around the prison, you notice a familiar figure. It's {npc.name}, one of the "+str(charTypes)+" that you got pregnant.. Oh no.. {npc.He} spots you and hurries towards you, {npc.his} face shows anger.")

			var randomNpcLine = RNG.pick(["Oh, great, it's you! Took your sweet time, didn't you? I've been searching all over this damn station. I can't believe I have to ask you for help.", "Don't even try to act surprised! You know damn well what you've done.", "I can't believe I'm even considering asking you for help, but here it goes."])
			saynn("[say=npc]"+str(randomNpcLine)+"[/say]")

			saynn("{npc.He} shows you {npc.his} swollen pregnant belly. And, it seems, {npc.he} is ready to give birth..")

			var randomNpcLine2 = RNG.pick(["I'm pregnant! And it's all because of you. Now I need your sorry ass to do something about it. Fast..", "Of all the people to get knocked up by in this hellhole, it had to be you. What are you gonna do about it?", "Congratulations, I'm pregnant. I can't believe I'm saying this, but I need your sorry ass to step up and help me.", "I'm pregnant and I can't handle this on my own. So quit avoiding responsibility and help me, for once.", "Guess what? I'm fucking pregnant. And I need your help, you selfish jerk..", "Congratulations, you're made me a mother. Now, are you going to step up and assist me, or should I handle it myself?", "I'm pregnant, and whether you like it or not, you're involved. So, are you going to be useful and help or should I find someone else?", "Listen, I'm pregnant, and I need your damn help."])
			saynn("[say=npc]"+str(randomNpcLine2)+"[/say]")

		elif (npcType == "subby"):
			saynn("As you wander around the prison, you notice a familiar figure. It's {npc.name}, one of the "+str(charTypes)+" that you got pregnant.. {npc.He} spots you and blushes before slowly approaching you, {npc.his} shy face shows a mixture of excitement and worry.")

			var randomNpcLine = RNG.pick(["Um, excuse me.. It's, uh, you. I've been looking for you. I.. I need your help, if you don't mind..", "Hi, it's me.. I don't know if you remember me.. I..", "Um, hi. I've been looking for you. I don't know who else to ask..", "H-Hey, it's you. I.. I've been.. looking for you.", "Um, excuse me.. I'm sorry to bother you but.."])
			saynn("[say=npc]"+str(randomNpcLine)+"[/say]")

			saynn("{npc.He} shows you {npc.his} swollen pregnant belly. And, it seems, {npc.he} is ready to give birth..")

			var randomNpcLine2 = RNG.pick(["I-I.. I'm pregnant.. And I think.. it's happening..", "I.. I'm pregnant and it's getting really close.. Maybe you could.. help me? Please?..", "I'm pregnant and I'm scared because I think it's about to happen.. Would you mind.. helping me through this?..", "I'm pregnant and I need someone to be there.. because I'm scared.. Would you.. be willing to help?"])
			saynn("[say=npc]"+str(randomNpcLine2)+"[/say]")

		addButton("Help", "Help them get to the medical wing and give birth", "help_them")
		addButton("Not my problem", "Tell them that it's their problem", "tell_not_my_problem")
	if(state == "tell_not_my_problem"):
		saynn("You really don't wanna do this right now.")

		var randomResponce = RNG.pick(["Look, your pregnancy is not my problem. Deal with it on your own.", "I really don't have time for this, just go to the medical wing.", "Seriously? You expect me to drop everything and help you with your pregnancy? I'm not here to handle your problems.", "I have my own problems to deal with. Your pregnancy is not my concern.", "Look, I didn't sign up for this. Your pregnant belly is not my responsibility.", "Why should I care about your pregnant belly? It's not like we planned any of this. Figure it out yourself."])
		saynn("[say=pc]"+str(randomResponce)+"[/say]")

		if (npcType == "kind"):
			saynn("The "+str(charType)+" gets sad sighs, still carefully supporting {npc.his} big belly with {npc.his} hands.")

			var randomNpcLine = RNG.pick(["Oh.. I see. I thought you would care. I guess I was wrong.", "I didn't expect you to be so cold-hearted.. I thought we had some connection.. But I guess I was wrong.", "I will figure this out on my own then..", "I guess I was hoping for too much from some inmate..", "This pregnancy is overwhelming.. I thought I could rely on you.. Guess not..", "It's okay. I understand. I will try to get to the medical on my own. Didn't mean to burden you with my problems..", "Okay. I will try to get to the medical on my own.."])
			saynn("[say=npc]"+str(randomNpcLine)+"[/say]")

		elif (npcType == "mean"):
			if (decidedToHit):
				saynn("The "+str(charType)+" gets so annoyed with your answer that {npc.he} punches you in the chest with full force.")

			else:
				saynn("The "+str(charType)+" looks at you with {npc.his} annoyed eyes, {npc.his} hands clenching into fists.")

			var randomNpcLine = RNG.pick(["Typical! I should have known better than to expect any decency from you. Fucker!", "Fine, fuck you too then! I don't need your help anyway. I will manage on my own.", "You fucker. Fine. I will handle this alone, just like I've had to from the beginning.", "Oh, how silly of me to think you might care. I will remember this when I'm holding my baby, knowing that I did it all without you!"])
			saynn("[say=npc]"+str(randomNpcLine)+"[/say]")

		elif (npcType == "subby"):
			saynn("The "+str(charType)+" lowers {npc.his} head, {npc.his} hands gently rub {npc.his} belly.")

			var randomNpcLine = RNG.pick(["Oh.. Okay. I understand. I'm sorry for bothering you..", "I.. I didn't mean to impose. I will manage on my own. Sorry for asking..", "Oh.. I guess I will go now. Sorry for wasting your time..", "I.. I'll handle this on my own. Sorry for burdening you with my situation..", "I will find my own way to the medical wing. Sorry for bothering you with my troubles.."])
			saynn("[say=npc]"+str(randomNpcLine)+"[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "help_them"):
		aimCameraAndSetLocName("medical_nursery")
		GM.pc.setLocation("medical_nursery")
		saynn("[say=pc]Okay, let's go then.[/say]")

		saynn("You grab {npc.name}'s hand and guide {npc.him} through the corridors of the prison. Eventually you arrive at the nursery lobby.")

		saynn("Inside, a nurse quickly takes notice of the situation and rushes to assist. She guides {npc.name} to a private room with lots of light and a special hospital bed.")

		addButton("Continue", "See what happens next", "before_birth")
	if(state == "before_birth"):
		playAnimation(StageScene.GivingBirth, "birth", {pc=npcID, bodyState={naked=true}})
		if (npcType == "kind"):
			saynn("You stand by {npc.name} side while {npc.he} listens to the nurse's orders. Then {npc.he} reaches {npc.his} hand to you and smiles nervously. You decide to hold it, to help {npc.him} feel calmer.")

			saynn("Contractions are happening, causing {npc.name} to groan from the pain while clenching your hand.")

			saynn("[say=pc]"+str(RNG.pick(["You're doing great. Just breathe through it. I'm here with you.", "You can do it. Push when the nurse tells you.", "I believe in you, listen to the nurse."]))+"[/say]")

			saynn("[say=npc]"+str(RNG.pick(["Thank you for being here..", "I don't know how would I do it without you..", "I couldn't go through this alone.. thank you.."]))+"[/say]")

		elif (npcType == "mean"):
			saynn("You stand by {npc.name} side while {npc.he} listens to the nurse's orders. You offer your hand to {npc.him} but it seems {npc.he} doesn't need it.")

			saynn("[say=npc]"+str(RNG.pick(["I'm strong, I don't need your pity.. ah..", "Do I look like I need your hand? Ah..", "Holding hands is for softies.. ah..", "I'm gonna give birth without any hand holding.. ah.."]))+"[/say]")

			saynn("Contractions are happening, causing {npc.name} to groan from the pain and eventually grab your hand before clenching it tight.")

		elif (npcType == "subby"):
			saynn("You stand by {npc.name} side while {npc.he} listens to the nurse's orders and tries {npc.his} best not to make too much noise, probably feeling embarrassed. You decide to grab {npc.his} hand and hold it tightly which makes {npc.him} blush deeply.")

			saynn("[say=pc]"+str(RNG.pick(["You're doing great. Just breathe through it. I'm here with you.", "You can do it. Push when the nurse tells you.", "I believe in you, listen to the nurse.", "Don't hold it, it's okay to scream if you need to."]))+"[/say]")

			saynn("[say=npc]"+str(RNG.pick(["Yeah.. okay.. ah..", "Thank you.. ah.."]))+"[/say]")

		saynn("The room fills with tension as {npc.name} produces more and more painful cries when the contractions become faster and harder.")

		addButton("Continue", "See what happens next", "do_birth")
	if(state == "do_birth"):
		playAnimation(StageScene.GivingBirth, "idle", {pc=npcID, bodyState={naked=true}})
		if (bornChildAmount == 1):
			saynn("{npc.name} gave birth to "+str(bornChildAmount)+" kid!")

		else:
			saynn("{npc.name} gave birth to "+str(bornChildAmount)+" kids!")

		saynn(""+str(bornString)+"")

		addButton("Continue", "See what happens next", "after_birth")
	if(state == "after_birth"):
		playAnimation(StageScene.SexStart, "start", {pc = "pc", npc=npcID, npcBodyState={naked=true}})
		if (bornChildAmount <= 1):
			saynn("Moments pass like an eternity until finally, the sound of a newborn's cry fills the air.")

			saynn("{npc.name}'s eyes shine with tears of relief and joy. {npc.He} waits for the nurse to carefully clean {npc.his} child and then begins cradling in {npc.his} hands.")

		elif (bornChildAmount == 2):
			saynn("Moments pass like an eternity until finally, the sound of a newborn's cry fills the air. Oh.. But not just one.. Soon {npc.name} gives birth to another kid..")

			saynn("{npc.name}'s eyes shine with tears of relief and joy. {npc.He} waits for the nurse to carefully clean {npc.his} child and then begins cradling one of them in {npc.his} hands.")

		else:
			saynn("Moments pass like an eternity until finally, the sound of a newborn's cry fills the air. Oh.. But not just one.. Soon {npc.name} gives birth to another kid.. But even after that, {npc.his} belly is still big, meaning there is more..")

			saynn("It's only when {npc.name} gives birth to the last child, {npc.his} eyes begin to shine with tears of relief and joy. {npc.He} waits for the nurse to carefully clean {npc.his} child and then begins cradling one of them in {npc.his} hands.")

		saynn("[say=npc]"+str(RNG.pick(["Oh.. oh my.. so perfect.. Look at the tiny fingers and those little eyes.. So beautiful..", "Hi, mommy loves you more than words can express.. welcome to the world, my precious..", "I can't believe I brought this incredible life into existence.. I can't live without you already..", "I will do everything in my power to give you the life you deserve.."]))+"[/say]")

		saynn("{npc.He} gently kisses {npc.his} baby's forehead while you stand nearby and smile.")

		saynn("[say=pc]You did an amazing job.[/say]")

		saynn("You both just stare at the new life for a while..")

		saynn("Eventually the nurse begins telling you that the mother needs rest. Fair enough..")

		if (bornChildAmount <= 1):
			saynn("You give the mommy and {npc.his} kid a last good-bye look before stepping out into the lobby.")

		else:
			saynn("You give the mommy and {npc.his} kids a last good-bye look before stepping out into the lobby.")

		saynn("Time to go..")

		addButton("Continue", "That was something", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "help_them"):
		processTime(10*60)

	if(_action == "tell_not_my_problem"):
		if(npcType=="mean"):
			if(RNG.chance(50) && !getCharacter(npcID).hasBoundArms()):
				decidedToHit = true
				GM.pc.addPain(30)
				addMessage("Ow..")

	if(_action == "before_birth"):
		processTime(3*60)

	if(_action == "do_birth"):
		processTime(35*60)
		var bornChilds = getCharacter(npcID).giveBirth()
		bornChildAmount = bornChilds.size()
		bornString = GM.CS.getChildBirthInfoString(bornChilds)
		GM.pc.addSkillExperience(Skill.Breeder, 50) # Reward for being near
		if(GM.main.IS.hasPawn(npcID)):
			GM.main.IS.stopInteractionsForPawnID(npcID)
			GM.main.IS.getPawn(npcID).setLocation("medical_nursery")
		else:
			GM.main.IS.spawnPawn(npcID)
			if(GM.main.IS.hasPawn(npcID)):
				GM.main.IS.getPawn(npcID).setLocation("medical_nursery")

	setState(_action)

func saveData():
	var data = .saveData()

	data["npcID"] = npcID
	data["npcType"] = npcType
	data["isStaff"] = isStaff
	data["charType"] = charType
	data["charTypes"] = charTypes
	data["decidedToHit"] = decidedToHit
	data["bornString"] = bornString
	data["bornChildAmount"] = bornChildAmount

	return data

func loadData(data):
	.loadData(data)

	npcID = SAVE.loadVar(data, "npcID", "")
	npcType = SAVE.loadVar(data, "npcType", "kind")
	isStaff = SAVE.loadVar(data, "isStaff", true)
	charType = SAVE.loadVar(data, "charType", "staff member")
	charTypes = SAVE.loadVar(data, "charTypes", "staff members")
	decidedToHit = SAVE.loadVar(data, "decidedToHit", false)
	bornString = SAVE.loadVar(data, "bornString", "")
	bornChildAmount = SAVE.loadVar(data, "bornChildAmount", 0)
