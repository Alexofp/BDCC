extends SceneBase

var statAnger = 0
var statAgility = 0
var statMind = 0
var statLust = 0

func _init():
	sceneID = "PSTentacles2SmallInteract"

func _reactInit():
	#addCharacter(GM.main.PS.getTentaclesCharID())
	pass

func resolveCustomCharacterName(_charID):
	if(_charID == "ten"):
		return GM.main.PS.getTentaclesCharID()
	if(_charID == "sci1"):
		return GM.main.PS.getScientist1CharID()
	if(_charID == "sci2"):
		return GM.main.PS.getScientist2CharID()

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(state == ""):
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc"})
		saynn("You try to take another nap.. but now you're not alone in the cell.")

		saynn("At least it looks like the tentacles are still too weak to do anything.. they can't even move.. just resting in its nest.. just like you rest in your bed. Both of you are now the prisoners of this bio-lab. Maybe you should work together..")

		saynn("But then again.. it looks more like a plant than anything else.. How useful can a plant be? Still, it does seem to be somewhat sentient. Maybe it's good that it doesn't have a mouth.. or teeth.")

		saynn("Maybe it's just friendly? Plants just want to live usually. Sure, some of them do feed on bugs and flies.. but you're not an insect, you should be fine.")

		saynn("If it decides to leap at you.. you can probably tear it apart.. maybe it knows that? Maybe that's why it didn't do it yet.")

		saynn("Thoughts like that keep attacking your mind as you try to nap..")

		addButton("Rest..", "Get some rest", "doRest")
	if(state == "doRest"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="pc"})
		aimCameraAndSetLocName("pstent_bed")
		saynn("Despite all of the thoughts, you manage to get some rest.")

		saynn("[say=sci1]Open your eyes, test subject.[/say]")

		saynn("Aw, just when you were finally slipping off into a dream land.")

		saynn("[say=sci2]Science never sleeps.[/say]")

		saynn("[say=pc]Sure.. it's not like I have a choice.[/say]")

		saynn("[say=sci1]Whine harder and you might just become fine.[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("You rub your eyes, still trying to come back to senses.")

		saynn("[say=sci2]I'm pretty sure that this was a joke. Whine sounds a lot like 'wine'. You see, as it ferments, the characteristics of..[/say]")

		saynn("[say=pc]I'm getting up.[/say]")

		addButton("Get up", "See what happened while you were sleeping", "doGetup")
	if(state == "doGetup"):
		# (( sad tiny tentacles anim
		aimCameraAndSetLocName("pstent_middle")
		saynn("You get up and take a look at the tentacles..")

		saynn("They look.. pretty bad actually. Even a few hours were enough to make them look all dry and weak. They can barely sway.")

		saynn("[say=sci2]Perfect. The next test that we need you to perform is..[/say]")

		saynn("[say=pc]Hey.. uhh.. I think it's dying.[/say]")

		saynn("You can just see the life force getting siphoned out of that plant. Two of the tentacles look like they gave up by now.. and the last one is desperately trying to lift itself off of the nest.")

		saynn("[say=sci1]What do you mean? Don't make fools out of us, I can clearly see it moving.[/say]")

		saynn("[say=pc]You should check your sight then, this thing isn't gonna make another hour.[/say]")

		saynn("A short silence..")

		saynn("[say=sci1]Again, don't make fools out of us..[/say]")

		saynn("[say=pc]It's gonna die. And then you're gonna space me. I ain't letting that happen.[/say]")

		addButton("Fridge", "Go check the fridge", "doCheckFridge")
	if(state == "doCheckFridge"):
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("pstent_fridge")
		saynn("It's a plant.. at least it looks like one.. kinda.. So maybe it just needs to be watered.")

		saynn("You open the fridge and look for a water bottle. Your eye gets caught by a different one that was filled with something white.. The label says 'Milk'.. But who knows what's inside it. You ignore it. Eventually you do manage something that looks water-y..")

		saynn("After that, you carefully approach the tentacles and pour the bottle's contents onto them.")

		saynn("[say=pc]Don't die on me now.[/say]")

		saynn("It certainly helped.. The tentacles now look wet and slick rather than dry.. but they still seem quite weak.")

		saynn("You get the camera's attention.")

		saynn("[say=pc]They need something else.[/say]")

		saynn("[say=sci1]It's a plant. It needs sun and water. Quit worrying and let's proceed with the testing already.[/say]")

		saynn("[say=sci2]Actually.. According to the calculations, it's not exactly a plant. But also, a plant would be able to get nutrients from the soil.[/say]")

		saynn("You let them argue with each other..")

		saynn("[say=sci1]So? We're in space, there is no soil here.[/say]")

		saynn("[say=sci2]Again, it's not exactly a plant so that logic doesn't apply here. Perhaps we could try feeding it something.. normal.[/say]")

		saynn("Something normal..")

		saynn("You open the fridge again and look at the contents..")

		addButton("Cooked chicken", "Feed it some chicken meet", "1_chicken")
		addButton("Raw meat", "Feed it a whole stake", "1_meat")
		addButton("'Milk'", "Feed it that suspicious white fluid", "1_milk")
		addButton("Broccoli", "Feed it some broccoli", "1_broc")
	if(state == "1_chicken"):
		# (( tiny anim
		aimCameraAndSetLocName("pstent_middle")
		saynn("You see some chicken.. and decide to feed it to the tentacles.")

		saynn("Carefully, you place it under the weak tentacle.. and watch as it begins to wrap around it. The tentacle then uses its tip to dig into the cooked chicken meat!")

		saynn("[say=pc]It seems to be.. eating it.[/say]")

		saynn("[say=sci2]Fascinating.[/say]")

		saynn("Soon, the other two tentacles join too. Together, they quickly strip the meat off of the bones.")

		saynn("After their meal, the tentacles now look alive again. They actively wiggle and coil around each other, showing off their newly-found energy.")

		saynn("[say=sci1]Are you done feeding meat to a plant? We have work to do.[/say]")

		saynn("[say=sci2]Actually..[/say]")

		saynn("[say=sci1]Shush.[/say]")

		addButton("Continue", "See what happens next", "needMusic")
	if(state == "1_meat"):
		# (( tiny anim
		aimCameraAndSetLocName("pstent_middle")
		saynn("For whatever reason, there is a stake there.. a completely raw, uncooked stake.")

		saynn("You ain't gonna eat it yourself anyway.. so you just grab it and toss it to the tentacles.")

		saynn("The raw slab of meat lands with a wet slap on the concrete in front of the nest. One of the tentacles stretches toward it, drawn by the rich, bloody smell.")

		saynn("[say=pc]Either eat it or die.[/say]")

		saynn("The slick tip prods the red flesh at first.. but then, it digs in. Not just wrapping around it, but pressing into the meat itself, as if tasting it from the inside.")

		saynn("After some time, the other two tentacles join, burrowing into the raw steak. A soft, squelching sound fills the cell as they absorb the nutrients, stripping the steak apart from the inside out.")

		saynn("In a few minutes, the steak is gone. Nothing is left but a pale, drained bone..")

		saynn("The tentacles rise up, dripping. You'd think that the raw meat would kill a plant.. but no.. they look slightly thicker and stronger instead. They coil and writhe in the air, their color a vibrant, healthy green. They seem.. satisfied. And very, very awake.")

		saynn("[say=sci1]Are you done feeding meat to a plant? We have work to do.[/say]")

		saynn("[say=sci2]Actually..[/say]")

		saynn("[say=sci1]Shush.[/say]")

		addButton("Continue", "See what happens next", "needMusic")
	if(state == "1_milk"):
		# (( tiny anim
		aimCameraAndSetLocName("pstent_middle")
		saynn("You grab the strange milk bottle. You open it and bring your nose to it..")

		saynn("Ooh.. hah.. It hits very strongly. Either this milk went bad.. or it's not milk at all.")

		saynn("[say=pc]What's this?[/say]")

		saynn("[say=sci2]Hm. It's milk that we sourced from one of the space cafes. It should be safe.[/say]")

		saynn("Right.")

		saynn("You approach the tentacles and pour the milk over them.")

		saynn("The thick, creamy liquid splashes over their slick, green skin. For a moment, nothing happens.")

		saynn("Then, the three tentacles spring to life. A soft, trembling wave passes through them from base to tip. They begin to move, but not like before. Their motions become slow and sinuous.")

		saynn("They coil around each other, rubbing the milky substance into their own skin. Their tips, now dripping with the white liquid, reach out toward you. They don't grab.. they can't anyway.. they just brush. One of the tentacles lightly traces your ankle. Another taps gently at your {pc.foot}, leaving a warm, wet spot.")

		saynn("The tentacles seem.. energized.. in a way. They sway hypnotically, their movements full of a weak but deliberate longing, all pointed in your direction.")

		saynn("[say=pc]Looks like they liked it.[/say]")

		saynn("[say=sci1]Are you done feeding it? We have work to do.[/say]")

		addButton("Continue", "See what happens next", "needMusic")
	if(state == "1_broc"):
		# (( tiny anim
		aimCameraAndSetLocName("pstent_middle")
		saynn("You see broccoli.. and now, for some reason, you can't get rid of a certain thought anymore. You grab it and close the fridge.")

		saynn("[say=pc]Feeding plants.. to a plant.. is that cannibalism?[/say]")

		saynn("[say=sci2]Actually, unless you wanna imply that the specimen and broccoli are somehow of the same species, no.[/say]")

		saynn("Alright.. well.. you carefully put broccoli under the weak tentacle and watch what it will do next.")

		saynn("The tentacle goes still. Its slick tip prods the green florets gently, as if thinking about it.")

		saynn("Then, something begins to happen. The tentacle doesn't wrap around the food. Instead, it presses its tip flat against it. It does something.. and a faint, clear fluid begins to seep from the plant, soaking into the tentacle.")

		saynn("Slowly, the vibrant green of the vegetable begins to pale, as if its color and life are being drawn out. The tentacle itself seems to.. brighten. A deeper, richer shade of green travels up its length.")

		saynn("The other two tentacles join, not to tear, but to lay against the broccoli in the same quiet way. They pulse softly, a steady rhythm, as they absorb something from it.")

		saynn("When they pull away, the broccoli is left pale and wilted. The three tentacles, however, are now quite lively.")

		saynn("[say=pc]Looks like they liked it.[/say]")

		saynn("[say=sci1]Are you done feeding it? We have work to do.[/say]")

		addButton("Continue", "See what happens next", "needMusic")
func supportsShowingPawns() -> bool:
	return true

func getBiggestStat() -> int:
	var biggestStat:int = PlayerSlaveryTentacles.STAT_ANGER
	var biggestStatNumber:int = 0
	if(statAnger > biggestStatNumber):
		biggestStatNumber = statAnger
		biggestStat = PlayerSlaveryTentacles.STAT_ANGER
	if(statAgility > biggestStatNumber):
		biggestStatNumber = statAgility
		biggestStat = PlayerSlaveryTentacles.STAT_AGILITY
	if(statMind > biggestStatNumber):
		biggestStatNumber = statMind
		biggestStat = PlayerSlaveryTentacles.STAT_MIND
	if(statLust > biggestStatNumber):
		biggestStatNumber = statLust
		biggestStat = PlayerSlaveryTentacles.STAT_LUST
		
	var amountSame:int = 0
	if(statAnger == biggestStatNumber):
		amountSame += 1
	if(statAgility == biggestStatNumber):
		amountSame += 1
	if(statMind == biggestStatNumber):
		amountSame += 1
	if(statLust == biggestStatNumber):
		amountSame += 1
	
	if(amountSame >= 2): # No biggest stat
		return -1
	
	return biggestStat


func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	
	if(_action in ["1_meat", "2_metal", "3_toy"]):
		statAnger += 1
	if(_action in ["1_chicken", "2_dnb", "3_ladder"]):
		statAgility += 1
	if(_action in ["1_broc", "2_ambient", "3_puzzle"]):
		statMind += 1
	if(_action in ["1_milk", "2_jazz", "3_self"]):
		statLust += 1

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doRest"):
		processTime(5*60*60)

	if(_action == "1_chicken"):
		_tentacles.interactTiny1 = "chicken"

	if(_action == "1_meat"):
		_tentacles.interactTiny1 = "meat"

	if(_action == "1_milk"):
		_tentacles.interactTiny1 = "milk"

	if(_action == "1_broc"):
		_tentacles.interactTiny1 = "broc"

	setState(_action)

func saveData():
	var data = .saveData()

	data["statAnger"] = statAnger
	data["statAgility"] = statAgility
	data["statMind"] = statMind
	data["statLust"] = statLust

	return data

func loadData(data):
	.loadData(data)

	statAnger = SAVE.loadVar(data, "statAnger", 0)
	statAgility = SAVE.loadVar(data, "statAgility", 0)
	statMind = SAVE.loadVar(data, "statMind", 0)
	statLust = SAVE.loadVar(data, "statLust", 0)
