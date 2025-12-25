extends SceneBase

func _init():
	sceneID = "PSTentaclesPlaySmall"

func _reactInit():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	addCharacter(GM.main.PS.getTentaclesCharID())
	
	var possible:Array = [""]
	
	if(possible.size() > 0):
		setState(RNG.pick(possible))

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
		saynn("The tentacle monster has stopped in the corner where all the toys and puzzles are..")

		saynn("It looks like it might wanna play or something.")

		addButton("Puzzle", "Do a puzzle where you have to put objects of various shapes into the correctly-shaped holes", "doPuzzle")
		addButton("Ball", "Through a ball", "doBall")
		addButton("Shoo", "Tell tentacles to go away", "say_shoo")
	if(state == "doBall"):
		saynn("YOU PLAY BALL!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "doPuzzle"):
		saynn("YOU DO A PUZZLE!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "say_shoo"):
		saynn("You shoo the tentacles away from this corner of the cell!")

		_tentacles.talk("Fine. We possess a lot of knowledge already.")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p0"):
		saynn("You get tentacles' attention and bring them to the box that has lots of differently-shaped holes in it.. along with separate objects of the same shapes.")

		saynn("[say=pc]Alright.. Try to solve this.[/say]")

		saynn("When presented with the puzzle.. the monster just ignores it, swaying around left and right.")

		saynn("One of the tentacles stumbles upon a cube and reflexively grabs it, giving you some hope..")

		saynn("Unfortunately, the same tentacle just tosses it away after a few seconds.")

		addButton("Explain", "Explain exactly what the tentacles need to do", "p0_explain")
		addButton("Show", "Show what the tentacles need to do", "p0_show")
		addButton("Scold", "Punish the tentacles for throwing the cube away", "p0_scold")
	if(state == "p0_explain"):
		saynn("You fetch the cube and set it down in front of the tentacles..")

		saynn("[say=pc]You see this? You gotta put this cube..[/say]")

		saynn("You point at the square hole in the puzzle box.")

		saynn("[say=pc]..through this exact hole.[/say]")

		saynn("It's hard to check if the tentacles have understood anything.. they're still just idly swaying around..")

		saynn("[say=pc]Try it again, please.[/say]")

		saynn("After some silence, the tentacles just lose interest and slither away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p0_show"):
		saynn("You fetch the cube and show it to the tentacles.")

		saynn("[say=pc]You see this?[/say]")

		saynn("After wiggling the cube left and right for a bit, you seem to catch one of the tentacle's attention. It reaches out and curls around your wrists, tickling it slightly..")

		saynn("[say=pc]You gotta do this.[/say]")

		saynn("While the tentacle is still wrapped around your wrist, you move your hand to the puzzle box and slide the cube through the square hole.")

		saynn("[say=pc]Like this.[/say]")

		saynn("Then, you grab a cylinder and offer it to the curious tentacle.")

		saynn("[say=pc]Your turn.[/say]")

		saynn("It just plays with the cylinder.. seemingly ignoring your offer.")

		saynn("You don't give up though.. you gently guide the tentacle towards the puzzle box.")

		saynn("[say=pc]See the circular hole? Isn't it perfect for this cylinder?[/say]")

		saynn("You try to spell out as hard as you can, now tapping at the area around the circular hole..")

		saynn("The tentacles hear you out.. and then just start smacking the cylinder against the box.. When that tactic doesn't work out, the tentacle gives up and slithers away.")

		saynn("It didn't exactly succeed.. but you gotta start off somewhere..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p0_scold"):
		saynn("[say=pc]You.. silly tentacles.. just shove the cube through the right hole, is it that hard?[/say]")

		saynn("The tentacles hear the anger in your voice and react by tossing all of the objects away.")

		saynn("[say=pc]Really? Ugh..[/say]")

		saynn("Looks like they're not happy.. but so are you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p1"):
		saynn("You get tentacles' attention and bring them to the box that has lots of differently-shaped holes in it.. along with separate objects of the same shapes.")

		saynn("[say=pc]Alright.. Try to solve this.[/say]")

		saynn("You present the monster to a bunch of differently-shaped objects. It grabs one of them.. a little pyramid.. and starts randomly smacking it against the box!")

		addButton("Show", "Show what the tentacles need to do", "p1_show")
		addButton("Explain", "Try to explain what the tentacles need to do", "p1_explain")
		addButton("Rile it up", "Put more stress on the tentacles! Try to get it all horny as well", "p1_rile")
	if(state == "p1_show"):
		saynn("You grab the tentacle that is holding the pyramid.. and guide it to the triangular hole. The tendril still just wants to bash the object against the box.. so you use more force to try to keep it still.")

		saynn("As you reach the triangular hole, you shake the tentacle until it drops the pyramid straight though it!")

		saynn("[say=pc]There you go! Now do it yourself.[/say]")

		saynn("You watch as the tentacle carefully curls around a cylinder.. lifts it up.. moves it over the puzzle box.. and drops it..")

		saynn("Unfortunately, the cylinder was dropped above the same triangular hole.. so it just bounces off.")

		saynn("The tentacle tries again.. and fails the same way.")

		saynn("[say=pc]Different hole?[/say]")

		saynn("The tentacle monster gives up before you can persuade it to try again.")

		saynn("It doesn't look like it learned anything new..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p1_explain"):
		saynn("You try to calm the tentacles down by gently stroking them.")

		saynn("[say=pc]Easy, easy.. Listen to me.[/say]")

		saynn("When the tentacle stops trying to destroy the box, you begin explaining.")

		saynn("[say=pc]You.. are holding a pyramid. It's triangular in shape.[/say]")

		saynn("You point at the holes in the box.")

		saynn("[say=pc]Which of these looks the most like the shape in your.. grip? Try to match it.[/say]")

		saynn("You gradually move the tentacle over all the holes.")

		saynn("Then.. you let it choose by itself.")

		saynn("[say=pc]Not sure if you have eyes.. wait.. hm..[/say]")

		saynn("You grab another tentacle and offer it to feel the puzzle box.. and all of its holes.")

		saynn("[say=pc]Maybe this will help you?[/say]")

		saynn("And indeed, it looks like it did. It takes the tentacles some time to feel all the holes..")

		saynn("It tries to slide the pyramid into the circular hole at first.. but obviously it doesn't fit.")

		saynn("[say=pc]Right.. well.. almost.[/say]")

		saynn("Just when you were about to lose hope, the tentacle manages to find a triangular hole! It slides the pyramid right through it!")

		saynn("Then it grabs a cylinder and starts trying different holes again.. The triangular one doesn't work.. but the circular ones does!")

		saynn("[say=pc]Good job. You're learning.[/say]")

		saynn("Looks like the both of you have learned something new..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p1_rile"):
		saynn("You know what the tentacles need.. they need to be inspired!")

		saynn("[say=pc]C'mon, you can do this! I believe in you.[/say]")

		saynn("You shake the pyramid that the tentacle is holding.")

		saynn("[say=pc]See this? This object. This is you! The box is a smoking hot babe! A babe.. that's wearing huge armor.. Armor that has huge gaping holes![/say]")

		saynn("You point at the puzzle box.")

		saynn("[say=pc]Faster! Find the hole that you'd fit through! Stuff that babe full of your.. plant meat. Yeah![/say]")

		saynn("The tentacle, spurred by your energy, begins jabbing the pyramid at random holes in the box. Clack.. Clack.. Clack..")

		saynn("[say=pc]No! Not that one! Feel it! The shape! Think![/say]")

		saynn("You slap the box next to a triangular hole for emphasis. The tentacle recoils, then thrusts again with more precision. It misses, scraping the side.")

		saynn("[say=pc]You're getting cold! Warmer! Warmer![/say]")

		saynn("It tries a circular hole. Failure.")

		saynn("[say=pc]COLD! Ice cold! Try again![/say]")

		saynn("The tentacle whips back, quivering with focus. It moves slower now, tracing the pyramid's edges, then brings it to the triangular hole. It fits, but at an angle, and gets stuck.")

		saynn("[say=pc]PUSH! Don't think, just DO IT! STUFF THAT HORNY BITCH![/say]")

		saynn("The tentacle slams the pyramid through! Great success.")

		saynn("[say=pc]YES! AH! That's it! Now the cylinder! STUFF THAT BABE'S OTHER HOLE! GO GO GO![/say]")

		saynn("Flushed with its first victory, the tentacle snatches the cylinder. It's no longer probing.. it's attacking. It rams the cylinder against the triangular hole. CLANG.")

		saynn("[say=pc]WRONG! You just got it right! Don't get stupid now! You are shaped differently now![/say]")

		saynn("It immediately switches targets, moving with frantic speed. It taps the cylinder against two wrong holes in rapid succession.. before forcing it perfectly through the correct one!")

		saynn("[say=pc]HA! FUCK YEAH! You did it! You're a natural! You have stuffed that bitch.[/say]")

		saynn("The tentacles wave in the air, not with their usual lazy sway, but with a sharp, jittery excitement, their tips are dripping some transparent juices..")

		saynn("They learned.. but also became a little more lusty for hot babes it seemes..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doPuzzle"):
		var possible:Array = []
		
		if(_tentacles.mind <= 0):
			possible.append("p0")
		if(_tentacles.mind == 1):
			possible.append("p1")
		if(_tentacles.mind == 2):
			possible.append("p2")
		if(_tentacles.mind == 3):
			possible.append("p3")
		if(_tentacles.mind == 4):
			possible.append("p4")
		if(_tentacles.mind >= 5):
			possible.append("p5")
		if(_tentacles.mind >= 3 && _tentacles.mind < 5):
			_tentacles.train(_tentacles.STAT_MIND)
		
		if(possible.size() > 0):
			setState(RNG.pick(possible))

	if(_action == "doBall"):
		_tentacles.incStat(_tentacles.STAT_AGILITY)

	if(_action == "say_shoo"):
		_tentacles.trainNothing()

	if(_action == "p0_explain"):
		_tentacles.trainNothing()

	if(_action == "p0_show"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "p0_scold"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "p1_show"):
		_tentacles.trainNothing()

	if(_action == "p1_explain"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "p1_rile"):
		_tentacles.train(_tentacles.STAT_MIND)
		_tentacles.train(_tentacles.STAT_LUST)

	setState(_action)
