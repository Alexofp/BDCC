extends SceneBase

var hasPP = false
var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingProstateStraponScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", bodyState={exposedCrotch=true}})
		hasPP = getCharacter("eliza").hasReachablePenis()
		saynn("You ask the doctor to milk your prostate. She nods and brings you into the special room.. the one that has an advanced table installed.")

		saynn("You expose your {pc.penis} and wait for her orders. You feel excited a bit, your member is already getting hard.."+str(" well.. trying to, in its cage." if GM.pc.isWearingChastityCage() else "")+"")

		saynn("Eliza offers you to get a little closer to the table.. what could go wrong..")

		addButton("Continue", "See what happens next", "get_locked")
	if(state == "get_locked"):
		playAnimation(StageScene.MilkingProstateFuck, "tease", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Eliza presses a few buttons on the computer and the table springs to life, sending its manipulators towards your limbs! Your wrists and ankles get grabbed and raised above the floor.. The machine then bends you over the table.. with your arms and legs still firmly secured. Your {pc.analStretch} tailhole is completely exposed..")

		saynn("[say=pc]Ah.[/say]")

		saynn("You test the manipulators, trying to pull your wrists or ankles free.. but all you can do is make the motors whirl a little louder, the table's algorithm negating your resistance with ease. You are completely helpless..")

		saynn("[say=eliza]Great. Now give me a second to prepare.[/say]")

		saynn("Eliza takes off her lab coat.. as well as her top and the skirt.. exposing her fancy black lingerie.. one that accentuates her sexy curves..")

		if (hasPP):
			saynn("She grabs a prepared strapon harness.. but quickly realizes her mistake.")

			saynn("[say=eliza]Ohh.. right~. I should have just looked at my bulging panties.[/say]")

			saynn("She pulls her lace panties down, exposing a {eliza.penis}. She is quite hard already..")

			saynn("[say=eliza]Yeah, exactly.. Today, I'm gonna milk your prostate with my cock~."+str(" I don't even need a strap, I already have a perfect tool to milk someone who is wearing a cage.." if GM.pc.isWearingChastityCage() else " I don't even need a strap, I already have a perfect tool to milk submissive inmates.")+"[/say]")

		else:
			saynn("She then grabs a prepared strapon harness and secures it around her waist.. adding some extra spice to her look.")

			saynn("[say=eliza]Mhm.. Today, I'm gonna milk your prostate with this strap."+str(" Perfect tool to milk someone who is wearing a cage.." if GM.pc.isWearingChastityCage() else " Perfect tool to milk submissive inmates.")+"[/say]")

		saynn("You gulp while looking back over your shoulder.. The corners of her mouth slightly raise when her gaze catches your subby stare..")

		saynn("She retrieves a tube of lube and slowly approaches you from behind, her paw does one quick slide over your {pc.thick} butt..")

		saynn("[say=eliza]Gotta make sure you will be able to walk afterwards.[/say]")

		saynn("She squeezes a generous amount of lube onto her clawed digits.. and begins to rub it into your anal ring, adding a shiny coating to it.")

		saynn("[say=pc]Ah..[/say]")

		saynn("It feels cold against your sensitive flesh.. your tailhole is already clenching while the feline keeps doing little circular motions with her digits, making sure every bit of your star is prepared.")

		saynn("She squeezes some more onto her "+str("strapon" if !hasPP else "cock")+" and uses her paw to spread it along the full length with a few strokes..")

		saynn("She aligns her.. tool.. with your quivering entrance.. and slowly begins the process. With gentle pushes, she makes "+str("the strap" if !hasPP else "her member")+" prod at your tailhole.. easing in the rounded tip at first with not much trouble, thanks to the lube.")

		saynn("[say=pc]Mhh..[/say]")

		saynn("As she continues to sink in "+str("the slick strapon " if !hasPP else "")+"into you, you feel "+str("it" if !hasPP else "her cock")+" quickly finding and pressing against your prostate.")

		saynn("[say=pc]Ah..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your locked away cock twitches.. dripping some pre.. a small bead of prostate fluid escaping, now hanging from the tip of your cage. Your inner walls hug the shiny shaft nicely..")

		else:
			saynn("Your cock twitches.. dripping some pre.. a small bead of prostate fluid escaping, now hanging from the tip. Your inner walls hug the shiny shaft nicely..")

		saynn("Eliza continues to gently push her hips forward, driving her"+str(" rubber cock" if !hasPP else " {eliza.penis}")+" inside you.. until she is satisfied enough.")

		addButton("Continue", "See what happens next", "do_sex")
	if(state == "do_sex"):
		playAnimation(StageScene.MilkingProstateFuck, "sex", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("After that, she pulls back, lifting the pressure from your prostate.. just to squeeze it again a few seconds later, establishing a rhythm.")

		saynn("Each of her next thrusts send shivers down your spine.. your tailhole clenching tightly around that "+str("strapon" if !hasPP else "shaft")+" as it keeps pushing on your pleasure spot.. causing your {pc.penis} to twitch and leak more of that prostate fluid.")

		saynn("[say=pc]Mhh.. ah.. ahh..[/say]")

		saynn("Eliza puts her hand on her side and just continues to thrust her tool inside you, increasing her pace ever so slightly. The motions of her hips become firmer and more insistent.. but she maintains her clinical focus..")

		saynn("[say=eliza]I like pegging.. Probably my favourite way to milk someone.[/say]")

		saynn("The constant stimulation makes you squirm against the restraints.. your lips slightly parted as you start to pant and moan.. your hands grabbing onto the table.")

		saynn("[say=pc]Hhh.. hah.. hh.ah..[/say]")

		saynn("Your poor neglected cock is dripping more and more.. multiple beads of transparent fluids emerge from the tip and fall into the fluid collector below.")

		saynn("Even though she isn't even pegging you that fast.. It feels so good, your swollen prostate getting squeezed again and again.. you feel like you won't last long..")

		addButton("Continue", "See what happens next", "process_cum")
	if(state == "process_cum"):
		playAnimation(StageScene.MilkingProstateFuck, "fast", {pc="pc", npc="eliza", pcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Eliza increases the onslaught on your asshole.. and very soon.. it becomes too much.")

		saynn("[say=pc]Ah!.. AHh-hh..[/say]")

		saynn("You throw your head back and let out some lovely moans while your whole body shudders beneath her relentless pegging.. Your tailhole is pulsing wildly around that "+str("strap" if !hasPP else "shaft")+" while your "+str("locked little cock starts to throb inside its cage" if GM.pc.isWearingChastityCage() else "{pc.penis} starts to throb")+", shooting weak spurts of {pc.cum} at the same rate as Eliza's thrusts..")

		saynn("[say=eliza]You're cumming? Good. Let's not leave even a drop of that useless seed in your balls~.[/say]")

		saynn("She keeps fucking you even while your inner walls start to grip her shaft tightly.. Spurts of seed become just a constant weak dribbling.. your balls keep twitching while Eliza smashes your prostate to bits, again and again.")

		saynn("[say=pc]Nhh-hh.. mhh.. ahh.. ahh.. nh..[/say]")

		saynn("It continues for a while.."+str(" Until her own orgasm catches up with you. Eliza rams her cock deep inside you and lets it throb, pumping you full of her seed.." if hasPP else "")+"")

		addButton("Continue", "See what happens next", "after_milking")
	if(state == "after_milking"):
		playAnimation(StageScene.MilkingProstateFuck, "inside", {pc="pc", npc="eliza", bodyState={exposedCrotch=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("After what seems like an eternity of raw, relentless stimulation, Eliza"+str(" gradually eases her motions, leaving most of her strap to rest inside your pulsing rear" if !hasPP else " stops, leaving her cock to rest inside your pulsing rear")+". It lets you finally snap out of that ecstatic state and start trying to rest..")

		saynn("Eliza leans to the side and looks down at the fluid collector.")

		saynn("[say=eliza]Thank you for your humble donation~. You've been very helpful.[/say]")

		saynn("You're still shaking a bit from the aftershocks of what happened..")

		saynn("Eliza carefully withdraws her "+str("toy" if !hasPP else "dick")+", allowing your hole to close..")

		addButton("Continue", "See what happens next", "get_up_after")
	if(state == "get_up_after"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		GM.pc.setLocation("med_nearmilking")
		aimCameraAndSetLocName("med_nearmilking")
		saynn("Eliza"+str(" takes off her harness and" if !hasPP else "")+" presses a few buttons on the computer that make it let go of your limbs.")

		saynn("Your legs feel weak so you just flop onto the table for a bit, trying to catch your breathing.")

		saynn("[say=eliza]Feeling good?[/say]")

		saynn("You nod.. blushing deeply..")

		saynn("Eliza helps you to get up.. and then brings you out into the corridor.")

		saynn("[say=eliza]I'm glad you enjoyed it. But if you excuse me, I gotta fill in some paperwork now. Hope you can find the way back to the lobby.[/say]")

		saynn("And just like that, she leaves you..")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_locked"):
		processTime(5*60)
		if(!hasPP):
			getCharacter("eliza").getInventory().equipItem(GlobalRegistry.createItem("Strapon"))

	if(_action == "do_sex"):
		processTime(5*60)

	if(_action == "process_cum"):
		processTime(5*60)
		amountCollected = GM.main.SCI.processMilkPlayerPenis()
		GM.pc.orgasmFrom("eliza")
		if(hasPP):
			GM.pc.cummedInAnusBy("eliza")

	if(_action == "after_milking"):
		processTime(5*60)

	if(_action == "get_up_after"):
		getCharacter("eliza").removeStrapon()

	setState(_action)

func saveData():
	var data = .saveData()

	data["hasPP"] = hasPP
	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	hasPP = SAVE.loadVar(data, "hasPP", false)
	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
