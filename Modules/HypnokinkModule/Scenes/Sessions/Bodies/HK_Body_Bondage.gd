extends "res://Modules/HypnokinkModule/Scenes/Sessions/HK_SessionBodyBase.gd"

func _init():
	sceneID = HK_Sessions.BodyBondage
	
func _initScene(_args = []):
	onBody()

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "sit", {npc="vion", npcAction="sit"})

		saynn("[say=vion]Bondage is such an interesting, multifaceted topic. What is it about it that interests you? Is it the feeling of restriction, of vulnerability, of powerlessness? Or is it the snug restraints that allow you not to be in control, to simply submit?[/say]")

		saynn("He grabs your wrists and pulls them to your side. He lets go of your left, but grabs your right with both hands and firmly squeezes it.")
		
		addButton("Continue", "", "after_intro")
	if(state == "after_intro"):
		playAnimation(StageScene.Duo, "sit", {npc="vion", npcAction="sit"})
		saynn("[say=vion]I'll start by locking these special cuffs on you. Until I say otherwise, you won't be able to take them off, no matter what you do. Understand?[/say]")

		saynn("You nod as he lets go of your right wrist, grabbing your left instead. He squeezes again, repeating the motions of fastening a cuff around it.")

		saynn("[say=vion]And there's the second one. They feel wonderful, don't they? Snug, tight, restrictive and secure, but also just the right size for you and perfectly comfortable.[/say]")

		saynn("He pushes your arms behind you and clamps your wrists together.")

		saynn("[say=vion]There, out of sight and out of mind. Inescapable. Not just restrained, though. Feel them go rigid as my commands wrap around them, taking control of them, entwining with them... Completely trapped, powerless in my grasp. No struggling allowed. No escape possible.[/say]")

		saynn("You try to squirm, but true to his words, your arms are locked in place as solidly as if they were in a block of concrete.")
		addButton("Continue", "", "after_wrist_cuffs")

	if(state == "after_wrist_cuffs"):
		playAnimation(StageScene.Duo, "sit", {npc="vion", npcAction="sit"})
		saynn("[say=vion]Now let's take care of your legs. Keep nice and still now...[/say]")

		saynn("You can't help but shiver as you feel Vion wrap his hands around first your left, then your right ankle, feeling the tension as he twists his hands around them.")

		saynn("[say=vion]Excellent, just as secure. Do feel free to [i]try[/i] and struggle if you'd like, though...[/say]")

		saynn("Despite your diligent attempt at doing so, you fail to make the slightest bit of progress.")
		addButton("Continue", "", "after_ankle_cuffs")
		
	if(state == "after_ankle_cuffs"):
		playAnimation(StageScene.Duo, "kneel", {npc="vion", npcAction="sit"})
		saynn("[say=vion]The best part about being restrained by the power of your own mind, though? Its how convenient it can be. [b]Kneel[/b] for me.[/say]")

		saynn("The restraining strength of Vion's hypnotic command abates for just a moment, allowing you to get down on your knees, only to return immediately afterwards, even stronger than before.")

		saynn("[say=vion]Let's strap you down a bit more, shall we? First let's tie those limbs down...[/say]")

		saynn("You feel his hands brush up against your wrists and ankles as he secures restraints to them.")

		saynn("[say=vion]That's better. Even if you could move without permission you'd get nowhere now. Now let's do something about this collar, hm?[/say]")

		saynn("He caresses your neck, pulling and twisting at your collar. Then he grips your chin, forcing you to look straight ahead.")

		saynn("[say=vion]I'm locking your head and neck in place. That's right, no looking back now~[/say]")

		addButton("Continue", "", "after_anchoring")
	if(state == "after_anchoring"):
		playAnimation(StageScene.DuoHypnoTied, "sit", {pc="vion", npc="pc", npcAction="kneel", flipNPC=true})
		saynn("You helplessly stare ahead, shivering as Vion circles behind you.")
		
		if(GM.pc.hasTail()):
			saynn("[say=vion]One last thing, just in case you fancy yourself an escape artist. Let's tie this tail down, nice and secure.[/say]")

			saynn("He pulls your tail taut, then forces it to lie flat against the ground.")

		saynn("[say=vion]That should do, I think. Remember, not a peep and keep your eyes closed.[/say]")
		
		saynn("You hear the sound of straining cushions as Vion sits down on the sofa behind you.")
		addButton("Continue", "", "wait")
		
		
	if(state == "wait"):
		playAnimation(StageScene.DuoHypnoTied, "stand", {pc="vion", npc="pc", npcAction="kneel"})
		
		saynn("You kneel there, restrained by your own desires.")

		saynn("Time passes.")

		saynn("You try to squirm, but...")

		saynn("Occasionally you hear the rustle of pencil upon paper behind you.")

		saynn("[say=vion]Hmm hm hmmm~[/say]")

		saynn("And yet, you continue to wait...")

		saynn("[say=vion]And done! I'm no artist, but you do make a great model. [i]Very[/i] good at holding a pose! Maybe I'll show you the sketch later, when you're more... present.[/say]")

		saynn("Again, you hear the sofa creak as Vion stands up and circles back in front of you.")

		saynn("[say=vion]Would you like to get up now? Just nod if you would.[/say]")

		saynn("With the greatest of struggles, you manage a barely perceptible nod.")
		
		saynn("[say=vion]Good {pc.boy}. The cuffs stay on for a bit longer, though~[/say]")
		
		addButton("Continue", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "after_intro"):
		var cuff = GlobalRegistry.createItem("ImaginaryWristCuffs")
		GM.pc.getInventory().forceEquipStoreOther(cuff)
	if(_action == "after_wrist_cuffs"):
		var cuff = GlobalRegistry.createItem("ImaginaryAnkleCuffs")
		GM.pc.getInventory().forceEquipStoreOther(cuff)
	if(_action == "after_ankle_cuffs"):
		pass
		
		
	if(_action == "endthescene"):
		endScene()
		afterBody()
		GM.pc.addSkillExperience(Skill.BDSM, 100, HK_Sessions.BodyBondage)
		return

	setState(_action)

