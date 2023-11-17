extends "res://Scenes/SceneBase.gd"

var usedCondom = false
var isPussy = false

func _init():
	sceneID = "Ch3s3AlexScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		
	if(state == ""):
		aimCameraAndSetLocName("eng_controlroom")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		
		saynn("As you walk out of the control room you suddenly run into one of the familiar engineers. Alex Rynard blocks your path.")

		saynn("[say=alexrynard]Huh.[/say]")

		saynn("He keeps stepping forward while you retreat until you both end up back inside the big room full of computers and consoles.")

		saynn("[say=pc]Why are you here?[/say]")

		saynn("He looks around before crossing his arms and glaring at you.")

		saynn("[say=alexrynard]Was gonna ask you the same question, honestly.[/say]")

		saynn("He finds the nearest wall and leans against it, still blocking your only way out.")

		# (if used stun baton before or fought the guy)
		if(getFlag("TaviModule.ch2AlexUsedStunbaton") || getFlag("TaviModule.ch2AlexAttackedAndWon")):
			saynn("[say=alexrynard]Just had a bad feeling. And you know, two engineers stopped responding. I reckon you know something about that. My back still hurts if you’re wondering.[/say]")

		# (else)
		else:
			saynn("[say=alexrynard]Just had a bad feeling. And you know, two engineers stopped responding. I reckon you know something about that.[/say]")

		saynn("His voice sounds cunning, the little extra low vibrations that you are picking up are quite intimidating too.")

		saynn("[say=alexrynard]I know you won’t tell me anything. I just hope they’re not dead. As for you..[/say]")

		saynn("He pushes himself away from the wall and produces a remote before pointing it at you.")

		saynn("[say=alexrynard]You will get on your knees. Then I will let you spend some time in stocks while I look for my people and figure out what you broke here.[/say]")

		saynn("His clawed thumb is pressed against the red button. Trying to attack him now surely wouldn’t end well.")

		# (Options are Kneel, Coward!, Explain self)

		addButton("Kneel", "(Agility) Let him take you to the stocks", "kneel")
		addButton("Coward!", "(Vitality) Try to guilt him into attacking you", "coward!")
		addButton("Explain yourself", "Maybe he will understand", "explain_yourself")

	if(state == "kneel"):
		playAnimation(StageScene.Duo, "kneel", {npc="alexrynard"})
		
		saynn("Rising your hands and getting on your knees seems like the best option here. So you do just that, slowly lowering yourself and presenting yourself to the guy.")

		saynn("[say=pc]Here. You won.[/say]")

		saynn("The guy lowers the remote and halves the distance between you and him but then stops. He reaches into his belt for some zip ties and then throws them at you.")

		saynn("[say=alexrynard]Tie your hands up.[/say]")

		saynn("[say=pc]Alright.[/say]")

		saynn("You reach out for the zip ties and begin securing them around your wrists. It’s a bit awkward when you have to use your own hands to do so.")

		# (Options are Secure loosely, Secure tightly)

		addButtonWithChecks("Secure loosely", "Leave some empty space", "secure_loosely", [], [[ButtonChecks.StatCheck, Stat.Agility, 10]])
		addButton("Secure tightly", "Might as well just get it over with", "secure_tightly")


	if(state == "secure_loosely"):
		saynn("You make sure not to secure them too tightly, leaving some space between the zip ties and your wrists. And since you avoid putting pressure onto them, the guy seems to have no idea that you did that. He slowly walks up to you and then clips a leash to your collar.")

		saynn("[say=alexrynard]Up.[/say]")

		saynn("You obey his words and get up. Alex takes another look around to make sure there is no one here before turning around.")

		# (Options are Follow, Attack)
		addButton("Follow", "See where he brings you", "follow")
		addButton("Attack", "Use this opportunity", "attack")

	if(state == "secure_tightly"):
		saynn("You leave no empty space between zip ties and your wrists, effectively restraining yourself. You test them in front of the guy and show that you mean no harm. He slowly walks up to you and then clips a leash to your collar.")

		saynn("[say=alexrynard]Up.[/say]")

		saynn("You obey his words and get up. Alex takes another look around to make sure there is no one here before turning around.")

		# (Options are Follow, Attack is blocked)

		addButton("Follow", "See where he brings you", "follow")
		addDisabledButton("Attack", "Can't because your arms are tied up")

	if(state == "follow"):
		# (runs the follow scene towards the stocks)
		playAnimation(StageScene.StocksSexOral, "tease", {npc="alexrynard"})
		setFlag("TaviModule.ch3AlexChoice", "submit")
		setFlag("TaviModule.ch3AlexDefeatedHim", false)

		saynn("Alex brings you to the punishment platform that’s in the middle of the main hall. He unties your hands and then shoves your head into the opening that’s designed for it before doing the same to your hands. He then closes the top part, trapping you inside the stocks. A loud click secures your fate.")

		saynn("Your body is forced to bend forward, you can’t even look around that much but you already get some curious glances from inmates and staff around.")

		saynn("[say=alexrynard]Wanna tell me something before I leave you here?[/say]")

		# (Options are No, You’re cute, Fuck you)

		addButton("No", "There is nothing you can say", "no")
		addButton("You’re cute", "Tell that guy that he is adorable", "you’re_cute")
		addButton("Fuck you", "Let him know what you think about the guy", "fuck_you")


	if(state == "no"):
		saynn("You try to shake your head but quickly realize that you can’t.")

		saynn("[say=pc]No.[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]That’s how it usually is. People stay quiet until they need to use you. Abuse your kindness. You reminded me of that lesson. Thank you. I guess.[/say]")

		saynn("[say=pc]Don’t mention it.[/say]")

		saynn("Alex leaves you alone while you’re left to your own thoughts. At least you initialized that maintenance protocol just like Tavi wanted.")

		# (Scene ends, stocks begin)
		addButton("Continue", "Stocks time", "startstocks")

	if(state == "you’re_cute"):
		saynn("Alex stands in front of the stocks. You look up at him the best you can.")

		saynn("[say=pc]Yes. You’re cute. You should know that.[/say]")

		saynn("He gets confused at first, understandably. But then he chuckles and crouches before you, there is a subtle noise of the servos in his spine working hard.")

		saynn("[say=alexrynard]I’m a failed parody of myself. I’m broken. I’m anything but cute.[/say]")

		saynn("He then slowly gets up.")

		saynn("[say=alexrynard]But thank you. Maybe things would be different if.. Nah. Dreaming doesn’t heal your wounds.[/say]")

		saynn("Alex leaves you alone while you’re left to your own thoughts. At least you initialized that maintenance protocol just like Tavi wanted.")

		# (Scene ends, stocks begin)
		addButton("Continue", "Stocks time", "startstocks")

	if(state == "fuck_you"):
		saynn("[say=pc]Fuck you. I didn’t do anything worth throwing me inside the stocks. You should be here, not me.[/say]")

		saynn("Alex frowns and crouches before you, there is a subtle noise of the servos in his spine working hard.")

		saynn("[say=alexrynard]Maybe you’re right. Maybe I should be.[/say]")

		saynn("He tilts his head down.")

		saynn("[say=alexrynard]Even the most righteous acts can repay you with pain and suffering. I learned that the hard way. But you know what?[/say]")

		saynn("He looks at you again, gazing deep into your eyes.")

		saynn("[say=alexrynard]That won’t stop me from doing the right thing.[/say]")

		saynn("Alex leaves you alone while you’re left to your own thoughts. At least you initialized that maintenance protocol just like Tavi wanted.")

		# (Scene ends, stocks begin)
		addButton("Continue", "Stocks time", "startstocks")
		

	if(state == "attack"):
		playAnimation(StageScene.SexStart, "start", {npc="alexrynard", pc="pc"})
		
		saynn("Since Alex is not looking at you, now is the best opportunity to attack him. You easily slip your hands out of the loose zip ties and drop them onto the floor. Alex hears some noise behind him but it was too late.")

		saynn("You grab onto the leash and yank on it hard, causing the guy to lose balance and fall onto his metal back, causing sparks even. He grunts from sudden pain while you use the leash against him, wrapping it around his neck and tightening as much as you can. Suddenly you find that this situation reminds you of what Tavi did to those engineers.")

		saynn("[say=alexrynard]Gh-h!..[/say]")

		saynn("He is trying to free himself. But that’s useless, it’s so easy to have a tight grip on that chain and choke him. Then he’s trying to claw your hands but you can easily avoid that too. He is quickly losing in this battle. But it also tests your strength.")

		# (Options are Stop choking, Continue)

		addButton("Stop choking", "Should be enough to break him", "stop_choking")
		addButtonWithChecks("Continue", "Keep choking the foxy", "chokeout", [], [[ButtonChecks.StatCheck, Stat.Strength, 15]])

	if(state == "stop_choking"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		
		saynn("Your grip on the chain leash slowly loosens.")

		saynn("[say=pc]Give up already, I’m giving you a chance.[/say]")

		saynn("But the foxy doesn’t listen to you. He finds a good moment and whips your face with the chain’s end, stunning you enough for him to break out of your pin. He coughs and gasps for air while you recover from the unfair move.")

		saynn("[say=alexrynard]I already gave up. Many years ago.[/say]")

		saynn("You both get up at roughly the same time. Seems like a fair fight is inevitable.")

		# (start fight button)
		addButton("Fight", "Start the fight", "fight_foxy")

	if(state == "chokeout"):
		playAnimation(StageScene.SexStart, "defeated", {npc="alexrynard", pc="pc"})
		setFlag("TaviModule.ch3AlexChoice", "choked_out")
		setFlag("TaviModule.ch3AlexDefeatedHim", true)
		# (15 strength required)

		# (add 100 pain)

		saynn("You decide to not leave this up for a chance and continue strangling the guy, waiting patiently for him to stop resisting. And his body slowly does just that, your raw strength lets you do this for a long time. You were almost done with him.")

		saynn("But suddenly you feel your collar shocking you! Ow! You cry out from pain. But the foxy cries louder, pretty much screaming. The electricity travels through the metal chain that is connected to your collar and then goes through the engineer’s body too, causing his artificial spine to malfunction. It malfunctions so badly that he loses consciousness.")

		saynn("You feel so.. tired. You’re panting too. All your muscles are starved for oxygen after that little unplanned workout. You free yourself from the leash and get up. You notice that Alex is holding a shock remote in his hand.")

		saynn("[say=pc]Fucker.[/say]")

		saynn("At least you managed to avoid being put into stocks. And the door should be opened now. Tavi is probably waiting.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "coward!"):
		# (You call him a coward. He shocks you and tells you that this won’t work on him, the guy learns)

		# (But if you have high virtality you can endure the shock and then attack Alex)

		# (otherwise he ties up, leashes you and throws into stocks)

		saynn("[say=pc]I thought you’re a real man. But no. You don’t have it in you. How much more are you gonna hide behind your toys?[/say]")

		saynn("You taunt the guy as you bravely begin to approach him, showing no fear. The words did have an effect on him. Probably. He raises a brow but then just presses the red button on the remote.")

		# (Options are Ow and Endure)

		addButtonWithChecks("Endure it!", "A simple shock won’t bring you down so easily!", "endure_it!", [], [[ButtonChecks.StatCheck, Stat.Vitality, 15]])
		addButton("Ow", "That was unexpected", "ow")

	if(state == "ow"):
		setFlag("TaviModule.ch3AlexChoice", "talk_failed")
		playAnimation(StageScene.Duo, "defeat", {npc="alexrynard"})
		
		saynn("The sudden spike of pain stops your offense before it even has a chance to happen. You grab onto your collar and cry out from the unpleasant sensations before your whole body goes stiff and then falls limp.")

		saynn("Ow. Everything hurts. The exhaustion kicks in soon after. You’re panting heavily while admiring that cold floor.")

		saynn("Alex walks up to you and ties your hands up before clicking a leash to your collar.")

		saynn("[say=alexrynard]I have nothing to prove to you. Call me a devil or a clown, don’t care. But if you wanna cross me, you gotta be prepared.[/say]")

		saynn("He gives you a few moments of rest before tugging on the leash.")

		saynn("[say=alexrynard]Up, inmate. We have a long journey ahead of us.[/say]")

		# (Option is Follow)
		addButton("Follow", "See where he brings you", "follow")

	if(state == "endure_it!"):
		# (Requires vitality 15)

		saynn("In hindsight, this was obviously gonna happen. And luckily, you were prepared. Yes, as the shock starts tensing your every muscle you can’t help but to let out an angry grunt. But your body knew this was coming. You drop to your knees and just let the current flow through you while all your limbs are locked up tight.")

		saynn("Five seconds of non-stop acute pain pass quickly. Alex sees that you’re still not kissing the floor and presses the button again, repeating the cycle.")

		saynn("You keep your eyes shut as more electricity starts to tinker with your whole nervous system, causing chaos. You grit your teeth and finally collapse onto the floor. As another five seconds pass, you’re left panting. But defeated you are not.")

		saynn("[say=alexrynard]I have nothing to prove to you. Call me a devil or a clown, don’t care. But if you wanna cross me, you gotta be prepared.[/say]")

		saynn("Alex walks up to you and crouches nearby. He tries to turn you on your back so he can cuff you.")

		addButton("Attack", "Seems like the best time for that", "attack1")

	if(state == "attack1"):
		saynn("And as he goes for your hands, you suddenly grab him and throw his body over yourself, causing the guy to go flying for a second before hitting the floor and injuring his back badly. You hear the servos screeching from being overstressed.")

		saynn("The foxy surely didn’t enjoy that little stunt that he did. Now it’s his time to grunt and nuzzle the dirty metal. Luckily the remote went flying somewhere too, posing no threat anymore.")

		saynn("As you both catch your breaths, you look at each other.")

		saynn("[say=alexrynard]Huh. I guess you did come prepared.[/say]")

		saynn("It doesn’t seem like he will just let you go though. Time for a fight.")

		# (start fight button)
		addButton("Fight", "Start the fight", "fight_foxy")

	if(state == "explain_yourself"):
		# (This is where you talk to him. There is usually 1 ‘correct’ option and 1 option that will make him shock you. If you pick all the right options you have a choice between being cuffed and left here and attacking him)

		# (If you win - you can ride him)

		saynn("You raise your hands but you don’t kneel.")

		saynn("[say=pc]I can explain myself.[/say]")

		saynn("The guy frowns.")

		saynn("[say=alexrynard]I’m sure you can.[/say]")

		saynn("[say=pc]I didn’t break anything. I’m not planning on breaking anything. Your guys are gonna be fine.[/say]")

		saynn("He keeps eye contact with you, watching your every motion.")

		saynn("[say=alexrynard]So? What did you do then? And where are they?[/say]")

		saynn("You can’t tell him everything but you can try to manipulate the guy.")

		# (Options are Seduce, Threaten)

		addButton("Seduce", "“Come closer and I will tell you”", "seduce")
		addButton("Threaten", "“I can’t guarantee their safety if you don’t let me go”", "threaten")


	if(state == "seduce"):
		setFlag("TaviModule.ch3AlexChoice", "talk_failed")
		playAnimation(StageScene.Duo, "defeat", {npc="alexrynard"})
		
		saynn("You offer the guy a kind smirk and gesture to him to come closer while swaying your {pc.masc} hips seductively.")

		saynn("[say=pc]Come here and I will tell you~. I will whisper you everything you want to hear.[/say]")

		saynn("The guy rolls his eyes and presses the button on the remote without a second thought. A painful spike goes through your whole body, causing you to drop to your knees. You grunt, defeated with a single blow.")

		saynn("[say=alexrynard]Uh huh. Save it for the horny inmates, I need to save my people.[/say]")

		saynn("You pant heavily while Alex puts zip ties around your hands, restraining them. He then leashes you.")

		saynn("[say=pc]What a hero..[/say]")

		saynn("[say=alexrynard]Someone has to keep this prison from falling into the abyss of corruption.[/say]")

		saynn("[say=pc]And you think you’re the pure one here?[/say]")

		saynn("He doesn’t answer, his hand just forcefully yanks you up to help you get up. The same hand invites you to follow.")

		# (Option is Follow)
		addButton("Follow", "See where he brings you", "follow")

	if(state == "threaten"):
		saynn("You put on a cunning smile.")

		saynn("[say=pc]They’re safe for now. But I can’t guarantee their safety if you don’t let me go, you know.[/say]")

		saynn("Foxy frowns his brows, you can see his muzzle wrinkling as he shows off his fangs. His hand with the remote shakes.")

		saynn("[say=alexrynard]You are seriously blackmailing me? How do you plan on doing anything if you’re here? You already got caught. You lost. Don’t make it worse for yourself.[/say]")

		# (Options are More pressure, Not alone)

		addButton("More pressure", "“They will die if you don’t let me go”", "more_pressure")
		addButton("Not alone", "“I’m not alone, I have people backing me up”", "not_alone")


	if(state == "more_pressure"):
		setFlag("TaviModule.ch3AlexChoice", "talk_failed")
		playAnimation(StageScene.Duo, "defeat", {npc="alexrynard"})
		
		saynn("You lower your hands, feeling confident.")

		saynn("[say=pc]You have no choice I’m afraid. They will die if you don’t let me go.[/say]")

		saynn("Alex lowers his head and looks away. But before you can even take a single step towards him, the guy just casually presses the button, sending a powerful shock through your body, causing you to drop to your knees. You grunt, defeated with a single blow.")

		saynn("[say=alexrynard]I guess I will take my chance then.[/say]")

		saynn("You pant heavily while Alex puts zip ties around your hands, restraining them. He then leashes you.")

		saynn("[say=pc]You’re made a huge mistake..[/say]")

		saynn("[say=alexrynard]Why end the streak?[/say]")

		saynn("His hand just yanks you up to help you stand. The same hand invites you to follow.")

		# (Option is Follow)
		addButton("Follow", "See where he brings you", "follow")

	if(state == "not_alone"):
		saynn("You lower your hands, feeling confident.")

		saynn("[say=pc]I’m not alone, I have people backing me up.[/say]")

		saynn("And just like that, you take a first step towards him. Then another.")

		saynn("[say=alexrynard]Is that so, huh? I don’t see any. Wanna list some names for me? I’m interested.[/say]")

		saynn("He still aims the remote at you. But at the same time, he is also keeping his distance with you. One more step and an automated door behind him opens with an audibly mechanical noise. This is your chance.")

		saynn("[say=pc]Behind you.[/say]")

		saynn("The guy only takes one glimpse behind his shoulder. But that was enough for you to leap forward and try to tackle the foxy.")

		saynn("But alas, he was ready for shenanigans like this so you only manage to make him drop the remote before he shoves you back.")

		saynn("[say=alexrynard]I should stop giving people chances.[/say]")

		saynn("Seems like it’s a fight.")

		# (start fight button)
		addButton("Fight", "Start the fight", "fight_foxy")

	if(state == "if_lost"):
		playAnimation(StageScene.Duo, "kneel", {npc="alexrynard"})
		setFlag("TaviModule.ch3AlexDefeatedHim", false)
		
		saynn("Defeated, you drop to your knees. Alex walks up to you and swiftly binds your hands with some zip ties before putting you on a chain leash.")

		saynn("[say=pc]Ugh. I’m not your pet.[/say]")

		saynn("[say=alexrynard]And this is not roleplay. You’re a misbehaving inmate that needs to learn {pc.his} place.[/say]")

		saynn("Well. Your hands are tied up. And you have no strength to fight anymore. All you can do is obey the leash when it tugs on your collar.")

		# (Option is follow)

		addButton("Follow", "See where he brings you", "follow")

	if(state == "if_won"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="kneel"})
		setFlag("TaviModule.ch3AlexDefeatedHim", true)
		
		saynn("Unable to continue fighting, Alex staggers back a few steps and grabs onto the wall behind. You hear something in him screeching and whining, servos struggling to keep his back straight. A few seconds later you hear him growl and slowly slide down the wall.")

		saynn("[say=alexrynard]Damn.. spine..[/say]")

		saynn("[say=pc]You’re always blaming everyone else but yourself?[/say]")

		saynn("[say=alexrynard]You’re right, I should blame the creator.. fuck.[/say]")

		saynn("You crouch before him and find some restraints on his belt before tying up his hands together behind his back.")

		saynn("[say=pc]So what should I do with you.[/say]")

		saynn("[say=alexrynard]I’m good, thanks. It’s the thought that counts.[/say]")

		# (Options are Leave him, Ride his cock)

		addButton("Leave him", "Might as well listen to him", "leave_him")
		addButtonWithChecks("Ride his cock", "Now is as good of a time as any", "ride_his_cock", [], [ButtonChecks.HasReachableVaginaOrAnus])

	if(state == "leave_him"):
		setFlag("TaviModule.ch3AlexHadSex", false)
		saynn("[say=pc]Sure. One last thing.[/say]")

		saynn("You reach for his ear and find a sneaky headset that you throw onto the ground and then crush with your foot. Then you take some more zip ties and tie the guy’s hands to the nearest pipe.")

		saynn("[say=pc]Enjoy your thoughts.[/say]")

		saynn("[say=alexrynard]Aw. No ordering pizza for me.[/say]")

		saynn("He tugs on the restraints but quickly gives up, he is too tired to struggle.")

		saynn("[say=pc]Practice your self-control.[/say]")

		saynn("[say=alexrynard]Uh huh. Very funny.[/say]")

		saynn("You get up and quickly make your way out of the control room. Time to go back to Tavi and check what fate has in store for you.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")

	if(state == "ride_his_cock"):
		playAnimation(StageScene.SexCowgirl, "tease", {pc="alexrynard", npc="pc", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		setFlag("TaviModule.ch3AlexHadSex", true)
		# (needs pussy or anus free. Needs arms and hands and eyes free too)

		saynn("You look around. It’s quiet. Yes, all the machines produce a low hum but other than that, this place is quite.. secluded. All kinds of thoughts are already popping up in your head.")

		saynn("[say=pc]I wonder.[/say]")

		saynn("Your hands reach out for his belt and take it off before leaving it near. And as you reach for his pants, the guy starts glaring at you.")

		saynn("[say=alexrynard]You won’t find anything interesting there.[/say]")

		saynn("[say=pc]That’s for me to decide.[/say]")

		saynn("You pull up his shirt slightly and grab onto the top of his pants before pulling them down, gently. The foxy doesn’t seem to resist as you expose his sheath and a pair of fluffy orbs, nothing out of the ordinary.")

		saynn("[say=pc]It seems like you lied to me.[/say]")

		saynn("Foxy carefully tracks your hand motions as you give his balls a gentle rub. One of your digits reach up to the sheath and brush over the poking red tip. And sure enough, his body begins to react to your teasing, his breathing becomes deeper while his dick gradually fills with blood and peeks out more. Nothing to brag about but the guy doesn’t seem like the stud type either.")

		saynn("[say=alexrynard]Listen..[/say]")

		# (if has reachable pussy)
		if(GM.pc.hasReachableVagina()):
			saynn("You cut him off by straddling his body, letting your {pc.pussyStretch} pussy rub against his length while the guy squirms ever so slightly underneath you.")

		# (else)
		else:
			saynn("You cut him off by straddling his body, letting your {pc.analStretch} tailhole rub against his length while the guy squirms ever so slightly underneath you.")

		saynn("[say=pc]You lost so I get to do whatever I want with you~.[/say]")

		saynn("[say=alexrynard]You do make a point.[/say]")

		saynn("[say=pc]Your guys are safe, don’t worry..[/say]")

		saynn("You slowly grind your crotch against that member until it gets fully hard, you can even feel his knot, a slight bump that will surely grow bigger when the time comes.")

		saynn("[say=alexrynard]It’s not their safety I’m worried about.. At least use a rubber.[/say]")

		# (Options Vag raw, Vag + Condom, Anal raw, Anal + Condom)

		addButtonWithChecks("Vaginal", "Choose this one", "vag", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Vag + Condom", "Choose this one", "vagCondom", [], [ButtonChecks.HasReachableVagina, ButtonChecks.HasCondoms])
		addButton("Anal", "Choose this one", "anal")
		addButtonWithChecks("Anal + Condom", "Choose this one", "analCondom", [], [ButtonChecks.HasCondoms])


	if(state == "vag"):
		playAnimation(StageScene.SexCowgirl, "sex", {pc="alexrynard", npc="pc", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		isPussy = true
		# (if used a condom)
		if(usedCondom):
			saynn("[say=pc]Sure, if you’re afraid of the kids so much~.[/say]")

			saynn("You keep hugging the guy with your legs while your hand produces a little wrapped up condom. You masterfully rip the package open and grab the rubber ring before proceeding to apply it around the guy’s hard dick. While doing so you notice the pointy tip already leaking some pre.")

			saynn("[say=alexrynard]Appreciate it..[/say]")

		# (else)
		else:
			saynn("[say=pc]But condoms eliminate most of the fun~.[/say]")

			saynn("[say=alexrynard]I’ve played enough risky games.[/say]")

			saynn("You lean in and kiss the guy on the lips while hugging his lower part with your legs and rubbing your folds against his cock, clearly letting him know that this sex is only gonna happen raw. While doing so you notice the pointy tip already leaking some pre.")

		# (end)

		saynn("One of your hands jumps on the foxy’s shoulder while the second one helps guide his red veiny shaft towards your slit. You make him find your pussy hole before you proceed to lower yourself. No rush at all, foxy is busy staring at your {pc.masc} body while his dick spreads your pussy wide open. You envelop him enough to make you bite your lip.")

		# (if chastity)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your own dick is trying to get hard too but the cage keeps your erection nicely contained. It provides you with some extra sensations of pressure.")

		# (elif has dick)
		elif(GM.pc.hasReachablePenis()):
			saynn("Your own {pc.dick} is hard as a rock too, leaking pre onto the guy’s uniform.")

		saynn("[say=pc]There we go~. Look, it wasn’t so bad.[/say]")

		saynn("Foxy chuckles softly, he looks so vulnerable. But not vulnerable enough, you take off his shirt too, exposing his mainly chest and a well-defined muscle structure that was hidden before. It’s only when you reach behind him you find something cold sticking out of his back.")

		saynn("[say=alexrynard]Bad ideas are bad only because of the consequences.[/say]")

		saynn("[say=pc]Oh shush.[/say]")

		# (if usedCondom)
		if(usedCondom):
			saynn("You pull your free hand away and cover his mouth as you proceed to ride him, slowly raising your body just to bring it down onto his dick a second later, letting it stretch you out. Feels so good. Your pussy quickly coats that condom on his shaft with your juices, the whole room smells of them.")

		# (else)
		else:
			saynn("You pull your free hand away and cover his mouth as you proceed to ride him, slowly raising your body just to bring it down onto his dick a second later, letting it stretch you out. Feels so good. Your pussy quickly coats that shaft with your juices, the whole room smells of them.")

		saynn("[say=pc]We all do what we enjoy doing. Take off your silly mask and try to enjoy the only life that we have.[/say]")

		saynn("Alex keeps eye contact with you, his breath is making your palm warm. All the while you keep letting his cock deeper inside you with each hip motion. Very soon the pointy canine tip finds your barricade and starts leaving little kisses on it when you’re at your lowest. His knot is already inflating, making it harder and harder to fit inside you until you can’t anymore.")

		# (if usedCondom)
		if(usedCondom):
			saynn("[say=pc]Good little pup~. You’re filling that condom inside me, you hear?[/say]")

		# (else)
		else:
			saynn("[say=pc]Good little pup~. You’re cumming inside me, you hear?[/say]")

		saynn("You see him closing his eyes and then nodding. As you pull your palm away from his mouth, he doesn’t drop a word. But when you pick up the pace, riding his cock faster, you begin to feel his body squirming slightly under you, quiet manly passion noises escaping from his lips.")

		saynn("His knot is slapping against your {pc.pussyStretch} pussy lips, struggling to fit inside. But it just needs some extra effort on your side. You’re so close too..")

		addButton("Force knot in", "This must happen", "force_knot_in")

	if(state == "force_knot_in"):
		playAnimation(StageScene.SexCowgirl, "tease", {pc="alexrynard", npc="pc", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		
		saynn("You ride him faster and faster, your motions becoming shaky as his cock sends waves of pleasure throughout your whole body. You’re bouncing on it so hard that your pussy starts squirting girly juices all over his crotch. You can’t hide your moans as you ride him even harder.")

		# (if condom)
		if(usedCondom):
			saynn("And soon enough, his fat knot spreads your pussy enough to slip inside, putting an end to your bouncy adventures and forcing you to be his knot bitch. The guy grunts as your pussy squeezes his member so much that he gets pushed over the edge fast. His cock throbs, the tip is pressed against the womb entering but the condom saves you from receiving his creampie by getting filled instead. Your own body joins this experience, you’re arching your back and moaning while the condom inside you is getting stuffed more and more, your pulsating slit milking him hard.")

		# (else)
		else:
			saynn("And soon enough, his fat knot spreads your pussy enough to slip inside, putting an end to your bouncy adventures and forcing you to be his knot bitch. The guy grunts as your pussy squeezes his member so much that he gets pushed over the edge fast. His cock throbs, the tip is pressed against the womb entering as it starts painting the insides with white thick seed. Your own body joins this experience, you’re arching your back and moaning while your babymaker is getting stuffed full, your pulsating slit milking him hard.")

		# (if chastity)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your dick throbs behind the cage too, barely managing to shoot some {pc.cum} through it, the thing is just too limiting, causing painful sensations even. But that’s what makes it fun.")

		# (else if has dick)
		elif(GM.pc.hasReachablePenis()):
			saynn("Your dick throbs too, shooting out some thick strings of {pc.cum} that land on the guy’s belly, leaving a mess.")

		saynn("[say=pc]Oh yeah~. I almost expected more resistance from you.[/say]")

		saynn("Both you and the foxy are panting. You, still with his cock inside you, are forced to sit on him.")

		saynn("[say=alexrynard]Maybe because I needed that. Maybe someone will find you like this.[/say]")

		saynn("You chuckle and try to get a better position. The first attempts to tug his knot out fail for obvious reasons.")

		saynn("[say=alexrynard]Now would be a good time to tell me where you took my people.[/say]")

		saynn("[say=pc]You wish. Enjoy having a cock warmer.[/say]")

		addButton("Wait", "Let that cock deflate", "wait")
		
	if(state == "anal"):
		playAnimation(StageScene.SexCowgirl, "sex", {pc="alexrynard", npc="pc", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		# (if used a condom)
		if(usedCondom):
			saynn("[say=pc]Sure, if you’re asking~.[/say]")

			saynn("You keep hugging the guy with your legs while your hand produces a little wrapped up condom. You masterfully rip the package open and grab the rubber ring before proceeding to apply it around the guy’s hard dick. While doing so you notice the pointy tip already leaking some pre.")

			saynn("[say=alexrynard]Appreciate it..[/say]")

		# (else)
		else:
			saynn("[say=pc]But condoms eliminate most of the fun~.[/say]")

			saynn("[say=alexrynard]Yeah, they eliminate messes too.[/say]")

			saynn("You lean in and kiss the guy on the lips while hugging his lower part with your legs and rubbing your butt against his cock, clearly letting him know that this sex is only gonna happen raw. While doing so you notice the pointy tip already leaking some pre.")

		# (end)

		saynn("One of your hands jumps on the foxy’s shoulder while the second one helps guide his red veiny shaft towards your rear hole. You make him find your tailhole before you proceed to lower yourself. No rush at all, foxy is busy staring at your {pc.masc} body while his dick stretches your star wide open. You envelop him enough to make you bite your lip.")

		# (if chastity)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your own dick is trying to get hard too but the cage keeps your erection nicely contained. It provides you with some extra sensations of pressure.")

		# (elif has dick)
		elif(GM.pc.hasReachablePenis()):
			saynn("Your own {pc.dick} is hard as a rock too, leaking pre onto the guy’s uniform.")

		saynn("[say=pc]There we go~. Look, it wasn’t so bad.[/say]")

		saynn("Foxy chuckles softly, he looks so vulnerable. But not vulnerable enough, you take off his shirt too, exposing his mainly chest and a well-defined muscle structure that was hidden before. It’s only when you reach behind him you find something cold sticking out of his back.")

		saynn("[say=alexrynard]Bad ideas are bad only because of the consequences.[/say]")

		saynn("[say=pc]Oh shush.[/say]")

		saynn("You pull your free hand away and cover his mouth as you proceed to ride him, slowly raising your body just to bring it down onto his dick a second later, letting it stretch you out more. Feels so good. His precum coats your soft inner walls, making the friction feel forced and more pleasurable .")

		saynn("[say=pc]We all do what we enjoy doing. Take off your silly mask and try to enjoy the only life that we have.[/say]")

		saynn("Alex keeps eye contact with you, his breath is making your palm warm. All the while you keep letting his cock deeper inside you with each hip motion. Very soon you manage to hide his whole shaft when you’re at your lowest. His knot is already inflating though, making it harder and harder to fit inside you until you can’t anymore.")

		# (if usedCondom)
		if(usedCondom):
			saynn("[say=pc]Good little pup~. You’re filling that condom inside me, you hear?[/say]")

		# (else)
		else:
			saynn("[say=pc]Good little pup~. You’re cumming inside me, you hear?[/say]")

		saynn("You see him closing his eyes and then nodding. As you pull your palm away from his mouth, he doesn’t drop a word. But when you pick up the pace, riding his cock faster, you begin to feel his body squirming slightly under you, quiet manly passion noises escaping from his lips.")

		saynn("His knot is slapping against your {pc.analStretch} ring, struggling to fit inside. But it just needs some extra effort on your side. You’re so close too..")

		addButton("Force knot in", "This must happen", "force_knot_in1")

	if(state == "force_knot_in1"):
		playAnimation(StageScene.SexCowgirl, "tease", {pc="alexrynard", npc="pc", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		
		saynn("You ride him faster and faster, your motions becoming shaky as his cock sends waves of pleasure throughout your whole body. You’re bouncing on it so hard that you feel your pleasure spot tingling. You can’t hide your moans as you ride him even harder.")

		# (if condom)
		if(usedCondom):
			saynn("And soon enough, his fat knot spreads your star enough to slip inside, putting an end to your bouncy adventures and forcing you to be his knot bitch. The guy grunts as your anus squeezes his member so much that he gets pushed over the edge fast. His cock throbs, the tip is shoved deep inside but the condom saves you from receiving his creampie by getting filled instead. Your own body joins this experience, you’re arching your back and moaning while the condom inside you is getting stuffed more and more, your pulsating fuckhole milking him hard.")

		# (else)
		else:
			saynn("And soon enough, his fat knot spreads your star enough to slip inside, putting an end to your bouncy adventures and forcing you to be his knot bitch. The guy grunts as your anus squeezes his member so much that he gets pushed over the edge fast. His cock throbs, the tip is shoved deep inside as it starts painting the insides with white thick seed. Your own body joins this experience, you’re arching your back and moaning while your nethers are getting stuffed full, your pulsating fuckhole milking him hard.")

		# (if chastity)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your dick throbs behind the cage too, barely managing to shoot some {pc.cum} through it, the thing is just too limiting, causing painful sensations even. But that’s what makes it fun.")

		# (else if has dick)
		elif(GM.pc.hasReachablePenis()):
			saynn("Your dick throbs too, shooting out some thick strings of {pc.cum} that land on the guy’s belly, leaving a mess.")

		saynn("[say=pc]Oh yeah~. I almost expected more resistance from you.[/say]")

		saynn("Both you and the foxy are panting. You, still with his cock inside you, are forced to sit on him.")

		saynn("[say=alexrynard]Maybe because I needed that. Maybe someone will find you like this.[/say]")

		saynn("You chuckle and try to get a better position. The first attempts to tug his knot out fail for obvious reasons.")

		saynn("[say=alexrynard]Now would be a good time to tell me where you took my people.[/say]")

		saynn("[say=pc]You wish. Enjoy having a cock warmer.[/say]")

		addButton("Wait", "Let that cock deflate", "wait")

	if(state == "wait"):
		playAnimation(StageScene.SexCowgirl, "tease", {pc="alexrynard", npc="pc", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true}})
		# (10-20 minutes pass)

		# (if pussy inside)
		if(isPussy && !usedCondom):
			saynn("After some time, the knot finally deflates enough for you to get up. Cum is gushing from your used pussy when the cock gets pulled out. You quickly clean what you can and grab more zip ties to tie the foxy’s paws to some pipe.")

		# (if pussy condom)
		if(isPussy && usedCondom):
			saynn("After some time, the knot finally deflates enough for you to get up. You tie the condom up before pulling it off the foxy’s dick. So neat, you don’t even have to clean yourself and your pussy. You grab more zip ties to tie the foxy’s paws to some pipe.")

		# (if anus inside)
		if(!isPussy && !usedCondom):
			saynn("After some time, the knot finally deflates enough for you to get up. Cum is gushing from your used tailhole when the cock gets pulled out. You quickly clean what you can and grab more zip ties to tie the foxy’s paws to some pipe.")

		# (if anus condom)
		if(!isPussy && usedCondom):
			saynn("After some time, the knot finally deflates enough for you to get up. You tie the condom up before pulling it off the foxy’s dick. So neat, you don’t even have to clean yourself and your tailhole. You grab more zip ties to tie the foxy’s paws to some pipe.")

		saynn("[say=pc]I gotta go. Thanks for serving me~.[/say]")

		saynn("[say=alexrynard]Sure. I won’t sit still, you know.[/say]")

		saynn("[say=pc]It will be too late, you might as well not bother.[/say]")

		saynn("Foxy huffs as you grab all your belongings and quickly make your escape. Time to go back to Tavi. Hopefully your little detour didn’t mess with her plans too much.")

		# (scene ends)

		addButton("Leave", "Time to go", "endthescene")

func _react(_action: String, _args):
	if(_action == "wait"):
		processTime(20*60)
	
	if(_action == "vagCondom"):
		usedCondom = true
		setState("vag")
		return
	
	if(_action == "analCondom"):
		usedCondom = true
		setState("anal")
		return
	
	if(_action == "force_knot_in"):
		if(!usedCondom):
			GM.pc.cummedInVaginaBy("alexrynard")
		else:
			addFilledCondomToLootIfPerk(getCharacter("alexrynard").createFilledCondom())
		GM.pc.gotVaginaFuckedBy("alexrynard")
		GM.pc.orgasmFrom("alexrynard")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)
	
	if(_action == "force_knot_in1"):
		if(!usedCondom):
			GM.pc.cummedInAnusBy("alexrynard")
		else:
			addFilledCondomToLootIfPerk(getCharacter("alexrynard").createFilledCondom())
		GM.pc.gotAnusFuckedBy("alexrynard")
		GM.pc.orgasmFrom("alexrynard")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)
	
	if(_action == "fight_foxy"):
		runScene("FightScene", ["alexrynard"], "alexfight")
		setFlag("TaviModule.ch3AlexChoice", "fight")
		return
	
	if(_action == "startstocks"):
		GM.pc.removeAllRestraints()
		runScene("StocksPunishmentScene")
		endScene()
		return
	
	if(_action == "follow"):
		runScene("ParadedOnALeashScene", ["alexrynard", GM.pc.getLocation(), "main_punishment_spot", [
		]])
	
	if(_action in ["ow", "seduce", "chokeout"]):
		GM.pc.addPain(100)

	if(_action in ["secure_loosely", "secure_tightly", "ow", "seduce", "more_pressure"]):
		GM.pc.removeAllRestraints()
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ZiptiesWrist"))

	if(_action == "attack"):
		GM.pc.freeArmsDeleteAll()

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "alexfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won")
			#setFlag("TaviModule.ch2AlexAttackedAndWon", true)
			#setFlag("TaviModule.ch2PCLearnedCode", true)
			#addMessage("Task completed!")
			addExperienceToPlayer(50)
			#setFlag("PortalPantiesModule.Alex_BusyDays", 1)
		else:
			setState("if_lost")
			addExperienceToPlayer(20)
			GM.pc.removeAllRestraints()
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ZiptiesWrist"))


func saveData():
	var data = .saveData()
	
	data["usedCondom"] = usedCondom
	data["isPussy"] = isPussy
	
	return data
	
func loadData(data):
	.loadData(data)
	
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	isPussy = SAVE.loadVar(data, "isPussy", false)
