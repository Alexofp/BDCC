extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventTentacles4Scene"

func _run():
	if(state == ""):
		setFlag("ArticaModule.gaveBirthToEggs", true)
		setFlag("ArticaModule.nextReaction", "t4hap")
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("As you approach Artica, you find her in a state of distress.. She is panting heavily and holding her arms wrapped around her incredibly swollen belly. Her eyes are wide from fear as looked up at you with a pleading expression.")

		saynn("[say=artica]I.. I.. t-think.. t-they w-want to..[/say]")

		saynn("[say=pc]You think you're about to give birth?[/say]")

		saynn("[say=artica]Uhh.. umm-m.. ah.. k-kinda..[/say]")

		saynn("Whatever it is, better to show her to the doctor.")

		addButton("Medical!", "Bring Artica to the medical", "in_medical")
	if(state == "in_medical"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="eliza"})
		aimCameraAndSetLocName("med_lobbymain")
		GM.pc.setLocation("med_lobbymain")
		saynn("You grab Artica by her paw and carefully guide her to the main elevator. It starts bringing you down to the lower floor..")

		saynn("[say=artica]T-these a-are not.. p-pups.. I.. I g-got.. um..[/say]")

		saynn("You pretend that you don't understand what she is talking about.")

		saynn("[say=pc]Don't worry, I got you.[/say]")

		saynn("[say=artica]Ah..[/say]")

		saynn("The metal doors finally open, allowing you to bring Artica out into the medical lobby.. The familiar doctor quickly rushes to you, seeing and hearing the panting pregnant-looking fluff.")

		saynn("[say=eliza]Wow. Doctor Quinn here.[/say]")

		saynn("[say=pc]She needs help.[/say]")

		saynn("[say=artica]I.. um..[/say]")

		saynn("The feline scans the girl with some device and then quickly starts tapping on her datapad.")

		saynn("[say=eliza]Oh, I know, eggs~. I'm setting everything up as we speak.[/say]")

		saynn("[say=pc]Eggs?[/say]")

		saynn("The feline nods.")

		saynn("[say=eliza]This inmate here participated in a little experiment~. And now she is full of.. eggs. Don't worry, they're harmless.. if she lays them down in time. And that time is now~.[/say]")

		saynn("You pretend that you're surprised.")

		saynn("[say=eliza]Do you wanna.. help? No is fine, I can just give you a few when we're done~. They share the taste of their carrier.. but they're usually very sweet~.[/say]")

		saynn("Do you really want to see Artica lay these plant eggs?..")

		addButton("Watch", "See it happen", "do_watch")
		addButton("Skip", "Just receive the eggs", "do_skip")
	if(state == "do_skip"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You decide to just wait in the lobby.")

		saynn("And soon.. Artica and doctor Quinn return to you, with Artica having a flat belly again!"+str(" Well.. a flatter one.. It's clearly still round, just a bit less." if getCharacter("artica").isVisiblyPregnant() else "")+"")

		saynn("[say=eliza]There you go! I kept some for.. the lab.[/say]")

		saynn("The feline hands you a few.. white egg-like.. fruits? All of them are covered in juices..")

		saynn("[say=eliza]Sorry, I didn't wash them. But it adds to the flavor, trust me~.[/say]")

		saynn("[say=pc]Thanks.. I guess..[/say]")

		saynn("The feline nods and steps back.")

		addButton("Artica", "Look at her", "skip_lookatartica")
	if(state == "skip_lookatartica"):
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("Artica looks.. spent.. exhausted.")

		saynn("[say=pc]How do you feel?[/say]")

		saynn("[say=artica]I.. ah.. i-it was intense..[/say]")

		saynn("Her blush makes you smile.")

		saynn("[say=artica]I w-will.. g-go back to my spot..[/say]")

		saynn("[say=pc]Sure, you do that.[/say]")

		saynn("Both, Artica and doctor Quinn, leave you alone with the.. eggs.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_watch"):
		aimCameraAndSetLocName("med_milkingroom")
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.GivingBirth, "birth", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("[say=pc]Alright, let's do it.[/say]")

		saynn("The feline nods and helps you bring the panting fluff to one of the secluded rooms. This one seems to have a lot of.. specialized equipment.. including a hi-tech table.")

		saynn("But before the doctor can bring the table to life, Artica sits down on the floor and starts moaning and holding onto her giant belly, her noises a mixture of pain and pleasure..")

		saynn("[say=artica]Ah!.. ah.. Agh.. hh-hh..[/say]")

		saynn("[say=eliza]Hold on-n-n, I'm still setting everything up![/say]")

		saynn("Looks like you will have to make do without that table for now."+str(" You quickly undress Artica and make her spread her legs wide, giving you a view of her slick holes" if !isNaked else " You make Artica spread her legs wide, giving you a view of her slick holes")+".")

		saynn("[say=artica]Ahh-h.. ahh.. it's.. h-happening..[/say]")

		saynn("Artica's pussy and asshole both twitch and clench, her body instinctively preparing for what is about to come.. You just put your hands on squirming fluff's legs, trying to keep her still.. as you watch.. entranced by the view of the first egg already peeking from her pussy, stretching her sensitive folds bit by bit..")

		saynn("[say=pc]Let it happen, girl.[/say]")

		saynn("[say=artica]Nh-hh.. hh-h.. AHh-h![/say]")

		saynn("Artica kept pushing.. until the first egg finally slipped out of her pussy with a wet squelch! The sensation was clearly too much for the poor girl, her eyes rolled back as her "+str("locked cock is throbbing in its cage, eagerly leaking pre" if isCaged else "hard canine cock throbbed, a long line of pre hanging from the tip already")+"..")

		saynn("[say=pc]Quinn?[/say]")

		saynn("[say=eliza]I'm almost do-o-o-one! Sorry-y-y! Damn computers..[/say]")

		saynn("You grab the egg.. ohh, it's slippery, its surface coated in Artica's juices.. and put it aside.")

		saynn("The next egg follows quickly, this one pushing against Artica's tight asshole. She arches her back and lets another noise of pain and pleasure as her rear hole gets stretched wide.. It seems to be stimulating her prostate so much that she can't hold back, Artica rolls her eyes back again as "+str("locked cock shoots thick ropes of cum onto the floor, her balls tensing up as the egg finally leaves her butt.." if isCaged else "throbbing cock starts shooting thick ropes of cum onto the floor, her balls tensing up as the egg finally leaves her butt..")+"")

		saynn("[say=artica]Ahhh-hh.. So b-bii-ig..[/say]")

		saynn("[say=eliza]I got it![/say]")

		addButton("Continue", "See what happens next", "artica_in_machine")
	if(state == "artica_in_machine"):
		playAnimation(StageScene.BDSMMachineFuck, "wand", {pc="artica", pcCum=true, noDildos=true, bodyState={naked=true, hard=true}})
		saynn("The doctor finally manages to get the smart table operational. It carefully grabs Artica with its long manipulator arms and brings her over the table, two tube-like egg collectors get pressed against her wet holes..")

		saynn("[say=eliza]Here![/say]")

		saynn("One by one, round white eggs emerge from her body, each one sending Artica into another passion frenzy as her hole gets stretched wide, gaping more and more, working tirelessly to expel the eggs.")

		saynn("[say=artica]Nhh-h.. ah..[/say]")

		saynn("Her balls keep getting drained as the eggs push on all her buttons on their way out, her cock keeps shooting strong spurts of seed as the girl is being pushed further and further into the abyss of pleasure..")

		addButton("Continue", "See what happens next", "do_make_eggs")
	if(state == "do_make_eggs"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="artica", noDildos=true, bodyState={naked=true, hard=true}})
		saynn("As the last egg slips free, Artica's body does a final, powerful shudder. Her pussy and tailhole.. gaping wide.. both love tunnels oozing with the remains of the sweet nectar that the eggs were bathing in.. Her cock, now spent, twitches weakly as a few final drops of cum dribbled out.")

		saynn("[say=artica]..ah..[/say]")

		saynn("She seems to be utterly exhausted.. her belly now"+str(" not as round as it was before.. but still somewhat round.." if getCharacter("artica").isVisiblyPregnant() else " completely flat again..")+"")

		saynn("[say=eliza]What a nice yield![/say]")

		saynn("The feline hands you your share of the eggs.. all of them covered in juices and smelling like.. Artica..")

		saynn("[say=artica]T-t.. t-th..[/say]")

		saynn("[say=pc]Relax, Artica. You need to rest.[/say]")

		saynn("She nods and just throws her head back, resting as her holes begin to slowly close up again..")

		saynn("You look at the eggs..")

		saynn("[say=pc]What can I even do with them?[/say]")

		saynn("The feline shows you by suddenly biting into one of them.. causing a sweet flavor to instantly fill your lungs.")

		saynn("[say=eliza]Ah~. It's food. It's just a great snack~.[/say]")

		saynn("[say=pc]I see..[/say]")

		saynn("You spend some time together with the feline and Artica.. until she is able to walk again.")

		addButton("Continue", "See what happens next", "back_to_lobby")
	if(state == "back_to_lobby"):
		addCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		aimCameraAndSetLocName("med_lobbymain")
		saynn("The feline brings you and Artica back into the lobby..")

		saynn("[say=eliza]Well, that's gonna be it! If you ever find yourself full of juicy fruits, you know where to find me![/say]")

		saynn("Artica blushes.")

		saynn("[say=artica]Ok-kay..[/say]")

		saynn("She turns towards you.")

		saynn("[say=artica]T-thank you.. Feels weird not to be.. full.. all the time.. haha..[/say]")

		saynn("And so she heads towards her back spot.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_medical"):
		processTime(5*60)

	if(_action == "do_watch"):
		processTime(3*60)

	if(_action == "do_skip"):
		processTime(35*60)
		var howMuch:int = 0
		if(getCharacter("artica").hasEffect(StatusEffect.ArticaFullWithPlantEggs)):
			howMuch = getCharacter("artica").getEffect(StatusEffect.ArticaFullWithPlantEggs).eggAmount
			getCharacter("artica").removeEffect(StatusEffect.ArticaFullWithPlantEggs)
		var willReceive:int = int(float(howMuch) / 2)
		addMessage("You received "+str(willReceive)+" tasty plant eggs!")
		if(willReceive > 0):
			var anEgg = GlobalRegistry.createItem("PlantEgg")
			anEgg.whoGaveBirth = "artica"
			anEgg.setAmount(willReceive)
			GM.pc.getInventory().addItem(anEgg)
		getModule("ArticaModule").triggerCorruption(0.05)

	if(_action == "skip_lookatartica"):
		processTime(3*60)

	if(_action == "artica_in_machine"):
		processTime(3*60)

	if(_action == "do_make_eggs"):
		processTime(30*60)
		var howMuch:int = 0
		if(getCharacter("artica").hasEffect(StatusEffect.ArticaFullWithPlantEggs)):
			howMuch = getCharacter("artica").getEffect(StatusEffect.ArticaFullWithPlantEggs).eggAmount
			getCharacter("artica").removeEffect(StatusEffect.ArticaFullWithPlantEggs)
		var willReceive:int = int(float(howMuch) / 2)
		addMessage("You received "+str(willReceive)+" tasty plant eggs!")
		if(willReceive > 0):
			var anEgg = GlobalRegistry.createItem("PlantEgg")
			anEgg.whoGaveBirth = "artica"
			anEgg.setAmount(willReceive)
			GM.pc.getInventory().addItem(anEgg)
		getModule("ArticaModule").triggerCorruption(0.05)

	if(_action == "back_to_lobby"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
