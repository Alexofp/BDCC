extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "Ch1s2Risha"


func _run():
	if(state == ""):
		addCharacter("risha")
		addCharacter("tavi")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="risha", pc="tavi"})
		
		# (Risha appears and tells she is not done yet, she is here to breed Tavi)

		# (You can fight or seduce her. Or wait and let Tavi be beaten up and save her)

		saynn("A lynx armored cat steps from behind the corner and notices you.")

		saynn("[say=risha]Oh hey there~. Why did you run off? I’m not done with you yet, inmate.[/say]")

		saynn("Risha directs her attention to Tavi, making her tense up.")

		saynn("[say=tavi]Angry that the captain is blue-balling you?[/say]")

		saynn("Risha rubs her chin. She is quite in an advantageous position, cutting your only exit off.")

		saynn("[say=risha]Yeah, he is strict but fair. I said I’m gonna breed you. And so I will~. Your pet can watch, I don’t mind~[/say]")

		saynn("Tavi whispers to your ear.")

		saynn("[say=tavi]I will need your help, cutie.[/say]")

		saynn("Tavi then stands up and raises her hands like she is surrendering. She wiggles her butt while a cunning smile shines on her face.")

		saynn("[say=tavi]I’m sure we can talk it out first and get to some compromise~. Come here. I don’t bite.[/say]")

		saynn("[say=risha]I’m well aware of your hair pulling tricks. You’re a red, your only compromise is being on my dick, sweetie pie.[/say]")

		saynn("Risha holds a shock remote in her paw and aims it at your miss. And there is still a fair amount of distance between them, there is no way for Tavi to reach the lynx without getting her neck fried. And that makes Tavi go from smiling to growling softly and getting ready to fight.")

		saynn("[say=tavi]Don’t make me regret saving you.[/say]")

		saynn("[say=risha]Maybe you shouldn’t have. But I just need to rut someone. Why fight? You will love it.[/say]")

		addButtonWithChecks("Seduce", "Offer yourself to Risha instead", "seduce", [], [[ButtonChecks.StatCheck, Stat.Sexiness, 5]])
		addButton("Attack", "Protect Tavi at all costs", "attack")
		addButton("Wait", "Maybe there will be a better opportunity to attack", "wait1")
		

	if(state == "seduce"):
		removeCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		
		saynn("You decide that just watching the scene unfold won’t bring anything and act. You step in and block the clear path to Tavi. Risha raises her brow and aims the remote at you instead.")

		# (if pc is red)
		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=risha]Reds protecting reds, huh? I’m not surprised.[/say]")

		# (if pc is general)
		elif(GM.pc.getInmateType() == InmateType.General):
			saynn("[say=risha]Why are you protecting a red. Stockholm syndrome?[/say]")

		# (if pc is lilac)
		elif(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=risha]Hah. What are you gonna do, fuck me to death?[/say]")

		# (if has clothes)
		if(!GM.pc.isFullyNaked()):
			saynn("Instead of answering her, you just begin undressing, exposing just enough to make your private bits visible. Risha tilts her head and watches over your {pc.masc} curves.")

		# (else)
		else:
			saynn("Instead of answering her, you just present her your naked body. Risha tilts her head and watches over your {pc.masc} curves.")

		saynn("[say=pc]Like it?[/say]")

		saynn("Tavi is still behind you, she doesn’t seem to mind the view of your {pc.thick} butt.")

		saynn("[say=risha]Hmm. I’d still rather fuck the cat, she was too cocky.[/say]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You feel Risha’s hesitation and push further. You step towards her and turn around before bending and spread your legs for her, offering a great view of your {pc.pussyStretch} pussy and {pc.analStretch} ass.")

		# (else if has cock)
		elif(GM.pc.hasPenis()):
			saynn("You feel Risha’s hesitation and push further. You step towards her and turn around before bending and spread your legs for her, offering a great view of your {pc.cock} and {pc.analStretch} butthole.")

		# (else)
		else:
			saynn("You feel Risha’s hesitation and push further. You step towards her and turn around before bending and spread your legs for her, offering a great view of your {pc.analStretch} butthole.")

		saynn("[say=pc]Why? Just breed this instead~[/say]")

		saynn("You catch Risha’s hungry stare, she puts the remote away and reaches out to smack your ass. But you dodge that and teasingly wiggle your behind instead.")

		saynn("[say=pc]Nuh-uh~[/say]")

		saynn("[say=risha]What a brat. Fine, I will deal with the cat after you.[/say]")

		saynn("Risha reaches out and grabs you by the back of the collar before pulling back towards her and pinning against the nearby wall. She rubs her crotch against your butt, making you feel her cock getting harder even through her riot armor.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("Risha keeps you pinned to the wall before producing some cuffs and trying to restrain your arms to the pipe above your head. Now would be a good time to strike.")

		saynn("At the same time, Tavi uses that moment to get out of sight. She seems to approach Risha from behind to steal something from her but then sneaks away and makes her escape. Is she just gonna leave you?")

		addButton("Be fucked", "Just ler her do it", "be_fucked")
		addButton("Struggle", "Risha is horny, that will give you an advantage in a fight", "struggle")
		

	if(state == "be_fucked"):
		playAnimation(StageScene.SexStanding, "tease", {npc="pc", pc="risha",
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={exposedCrotch=true,},
		})
		# (Risha chains and fucks pc)

		# (Risha leaves and Tavi returns)

		saynn("Well, you really hope Tavi knows what she is doing. And with that, Risha cuffs your arms to some pipe above you, rendering you pretty much helpless.")

		saynn("[say=pc]I’m not resisting..[/say]")

		saynn("Risha chuckles as she proceeds to strip the important pieces of her riot armor.")

		saynn("[say=risha]Why not?[/say]")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("And since your {pc.pussyStretch} pussy is quite exposed already, Risha takes off her glove and gently runs her claws over your sensitive petals, sending shivers through your body. Yeah, she is clearly going for that hole.")

		# (else)
		else:
			saynn("And since your {pc.analStretch} tailhole is quite exposed already, Risha takes off her glove and gently runs her claws over your sensitive flesh, sending shivers through your body. She then spits on her digits and rubs them into your ass. Yeah, she is clearly going for that hole.")

		saynn("[say=risha]It’s gonna be painful either way with me.[/say]")

		saynn("To prove that she exposes her sheath with a feline cock already escaping its contains after it got enough room. The tip features a few rows of barbs that seem to be somewhat soft for now but who knows.")

		saynn("[say=pc]Kinky..[/say]")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your own cock is getting somewhat hard behind the cage. Risha cups your balls and gives them a gentle squeeze.")
		elif(GM.pc.hasPenis()):
			saynn("Your own cock is getting somewhat hard. Risha cups your balls and gives them a gentle squeeze.")

			saynn("[say=risha]Cute.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		playAnimation(StageScene.SexStanding, "sex", {npc="pc", pc="risha",
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={exposedCrotch=true,},
		})
		
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You dangle around a lot, having to pretty much stand on your toes as the pipe is quite high. Risha gets herself hard and stands behind you, her strong hand catches your leg and lifts it up while the second one guides her prickly cock down your sex.")

			saynn("Your lips send out a few soft moans while the soft barbs are brushing against your slit. Your petals are getting spread by the shaft that then finds your pussy holes and starts putting pressure on it, stretching.")

			saynn("[say=risha]My favorite moment~. Apart from breaking sluts completely, of course.[/say]")

			saynn("You throw your head back and pant while the guard is taking her sweet time, stretching you out. Eventually the folds of your sex engulf the barbed head soon followed by Risha’s rough thrust, shoving the rest of the shaft inside! You let out a stifled moan of discomfort as you feel your inner walls being scratched and explored by an intruding member.")

		# (else)
		else:
			saynn("You dangle around a lot, having to pretty much stand on your toes as the pipe is quite high. Risha gets herself hard and stands behind you, her strong hand catches your leg and lifts it up while the second one guides her prickly cock down your sex.")

			saynn("Your lips send out a few soft moans while the soft barbs are brushing against your ring. After that you feel it being prodded by the shaft that starts putting more pressure, gradually stretching.")

			saynn("[say=risha]My favorite moment~. Apart from breaking sluts completely, of course.[/say]")

			saynn("You throw your head back and pant while the guard is taking her sweet time, stretching you out. Eventually your backdoor engulfs the barbed head soon followed by Risha’s rough thrust, shoving the rest of the shaft inside! You let out a stifled moan of discomfort as you feel your inner walls being scratched and explored by an intruding member.")

		addButton("Continue", "See what happens next", "getCummedInside")

	if(state == "getCummedInside"):
		playAnimation(StageScene.SexStanding, "fast", {npc="pc", pc="risha", pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={exposedCrotch=true,},
		})
		
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Risha still holds your leg lifted while proceeding to use you raw, almost pulling out her cock before thrusting deep inside. Her free paw lands on your chin and holds your jaw before forcing a few digits into your mouth. You can’t fight it, little moans escape while you begin to suck on offered fingers.")

			saynn("[say=risha]Yeah, exactly how a proper slut must react.[/say]")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("Your chastity cage is just swaying around, the cock inside leaking pre while one of your pleasure points is being stimulated.")
			elif(GM.pc.hasPenis()):
				saynn("Your own cock is just swaying around, leaking pre while one of your pleasure points is being stimulated.")

			# (if has big breasts)
			if(GM.pc.hasBigBreasts()):
				saynn("Your {pc.breasts} are unconstrained and are sent to bounce each time you get pounded.")

			saynn("The lynx quickly picks up the pace, eagerly fucking you, her barbed cock has reached your inner wall and began hammering at it, making you shake from so much sensations. You keep rattling the cuffs while the cat quickly brings your orgasm closer, you feel yourself getting tighter around her shaft.")

			saynn("[say=risha]Ready to cum already? You’re dripping so much, must have been really riled up.[/say]")

			saynn("The barbs are becoming stiffer, your tongue drools onto the fingers in your mouth as the orgasm overwhelms you. Muscles begin to tense up, you’re squirming a lot while the lynx keeps thrusting inside you, raking at your inner walls and making each wave of pleasure that much better.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your {pc.cock} wastes its {pc.cum} by messing up the floor.")

			saynn("[say=risha]Nghh~. Gonna breed you.[/say]")

			saynn("Yeah, it seems Risha doesn’t plan on pulling out, she rams her cock deep inside you and lets your {pc.pussyStretch} pussy get her over the edge. The barbs get very stiff and catch onto the inner walls while the shaft begins to throb and shoot cum into your babymaker. The mean lynx grunts while stuffing you full of her virile seed. All the while you keep sucking on her digits.")

			saynn("[say=risha]Good little slut.[/say]")

		# (if no pussy)
		else:
			saynn("Risha still holds your leg lifted while proceeding to use you raw, almost pulling out her cock before thrusting deep inside. Her free paw lands on your chin and holds your jaw before forcing a few digits into your mouth. You can’t fight it, little moans escape while you begin to suck on offered fingers.")

			saynn("[say=risha]Yeah, exactly how a proper slut must react.[/say]")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("Your chastity cage is just swaying around, the cock inside leaking dripping uncontrollably.")
			elif(GM.pc.hasPenis()):
				saynn("Your own cock is just swaying around and dripping uncontrollably.")

			# (if has big breasts)
			if(GM.pc.hasBigBreasts()):
				saynn("Your {pc.breasts} are unconstrained and are sent to bounce each time you get pounded.")

			saynn("The lynx quickly picks up the pace, eagerly fucking you, her barbed cock is hammering at your pleasure spot, making you shake from so much sensations. You keep rattling the cuffs while the cat quickly brings your orgasm closer, you feel yourself getting tighter around her shaft.")

			saynn("[say=risha]Ready to cum already? You must have been really riled up.[/say]")

			saynn("The barbs are becoming stiffer, your tongue drools onto the fingers in your mouth as the orgasm overwhelms you. Muscles begin to tense up, you’re squirming a lot while the lynx keeps thrusting inside you, raking at your inner walls and making each wave of pleasure that much better.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your {pc.cock} wastes its {pc.cum} by messing up the floor.")

			saynn("[say=risha]Nghh~. Gonna breed you.[/say]")

			saynn("Yeah, it seems Risha doesn’t plan on pulling out, she rams her cock deep inside you and lets your {pc.analStretch} tailhole get her over the edge. The barbs get very stiff and catch onto the inner walls while the shaft begins to throb and shoot cum into your butt. The mean lynx grunts while stuffing you full of her virile seed. All the while you keep sucking on her digits.")

			saynn("[say=risha]Good little slut.[/say]")

		addButton("Continue", "See what happens next", "continue3")

	if(state == "continue3"):
		removeCharacter("risha")
		playAnimation(StageScene.Solo, "stand")
		
		saynn("After the lynx is done cumming inside you, she waits for her barbs to become a bit softer before pulling out, causing you to moan again.")

		saynn("[say=risha]Huh, now where is that other slut.[/say]")

		saynn("Risha looks around, unable to find Tavi. She huffs and leaves you a panting leaking cum mess. You’re also still cuffed to the pipe.")

		addButton("Wait", "Maybe someone will return", "wait")

	if(state == "wait"):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		
		saynn("After a bit of time you notice Tavi returning.")

		saynn("She walks up to you before freeing your hands.")

		saynn("[say=pc]What took you so long?[/say]")

		saynn("[say=tavi]You will see, cutie.[/say]")

		# (Tavi pulls out a tablet)
		addButton("Continue", "See what happens next", "endthescene")


	if(state == "struggle"):
		saynn("You find a good moment and free your arm before shoving an elbow into Risha’s face, making her hiss from pain and stagger. You break free of her grasp and shove her back.")

		saynn("[say=risha]Is that how you’re gonna play, slut?[/say]")

		saynn("Risha tries to find her shock remote but its not there.")

		saynn("[say=risha]Fuck. Not again.[/say]")

		saynn("At least her stun baton is still there. She grabs it and prepares for a fight.")

		saynn("[say=risha]Well, let's do it the old fashioned way then.[/say]")

		# (fight)
		addButton("Fight!", "Begin the fight", "fight_horny")

	if(state == "if_won"):
		addCharacter("tavi")
		saynn("Risha drops to her knees and huffs at you. That’s when Tavi shows up.")

		saynn("[say=pc]Where have you been?[/say]")

		saynn("Tavi leans in to whisper into your ear.")

		saynn("[say=tavi]You will see later. Good job, my pet.[/say]")

		saynn("[say=risha]You can’t just leave me.[/say]")

		saynn("Tavi leans down to Risha and smiles before stealing cuffs off of her and restraining her paws.")

		addButton("Let her go", "Risha can go screw herself", "let_her_go")
		addButton("Humiliate", "Strip Risha and write some things on her with a marker", "humiliate")
		

	if(state == "if_lost"):
		saynn("You drop to your knees, unable to continue fighting.")

		saynn("Risha looks around and sighs before producing a black marker.")

		saynn("[say=risha]Where is that whore?[/say]")

		saynn("[say=pc]Why would I know?[/say]")

		saynn("She grabs you by the collar and presses the maker against your cheek.")

		saynn("[say=risha]You’re her pet, of course you know.[/say]")

		addButton("Let her draw", "Risha will draw something on you", "let_her_draw")
		addButton("Struggle!", "You really don’t wanna be drawn on. This might be painful though", "struggle!")


	if(state == "let_her_draw"):
		addCharacter("tavi")
		saynn("You keep silent but also don’t resist her, just trying to catch your breath.")

		saynn("[say=risha]Fine, I see how it is.[/say]")

		saynn("Risha draws something humiliating on you, in a few spots actually. She then just straightens her posture and chuckles at the view.")

		saynn("[say=risha]Much better.[/say]")

		saynn("But just before Risha can react, Tavi jumps her and steals the stun baton before shoving it into the exposed part of her neck. Risha cries out from pain as her body locks up and hits the floor.")

		saynn("[say=risha]Arghh!.. B-bit-tch.[/say]")

		saynn("[say=tavi]No you.[/say]")

		saynn("Tavi holds the weapon against the lynx’s neck until she stops trying to struggle.")

		saynn("[say=pc]What took you so long.[/say]")

		saynn("[say=tavi]I will explain, cutie.[/say]")

		addButton("Let her go", "Risha can go screw herself", "let_her_go")
		addButton("Humiliate", "Strip Risha and write some things on her with a marker", "humiliate")
		

	if(state == "struggle!"):
		addCharacter("tavi")
		saynn("You hit the marker out of Risha’s paws and hear her growling. She kicks you down before pinning to the floor with her armored boot.")

		saynn("[say=risha]That was a huge mistake, inmate.[/say]")

		saynn("She grabs her handy stun baton and presses it against your exposed parts, sending a long powerful shock through you. All the while keeping you still with her boot that seems to be isolating her from being shocked too.")

		saynn("But just before Risha can react, Tavi jumps her and yanks on her hair before making it so she shoves the stun baton into her own neck. Risha cries out from pain as her body locks up and hits the floor.")

		saynn("[say=risha]Arghh!.. B-bit-tch.[/say]")

		saynn("[say=tavi]No you.[/say]")

		saynn("Tavi holds the weapon against the lynx’s neck until she stops trying to struggle.")

		saynn("You take some time trying to catch your breath.")

		saynn("[say=pc]What took you so long.[/say]")

		saynn("[say=tavi]I will explain, cutie.[/say]")

		saynn("Tavi then steals some cuffs off of Risha and restrains her paws.")

		# (Options are let her go, humiliate)
		addButton("Let her go", "Risha can go screw herself", "let_her_go")
		addButton("Humiliate", "Strip Risha and write some things on her with a marker", "humiliate")
		

	if(state == "let_her_go"):
		removeCharacter("risha")
		saynn("[say=pc]We should let her go.[/say]")

		saynn("[say=tavi]Are you sure, cutie? I’m sure this slut doesn’t mind being degraded.[/say]")

		saynn("Risha rattles her cuffs and growls back. But that just makes Tavi put her digi foot onto the guard’s face and pin her with it.")

		saynn("[say=tavi]I didn’t ask you.[/say]")

		saynn("[say=pc]Yeah, whatever. She got what she deserves already.[/say]")

		saynn("Tavi shrugs and kicks Risha to make her stand up. The guard obeys and gives you both an angry stare before leaving shortly after, still handcuffed.")

		saynn("[say=pc]So. What now?[/say]")

		#(scene ends)
		addButton("Continue", "See what happens next", "endthescene")

	if(state == "humiliate"):
		addCharacter("risha", ["naked"])
		
		saynn("[say=pc]Can you help me strip her?[/say]")

		saynn("[say=tavi]Sure~.[/say]")

		saynn("Risha growls at that question but a slap on the cheek makes her calm down. You and Tavi begin to pry off pieces of riot armor from the lynx until there is nothing but shorts and a light top on her, it must be getting quite hot in that armor. She snarls again when you reach for her clothing.")

		saynn("[say=risha]Bitch, don’t you dare.[/say]")

		saynn("But Tavi forces her digi foot into the guard’s cheek to pin her head into the cold floor.")

		saynn("[say=tavi]Not so cocky now, are you?[/say]")

		saynn("You pull down her shorts, exposing her sheath and a little slit hiding underneath her fluffy balls. Then you pull up her top too, exposing her big bouncy tits.")

		saynn("[say=tavi]Sluts don’t need clothes~[/say]")

		saynn("Risha squirms and struggles against her cuffs so you give her breasts a smack each, sending them to jiggle.")

		saynn("You notice a marker sticking out of one of Risha’s pouches. That might come in handy.")

		addButton("Draw on her", "Scribble some humiliating things on Risha’s body", "draw_on_her")
		addButtonWithChecks("Piss on her", "Make the slut really regret it", "piss_on_her", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])


	if(state == "draw_on_her"):
		# (should add random words onto Risha)
		playAnimation(StageScene.SexStart, "start", {pc="pc", npc="risha",
			bodyState={},
			npcBodyState={naked=true,},
		})

		saynn("You go through the guard’s equipment and find a black permanent marker. When seeing it, Risha immediately begins to squirm and try to break free but Tavi is holding her still.")

		saynn("[say=tavi]Don’t wiggle, slut. Or nobody will be able to read it~[/say]")

		saynn("[say=risha]You can go fuck yourself.[/say]")

		saynn("[say=tavi]Nu-uh~[/say]")

		saynn("You begin scribbling naughty words on Risha, slowly making her look more like a used fucktoy. Tavi grabs the marker and adds some of her own too.")

		saynn("Eventually the naked Risha begins to look more like a canvas, covered in drawings. And she can’t really cover herself due to her cuffed arms, she looks at her fur and sighs.")

		saynn("[say=risha]Really?[/say]")

		saynn("[say=tavi]Yeah~. Now get the fuck out, I won’t touch your shit.[/say]")

		saynn("And just like that, Risha gets up and leaves, trying to be sneaky so nobody sees her.")

		#(scene ends)
		addButton("Continue", "See what happens next", "endthescene")

	if(state == "piss_on_her"):
		# (needs piss enabled)
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="risha",
			bodyState={exposedCrotch=true,hard=true,},
			npcBodyState={naked=true,},
		})

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Tavi is still helping you to keep naked Risha in place so you take your time exposing your {pc.cock}.")

		# (else if pussy)
		elif(GM.pc.hasVagina()):
			saynn("Tavi is still helping you to keep naked Risha in place so you take your time exposing your pussy.")

		# (else)
		else:
			saynn("Tavi is still helping you to keep naked Risha in place so you take your time exposing your crotch.")

		saynn("[say=pc]Gonna mark her, that will make her remember it.[/say]")

		saynn("[say=risha]What? Mark how?![/say]")

		saynn("[say=tavi]Sure, cutie~.[/say]")

		# (if cock)
		if(GM.pc.hasPenis()):
			saynn("Without answering Risha’s question, you just hold your cock in her direction and try to force the urge. The lynx seems to eventually realize what your plan is about, she is panting and trying to break free again but it’s too late, a stream of yellow hot piss emerges from your dick and gives the guard a golden shower. She is whining and squirming as the gross fluids make her white fur look yellow, you make sure to piss all over her tits, belly and even her sheath.")

		# (else if pussy)
		else:
			saynn("Without answering Risha’s question, you just stand over her and try to force the urge. The lynx seems to eventually realize what your plan is about, she is panting and trying to break free again but it’s too late, a stream of yellow hot piss emerges from your pee hole and gives the guard a golden shower. She is whining and squirming as the gross fluids make her white fur look yellow, you make sure to piss all over her tits, belly and even her sheath.")

		saynn("[say=risha]Hey-y! Stop it! That’s fucking gross.[/say]")

		saynn("[say=tavi]Piss on her face too, the slut talks too much~[/say]")

		saynn("Tavi pulls her leg away and you obey, pissing on her face and hair too, making the lynx close her eyes and mouth but still forcing her to smell the scent of pee.")

		saynn("[say=pc]That felt so good.[/say]")

		saynn("After the shower, Risha looks extremely humiliated, her red face shows that she is embarrassed of what happened.")

		saynn("[say=tavi]Now get the fuck out, I won’t touch your shit.[/say]")

		saynn("Without an extra, naked and gross-smelling Risha obeys, getting up as fast as she can and leaving.")

		addButton("Continue", "See what happens next", "endthescene")

	if(state == "attack"):
		removeCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		
		saynn("You step in and break the eye contact that Risha has on Tavi. The lynx smirks and points the remote at you instead.")

		saynn("[say=risha]Well, if you wanna suffer first, be my guest~.[/say]")

		saynn("But before she can press the button, you decide to taunt her.")

		saynn("[say=pc]What, can’t even fight a single inmate without using that thing? Are you that weak?[/say]")

		saynn("Risha frowns at first but then a cheeky grin returns to her face. All the while Tavi is sneaking out of view to do something. Risha puts away the remote and whips out her stun baton.")

		saynn("[say=risha]Fine, bitch. Bring it on~.[/say]")

		# (Fight happens, if won and if lost are the same as with seducing)
		addButton("Fight!", "Begin the fight", "fight_normal")

	if(state == "wait1"):
		addCharacter("tavi", ["naked"])
		playAnimation(StageScene.Duo, "stand", {
			npc="risha", pc="tavi",
			bodyState={naked=true,},
		})
		
		saynn("Maybe it's best not to do anything and see what happens, wedging between them at the current moment seems like a bad idea.")

		saynn("Tavi is still holding her paws up while glancing at you sometimes while Risha is threatening her with the remote.")

		saynn("[say=risha]Unbutton that shirt.[/say]")

		saynn("[say=tavi]Why don’t y..[/say]")

		saynn("But just before Tavi can finish her sentence, Risha presses the button that sends an annoyingly painful shock through the red. Tavi is trying to hold strong but her muscles are visibly tensing up in reaction to electricity. You can’t help but to wince as the passive observer.")

		saynn("[say=tavi]Grghh-..[/say]")

		saynn("[say=risha]Shut up and do as you’re told.[/say]")

		saynn("When the shock ends, Tavi is left quite annoyed. She glances at you with her mean eyes again before moving her paws to her shirt and undoing each button one by one, eventually exposing her purplish belly but nothing else.")

		saynn("[say=risha]Take it off.[/say]")

		saynn("[say=tavi]Say please?[/say]")

		saynn("Instead of answering, Risha just presses the button, causing the other cat to hiss and grind her teeth while her body is suffering from the constant painful shock.")

		saynn("[say=risha]That’s enough manners for you?[/say]")

		saynn("Tavi nods subtly and opens her inmate shirt more, exposing her pristine perky tits with glowing green nips. Her chest is visibly rising and lowering as she is trying to catch her breath. The tall cat then takes off the piece of clothing completely and lets it fall. Risha hungrily eyes the exposed chest while grinning.")

		saynn("[say=risha]Much better. Now the shorts.[/say]")

		saynn("Tavi squints at the lynx but the threat of being shocked again makes her obey. She reaches for her shorts and sneaks two digits under the rubber band before slowly pulling them down.")

		saynn("[say=tavi]Of course, miss.[/say]")

		saynn("As the shorts fall, her crotch and the tight pussy slit get exposed. Tavi raises her paws up again, letting Risha look at her careful little kitty that has the same bright green color as her nips.")

		saynn("[say=risha]Much better. I knew there was a slut in you. I’m gonna put cuffs on you.[/say]")

		saynn("Completely naked Tavi just offers the lynx a kind smile.")

		addButton("Continue", "See what happens next", "continue4")

	if(state == "continue4"):
		playAnimation(StageScene.Duo, "defeat", {
			npc="risha", pc="tavi",
			bodyState={naked=true,},
		})
		
		saynn("Risha checks out all of Tavi's exposed curves before proceeding to slowly step towards her while still holding the remote.")

		saynn("[say=risha]Then I will bend you over and breed your slutty little slit. And you’re gonna take it like a good fucktoy.[/say]")

		saynn("Tavi is smiling, her paws are still up in the air while Risha is reaching for her cuffs. But just when the lynx pulls her eyes away from the cat, she dashes forward and grabs the hand that holds the remote before experly wrenching it behind Risha’s back, causing a sudden spike of pain for her.")

		saynn("[say=risha]Argh, bitch![/say]")

		saynn("Risha tries to break free but Tavi is already behind her and holding her neck with the free hand, trying to choke the guard into submission. It was so sudden, you’re not really sure what to do and Tavi is not giving you any orders so you feel like you’re paralized.")

		saynn("[say=tavi]Submit already, whore, it’s not worth it.[/say]")

		saynn("But eventually Risha manages to free her hand enough to slam the button on the remote, sending a powerful shock through Tavi and forcing her body to let go. The lynx then breaks free easily and kicks Tavi down. Risha is pressing her armored boot into Tavi’s naked belly to make sure she can’t stand up while the constant shock wears down her body and spirit.")

		saynn("[say=risha]I will make sure you remember this, stupid brat.[/say]")

		saynn("There is no other choice, you must act to save Tavi!")

		addButton("Push her!", "Shove Risha to make her stop", "push_her!")

	if(state == "push_her!"):
		removeCharacter("tavi")
		playAnimation(StageScene.Duo, "shove", {npc="risha", npcAction="hurt"})
		
		saynn("You rush towards the pair and shove Risha away from Tavi. That makes the lynx drop the shock remote and snarl at you before hitting the floor in her bulky riot armor. She kicks you back and reaches for her weapon before getting up.")

		saynn("[say=risha]Oh yeah?! Trying to be a hero? Bring it on, white knight.[/say]")

		saynn("All the while Tavi is left panting on the floor, she is swiftly grabbing her clothes and also something else before quickly making her escape.")

		# (Fight Risha, if won and if lost are same as before)
		addButton("Fight!", "Begin the fight", "fight_easier")
		
		


