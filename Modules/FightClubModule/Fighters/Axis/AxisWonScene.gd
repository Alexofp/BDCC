extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AxisWonScene"

func _run():
	if(state == ""):
		addCharacter("axis")
		playAnimation(StageScene.Duo, "stand", {npc="axis", npcAction="kneel"})

	if(state == ""):
		saynn("Axis roars and drops to his knees, he is clearly done fighting. Something fell out of his pocket as he hit the ground, something small. You have to get closer to see what it is.")

		saynn("[say=axis]Grr.. Fuck, I can’t lose. Don’t you dare touch me.[/say]")

		saynn("[say=pc]Why? Stop me then, alpha.[/say]")

		saynn("The crowd is watching the giant white wolf carefully, some are very surprised that he bent the knee.")

		saynn("[say=axis]If I’m to be humiliated, in front of everyone, others will stop seeing me as alpha. You have to spare me.[/say]")

		saynn("[say=pc]You’re a lilac, aren’t you a sextoy already?[/say]")

		saynn("[say=axis]I’m not! And never was. I’m a lilac because of my crimes.[/say]")

		saynn("Interesting. The guy doesn’t look so smug anymore, he knows his faith is in your hands.")

		saynn("As you approach him, you notice that the object that fell out of his pocket looks a lot like.. a chastity cage. Yeah, it is. It’s a small pink cage designed to keep someone’s dick from becoming erect.")

		saynn("[say=pc]Why do you have that?[/say]")

		saynn("[say=axis]It’s not for me if that’s what you are asking.[/say]")

		addButton("Spare", "You don’t feel like humiliating him", "spare")
		addButton("Humiliate", "That’s a nice chastity cage he has. You wonder if it will fit on him", "humiliate")
		GM.ES.triggerRun("ArenaFighterPCWon", ["axis"])

	if(state == "spare"):
		saynn("[say=pc]Fine. You can stay alpha if you need it so much.[/say]")

		saynn("[say=axis]Thanks for having decency. Appreciate it.[/say]")

		saynn("As you climb over the fence, the guy offers you the same smug smile. The crowd boos at your decision but they always do that when they don’t get to see somebody being fucked against their will.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")

	if(state == "humiliate"):
		playAnimation(StageScene.Duo, "stand", {
			npc="axis", npcAction="kneel", 
			bodyState={},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("As you approach the guy, his growling becomes more audible. You lean down and pick up the cage that he dropped.")

		saynn("[say=pc]Bet it would look cute on you.[/say]")

		saynn("He snarls and tries to get up but you shove him before he can do that and press your leg into his chest, pinning him.")

		saynn("[say=axis]Don’t you fucking dare.[/say]")

		saynn("[say=pc]What? All the days of being ‘alpha’ spoiled you. Made you a cocky narcissist. A hypocrite. I just bring your ego down to a level it deserves to be at. It will be fun~[/say]")

		saynn("You shift your leg lower, rubbing your feet against the guy’s crotch. That makes him growl louder. But you do feel his cock hardening up under the clothing. That gives you an idea. You lean down and shove your hand under his shorts, getting a grasp on his canine cock.")

		saynn("[say=axis]Gonna give me a handjob?[/say]")

		saynn("[say=pc]Nah, I feel like your scent has quite some interesting properties.[/say]")

		saynn("The guy raises his brow, being more confused than anything. But then everything becomes clear to him, you catch some of his precum onto your fingers and then shove them under his nose, forcing him to sniff his own fluids. He shakes his head but it’s too late, his own pheromones are already being absorbed into the bloodstream.")

		saynn("[say=axis]Bitch! What have you done![/say]")

		saynn("[say=pc]Exactly what you’ve been doing to others.[/say]")

		saynn("That thing is like a drug, the wolf’s facial expression quickly switches from hostile to a sorry and then to a horny one, the bulge on his shorts becomes bigger until his shorts start to look small.")

		saynn("[say=pc]Unbutton your shirt, alpha slut.[/say]")

		saynn("Weak growling can be heard from him but then it turns into him panting, he grits his teeth but also blushes, his shaky paws move to his shirt and begin undoing the buttons, slowly exposing his white chest and his six pack. The audience cheers and laughs, some horny inmate yells ‘Breed him!’. After he is done, you try to forcefully take off his shirt but you don’t meet any resistance, he allows you to expose his manly buff pecs.")

		saynn("[say=pc]Now the shorts.[/say]")

		saynn("The wolf doesn’t fight you, he starts pulling down his shorts, letting his member out, it’s a red knotted cock that is at least {axis.penisSizeStr} long. And it’s dripping more precum. He looks at you with his lusty eyes.")

		saynn("[say=axis]Gonna ride me? Be my guest.[/say]")

		saynn("You chuckle.")

		addButton("Lock his cock", "This is gonna be tricky", "lock_his_cock")

	if(state == "lock_his_cock"):
		playAnimation(StageScene.Duo, "stand", {
			npc="axis", npcAction="kneel", 
			bodyState={},
			npcBodyState={exposedCrotch=true,caged=true,},
		})
		
		saynn("The wolf is kneeling before you, his aroused cock is dripping precum onto the floor. You use your foot to make Axis spread his legs wider before crouching near him. You fidget with the pink chastity cage.")

		saynn("[say=axis]No..[/say]")

		saynn("[say=pc]No? You don’t sound too sure. Let’s ask the audience.[/say]")

		saynn("You show the cage to the crowd behind the fences.")

		saynn("[say=pc]Look at this. Should I lock it onto this alpha wolf’s cock?[/say]")

		saynn("The crowd cheers loudly, some inmates yell ‘And then fuck him! Make him into a sissy!’. You chuckle and begin putting the cage onto the wolf. It’s quite small so you really have to fight his erection. Although all the precum works nicely as a lube, you spread it along his full length and then start forcing the main part onto his cock. By applying lots of strength you manage to squeeze the pointy tip of his member in and that already made the wolf let out a muffled grunt.")

		saynn("[say=axis]It won’t fit, clearly..[/say]")

		saynn("[say=pc]Watch it.[/say]")

		saynn("You start putting more and more pressure, leaving the wolf's body with no choice but to begin moving blood away from his member. Eventually the cage starts to contain more of his length, he raises his chin high and grunts as his giant shaft is now getting stuffed into a small pink cage. His knot deflates on its own and after some extra effort you finally manage to lock it, sealing away the wolf’s cock. Boom, the key is in your hand.")

		saynn("[say=pc]There we go, one useless cock is locked away.[/say]")

		saynn("[say=axis]Bitch..[/say]")

		saynn("Oh, seems like he needs more of his own pheromones, you swiftly shove your wet fingers into his maw and rub them against his tongue.")

		saynn("[say=pc]Suck them, sissy.[/say]")

		saynn("The wolf blushes even harder as his alpha state is pushed away, replaced with subbyness. He starts slow, gently sucking your fingers. Then his canine tongue joins, he thrusts it between your digits and gathers all the precum before swallowing it, so cute. After he is done, you pull your fingers out and dry them against his cheek. Wolf’s cage throbs slightly in response, his lusty subby eyes burn with desire.")

		saynn("[say=pc]Good boy. Or, you’re more of a girl now I guess.[/say]")

		saynn("[say=axis]I.. I really wanna cum..[/say]")

		saynn("[say=pc]Do you now? Turn towards the audience and show how eager you are.[/say]")

		saynn("Quiet whining can be heard from him but obeys, turning towards the crowd and putting his paws up like a good kitty would. He then starts bouncing in place like he is riding an invisible cock, his pink cock cage bobbing up and down with small delay as he does that, his trapped cock leaking so much precum. The crowd reacts by yelling ‘Such a wet slut! Get on my cock! Bend over!’.")

		saynn("He looks at you pleadingly, nothing left of the alpha that you knew. You are still holding the key to his cage, deciding what to do next.")

		addButton("Enough", "That was some great humiliation", "enough")
		addButtonWithChecks("Breed", "Give the slutty sissy what she wants", "breed", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Grind face", "Rub your crotch against his face", "grind_face", [], [ButtonChecks.HasReachableVagina])


	if(state == "enough"):
		saynn("[say=pc]I think the world saw you for who you really are, a subby slut.[/say]")

		saynn("He tilts his head down, his cage throbs more each time you humiliate him.")

		saynn("[say=axis]Yes, I’m just a needy slut..[/say]")

		saynn("You toss the key onto the floor and begin climbing over the fence. While doing so, you notice him pouncing at it and trying to unlock his cage. He is eager so his hands shake a lot but as soon as the padlock gets unlocked, his cock suddenly starts shooting strings of cum! Too much fidgeting with his cage made him climax, he is moaning passionately while his half-erect cock sprays sticky stuff all over his naked body and his unlocked cage. So cute.")

		saynn("You get over the fence and go get your reward.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "breed"):
		# (needs cock)
		playAnimation(StageScene.SexStanding, "sex", {
			pc="pc", npc="axis", 
				bodyState={exposedCrotch=true,hard=true},
				npcBodyState={exposedCrotch=true,caged=true},
		})
		
		saynn("You feel like even though this ‘alpha’ was quite an unruly sub, he deserves a relief. You expose your {pc.cock} and stand in front of him, waiting silently.")

		saynn("Axis gazes at your cock and then looks up at you, pleadingly. Seeing your strict gaze, he moves his muzzle closer to your crotch and begins licking your cock with his long wolf tongue, getting it hard.")

		saynn("[say=pc]You better treat it well, this is what’s gonna breed you.[/say]")

		saynn("Wolf’s blushing harder, he parts his lips and engulfs the tip of your cock. You exhale audibly and offer him a nod and a cold headpat. You hear quite purring from the wolf, he gets more of your shaft into his mouth and begins sucking it, dragging his lips along it while using his tongue for extra friction. Your member is now fully hard in his mouth and leaking pre, just like the wolf’s caged cock.")

		saynn("[say=pc]Enough.[/say]")

		saynn("You pull your cock out and use it to smack the sissy’s cheek, making him feel even more humiliated. Then you get a grasp on his collar and pull him up before shoving against the nearby fence. Wolf whines as he is so easily thrown around, he holds onto the fence and sticks his butt out for you. You approach him from behind and give a firm smack on his sissy ass.")

		saynn("[say=pc]Move the tail out of the way.[/say]")

		saynn("He whines and grips the fence harder but eventually obeys, moving his fluffy tail to the side and exposing his tight-looking anal ring and the small pink cage. The ‘alpha’ is excited, his caged member is leaking profusely. The crowd can’t wait to see him being fucked.")

		saynn("Your hand grabs his tail and holds it as a leash while you guide your wet {pc.cock} towards his tailhole. A quiet gasp escapes from the wolf’s lips as the tip of your shaft starts rubbing and prodding at his clenching star.")

		saynn("[say=pc]Who is a sissy slut?[/say]")

		saynn("[say=axis]I am..[/say]")

		saynn("That was the correct answer, you push your hips forward and force your member inside his butt, causing him to let out a moan. Then you yank on his tail to make him move his rear back and forth, letting your cock explore and stretch him out. You let go of the tail but the wolf keeps following the motions, impaling on your member himself while dropping more and more lusty noises. He’s tight, very tight, maybe he even was a virgin. But not anymore, you slowly pick up the rhythm and start fucking the so-called alpha in front of a giant crowd.")

		saynn("[say=axis]Ah-h..[/say]")

		saynn("You are clearly hitting his pleasure spot, the wolf is shivering ever so slightly every time you thrust inside him, any discomfort he might have had seems to be gone, replaced with pleasure. You put a hand on his neck, just above the collar, and apply some pressure while using his tight ass.")

		saynn("[say=pc]What? This slut is gonna cum already? C’mon, show everyone how a sissy like you cums into her cage.[/say]")

		saynn("You pull your cock completely, leaving empty space behind. The wolf whines and moans desperately while his stretched star struggles to close. Just before it does, you ram your cock deep inside and start fucking him relentlessly. You place your chin on his shoulder and see his face, the wolf looks embarrassed but also incredibly turned on, his own pheromones are to blame for this for sure but maybe he always wanted this, maybe he was suppressing his subby side.")

		addButton("Cum", "See what happens next", "cum")

	if(state == "cum"):
		playAnimation(StageScene.SexStanding, "fast", {
			pc="pc", npc="axis", 
			npcCum=true, pcCum=true,
				bodyState={exposedCrotch=true,hard=true},
				npcBodyState={exposedCrotch=true,caged=true},
		})
		
		saynn("More passionate moans escape from him, the wolf is not holding back anymore, his caged member is swaying while he is being fucked and leaking something transparent at a constant rate. His inner walls begin closing around your shaft, trying to milk it. A few more seconds and the wolf suddenly cums, he throws his head back and cries out a loud moan while his trapped cock throbs and shoots a very weak string of cum. And then another. And another. As you fuck and milk his prostate, his cage keep leaking sticky stuff that drips down to the floor. The audience triumphs seeing and hearing the sissy finally wasting her load.")

		saynn("[say=axis]F-fuck!.. Feels so g-good!..[/say]")

		saynn("You spank his squirming ass again, causing him to clench harder. You feel like you won’t be able to endure this for long too, you pound his butt until the orgasmic waves overtake your body, you shove your cock deep down the wolf’s butt and let it stuff him to the brim with your {pc.cum}. His tailhole milks you dry, a few grunts escape from you as you both stay still, riding your orgasms to the end.")

		saynn("[say=pc]Such a tight fucktoy.[/say]")

		saynn("You pull your cock out, leaving his gaping used hole to leak {pc.cum}, creating even more mess on the ground. The wolf holds onto the fence and keeps moaning while his legs shiver. You pull your cock away.")

		saynn("[say=pc]Did you like it?[/say]")

		saynn("[say=axis]Yes..[/say]")

		saynn("[say=pc]Good. Don’t worry about the reputation, you will be much more popular as a breeding bitch.[/say]")

		saynn("You drop the key from his cage into the puddle of {pc.cum} between his legs, making it so he would need to humiliate himself even more to get his cock free. As you begin climbing over the fence, you see his subby eyes watching at you and at the mess he made.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "grind_face"):
		# (needs pussy)
		playAnimation(StageScene.SexFaceSitting, "grind", {
			pc="pc", npc="axis", 
				bodyState={exposedCrotch=true,hard=true},
				npcBodyState={exposedCrotch=true,caged=true},
		})

		saynn("You stand in front of him and expose your cute {pc.pussyStretch} pussy for him. Then you lean down and scritch the wolf under the chin.")

		saynn("[say=pc]You need to earn the right to cum, sissy slut.[/say]")

		saynn("Before he knows it, you shove your leg into his torso and make him fall back onto his back. Then you step over him and lower yourself onto your knees, offering a great view of your slit for him. You look down at the confused wolf and wait patiently.")

		saynn("[say=pc]Gonna start licking today, fucktoy?[/say]")

		saynn("The wolf, hypnotized by your pussy, snaps out of it and sticks his tongue out. He then reaches for your crotch and starts dragging his canine tongue over your sensitive folds. It feels good, you lower yourself more and press your slit into him, letting him lick you more easily.")

		saynn("[say=pc]Much better, use that alpha tongue.[/say]")

		saynn("He gives some extra attention to your clit, tracing around it and then playfully lapping at it, forcing little moans out of you. Your snatch becomes aroused with your juices, the wolf makes sure to gather your wetness onto his tongue and swallow it. He then finds your {pc.pussyStretch} pussy entering and starts prodding at it, teasing how easy it would be to penetrate you. You steal the initiative from him before he does that and hold his head still between your thighs. Then you start grinding your slit across his entire muzzle, slowly coating it with your juices. The wolf blushes and keeps his tongue out so you can rub yourself against it too. More little moans escape from you as the audience cheers you to ride his face harder.")

		saynn("[say=pc]Yeah, that’s right. The alpha turned out to be a great pussy licker, who would have thought.[/say]")

		saynn("You look behind you and see that your words had an effect on the wolf, his pink cage keeps throbbing and leaking precum at a steady rate. You chuckle and keep grinding his face, pushing yourself closer to your peak.")

		saynn("Your hand slips down to your crotch and starts caressing your clit for extra pleasure. Your second hand lands on your {pc.breasts} and rubs a nipple. Your moans become more passionate, each time you take a little break the wolf continues to lick your folds and swallow all the juices.")

		saynn("[say=pc]Are you ready, sissy~? Take a deep breath.[/say]")

		addButton("Cum", "Cum all over the guy", "cum1")

	if(state == "cum1"):
		playAnimation(StageScene.SexFaceSitting, "grind", {
			pc="pc", npc="axis", 
			npcCum=true, pcCum=true,
				bodyState={exposedCrotch=true,hard=true},
				npcBodyState={exposedCrotch=true,caged=true},
		})
		
		saynn("You grind the wolf’s face until you feel like you can’t take it anymore. Then you raise slightly and shove two fingers inside your slit. Your big thumb rubs the clit while the other two finger yourself at a crazy pace, causing your wet snatch to make wet noises. It only takes a few seconds before you push past the point of no return, you let out some loud moans and cum hard, your pussy squirting juices all over the alpha’s muzzle and into his opened maw. Your shaky legs give up and you fall onto his face again, squirming from all the orgasmic feelings.")

		saynn("The wolf swiftly swallows all of your juices and keeps asking for more, he drags his tongue over your pulsating folds and then penetrates them, quickly tongue-fucking you until your slit squirts again. You arch your back and look behind you, noticing that the wolf came too, his caged cock is shooting weak strings of cum that land on his belly, all without any stimulation.")

		saynn("[say=pc]Ah~.. You came like a true sissy.[/say]")

		saynn("You pant heavily and get off his face, letting him breathe. Oh, you made quite a mess, wolf’s whole face is covered in your fluids and his crotch has signs of his cum.")

		saynn("[say=pc]Thought about switching away from this whole Alpha bullshit? You’d make a great lilac toy.[/say]")

		saynn("The wolf is too embarrassed to answer you. You chuckle and throw him the key before getting over the fence. That was fun.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	if(_action == "cum"):
		getCharacter("axis").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("axis")
		GM.pc.addSkillExperience(Skill.SexSlave, 40, "axis_fuckhim")
	
	if(_action == "grind_face"):
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "axis_grindface")
	
	if(_action == "cum1"):
		GM.pc.orgasmFrom("axis")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

