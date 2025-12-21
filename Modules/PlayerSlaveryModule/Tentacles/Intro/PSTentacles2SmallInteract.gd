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
	if(state == "needMusic"):
		# (( tiny idle anim
		aimCameraAndSetLocName("pstent_middle")
		saynn("[say=sci2]We wanna test how the specimen will react to a different atmosphere.[/say]")

		saynn("[say=pc]You mean void? Pretty sure it will kill it.[/say]")

		saynn("[say=sci2]No.[/say]")

		saynn("An armed guard steps into your cell and hands you something.")

		saynn("[say=sci2]This is a device that is capable of interacting with your cell's speakers and lights.[/say]")

		saynn("You take a closer look.. indeed.. It looks like a remote with a few buttons on it.")

		saynn("[say=sci2]The specimen possesses no obvious eyes or ears. We wanna see if it can still somehow see or hear.[/say]")

		if (_tentacles.interact1 == "listen"):
			saynn("[say=pc]Didn't I tell you that it can hear me already?[/say]")

			saynn("[say=sci1]First of all, it was an egg. But most importantly, you have no science degree, why would we listen to your baseless assumptions?[/say]")

			saynn("You roll your eyes.")

		saynn("What music do you wanna play for the tentacles?")

		addButton("Heavy metal", "Play some heavy metal", "2_metal")
		addButton("Soothing ambient", "Play some very calming ambient", "2_ambient")
		addButton("Drum'n'Bass", "Play some electronic music", "2_dnb")
		addButton("Smooth jazz", "Play something smooth and intimate", "2_jazz")
	if(state == "2_metal"):
		# ((tiny dance anim?
		saynn("You choose one of the heavy metal music tracks.. and suddenly the whole cell lights up red.. almost like it's an emergency.")

		saynn("The first thunderous guitar chord hits like a physical blow, a wave of pure noise that vibrates the air in your chest.")

		saynn("The small creature recoils as if struck. Its three tentacles jerk back, coiling into tight, defensive knots. The raw, screaming vocals rip through the room while the red lights begin to flash.")

		saynn("Eventually, the tentacles uncurl themselves and adapt to the insane music. They begin to thrash, whipping against the concrete in a frantic, angry rhythm that matches the pounding drums.")

		saynn("[say=sci2]That's.. certainly a choice.[/say]")

		saynn("[say=sci1]What?[/say]")

		saynn("[say=sci2]I SAID.. IT'S A CHOICE.[/say]")

		saynn("[say=sci1]I still can't hear you.[/say]")

		saynn("You let the track play out.. hoping that it would end faster than you losing your hearing. The tentacles seem to continue thrashing even after the last chord.. looks like you're got them into the right mood.")

		saynn("[say=sci2]Finally.. peace..[/say]")

		saynn("[say=sci1]Did this prove anything?[/say]")

		saynn("[say=sci2]Well.. it can hear. But maybe it was just getting startled by the whole cell vibrating.[/say]")

		saynn("[say=sci1]I regret letting this test subject choose anything.[/say]")

		addButton("Continue", "See what happens next", "timeToTest")
	if(state == "2_ambient"):
		# ((tiny slow dance anim?
		saynn("You find some smooth, soothing ambient music.. and decide to turn it on.")

		saynn("The first soft, calming note drifts through the air of the cell. The harsh lab lights seem to be switching towards a warm hue.")

		saynn("The three tentacles stay still for a bit, almost like they're listening.. After that, they simply begin to sway, a slow, graceful dance in time with the peaceful rhythm.")

		saynn("Their movements become purposeful, smooth. The slick surfaces glisten as they weave intricate, gentle patterns in the air, tracing the shapes of the melodies they hear. Their tips move with a curiosity, exploring the vibrations in the air itself.")

		saynn("A soft, harmonious hum, almost below hearing, resonates from their core, harmonizing with something inside you..")

		saynn("[say=sci2]The test proves their hearing ability. Interesting. Makes me wonder why would a plant-like specimen evolve such a trait.[/say]")

		saynn("[say=sci1]This doesn't matter to us right now.[/say]")

		saynn("Eventually, the track ends.. and the cell's lighting returns back to normal.")

		addButton("Continue", "See what happens next", "timeToTest")
	if(state == "2_dnb"):
		# ((tiny dance anim?
		saynn("You see a drum'n'bass option.. and decide to pick it! The cell's lighting gets all dim..")

		saynn("The first sound that fills the room is a precise thump-thump-thump of a deep drum. It's followed instantly by a fast, intricate pattern of sharp, electronic hi-hats, each one spawning a little flash of light. The sound is rapid, clean, and full of energy.")

		saynn("The plant freezes for some time.. Then, a twitch. A single green tentacle jerks in time with the next bass hit. Another joins it, tapping the air.")

		saynn("Suddenly, it's moving. The three tentacles aren't just randomly thrashing.. It feels like they're following the melody. They curl and weave around each other in a blur of a dance, moving so fast they almost seem to leave after-images in the flashing light.")

		saynn("They vibrate with the sub-bass, whip with the snares, and slice precise patterns to the rapid percussion. It's learning the beat and is clearly trying to match it.. And you do too, the music is just begging for you to move your butt in tact with it..")

		saynn("[say=sci2]Fascinating reaction. The specimen is extremely energetic.[/say]")

		saynn("[say=pc]It's got good taste in music.[/say]")

		saynn("Eventually, the track ends.. and the cell's lighting returns back to normal.")

		addButton("Continue", "See what happens next", "timeToTest")
	if(state == "2_jazz"):
		# ((tiny slow dance anim?
		saynn("You pick an option that you like the most..")

		saynn("[say=sci2]Deploying smooth jazz.[/say]")

		saynn("A moment later, the cell is bathed in a soft, warm light. A gentle bassline begins to thump, slow and deep as a heartbeat. A smooth saxophone winds its way through the air, lazy and sweet like honey.")

		saynn("The three tentacles pick up on the melody and begin their slow, hypnotic sway. They follow the curl of the saxophone's notes and shine under the intimate glow.")

		saynn("One tentacle extends toward you, not to strike, but to dance. It brushes the air just inches from your ankle, inviting you to join. Another curls loosely around its own length, caressing itself in time with the bass.")

		saynn("[say=sci2]Fascinating reaction.[/say]")

		saynn("Eventually, the track ends.. and the cell's lighting returns back to normal.")

		addButton("Continue", "See what happens next", "timeToTest")
	if(state == "timeToTest"):
		# (( tiny idle anim
		saynn("[say=sci2]We don't have much time before our break so let's be quick.[/say]")

		saynn("The doors to your cell open.. revealing a few armed guards who bring in some things.")

		saynn("[say=sci2]Here are a few tests you could do. You may pick one of them and see if the specimen will complete it.[/say]")

		saynn("How do you wanna test the tentacles?")

		addButton("Puzzle", "Offer the tentacles a logic puzzle", "3_puzzle")
		addButton("Evil robot", "Give it an evil-looking robot toy to play with", "3_toy")
		addButton("Small ladder", "Let the tentacles climb a small ladder", "3_ladder")
		addButton("Onahole", "Give it a sextoy and see what it will do with it", "3_onahole")
	if(state == "3_puzzle"):
		saynn("One of the things that were brought by guards seems to be a logic puzzle.. It looks like a box with differently-shaped holes in it.. square, circle, triangle and some others. And there are also objects of the same shapes that you are supposed to push through these holes.")

		saynn("[say=pc]Alright.. Should be simple enough. Try to figure out what to do.[/say]")

		saynn("You offer this box and all the other objects to the tentacles.")

		saynn("At first, they just poke it.. But then one of the tentacles wraps around a cube and curiously lifts it, feeling its weight. Then it lifts the other objects as well, one by one.")

		saynn("After trying every object, the monster decides to bonk the big box with a small cube!")

		saynn("[say=pc]Nope, try again.[/say]")

		saynn("It bonks the box again.. but now it keeps sliding the cube along the top surface.. back and forth for some time.. until the cube finds a correctly-shaped hole and falls through it.")

		saynn("[say=pc]Good job.[/say]")

		saynn("The tentacles grab a second object.. a cylinder.. and start doing the same thing, grinding the object across the surface with all the holes.. This time it doesn't get so lucky because it's holding the cylinder the wrong way.")

		saynn("Eventually it gives up and throws the cylinder away.")

		saynn("[say=sci1]Looks like it failed.[/say]")

		saynn("[say=pc]It did one![/say]")

		saynn("[say=sci2]The specimen does seem to possess the ability to do basic logic puzzles. Further training might improve the results.[/say]")

		saynn("[say=sci1]It's just brute-forcing the puzzle, there is no logic here, it's a plant. And so it's as dumb as any plant.[/say]")

		saynn("You furrow your brows.. but then you hear another object finding its hole. The triangle-shaped one.")

		saynn("[say=pc]See?[/say]")

		saynn("You really wanna pat the tentacles.. but you're not sure how.")

		saynn("[say=sci2]Despite being plant-based, it seems to possess a lot of the same traits as we do. Learning is one of them. At least that is my current theory.[/say]")

		saynn("[say=sci1]I will need to see more than theory.[/say]")

		saynn("You put the box away.")

		addButton("Continue", "See what happens next", "afterAll")
	if(state == "3_toy"):
		saynn("One of the things that were brought is a little humanoid robot.. It looks like it has cool red armor with a slick but also slightly intimidating design. The helmet has 4 robotic eyes.. and its hand is holding a weapon.")

		saynn("[say=pc]Isn't that a toy?[/say]")

		saynn("[say=sci1]It's more than a toy! Watch.[/say]")

		saynn("The robot's systems kick into life.. making it stand up. The 4 robotic eyes light up with a scary green color.")

		saynn("[say=sci2]Full remote control. Composite materials that mimic the ones used in the real space rigs. Advanced gyroscopes and motors that allow for high-frequency stabilization and locomotion. 4 cameras attached to a bluespace receiver, allowing for near-infinite precision and range of operation. A battery pack that will last you at least a week. Completed with a small 5 to 1 replica of an AlphaCorp standard issue laser rifle.[/say]")

		saynn("You shrug. The tentacles don't seem to be very interested in the robot either, even when it walks past it a few times.")

		saynn("[say=pc]Fancy toy, sure.[/say]")

		saynn("[say=sci1]I will show you, fancy.[/say]")

		saynn("Suddenly, the robot raises its laser rifle and aims it at the tentacle monster.")

		saynn("[say=pc]Hey![/say]")

		saynn("Before you can do anything, a thin, searing bolt of red energy flashes through the air and strikes the center mass of the tentacle monster.")

		saynn("The effect is instant. A pained, sizzling sound fills the air, and the smell of burnt, sweet plant matter. The three green tentacles snap straight out, throbbing with shock and agony.")

		saynn("Then, only a few moments later, they act..")

		saynn("One tentacle whips forward, wrapping around the rifle's barrel with a crushing grip. You're momentarily deafened by a sharp crack of composite materials breaking.. until the robot's weapon is ripped from its hand, sparks spraying from its ruined housing.")

		saynn("The other two tentacles strike like angry snakes. They wrap around the robot's legs and yank hard. The advanced gyroscopes whine in protest.. until they fail. The robot crashes onto its back with a heavy metallic thud.")

		saynn("It tries to push itself up, its four green eyes flashing.. but it doesn't get the chance. All three tentacles coil around its torso and neck in a furious, squeezing embrace. What comes next is a sickening screech of tearing metal and a final, spectacular shower of white sparks.. until the robot's head gets violently ripped from its body.")

		saynn("The headless body goes limp. The tentacles, slick with robot fluid and glowing with fury, hold the spoils of war for a few seconds.. before just tossing the head aside..")

		saynn("[say=sci2]Ooh.. wow..[/say]")

		saynn("[say=sci1]What the.. That prototype cost us millions of credits![/say]")

		saynn("The tentacles awkwardly climb into its nest and coil around the wounded one.")

		saynn("[say=pc]So much for composite materials and advanced gyroscopes.[/say]")

		saynn("You can't help but to smile hearing all the grumbling that comes through the intercom.")

		saynn("[say=sci2]..try to remain calm..[/say]")

		saynn("[say=sci1]..no.. did you see what that stupid thing did?[/say]")

		saynn("[say=sci2]..yeah.. but try to recontextualize everything that happened..[/say]")

		saynn("[say=sci1]..grr.. fine.[/say]")

		saynn("All the while the guards walk into the cell and remove the remains of the robot.. being careful to avoid the nest as far as they can.")

		saynn("[say=sci1]Okay. Test is over.[/say]")

		addButton("Continue", "See what happens next", "afterAll")
	if(state == "3_ladder"):
		saynn("The tentacles probably wouldn't be able to handle a full obstacle course.. they can't even move around still.. but maybe they can try to climb a single thing.")

		saynn("You find a little triangle-shaped ladder.. and place it against the monster.")

		saynn("At first, the tentacles don't seem to have much interest in it. They brush lightly against the bars of it.. until one of them decides to wrap around them and push. The ladder seems to be too heavy for it to move..")

		saynn("[say=pc]Don't push it. Pull.[/say]")

		saynn("You watch it struggle with the ladder.. until it suddenly does what you say and pulls itself closer to it by pulling on the bars. The tentacles manage to lift themselves off of the nest and climb a few horizontal metal bars.")

		saynn("[say=sci2]Hm. The specimen seems to possess a very intricate muscle system.[/say]")

		saynn("Makes you wonder if these muscles can be trained the same way..")

		saynn("After some time, the monster gets too tired to hang off of the horizontal bars and so it returns back to the nest.")

		addButton("Continue", "See what happens next", "afterAll")
	if(state == "3_onahole"):
		saynn("A certain.. toy.. catches your eyes. A limbless onahole sextoy.. completed with 2 tight holes, a pussy and a butthole.. very lewd.")

		saynn("[say=pc]Ohh.. I like this.[/say]")

		saynn("[say=sci2]We wanted to see how it will react to.. normal anatomy of a person.[/say]")

		saynn("You hold the toy for a moment, feeling its strange, soft texture. Nothing about this anatomy is normal.. Still, you place it carefully on the floor in front of the three green tentacles.")

		saynn("At first, they are still. Then, one slick tip slowly extends, tapping the silicone surface. It prods, testing the toy. The tentacle draws back, then prods again, a little harder. The other two tentacles join, their tips now gently exploring the curves and ridges of the onahole.")

		saynn("They trace the outlines of the two holes, circling them again and again. A low, interested hum vibrates from the monster.")

		saynn("Then, the exploring stops. One of the tips presses firmly against the pussy hole. With a soft, wet sound, it pushes inside. The tentacle slides in smoothly, deeper and deeper, its slick surface shining with a fresh coat of clear, slippery fluid..")

		saynn("Seeing this, the other two tentacles sway with an undying interest. One quickly seeks out the second hole, sliding in with the same wet ease. The third tentacle, with no hole left, wraps tightly around the toy's exterior, squeezing it as the other two keep it stuffed full.")

		saynn("They thrust ever so slightly.. a slow, instinctive rhythm that grows faster over time.")

		saynn("[say=sci1]It seems to be quite horny, for sure.[/say]")

		saynn("[say=sci2]Not sure if such a term can be applied to this kind of specimen.[/say]")

		saynn("After the tentacles are done.. fucking.. the onahole, you grab it and put it away.. its holes are still leaking lube-like juice.")

		saynn("Seeing all of this.. makes you excited.. for some reason..")

		addButton("Continue", "See what happens next", "afterAll")
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
	if(_action in ["1_milk", "2_jazz", "3_onahole"]):
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

	if(_action == "2_metal"):
		_tentacles.interactTiny2 = "metal"

	if(_action == "2_ambient"):
		_tentacles.interactTiny2 = "ambient"

	if(_action == "2_dnb"):
		_tentacles.interactTiny2 = "dnb"

	if(_action == "2_jazz"):
		_tentacles.interactTiny2 = "jazz"

	if(_action == "3_puzzle"):
		_tentacles.interactTiny3 = "puzzle"

	if(_action == "3_toy"):
		_tentacles.interactTiny3 = "toy"

	if(_action == "3_ladder"):
		_tentacles.interactTiny3 = "ladder"

	if(_action == "3_onahole"):
		_tentacles.interactTiny3 = "onahole"

	if(_action == "afterAll"):
		processTime(2*60*60)

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
