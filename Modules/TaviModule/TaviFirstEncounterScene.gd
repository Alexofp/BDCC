extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TaviFirstEncounterScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		
	if(state == ""):
		saynn("You were exploring the mineshafts level when your ears suddenly caught an unknown voice somewhere from behind.")

		saynn("[say=tavi]Hey there~[/say]")

		saynn("Behind you was standing a pretty tall feline, about 2 meters high. First thing you notice is that she has glowing green markings running through her fur which make her stand out in the overall darkness. But the second big thing was her having a red block uniform on. She would quickly catch on your glance and offer you a smile.")

		saynn("[say=tavi]Yes, I’m a red. But you shouldn’t be afraid, I’m not tha-at kind of red.[/say]")

		saynn("She was standing pretty far, a few meters away, paws by her sides, giving you lots of room. Though she would begin to slowly close the distance, putting the feminine sway into her thighs as she steps.")

		saynn("[say=tavi]I’m not a bully, I don’t beat inmates up.. for no reason, I treat everyone fairly. My name is Tavi. What’s yours?[/say]")

		addButton("It's "+GM.pc.getName(), "Say your name", "sayname")

	if(state == "sayname"):
		saynn("[say=pc]I’m {pc.name}. What do you want?[/say]")

		saynn("The red pauses when she closes about half of the distance and shows you her raised open palms.")

		saynn("[say=tavi]{pc.name}, that’s a nice name. You probably noticed that it’s tough here. And I just wanna help you.[/say]")

		saynn("[say=pc]By beating me up? Red means you’re violent.[/say]")

		saynn("Tavi tilts her head down and sighs audibly, still keeping her palms visible.")

		saynn("[say=tavi]Sometimes you have to protect yourself. But then you get punished for that. What, I shouldn’t have broken that guard’s knee caps for beating me up? I just fixed the injustice.[/say]")

		saynn("Tavi shakes her head slightly and moves a few of her hair strands, exposing her differently colored eyes, red and green.")

		saynn("[say=pc]And how can you help me?[/say]")

		saynn("The smile returns to her as she puts her arms behind her back and creates eye contact. Her fluffy tail slowly swishes behind her as she proceeds to approach you.")

		saynn("[say=tavi]I can show you around at least, you need a tour guide right?[/say]")

		addButton("Sure", "She does seem somewhat friendly", "sure")

	if(state == "sure"):
		saynn("[say=pc]Umm. Yeah, sure.[/say]")

		saynn("At this point Tavi has caught up to you. She still keeps her arms behind her back so as not to scare you maybe, her face flashes a constant smile as she begins to slowly circle around, eying you out from every direction.")

		saynn("[say=tavi]You know.. I’m not in any gang. And I don’t have many friends here. Maybe you wanna be my friend. And in exchange, I can protect you. We would be stronger together, you know? What do you say..[/say]")

		addButton("Yes", "She seems like a good lady", "yes")
		addButton("No", "Something about her is off", "no")

	if(state == "yes"):
		saynn("You think about it for a second and decide that having a red on your side would be a pretty good idea.")

		saynn("[say=pc]Yeah, we can be friends, Tavi. I’m kinda new here and I wouldn’t mind someone helping me.[/say]")

		saynn("The feline would stop behind you, you would suddenly feel her touch as her palm runs along your back, stroking it. It was a very gentle touch so you kinda just let it happen. Then Tavi would move her hand to your head and give you a little scritch behind the ear. It all felt good.")

		saynn("[say=tavi]Just.. one thing. I will ask for just one thing in return.. Loyalty.[/say]")

		saynn("You raise your brow and tilt your head at the sudden new condition. But Tavi just keeps smiling as she runs her digits through your hair.")

		saynn("[say=pc]What does that mean?[/say]")

		saynn("[say=tavi]It means.. no lying to me.. no plotting against me.. simple. If my friend lies to me.. is that a good friend? I don’t think so. Are you gonna be loyal?[/say]")

		if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth) && GM.pc.isGagged()):
			saynn("She also tugs on your head harness.")
			saynn("[say=tavi]And I can help you with that too.[/say]")

		addButton("Yes", "Say that you will be loyal", "yes1")
		addButton("Push away", "What she thinks she is doing", "push_away")

	if(state == "no"):
		saynn("You shake your head at the feline, her smile starts to give you the creeps.")

		saynn("[say=pc]You will protect me? Why? I don’t believe that. You’re starting to creep me out.[/say]")

		saynn("You take a step away from her and she lets you do it, her smile is not as bright as it was and her voice switches to a more strict and intimidating one.")

		saynn("[say=tavi]So you think I’m lying, right? That I’m here to beat you up or something?[/say]")

		saynn("[say=pc]I don’t know what you want. But I don’t trust a red.[/say]")

		saynn("[say=tavi]I never lie, {pc.name}. I’m always honest. You know. I could help you escape from this place, together with me. I really can. Or I can help us to be paroled. But I need your help. But you’re too stubborn to see that, busy thinking that my red uniform means something[/say]")

		saynn("Her words confuse your mind, put it under stress, you’re just staring at her as she approaches you again, her palm lands on your cheek and caresses it.")

		saynn("[say=tavi]Tell me, sweetie, was there a reason to tell you all that just to beat you up later? I don’t want none of that.[/say]")

		saynn("[say=pc]I guess there is no reason.[/say]")

		saynn("[say=tavi]I need a friend like you. A loyal friend. A friend that won’t lie to me. A friend that won’t snitch. Are you gonna be loyal?[/say]")

		if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth) && GM.pc.isGagged()):
			saynn("She also tugs on your head harness.")
			saynn("[say=tavi]And I can help you with that too.[/say]")

		addButton("Yes", "Say that you will be loyal", "yes1")
		addButton("Push away", "What she thinks she is doing", "push_away")

	if(state == "yes1"):
		saynn("You think about it for a second, maybe it’s not that huge of a price to pay, you’re not a liar anyway. You nod to the tall feline a few times. Tavi’s smile is bright.")

		saynn("[say=tavi]Well.. I’m afraid you will have to prove it, sweetie.[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("She pushes her digits into your hair to give you some scritches.")

		saynn("[say=tavi]Get on your knees for me. Simple task, isn’t it?[/say]")

		saynn("She tilts her head and gently tries to push you down, her digits have a slightly threatening grasp on your hair.")

		addButton("Kneel", "Do as Tavi says", "kneel")
		addButton("Push away", "What she thinks she is doing", "push_away")

	if(state == "kneel"):
		playAnimation(StageScene.Duo, "kneel", {npc="tavi"})
		
		saynn("You feel her firm grasp and decide to comply. Without much resistance, you lower yourself and get on your knees before the tall cat. She can’t help but to smile and give you a few headpats.")

		if(GM.pc.getGender() == Gender.Female):
			saynn("[say=tavi]Good girl~[/say]")
		elif(GM.pc.getGender() == Gender.Male):
			saynn("[say=tavi]Good boy~[/say]")
		else:
			saynn("[say=tavi]Good little cutie~[/say]")
			
		#if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth) && GM.pc.isGagged()):
		#	saynn("Tavi does something to your gag and the whole harness slips off of your head and falls onto the floor.")

		#	saynn("[say=tavi]Can’t have you be gagged all the time~[/say]")

		saynn("Tavi gently caresses your cheeks and then gives you scritches under the chin. It feels good to have her do that, a slight blush appears on your face.")

		saynn("[say=tavi]There will be a few rules with me, cutie.[/say]")

		addButton("Continue", "Listen to the rules", "continue")

	if(state == "push_away"):
		saynn("You start to understand that this is not going into a good direction for you. But as you try to shove the red away, she suddenly gets a hold of your hair and pulls you to the side, causing a painful spike.")

		saynn("[say=pc]Agh, fuck! Let go, you bitch[/say]")

		saynn("Her voice is strict, the stare drills you.")

		saynn("[say=tavi]I’m afraid you don’t have a choice here, sweetie. If I have to force you, I will. Get. On. Your. Knees. Don’t make it any more painful for yourself.[/say]")

		saynn("You try to struggle but each attempt is met with her pulling on your hair more. The pain is unbearable.")

		addButton("Submit", "Do as she orders", "submit")
		addButton("Push", "Fight the pain and try to overpower her. You will probably have to fight her.", "push")

	if(state == "submit"):
		playAnimation(StageScene.Duo, "kneel", {npc="tavi"})
		
		saynn("The pain is too much so you decide to comply. You raise your hands up and cease resisting.")

		saynn("[say=pc]Alright, alright.. fuck..[/say]")

		saynn("Tavi keeps holding your hair and tugging down, inviting you to show more submission. And you do, you slowly get on your knees before Tavi while glaring at her.")

		saynn("[say=tavi]See? Wasn’t that hard, was it. I don’t mind brats as long as they behave when it matters~[/say]")

		#if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth) && GM.pc.isGagged()):

		#	saynn("Tavi does something to your gag and the whole harness slips off of your head and falls onto the floor.")

		saynn("[say=pc]Ugh.. What now?[/say]")

		saynn("[say=tavi]There will be rules. Just so something like this doesn’t happen again.[/say]")

		saynn("[say=pc]And you’re gonna beat me up if I don’t follow them. I see how it is..[/say]")

		saynn("[say=tavi]I’m not a sadist, pain is a tool for me, sweetie. It shows you that what you’re doing is wrong. But, perhaps, you might learn to enjoy them. The painful sensations in the right circumstances can be as pleasurable as the sexual one, if not more~. Ready to listen?[/say]")

		saynn("You nod subtly and tilt your head down, defocusing your glance. Tavi sees that you’re not resisting and lets go of your hair.")
		
		addButton("Continue", "Listen to the rules", "continue")
		

	if(state == "push"):
		saynn("Instead of trying to escape from Tavi’s grasp, you do the opposite, dashing into her and trying to knock her down. It was an unexpected move for Tavi and she lets go of your hair as you both collapse onto the cold metal floor.")

		saynn("[say=tavi]Argh. You will pay for that[/say]")

		saynn("You quickly crawl away and stand up but the feline manages to recover too. And seems like she is blocking the exit. Tavi notices that and chuckles at you.")

		saynn("[say=tavi]Well. Come here, sweetie~[/say]")

		saynn("Seems like it’s a fight.")

		addButton("Fight", "Start the fight", "fight")

	#if(state == "fight"):
		# (fight happens)

	#	addButton("Lost fight", "", "lost_fight")

	if(state == "lost_fight"):
		playAnimation(StageScene.Duo, "kneel", {npc="tavi"})
		
		saynn("You can’t fight anymore, the cat was too strong for you. You give up and drop to your knees, all your bruises cause you pain. Tavi is clearly looking very annoyed, you can’t see her smile anymore. She walks up to you and grabs you by the collar with the other hand threatening to strike you.")

		saynn("[say=tavi]Since your willpower is so fucking strong, I will give you one last chance. Submit. Or suffer.[/say]")

		addButton("Submit", "Maybe it’s not too bad", "submit1")
		addButton("No", "Do not submit to her. Probably a bad idea", "no1")

	if(state == "submit1"):
		saynn("You nod silently and don’t resist much. Tavi sees that and quickly calms down, putting her happy face on again.")

		saynn("[say=tavi]Wasn’t too hard, was it? I’m glad you picked the right choice. Since you are so prone to misbehave, there are gonna be rules for you[/say]")

		#if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth) && GM.pc.isGagged()):

		#	saynn("Tavi does something to your gag and the whole harness slips off of your head and falls onto the floor.")


		addButton("Continue", "Listen to the rules", "continue")

	if(state == "no1"):
		playAnimation(StageScene.Duo, "defeat", {npc="tavi"})
		
		saynn("You just spit in her direction. And Tavi clearly didn’t like that answer, she growls as she pushes her leg into your chest and then kicks you away, causing you to hit the floor. That act puts a somewhat satisfied grin on her face.")

		saynn("[say=tavi]Well enjoy yourself then.[/say]")

		saynn("And after that, she leaves you alone.")

		addButton("Continue", "Screw her", "endthescene")

		#addButton("Won fight", "", "won_fight")

	if(state == "won_fight"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="kneel"})
		
		saynn("Tavi loses her strength and collapses onto the floor. All her many bruises seem to be glowing green, with the color of her blood.")

		saynn("[say=tavi]Yes, you won. I won’t touch you anymore. Go the fuck away now. Mghhh..[/say]")

		saynn("She is panting and hissing at you. What are you gonna do?")

		addButton("Submit", "Maybe you went too far..", "submit2")
		addButton("Walk away", "Leave Tavi", "walk_away")
		addButtonWithChecks("Dominate Tavi", "Make that bitch submit to you using violence", "dominateTavi", [], [ButtonChecks.NotHandsBlocked])
		if(getModuleFlag("TaviModule", "Tavi_Submissiveness", 0) >= 1):
			addButtonWithChecks("Degrade Tavi", "Force her to act like a puppy", "degradeTavi", [], [ButtonChecks.NotHandsBlocked])
		else:
			addDisabledButton("Degrade Tavi", "Tavi needs to be at least a little bit obedient")
		addDisabledButton("Fuck Tavi", "Not done :(")

	if(state == "submit2"):
		playAnimation(StageScene.Duo, "kneel", {npc="tavi"})
		
		saynn("You crouch before Tavi and help her to get up. You swipe the dirt from her uniform and step away, tilting your head down, looking kinda sad after what you did.")

		saynn("[say=tavi]What are you doing? You managed to beat me up, what else do you want?[/say]")

		saynn("[say=pc]Sorry.. I’m sorry I did that, Tavi..[/say]")

		saynn("After saying that you quickly get on your knees before Tavi, showing full submission. She sees that you are genuine and hardly believes her eyes. She straightens her posture and stretches but the slight pain is still here.")

		saynn("[say=tavi]Ugh. You’re good at fighting, I will give you that.[/say]")

		saynn("She then grabs you by the chin and makes you look up at her.")

		saynn("[say=tavi]Well. I’m glad you made the right choice. Eventually. Let me tell you how this is gonna work. You’re gonna follow my rules. Mhm?[/say]")

		saynn("You nod.")

		#if(GM.pc.getInventory().hasSlotEquipped(InventorySlot.Mouth) && GM.pc.isGagged()):

		#	saynn("Tavi does something to your gag and the whole harness slips off of your head and falls onto the floor.")


		addButton("Continue", "Listen to the rules", "continue")

	if(state == "walk_away"):
		saynn("You just turn around and leave the beaten up red behind.")

		saynn("[say=tavi]I will watch you be fucked in the stocks with great pleasure. Ugh..[/say]")

		saynn("You decide that it’s not worth answering.")

		addButton("Continue", "Screw that bitch", "endthescene")

	if(state == "continue"):
		saynn("[say=tavi]Firstly. You address me as Miss. Miss Tavi. Understand?[/say]")

		saynn("[say=pc]Yes, Miss Tavi..[/say]")

		saynn("She slides her paw along your shoulders.")

		saynn("[say=tavi]Like I said, you don’t lie to me. Ever[/say]")

		saynn("She traces her digits over your lips while licking hers.")

		saynn("[say=tavi]And you obey my commands. If I tell you to jump - you jump. Be good for me and we won’t have any problems. You will be my personal pet. Think I lied to you? Pets are friends, aren’t they? Yes they are, hah[/say]")

		saynn("You tilt your head down.")

		saynn("[say=pc]Yes, Miss Tavi..[/say]")

		saynn("Suddenly she gets a hold of your hair again.")

		saynn("[say=tavi]Hands behind your back, pet. Close your eyes[/say]")

		addButton("Obey", "Put your hands behind your back and close eyes", "obey")

	if(state == "obey"):
		addCharacter("tavi", ["naked"])
		playAnimation(StageScene.SexFaceSitting, "sit", {
			pc="tavi", npc="pc", pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,},
			npcBodyState={hard=true},
		})
		
		saynn("You do as she says. Your eyes are shut, arms are behind the back. You are kneeling before a tall feline that has a grab on your hair. Suddenly she starts tugging you closer, closer to herself. And you give in, leaning forward for your new Miss, until meeting with her covered crotch. She is still wearing the shorts but you still feel the warmness of her body, get her nice female scent.")

		saynn("[say=tavi]Like it, cutie? You like being used like a toy?[/say]")

		saynn("You breathe warmly into her crotch, something about this turns you on so much. Tavi gently tugs on your hair, causing you to shift your face up and down, rubbing against the sensitive flesh behind the shorts. Tavi is clearly breathing more deeply too.")

		saynn("[say=pc]Yes, I do..[/say]")

		saynn("[say=tavi]Yes, who? Stick your tongue out, pet[/say]")

		saynn("She pushes you more into her crotch as you obey. You feel the slight bumps that are her pussy lips, your tongue can distinguish where the sensitive little bean is, you begin licking it eagerly and exhale warmly while the tall feline uses your tongue for her pleasure. She can’t help but to open her mouth and let out a slight moan. You feel her becoming wet, you feel the female scent becoming stronger as you continue to lick her out, even though doing it through the shorts seems humiliating.")

		saynn("[say=pc]Yes, I do, Miss Tavi.. I like being used..[/say]")

		saynn("Tavi enjoys your tongue so much she slowly starts to grind her crotch against your face, slowly picking up the pace. Her warm moans become more pronounced, you’re lucky there is no one around.")

		saynn("[say=tavi]Yes, very good.. mhm~.. Such a good toy.. Such a good pussy licker. You want to see me cum on your face, right cutie~? Maybe I should steal that from you[/say]")

		saynn("[say=pc]Yes, Miss.. Please.. Don’t steal..[/say]")

		saynn("Suddenly she gently pushes a leg into your shoulder, causing you to lose balance and fall back onto your back. You gasp and open your eyes, seeing the turned on feline pin you to the floor. The crotch spot on her shorts is visibly wet.")

		saynn("[say=tavi]Aww. You’re cheating. So naughty~[/say]")

		saynn("You blush a lot seeing Tavi. She teasingly tugs on her shorts before pulling them down, exposing her privates. Your eyes can see her beautiful tight-looking petals with a little clitoris above. Her purple fur is in big contrast with the color of her flesh, it’s toxic-green and it’s glowing in the dark. She is clearly very aroused, the scent of her wet slit is so desirable.")

		saynn("[say=tavi]My little submissive pet~[/say]")

		saynn("Tavi throws the wet shorts away and keeps an eye contact with you as she stands to lower herself onto your face. She crouches, then kneels down, now giving you a great view at her slit. It almost seems pure, no abuse or anything, just a wet slit and a tight-looking anus of the same green color. You feel her wet pussy petals touch your face and begin to eagerly try to lick them again.")


		if(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("As she sits down on your face, you can’t help but to sneak one of your hands down to your cage. You’re so turned on that your {pc.cock} leaks precum already. It’s useless but you begin to slowly stroke yourself, trying to get at least some stimulation.")
			else:
				saynn("As she sits down on your face, you can’t help but to sneak one of your hands down to your hard cock. You’re so turned on that it leaks precum already. You begin to slowly stroke yourself.")

			saynn("[say=tavi]Don’t think I don’t see that~. But I will allow it[/say]")

			saynn("Little moans escape from your mouth.")

			if(GM.pc.hasVagina()):
				saynn("And your pussy is wet. Very wet. Your second hand joins the first and starts rubbing your little sensitive button.")

		elif(GM.pc.hasVagina()):
			saynn("As she sits down on your face, you can’t help but to sneak one of your hands down to your crotch. Your digits find your sensitive button and begin to sneakily rub it. It just feels so good.")

			saynn("[say=tavi]Don’t think I don’t see that~. But I will allow it[/say]")

			saynn("You rub yourself harder, little moans begin to escape from your mouth. You’re wet. Very wet. And your digits quickly become too.")

		saynn("[say=tavi]So lustful.. so eager.. so.. slutty[/say]")

		saynn("Dirty words only make it more hot, Tavi finally fully lowers her crotch onto your face and lets you do the work. You stick your tongue out and begin to lap at her lips, gathering more and more of her female wetness. You trace the tip around your clit and then push around the wet entrance. She shows how she enjoys it by moaning warmly. You prod at the entrance itself too and manage to slip a bit of the lenght inside as she begins to slowly shift up and down, letting you tongue-fuck her.")

		saynn("[say=tavi]Fuck that feels good~[/say]")

		saynn("You explore her soft depths, lapping at her green pussy walls and swallowing her girl fluids, enjoying seeing the tall cat quiver and hearing her moan. She then steals the initiative and pins you into the floor with her arms as she proceeds to grind her slit against your face and lips, moaning harder and harder, using you as a pleasure device.")


		if(GM.pc.hasPenis()):
			if(GM.pc.isWearingChastityCage()):
				saynn("It’s so hot that you can’t help but to tease your chastity cage harder. Your shaft twitches under it and leaks a lot of precum, the balls beg for release.")
			else:
				saynn("It’s so hot that you can’t help but to stroke your cock harder. Your shaft twitches and leaks a lot of precum, the balls beg for release.")

			if(GM.pc.hasVagina()):
				saynn("Your other hand fingers your wet slit at a fast pace, causing it wet noises, it’s only a matter of time before you cum.")

		elif(GM.pc.hasVagina()):
			saynn("It’s so hot that you can’t help but to push two of your digits inside your wet slit. While Tavi uses your face for her pleasure, you begin to finger yourself at a fast pace, pushing your digits in and out and pushing yourself closer to your climax.")

		saynn("[say=tavi]Ah~.. Ready to swallow, my pet? Open your mouth for me.. mhm~[/say]")

		saynn("You obediently do it, your face is all covered in Tavi’s wetness already but she is clearly not done. She grinds herself close to her climax, moaning and panting heavily before raising her body slightly, giving you more breathing room. She then pins your head to the floor with one hand while pleasuring herself with the other. Her digits are mostly focused on her clit, she quickly rubs it from side to side, causing her legs to begin shaking and her whole body shivering. Only a few seconds pass before the waves of pleasure hit her body. She cums hard, arching her back and letting out some very passionate moans while her pussy contracts in an uneven rhythm. She was stimulated so much, her slit suddenly squirts, covering your face with her transplant girlcum with some landing into your mouth.")


		if(GM.pc.hasPenis()):
			saynn("Not too long after Tavi begins to climax, you do too. You pull your own shorts down so you don’t make a mess as you cum. Spurt after spurt of your semen lands on the floor nearby, you didn’t cum inside anyone but it’s still a great feeling to be used like this.")

			if(GM.pc.hasVagina()):
				saynn("And your pussy begins to spasm too from all the orgasmic waves hitting your body, your mind is begging for this moment to continue for as long as possible.")

		elif(GM.pc.hasVagina()):
			saynn("And you quickly join her. Your fingers quickly get you to your own orgasm. You feel a wave after wave of pure ecstasy begin to overtake your body. Your muscles don’t listen, causing you to moan and shiver, your mind begging for this moment to continue for as long as possible.")

		saynn("Eventually you both calm down though your hearts are still racing and Tavi is panting a lot. She slowly stands up and takes a look at the mess she left, smiling.")

		saynn("[say=tavi]Good little toy~. I will see you around, my pet[/say]")

		saynn("[say=pc]Thank you, Miss Tavi..[/say]")

		saynn("And with that, she quickly grabs her shorts and leaves you alone, your face is covered with her fluids. You keep licking your lips, liking the aftertaste. Eventually you catch your breath and stand up. You probably would need to wash your face or take a shower after that.")

		addButton("Continue", "That was something", "endthescene")

func _react(_action: String, _args):
	if(_action == "no1"):
		GM.pc.addPain(20)
		
		addMessage("That was painful. You received 20 pain")
		
		TaviModule.makeTaviAngry()
	
	if(_action == "walk_away"):
		TaviModule.makeTaviAngry()
	
	if(_action in ["kneel", "submit", "submit1", "submit2"]):
		if(GM.pc.freeMouthDeleteAll()):
			addMessage("Tavi does something to your gag and the whole harness slips off of your head and falls onto the floor.")
	
	if(_action == "obey"):
		processTime(30*60)
		GM.pc.orgasmFrom("tavi")
		GM.pc.cummedOnBy("tavi", FluidSource.Vagina)
		GM.pc.cummedInMouthBy("tavi", FluidSource.Vagina)
		GM.pc.addSkillExperience(Skill.SexSlave, 50, "tavi_firstencounter")
		addMessage("Tavi came on you, covering your body with her female juices")
	
	if(_action == "fight"):
		runScene("FightScene", ["tavi"], "tavifight")

	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "dominateTavi"):
		TaviModule.makeTaviAngry()
		
		runScene("DominateTaviScene")
		endScene()
		return
		
	if(_action == "degradeTavi"):
		TaviModule.makeTaviAngry()
		
		runScene("DegradeTaviScene")
		endScene()
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "tavifight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_fight")
			addExperienceToPlayer(40)
		else:
			setState("lost_fight")
			addExperienceToPlayer(10)

func getDevCommentary():
	return "A lot of people don't like Tavi (and still don't). Which is fair.. The reason is probably because she is quite obviously.. shady. And tries to dominate you at the first sight. Ehh.. I tried to write her.. intimidating, yes. She does actually need your help but she is not quite sure how to ask for it.\n\nThis is probably one of the first 'lewd' scenes that I wrote for the game. Would I do it differently now? I still can x3. I'm just lazy. But.. I dunno. Tavi is weird by design. She is like.. Joker. Even has his colors x3. I think her current introduction is fine.\n\nWhy did I made it so you must sub to her to get any story? Well, I wanted to complete a route for 'switch' people first. Switches are between doms and bottoms, they can do both, they can 'switch'. I'm a switch so it would be the easiest for me to write. What does that mean for the route? It means that you are Tavi's sidekick and sub to her but also can dominate people around the station (or sub to them too x3). And that 'Tavi's sub' is what irks people. But I can't really see her content working without that.. connection.. between you and her. Hope I make sense. Sorry dom people, I will write a route for you too x3"

func hasDevCommentary():
	return true