func _react(_action: String, _args):
	if(_action == "getCummedInside"):
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("risha")
			GM.pc.cummedInVaginaBy("risha")
		else:
			GM.pc.gotAnusFuckedBy("risha")
			GM.pc.cummedInAnusBy("risha")
		GM.pc.orgasmFrom("risha")
		
		GM.pc.addSkillExperience(Skill.SexSlave, 40)
		setFlag("TaviModule.ch1SeducedRishaAndGotFucked", true)
	
	if(_action == "struggle!"):
		GM.pc.addPain(100)
	
	if(_action == "let_her_draw"):
		for _i in range(3):
			var zone = BodyWritingsZone.getRandomZone()
			GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
	
	if(_action == "draw_on_her"):
		var risha = getCharacter("risha")
		for _i in range(5):
			var zone = BodyWritingsZone.getRandomZone()
			risha.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
	
	if(_action == "piss_on_her"):
		getCharacter("risha").pissedOnBy("pc")
	
	if(_action in ["fight_horny", "fight_normal", "fight_easier"]):
		runScene("FightScene", ["risha"], "ch1rishafight")
		if(_action == "fight_horny"):
			getCharacter("risha").addLust(30)
			setFlag("TaviModule.ch1SeducedRishaAndAttacked", true)
		if(_action == "fight_easier"):
			getCharacter("risha").addPain(50)
			setFlag("TaviModule.ch1WaitedBeforePushingRisha", true)
		return

	if(_action == "endthescene"):
		getCharacter("risha").removeEffect(StatusEffect.DrenchedInPiss)
		getCharacter("risha").clearBodywritings()
		
		runScene("Ch1s3Datapad")
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "ch1rishafight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(50)
		else:
			setState("if_lost")
			addExperienceToPlayer(20)
