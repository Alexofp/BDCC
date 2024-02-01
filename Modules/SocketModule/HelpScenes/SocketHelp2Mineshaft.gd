extends SceneBase

var fuckedPussy = false

func _init():
	sceneID = "SocketHelp2Mineshaft"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("[say=pc]How is your acclimation going?[/say]")

		saynn("Socket stares into her datapad.")

		saynn("[say=socket]Um.. I need to get to the bathroom.[/say]")

		saynn("[say=pc]Sure, I can wait for you here.[/say]")

		saynn("Socket tilts her head at you.")

		saynn("[say=socket]Not in that way, I need to check the ventilation in the bathroom. Could you please show me where it is?[/say]")

		saynn("Wait..")

		saynn("[say=pc]You don't know where it is? How do you.. pee.. then?[/say]")

		saynn("Socket smiles.")

		saynn("[say=socket]I can show you some other time.[/say]")

		saynn("Oh no. She sees your face deforming from disgust and decides to explain herself.")

		saynn("[say=socket]A device! I can show you a device that helps with that.. not show how I pee..[/say]")

		saynn("That makes it.. slightly better.")

		saynn("[say=socket]Although if you want to see me..[/say]")

		saynn("You grab her hand and pull her towards the lift.")

		saynn("[say=pc]Let's go![/say]")

		addButton("Lift", "Enter it", "bring_socket_lift")
	if(state == "bring_socket_lift"):
		aimCameraAndSetLocName("mining_elevator")
		saynn("You and Socket step into the lift. You press the 'cellblock' button and watch as the room begins to move up with a screech.")

		saynn("[say=socket]Thanks![/say]")

		saynn("[say=pc]Do you really need me though?[/say]")

		saynn("She nods many times.")

		saynn("[say=socket]I used to spend most of my time in cyberspace. There are no.. walls there.. you know?[/say]")

		saynn("Makes sense that she is struggling here now.")

		saynn("[say=pc]What does it look like?[/say]")

		saynn("[say=socket]Cyberspace? It's handmade by people. So it's pretty. It's like a spider web that you can run through! I have some implants that help me do that. Wanna see?[/say]")

		saynn("[say=pc]Sure?[/say]")

		saynn("Suddenly, Socket does a vertical split, raising her leg high and showing you her private bits in great detail.")

		saynn("[say=pc]Uh..[/say]")

		saynn("[say=socket]It's in there![/say]")

		saynn("She casually spreads the petals of her pussy and tries her best to show the depths of it. There is something metal in there.. some kind of.. port.. exactly where her cervix should be.")

		saynn("[say=pc]What's that in your.. womb.[/say]")

		saynn("[say=socket]That's the implant![/say]")

		saynn("Technically.. She is not wrong. It is implanted into her.")

		saynn("[say=pc]Does that mean you can't get pregnant?[/say]")

		saynn("Socket blinks many times.")

		saynn("[say=socket]Probably? Is that a problem?[/say]")

		saynn("You shrug. Socket lowers her leg and stands near.")

		saynn("[say=socket]Most places I worked at prohibit breeding. So it was.. kind of an advantage. Helps against people that really want to stretch the unstretchable too![/say]")

		saynn("Right.. One uncomfortable talk later, the lift finally arrives.")

		addButton("Bathroom", "Show Socket where the bathroom is", "socket_goes_bathroom")
	if(state == "socket_goes_bathroom"):
		aimCameraAndSetLocName("main_bathroom1")
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction="crawl"})
		saynn("You walk Socket through the main hall and show her where the closest bathroom is. The door opens automatically, inviting you two in.")

		saynn("[say=socket]Thanks! Now I just need access to the vent.[/say]")

		saynn("Socket begins to follow the walls of the big room, trying to find any covered openings in the walls.")

		saynn("[say=socket]Where is it..[/say]")

		saynn("At some point she gets on all fours and starts crawling around, pushing her head into each corner.")

		saynn("[say=pc]Do you need help or?[/say]")

		saynn("[say=socket]I'm good![/say]")

		saynn("She crawls under the sinks, wiggling her ass a lot in the process.")

		saynn("You notice a panel on one of the walls.. a big metal panel that has an orange trim to it.. a trim that says.. maintenance.. You point at it.")

		saynn("[say=pc]Is that it?[/say]")

		saynn("Socket tilts her head.")

		saynn("[say=socket]Yep![/say]")

		addButton("Continue", "See what happens next", "socket_approaches_vent")
	if(state == "socket_approaches_vent"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", flipNPC=true})
		saynn("Socket gets up and approaches it. She tries to use her access badge to open it.. but the maintenance door only buzzes, the motors inside it spinning loudly and fruitlessly.")

		saynn("[say=pc]Looks like it got stuck.[/say]")

		saynn("[say=socket]Yep! I know what to do.[/say]")

		saynn("Socket fetches a giant wrench from her backpack.. and, with one big swing, hits the door.. bonk!")

		saynn("The wrench bounces off the vent.. but the impact was enough to make something inside it shift and unlock the mechanism. The maintenance door opens, presenting.. a small square vent, slightly above floor..")

		saynn("[say=pc]Is that how you solve problems?[/say]")

		saynn("[say=socket]Yes.[/say]")

		saynn("If it works, it works..")

		saynn("[say=socket]That's not the task though. Need to check something inside.[/say]")

		saynn("Socket sticks her head inside the vent and tries to reach something.")

		addButton("Continue", "See what happens next", "socket_gets_stuck")
	if(state == "socket_gets_stuck"):
		# (( Anim here
		saynn("Socket reaches further and further, trying to poke something that's far away with her wrench.")

		saynn("[say=pc]Don't get stuck in it.[/say]")

		saynn("[say=socket]I won't![/say]")

		saynn("She crawls more and more into it and reaches her wrench out far to tighten some pipe. Seconds later..")

		saynn("[say=socket]I think I'm stuck.[/say]")

		saynn("Indeed. Her wide hips got perfectly squeezed by walls of the vent, making it so she can't get out or crawl further.")

		saynn("Too late to say 'I told you so'. Now you gotta decide what you're gonna do with her..")

		addButton("Help her", "Avoid the temptation and help her", "help_socket")
		addButton("'Help her'", "Pretend to help her", "help_lewd_socket")
	if(state == "help_socket"):
		saynn("Such a silly fennec, got herself stuck like that.")

		saynn("Obviously you're not gonna take advantage of that fluffy butt.. and that cute little squeezed pussy.. and the tight-looking tailhole that she doesn't even try to hide with her tail.")

		saynn("[say=pc]How did you even manage to do that, hold on.[/say]")

		saynn("You squeeze your hands into the space between her hips and the walls of the vent. After that, you proceed to try and pull her out of there..")

		saynn("[say=socket]Whatcha doing..[/say]")

		saynn("[say=pc]Helping you?[/say]")

		saynn("Her fluffy tail tickles your face as you tug on her hips, trying to free them.")

		saynn("[say=socket]Looks like I got myself into quite the situation..[/say]")

		saynn("Your hands slide over her wide curves as you try to grab her from different angles. No matter what you do, it doesn't seem to help.")

		saynn("That tail is getting really annoying though, the fluff getting into your mouth. You pull on it to try to free Socket but you only make her shudder and let out a painful noise, her legs kick you away. Ouch.")

		saynn("[say=socket]Ow! Don't do that![/say]")

		saynn("She is awfully picky for someone who is stuck and needs help.")

		addButton("Just keep helping", "Whatever. You have to get her out of there somehow", "socket_help_actually")
		addButton("Spank her", "Punish her for kicking you", "socket_stuck_spank")
		addButtonWithChecks("Rail her pussy!", "Really punish her for doing this", "socket_rough_pussy", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Rail her ass!", "Really-really punish her for doing this", "socket_rough_ass", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "socket_help_actually"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("Oh well, you let the annoying tail tickle your chin as you keep pulling on Socket's butt. You pray that someone won't walk in on you because..")

		saynn("[say=nova]Kinky~.[/say]")

		saynn("One of the guards walks past you two.. of course.")

		saynn("[say=socket]Hi-i![/say]")

		saynn("[say=nova]Yes, hai. Don't mind me, carry on.[/say]")

		saynn("One awkward interaction later, you return to it. Your arms are getting tired by now.. just like your lusty eyes are tired of watching that fluffy butt trying to wiggle free.")

		saynn("[say=socket]Oh, I know. My shoulder pads got caught![/say]")

		saynn("Socket lowers her shoulders a bit.. and just casually pulls herself out of the vent, without your help even.")

		saynn("[say=pc]Really?[/say]")

		saynn("Socket shrugs and closes the maintenance door. Makes you feel like you should have punished her for this..")

		saynn("[say=socket]My bad![/say]")

		addButton("Continue", "See what happens next", "unlock_fast_travel")
	if(state == "unlock_fast_travel"):
		GM.pc.setLocation("main_bathroom1")
		saynn("Socket takes a better look at the vent. Then she pulls out her datapad and takes a look at some kind of map.")

		saynn("[say=socket]These vents seem to be all over the prison. Maybe I could overhaul them into a.. a quick transportation system of sorts? I would have to modify each vent and connect them all into a network.. but I think it's doable![/say]")

		saynn("[say=pc]Isn't that a little.. suspicious?[/say]")

		saynn("[say=socket]Suspicious?[/say]")

		saynn("[say=pc]What would staff think if they'd spot me using these?[/say]")

		saynn("Socket hums.")

		saynn("[say=socket]You're right. I guess that limits the list a little. You should be safe if you climb into the one in your cell though![/say]")

		saynn("[say=pc]Sure. Just make sure I won't get stuck in them.[/say]")

		saynn("She giggles and starts jogging away"+str(", her pussy still dripping your seed" if fuckedPussy else "")+".")

		saynn("[say=socket]Thanks by the way! I think I can find a way back.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "socket_stuck_spank"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You got really frustrated with how she kicked you.. so you return the favor by smacking her naked ass, making it jiggle!")

		saynn("[say=socket]Ouch!..[/say]")

		saynn("Socket jerks from the pain so hard that she manages to accidentally free herself. She hits her butt again as she falls onto the floor.")

		saynn("[say=socket]Ow-w-w..[/say]")

		saynn("[say=pc]Oh, that worked.[/say]")

		saynn("[say=socket]If you'd spank me any harder, you'd be punished right now![/say]")

		saynn("Huh? This girl doesn't seem like the kind that would do that.")

		saynn("[say=pc]My bad. It was you who kicked me.[/say]")

		saynn("Socket gets up and rubs her butt a bit.")

		saynn("[say=socket]Apology accepted![/say]")

		saynn("At least you got her out of there with minimal effort on your side.")

		addButton("Continue", "See what happens next", "unlock_fast_travel")
	if(state == "socket_rough_pussy"):
		# (( Fuck anim here
		saynn("Fuck it, you're too horny and annoyed not to take advantage of that slut.")

		saynn("You take a spot behind her and get a firm grasp on her ass with one hand while the other holds your hard cock ready, your eyes focussed on her pussy slit that she doesn't even try to hide, displaying it proudly for you.")

		saynn("[say=socket]Ow. Gonna try to pull me out like that?[/say]")

		saynn("Socket doesn't even realize.. but seconds later. You piece her cunt with one rough thrust that sends shivers through her body and makes her gasp. The sudden penetration catches her off-guard, her pussy walls gripping your length tightly!")

		saynn("[say=socket]AH! Hey! Easy!..[/say]")

		saynn("[say=pc]Shut up, you're a free use slut now.[/say]")

		saynn("You put both of your hands on her hips and start fucking her while she is completely helpless. Socket tries to kick you off again but you just yank on her tail again while shoving your cock deep inside.")

		saynn("[say=socket]Nhh![/say]")

		saynn("She still tries to resist.. but being stuck like that doesn't give her much wiggle room, she is forced to endure your onslaught, her pussy making wet noises as you pound her relentlessly.")

		addButton("Faster", "Use that girl for your pleasure", "socket_rough_pussy_fast")
	if(state == "socket_rough_pussy_fast"):
		# ((faster anim here
		var removedImplant = getFlag("SocketModule.removedWombImplant", false)
		if (!removedImplant):
			saynn("Your hips slap against her butt as you pick up the pace. Whatever Socket has in her womb, it doesn't allow you to penetrate her cervix. But your thrusts are enough to cause a bump on her belly anyway, little desperate moans begin to escape her lips.")

		else:
			saynn("Your hips slap against her butt as you pick up the pace. Your thrusts are enough to cause a bump on her belly, little desperate moans begin to escape her lips.")

		saynn("[say=socket]Huff.. ah..[/say]")

		saynn("She got tired of resisting and just lets you have it your way with her and her cunt, her inner walls are barely wet.")

		saynn("[say=socket]You will pay for it![/say]")

		saynn("[say=pc]Uh huh. Give me even more reasons to leave you like this, slut.[/say]")

		saynn("[say=socket]Huff-f..[/say]")

		saynn("At some point her moans get louder, her whole body starts to shiver, her pussy gripping your cock again. She feels so tight that you can't hold back anymore..")

		addButton("Cum inside", "Breed the fennec", "socket_rough_pussy_cuminside")
	if(state == "socket_rough_pussy_cuminside"):
		# (( inside anim
		var removedImplant = getFlag("SocketModule.removedWombImplant", false)
		if (!removedImplant):
			saynn("She can't get pregnant anyway so you just push yourself over the edge with the last slow but rough thrusts, shoving your cock as deep as that pussy allows.")

		else:
			saynn("You really don't want to hold back so you just push yourself over the edge with the last slow but rough thrusts, shoving your cock as deep as that pussy allows.")

		saynn("[say=socket]Oh.. Are you.. ah..[/say]")

		saynn("Socket is still shivering a lot, her pussy squeezing your shaft as you start pumping her full of your spunk.")

		saynn("[say=pc]Yes. Why wouldn't I use a stuck whore?[/say]")

		saynn("[say=socket]Huff.. I'm not a whore! I'm.. I'm just stuck![/say]")

		saynn("You pull your cock out, leaving her stuffed pussy to leak your seed onto her fluffy trembling thighs. Whole bathroom smells of sex now..")

		saynn("[say=pc]Then I'm sure the next person who sees you will help.[/say]")

		saynn("You slap her ass, making her used slit push out more {pc.cum}.")

		saynn("[say=socket]Hey![/say]")

		saynn("And just like that, you leave her there.")

		addButton("Leave", "Time to go", "unlock_fasttravel_rough")
	if(state == "unlock_fasttravel_rough"):
		saynn("Although, before you leave completely, you take one last look at the vent.")

		saynn("Hmm.. You have seen many of them throughout the station. They're all probably connected into one network. Maybe you can use them as a.. quick transportation system of sorts. Socket would probably be able to modify them to allow for that.. after she gets out of the precarious state that she is in.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "bring_socket_lift"):
		processTime(3*60)

	if(_action == "socket_goes_bathroom"):
		processTime(3*60)

	if(_action == "socket_approaches_vent"):
		processTime(3*60)

	if(_action == "help_socket"):
		processTime(10*60)
		GM.pc.addStamina(-30)
		GM.pc.addLust(20)
		GM.pc.addPain(10)

	if(_action == "help_lewd_socket"):
		processTime(5*60)

	if(_action == "socket_help_actually"):
		processTime(10*60)
		GM.pc.addStamina(-30)

	if(_action == "unlock_fast_travel"):
		processTime(3*60)
		addMessage("You can now ask Socket to modify the station's vents to make them traversable")

	if(_action == "socket_rough_pussy_fast"):
		processTime(6*60)

	if(_action == "socket_rough_pussy_cuminside"):
		processTime(3*60)
		getCharacter("socket").cummedInVaginaBy("pc")
		setFlag("SocketModule.socketWillPunish", true)
		setFlag("SocketModule.punishReason", "stuckroughfuck")

	if(_action == "unlock_fasttravel_rough"):
		addMessage("You can now ask Socket to modify the station's vents to make them traversable")

	setState(_action)

func saveData():
	var data = .saveData()

	data["fuckedPussy"] = fuckedPussy

	return data

func loadData(data):
	.loadData(data)

	fuckedPussy = SAVE.loadVar(data, "fuckedPussy", false)
