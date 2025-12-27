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
		addButton("Armwrestling", "Test the tentacle's strength", "doArmwrestling")
		addButton("Shoo", "Tell tentacles to go away", "say_shoo")
	if(state == "doBall"):
		saynn("YOU PLAY BALL!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "say_shoo"):
		saynn("You shoo the tentacles away from this corner of the cell!")

		_tentacles.talk("Fine. We possess a lot of knowledge already.")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "a0"):
		saynn("You offer the tentacles to do some armwrestling.. tentacle-wrestling.")

		saynn("They're strong enough to move around so they probably have some strength in them.")

		saynn("You catch the strongest-looking tentacle and set your elbow on one of the nearby tables.")

		saynn("It looks like the monster is ready.")

		saynn("[say=pc]Alright, bring it on.[/say]")

		saynn("You barely apply any pressure, and it immediately yields, flopping limply onto the table.")

		_tentacles.talk("We surrender, we are not strong enough.")
		saynn("Rather than feeling triumph.. you're worried. The other tentacles in the periphery sway gently, as if confused.")

		saynn("[say=pc]You're okay?[/say]")

		saynn("You release the tentacle, and it pulls back back slowly, looking alright.")

		saynn("[say=pc]Let's do multiple of you I guess.[/say]")

		saynn("You catch the tips of a few biggest tentacles and prepare for another armwrestling match.")

		saynn("[say=pc]Do it![/say]")

		saynn("You let them take the lead.")

		saynn("The tentacles start trying to apply pressure.. more and more of it.. but it's barely enough to make you feel anything. It is extremely easy for you to hold them in the same exact spot.")

		saynn("And when you begin overpowering them, you actually get concerned.. it feels like you will snap these tentacles any second.. so you stop early.")

		saynn("[say=pc]Alright.. I see.. You need a lot of training. Gotta build your core strength too somehow. Maybe the right meal will help.[/say]")

		saynn("The tentacles feel your negative tone and lower their tips.")

		_tentacles.talk("We did our best.")
		saynn("You just gotta do this more often.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "a1"):
		saynn("You offer the tentacles to do some armwrestling.. tentacle-wrestling.")

		saynn("They're strong enough to move around so they probably have some strength in them.")

		saynn("You catch the strongest-looking tentacle and set your elbow on one of the nearby tables.")

		saynn("It looks like the monster is ready.")

		saynn("[say=pc]Alright, let's see if you have some more strength in you now. Go.[/say]")

		saynn("You apply some pressure and immediately start winning.. it doesn't look like a single tentacle is strong enough at all.")

		saynn("[say=pc]Use more of.. you.[/say]")

		saynn("A few more tentacles wrap around your palm, trying to bring it down the opposite way from where you're pulling.")

		saynn("With the usage of extra tentacles, it sure feels a bit stronger.. but you're still only using about half of your strength.")

		addButton("Win!", "Show the tentacles their place by winning the armwrestling match", "a1_win")
		addButton("Lose", "Give up the match and let the tentacles win", "a1_lose")
		addButton("Keep it going", "Apply just enough strength to prevent the tentacles from winning", "a1_keep")
	if(state == "a1_win"):
		saynn("The tentacles clearly won't be able to win this match.. so you take the lead and overpower them with ease, bringing the whole set of the strongest tentacles down to the table surface.")

		saynn("[say=pc]That's how you do it.[/say]")

		saynn("The monster feels your smug aura and whips your butt for it.")

		saynn("Luckily, it didn't hurt that much. But that also means that the tentacles didn't really get any stronger.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "a1_lose"):
		saynn("Maybe the tentacles just need some encouragement.")

		saynn("You relax your hand and let the multiple tentacles overpower you. You lose!")

		saynn("[say=pc]Aw. Good job, you're so strong![/say]")

		if (_tentacles.mind <= 3):
			saynn("The tentacles aren't smart enough to see through your act.. so they sway happily.. But they didn't actually get any stronger from this.")

		else:
			saynn("The tentacles are smart enough to see that something is fishy. You get multiple stern looks from their tips.")

			_tentacles.talk("We understand what you did. No need for that.")
			saynn("[say=pc]What? I lose, fair and square.[/say]")

			saynn("The tentacles sway annoyed.. and slither away. Looks like they didn't get any stronger from this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "a1_keep"):
		saynn("You decide to apply a small amount of your strength.. enough to keep the tentacles from winning.. but not enough to win yourself.")

		saynn("It doesn't take too long before the tentacles fail to keep up the pressure and lose anyway.")

		saynn("Still, it was a good workout for them!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "a2"):
		saynn("You offer the tentacles to do some armwrestling.. tentacle-wrestling.")

		saynn("They're strong enough to move around so they probably have some strength in them.")

		saynn("You know that they're not the strongest so you catch a few of the most strong ones and set your elbow on the nearby table.")

		saynn("[say=pc]Show me your gains.[/say]")

		saynn("It looks like the monster is ready.")

		saynn("[say=pc]Go.[/say]")

		saynn("You decide to apply a small amount of your strength.. enough to keep the tentacles from winning.. but not enough to win yourself.")

		saynn("Why? Well, the reason becomes obvious soon.")

		saynn("You start panting.. the constant pressure from the tentacles does add up eventually. It starts taking more and more of your strength to keep your hand where it is. All the while, the tentacles stay a constant force, sometimes sneakily switching the used tentacles.")

		saynn("By this point, you're not even sure if you can win this match. Your hand is shaking, your muscles are screaming for more oxygen, making you hungrily grab air with your mouth.")

		saynn("[say=pc]Uh.. draw?[/say]")

		_tentacles.talk("A draw would leave both of us unsatisfied.")
		saynn("The tentacles keep pushing.. and so you start losing, your hand getting overpowered.")

		saynn("That is, until the pool of untouched tentacles runs out. All of them are extremely tired by now.. and so you get a sudden victory! Completely out of nowhere.")

		saynn("[say=pc]Phew.. that was a good one.[/say]")

		saynn("Both of you have gotten a great workout.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "a3"):
		saynn("You offer the tentacles to do some armwrestling.. tentacle-wrestling.")

		saynn("You know that they're not the strongest so you catch a few of the most thick-looking ones and set your elbow on the nearby table.")

		saynn("[say=pc]Prove me you're not a weakling.[/say]")

		saynn("It looks like the monster is ready.")

		saynn("[say=pc]Go.[/say]")

		saynn("Oof, the sudden pull almost catches you off-guard. These tentacles sure have gotten stronger.")

		saynn("Only using half of your strength isn't enough, you gotta put all of it into this. You grab the table with your other hand and use it as support.")

		saynn("The tentacles keep pushing, their collective pressure gradually wearing you down. A quiet growl starts escaping your lips, adrenaline starts pumping through your blood!")

		saynn("You're managing to keep your hand roughly in the middle.. but it sure takes all of what you've got.")

		saynn("Eventually, the tentacles start giving in! They're slipping, their strength running out fast.")

		if (_tentacles.lust < 3):
			saynn("That's when one of the sneaky ones quietly reaches out.. and suddenly tickles your armpit!")

			saynn("[say=pc]AH![/say]")

		else:
			if (GM.pc.hasReachableVagina()):
				saynn("That's when one of the sneaky ones quietly reaches out.. and suddenly starts rubbing your pussy!")

				saynn("[say=pc]Ah..[/say]")

			elif (GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
				saynn("That's when one of the sneaky ones quietly reaches out.. and suddenly starts stroking your {pc.penis}!")

				saynn("[say=pc]Ah.[/say]")

			else:
				saynn("That's when one of the sneaky ones quietly reaches out.. and suddenly starts rubbing your tailhole!")

				saynn("[say=pc]Ah..[/say]")

		saynn("This one trick was enough for you to lose your grip and lose the match! The tentacles bring your hand down to the table's surface and pin it!")

		saynn("[say=pc]Wow. That was so unfair.[/say]")

		saynn("The cheeky tentacles are swaying happily.")

		saynn("[say=pc]Alright, you win this one. But you're not allowed to do this from now on.[/say]")

		saynn("They nod and set your hand free.")

		if (_tentacles.mind > 3):
			saynn("These tentacles are sure quite smart to be able to come up with this plan.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "a4"):
		saynn("You offer the tentacles to do some armwrestling.. tentacle-wrestling.")

		saynn("You know that they're not the strongest so you catch a few of the most thick-looking ones and set your elbow on the nearby table.")

		saynn("[say=pc]Prove me you're not a weakling.[/say]")

		saynn("It looks like the monster is ready.")

		saynn("[say=pc]Go.[/say]")

		saynn("Your hand hits the table faster than you can say..")

		saynn("[say=pc]Wow![/say]")

		saynn("The strength of the multiple tentacles almost dislocates your shoulder! The tentacles win this one, fair and square.")

		saynn("[say=pc]Ow. Holy..[/say]")

		saynn("They're bobbing happily. Maybe trying to fight many of them at once was a mistake.. especially now.")

		saynn("[say=pc]Give me your strongest one.[/say]")

		saynn("The thickest tentacle of them all lands on the table.")

		saynn("[say=pc]Alright..[/say]")

		saynn("You grab the tendril's tip.. and push your elbow into the sturdy metal surface below it. Knowing what it's capable of, you pre-flex your muscles.")

		saynn("[say=pc]Go.[/say]")

		saynn("And so the fight rages on. Your hand and the thick tendril are locked together, trying to subdue each other. The metal table groans under the sudden strain.")

		saynn("For a full minute, neither of you budge an inch. Your arm's muscles are tensed up beyond belief. Your breath quickens fast. All the while, the tentacle is doing fine..")

		saynn("[say=pc]Come.. on..[/say]")

		saynn("Slowly, the balance begins to shift. Not instantly.. bit by bit. Your forearm begins to tremble, the burn in your bicep turning into a full-on fire.")

		saynn("You push with everything you have left, a final desperate rally that wins you about twenty degrees.. but the tentacle absorbs it soon after and continues its steady, patient advance.")

		saynn("Your fingers start to curl open, your wrist bending more and more. The fight leaves your muscles strained hard. With a final, gentle yet undeniable pressure, the back of your hand kisses the cool metal.")

		saynn("[say=pc]Ah..[/say]")

		saynn("The tentacle wins!")

		saynn("Your arm.. is aching from all the abuse that it went through. A shocked laugh escapes your lips.")

		saynn("[say=pc]Now I'm the weak one here, huh?[/say]")

		saynn("You offer a nod of respect to the victorious tendril. It was a fair fight.. as fair as it could be.")

		_tentacles.talk("Thank you for training our strength.")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "a5"):
		saynn("You offer the tentacles to do some armwrestling.. tentacle-wrestling.")

		saynn("You know that you're gonna lose. But still.. maybe you can put up somewhat of a challenge.")

		saynn("[say=pc]Let's do this.[/say]")

		saynn("The monster offers you one of its tentacles.. not even the strongest one. You grab its tip and press your elbow into the table.")

		saynn("[say=pc]Go.[/say]")

		saynn("You were bracing for the worst.. but that doesn't happen. Instead, the tentacle just freezes your hand in place. As you try to put more strength into it, the tendril meets your efforts and nullifies them with ease.")

		saynn("[say=pc]Is that all you've got?[/say]")

		saynn("Slowly, deliberately, the tentacle begins to press. It's a smooth, controlled descent, the tendril lowering your hand onto the table. You grunt, you brace, you try to twist, but your resistance is meaningless. Your arm is guided down with the sheer force of a hydraulic press.")

		saynn("The back of your hand touches the cool surface. The tentacle won!")

		saynn("[say=pc]Ah..[/say]")

		saynn("You slump back, your arm throbbing. The tentacles are offering you a slow clap.")

		saynn("They have gotten quite strong, haven't they? And so fast, too.")

		addButton("Continue", "See what happens next", "endthescene")
		# (( a0 - total fail
		# (( a1 - still fail
		# (( a2 - neutral for a while but loses
		# (( a3 - wins because tickles or lusts
		# (( a4 - can win somewhat easily
		# (( a5 - can win easily with one tentacle
		# (( aa - can lift you
	if(state == "p0"):
		saynn("You get tentacles' attention and bring them to the box that has lots of differently-shaped holes in it.. along with separate objects of the same shapes.")

		saynn("[say=pc]Alright. I want you to try to solve this. You just have to put the objects in their correct holes.[/say]")

		saynn("The monster has a different idea though.. it just slides its tentacles into every hole of the puzzle box, stuffing it full.")

		saynn("[say=pc]Right..[/say]")

		saynn("Any kind of puzzle might be too hard for it.. especially now. It's just a plant after all.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p1"):
		saynn("You get tentacles' attention and bring them to the box that has lots of differently-shaped holes in it.. along with separate objects of the same shapes.")

		saynn("[say=pc]Alright.. Try to solve this.[/say]")

		saynn("When presented with the puzzle.. the monster just ignores it, swaying around left and right.")

		saynn("One of the tentacles stumbles upon a cube and reflexively grabs it, giving you some hope..")

		saynn("Unfortunately, the same tentacle just tosses it away after a few seconds.")

		addButton("Explain", "Explain exactly what the tentacles need to do", "p1_explain")
		addButton("Show", "Show what the tentacles need to do", "p1_show")
		addButton("Scold", "Punish the tentacles for throwing the cube away", "p1_scold")
	if(state == "p1_explain"):
		saynn("You fetch the cube and set it down in front of the tentacles..")

		saynn("[say=pc]You see this? You gotta put this cube..[/say]")

		saynn("You point at the square hole in the puzzle box.")

		saynn("[say=pc]..through this exact hole.[/say]")

		saynn("It's hard to check if the tentacles have understood anything.. they're still just idly swaying around..")

		saynn("[say=pc]Try it again, please.[/say]")

		saynn("After some silence, the tentacles just lose interest and slither away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p1_show"):
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
	if(state == "p1_scold"):
		saynn("[say=pc]You.. silly tentacles.. just shove the cube through the right hole, is it that hard?[/say]")

		saynn("The tentacles hear the anger in your voice and react by tossing all of the objects away.")

		saynn("[say=pc]Really? Ugh..[/say]")

		saynn("Looks like they're not happy.. but so are you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p2"):
		saynn("You get tentacles' attention and bring them to the box that has lots of differently-shaped holes in it.. along with separate objects of the same shapes.")

		saynn("[say=pc]Alright.. Try to solve this.[/say]")

		saynn("You present the monster to a bunch of differently-shaped objects. It grabs one of them.. a little pyramid.. and starts randomly smacking it against the box!")

		addButton("Show", "Show what the tentacles need to do", "p2_show")
		addButton("Explain", "Try to explain what the tentacles need to do", "p2_explain")
		addButton("Rile it up", "Put more stress on the tentacles! Try to get it all horny as well", "p2_rile")
	if(state == "p2_show"):
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
	if(state == "p2_explain"):
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
	if(state == "p2_rile"):
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
	if(state == "p3"):
		saynn("You get tentacles' attention and bring them to the box that has lots of differently-shaped holes in it.. along with separate objects of the same shapes.")

		saynn("[say=pc]Solve this for me.[/say]")

		saynn("The tentacles grab a few of the objects and reach towards the main box.")

		saynn("It feels like it kinda knows what to do.. the free tentacles start searching for holes.. that are then prodded by differently-shaped objects.")

		saynn("Despite all the training, the tentacles are still just doing it randomly.. Trying to fit a cube into a circular hole.. or a cylinder into a triangle one..")

		saynn("It feels like it's about to give up.. maybe.. who knows. You can't read minds.")

		addButton("Explain", "Give the tentacles an explanation of what it should do", "p3_explain")
		addButton("Just watch", "Maybe it will figure it out", "p3_watch")
	if(state == "p3_explain"):
		saynn("You start explaining what the tentacles should do..")

		saynn("[say=pc]You gotta match the object and the hole shape.. If you're holding a cube, you gotta put it through the square hole. If you're holding a cylinder..[/say]")

		saynn("..but the tentacles quickly get bored by your explanation and slither away.")

		saynn("Looks like they already know all of this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p3_watch"):
		saynn("You decide to just stay quiet and watch the process.")

		saynn("The tentacles keep failing..")

		saynn("It's hard to fight this feeling.. you really wanna help.. but you don't wanna solve it for them.")

		saynn("The tendrils just keep trying all the holes.. until they finally manage to fit one of the objects through the correct one!")

		saynn("You raise a brow but don't say anything.")

		saynn("It takes some more time.. but eventually another object finds the right hole!")

		saynn("The tentacles are on a roll! There are not that many more possibilities left.. so it doesn't take long until the last object gets pushed through!")

		saynn("[say=pc]Great job![/say]")

		saynn("Even though it wasn't you who solved it.. somehow.. you still get a strong feeling of accomplishment. A shared one.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p4"):
		saynn("You get tentacles' attention and bring them to the box that has lots of differently-shaped holes in it.. along with separate objects of the same shapes.")

		saynn("Before you can even tell the tentacles what they should do, they already start grabbing all the objects and moving them towards the puzzle box.")

		saynn("It doesn't take long before the cube finds a square hole, a cylinder finds a circular hole, a pyramid finds a triangle hole, an arch finds an arch hole..")

		saynn("It does them all!")

		saynn("[say=pc]Wow. Great job.[/say]")

		saynn("You can see some real potential now. The tentacles are getting smarter fast.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p5"):
		saynn("You get tentacles' attention and bring them to the box that has lots of differently-shaped holes in it.. along with separate objects of the same shapes.")

		saynn("The tentacles see that you brought that puzzle box.. and just stare at you.. silently.")

		saynn("[say=pc]Huh? You don't wanna do this?[/say]")

		saynn("They can't talk.. but you do get a strong feeling that they're already bored of such simple puzzles.")

		saynn("[say=pc]Maybe it's just too hard for you, huh~? You're afraid to fail too much. I see, I can take it away.[/say]")

		saynn("But before you can do that, the tentacles reach out to yoink all the objects and the puzzle box for itself.")

		saynn("The monster carefully sets down the main box on the floor in front of it.")

		saynn("Then it brings the first object.. the cube.. and pushes it through the square hole with ease.")

		saynn("[say=pc]Alright. But can you do the others?[/say]")

		saynn("You can see what can only be described as tentacles doing an eye roll.")

		saynn("The cylinder is next.. the tentacle brings it to the puzzle box.. and makes it hover above the holes. The cylinder sways left and right a bit, inching closer and closer to the circular hole.")

		saynn("..but then it moves it above the square hole instead.")

		saynn("[say=pc]Huh?[/say]")

		saynn("The tentacle starts lowering the cylinder into the square hole..")

		saynn("[say=pc]But you had it right the first time.[/say]")

		saynn("It keeps doing it..")

		saynn("[say=pc]Uhm..[/say]")

		saynn("Miraculously, the cylinder fits through the square hole just fine.")

		saynn("[say=pc]Right. They just got the same dimensions. But it's incorrect to do that.[/say]")

		saynn("The tentacle grabs a pyramid next and moves it to the puzzle box.")

		saynn("The pyramid begins to get lowered into the triangular hole.. but at the last possible second.. the tentacle pushes it through the square hole instead.")

		saynn("[say=pc]Are you serious right now? No![/say]")

		saynn("The tentacle grabs an arch.. and pushes it through the same square hole..")

		saynn("[say=pc]No! No![/say]")

		saynn("It grabs another shape.. and then another.. they all fit through the square hole just fine.. The tentacles are clearly bullying you..")

		saynn("[say=pc]Stop it.. this is so wrong.. please..[/say]")

		saynn("Another shape.. a half-circle.. there is no way it'd fit anything but a half-circle hole.. but it does.. it fits through the square hole just fine..")

		_tentacles.talk("Too hard for you?")
		saynn("You feel like you're losing your mind.. you began hearing voices in your head..")

		saynn("[say=pc]What?[/say]")

		saynn("You look around but there is no one.. just the tentacles.")

		_tentacles.talk("Should we stop?")
		saynn("You blink a lot.")

		saynn("[say=pc]Uh.. sure?[/say]")

		saynn("The tentacles put the puzzle box back where it was.. and slither away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "p6"):
		saynn("It looks like the tentacles have no interest in doing the puzzle box anymore..")

		saynn("You look for something else that you can do.. and find a chess board.")

		saynn("The wooden surface with a fancy pattern quickly gets the monster's attention.")

		saynn("[say=pc]This is chess. It's a game.[/say]")

		saynn("You set up the whole board with all the pieces.")

		saynn("[say=pc]Different pieces play by different rules. The pawns are the simplest, they can move one square forward..[/say]")

		saynn("Hearing the word 'square' activates something in the tentacles' brain.. It grabs as many pieces as it can and begins looking for holes to put them in.")

		saynn("[say=pc]Wait, wait. This is a different thing.[/say]")

		saynn("You try to explain the rules of chess.. but the board is ruined anyway..")

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
			#possible.append("p6")
		if(_tentacles.mind >= 5):
			possible.append("p5")
		if(_tentacles.mind >= 4 && _tentacles.mind < 5):
			_tentacles.train(_tentacles.STAT_MIND)
		
		if(possible.size() > 0):
			setState(RNG.pick(possible))
		return

	if(_action == "doArmwrestling"):
		var possible:Array = []
		
		if(_tentacles.agility <= 0):
			possible.append("a0")
		if(_tentacles.agility == 1):
			possible.append("a1")
		if(_tentacles.agility == 2):
			possible.append("a2")
		if(_tentacles.agility == 3):
			possible.append("a3")
		if(_tentacles.agility == 4):
			possible.append("a4")
		if(_tentacles.agility >= 5):
			possible.append("a5")
		
		if(_tentacles.agility != 1):
			_tentacles.train(_tentacles.STAT_AGILITY)
		
		if(possible.size() > 0):
			setState(RNG.pick(possible))
		return

	if(_action == "say_shoo"):
		_tentacles.trainNothing()

	if(_action == "a1_win"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "a1_lose"):
		_tentacles.trainNothing()

	if(_action == "a1_keep"):
		_tentacles.train(_tentacles.STAT_AGILITY)

	if(_action == "p1_explain"):
		_tentacles.trainNothing()

	if(_action == "p1_show"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "p1_scold"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "p2_show"):
		_tentacles.trainNothing()

	if(_action == "p2_explain"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "p2_rile"):
		_tentacles.train(_tentacles.STAT_MIND)
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "p3_explain"):
		_tentacles.trainNothing()

	if(_action == "p3_watch"):
		_tentacles.train(_tentacles.STAT_MIND)

	setState(_action)
