extends SceneBase

func _init():
	sceneID = "PSTentaclesEggIntro"

func _reactInit():
	#addCharacter(GM.main.PS.getTentaclesCharID())
	addCharacter(GM.main.PS.getScientist1CharID())
	addCharacter(GM.main.PS.getScientist2CharID())
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
		aimCameraAndSetLocName(_tentacles.LOC_SCIENTISTS)
		playAnimation(StageScene.Duo, "stand", {pc=GM.main.PS.getScientist1CharID(), npc=GM.main.PS.getScientist2CharID()})
		saynn("You approach the reinforced window, curious about the noise. On the other side of the thick glass is a brightly lit corridor.. and two figures who are watching you with great interest.")

		saynn("On the right is a wolf with sharp, intelligent eyes. He sips from a steaming mug, his calculating gaze flicking over you.. before he says something to his companion.")

		saynn("The female cat beside him nods, her attention is split before you and her fancy glowing datapad.")

		saynn("Both of them wear crisp white lab coats over their clothes.")

		saynn("The intercom lets itself be known by spewing out some static.")

		saynn("[say=sci1]Welcome to our little paradise.[/say]")

		saynn("You just can't escape them. The smooth voice, too..")

		saynn("[say=sci2]We made sure that your vitals are in good condition after the transportation procedure. You might feel residual dizziness or disorientation, but..[/say]")

		saynn("Her voice doesn't seem to be as assertive.. so you cut her off.")

		saynn("[say=pc]I do feel something alright. Where am I? Who are you people?[/say]")

		saynn("The guy leans closer, looking down at you.. even through the window.")

		saynn("[say=sci1]Don't make the mistake of interrupting a lady. You're not in a position to do so.[/say]")

		saynn("He turns his head towards the cat to make sure she is alright. The lady blushes ever so slightly, her hand reaching out to adjust her already-perfect glasses.")

		saynn("[say=pc]What position am I in then?[/say]")

		saynn("[say=sci2]You have been assigned as a primary test subject for a new research initiative.[/say]")

		saynn("[say=pc]I don't remember agreeing to that.[/say]")

		saynn("The wolf takes another slow sip, really taking the time to enjoy his hot brew.")

		saynn("[say=sci1]Ever seen a lab rat signing a work contract?[/say]")

		saynn("You don't even know how to react. He's got you on that one.")

		saynn("The cat taps on her datapad, bringing some random schematics.")

		saynn("[say=sci2]If you want to know what we do.. This bio-lab is specialized on research that normally would be considered.. unethical. It's not as bad as you might think it is, I can assure you. As long as you do what we tell you to do, you will not be in any danger.[/say]")

		saynn("You sure don't like the sound of that.")

		saynn("[say=pc]You're running an illegal bio-lab. You are in constant danger already.[/say]")

		saynn("[say=sci2]Actually, it's more nuanced than that. The demand for the scientific work that we do is incredibly high. And the unique positioning of our bio-lab allows us to not be.. constrained.. by any governing organization.[/say]")

		saynn("[say=sci1]Let me dumb it down for you. Nobody wants to murder the chicken. But they won't say no to chicken meat.[/say]")

		saynn("These scientists can do what they want.. as long as they do the messy work. And now you're stuck here with them.")

		saynn("[say=pc]Great.[/say]")

		saynn("[say=sci1]You basically have a bomb collar around your neck already, what do you have to lose?[/say]")

		saynn("Your hand reaches to tug on your inmate collar.. They sure didn't bother trying to take it off it seems.")

		saynn("[say=pc]You could have helped with it.[/say]")

		saynn("[say=sci1]That's just extra risk. As long as you can do your job, I don't care what kinky shit you're into.[/say]")

		saynn("You sigh.")

		saynn("[say=pc]Job?[/say]")

		saynn("[say=sci2]Our current focus is a newly acquired specimen. Its behavioral matrix has some missing entries that we would like to fill. That's all you need to know for now.[/say]")

		saynn("Specimen? Your confused stare gets an explanation fast.")

		addButton("Continue", "See what happens next", "guards_step_in")
	if(state == "guards_step_in"):
		aimCameraAndSetLocName(_tentacles.LOC_MIDDLE)
		playAnimation(StageScene.Solo, "stand")
		saynn("The reinforced door into your cell beeps loudly.. It goes through some kind of.. unsealing process.. hissing with cold air in the process.. before finally opening up.")

		saynn("A few armed guards step inside, all of them carrying pulse rifles and armored bio-hazard suits. Modern versions of plague doctors.")

		saynn("They breathe loudly through their gas masks.. and secure the perimeter.. which means.. aiming their weapons at the only possible threat in the room.")

		saynn("[say=pc]I feel like I'd be more useful alive to you.[/say]")

		saynn("The guards don't answer. And you just wait for what's next, your hands are raised slightly.")

		saynn("Soon, another few guards show up, bringing.. some kind of round object with them, on a special flat bed cart.")

		saynn("They bring the cart into the middle of the room.. and press some button on it that gently lowers it down onto the floor and unloads it.")

		saynn("After the guards are gone, the door gets sealed again, trapping you with the.. so called.. specimen.")

		saynn("[say=sci1]Approach it.[/say]")

		saynn("[say=pc]Do I have to?[/say]")

		saynn("Silence.")

		addButton("Look at it", "Do what they say", "do_approach_egg")
	if(state == "do_approach_egg"):
		GM.pc.setLocation(_tentacles.LOC_MIDDLE)
		aimCameraAndSetLocName(_tentacles.LOC_MIDDLE)
		playAnimation(StageScene.SoloBigEgg, "stand")
		saynn("Carefully, you approach the new round object in the room.")

		saynn("Soon it becomes obvious what it is.")

		saynn("[say=pc]It's a fucking egg.[/say]")

		saynn("Even though you only thought about your choice of words for a few moments, you couldn't be more correct.")

		saynn("You're standing near an egg. It's not just a normal egg. This one is huge, spotting an unnatural toxic-green color.. unnatural for eggs.")

		saynn("It's resting in.. some kind of gross nest. This nest is composed of multiple purple.. tendrils? They're covered in weird green goo. The whole composition is quite.. nerve-racking.")

		saynn("You haven't even seen the main bit. The top of the egg seems to have a deep cross-shaped crease on it. You've seen enough movies to know what this is about.")

		saynn("[say=pc]I'm not touching that. Nope.[/say]")

		saynn("[say=sci2]We did initial tests. The specimen is currently completely safe.[/say]")

		saynn("[say=pc]Of course you would say that.[/say]")

		saynn("[say=sci1]I'm getting tired of this whining. We're going on a break. Have your rest, gather what little bits of bravery that you have together, and focus. When we're gonna be back, prepare to do some actual work.[/say]")

		saynn("And just like that, the intercom turns off. You look through the window.. the scientists aren't there anymore.")

		saynn("At least the egg doesn't seem to be moving.. at all. Maybe it's dead already, who knows.")

		saynn("You look at your bed..")

		addButton("Continue", "See what happens next", "endthescene")
func supportsShowingPawns() -> bool:
	return true


func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_approach_egg"):
		_tentacles.setStage(_tentacles.STAGE_EGG)

	setState(_action)
