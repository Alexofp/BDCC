extends "res://Modules/DrugDenModule/DrugDen/DrugDenEncounterTemplateScene.gd"

func _init():
	sceneID = "DrugDenEncounterBossScene"
	
	expWin = 150
	wonState = "wonFight"

func _reactInit():
	npcID = generateJunkieNPCID(true)
	addCharacter(npcID)
	#startFightWithNPC()


func _run():
	encounter_run()
	
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		saynn("You push deeper into the tunnels, the air thick with the stench of sweat, chemicals, and something rancid. You have stumbled upon one of the drug labs.")
		
		saynn("And you're not alone..")
		
		saynn("A filthy, twitching mess of a junkie stands between you and the lab, {npc.his} pupils blown wide. {npc.His} whole body is jittering like {npc.he} {npc.isAre} barely holding it together.")
		
		saynn("Around {npc.him}, the floor is littered with half-conscious bodies of other junkies, moaning and lost in their own highs.")
		
		saynn("[say=npc]"+RNG.pick([
			"You lost, dipshit? This is MY fucking lab. Crawl back to whatever pisshole you came from.",
			"Hhhhnngh.. Fresh meat. You here to trade? Maybe I let you sniff some - if you ain't a little BITCH about it!",
			"Haaaah.. You smell clean. Too clean. Either you take a hit, or I break your fuckin’ legs.",
			"Heh. HEH. Ohhh, you’re fucked, buddy. You don’t walk into my kingdom and just leave. I don’t like SHARING.",
			"Hey, guys! Look at this dumb fuck. Thinks {pc.he} can just waltz in and take my shit! HAH! Let’s see if you can still breathe after I’m done with you!",
			"Mmmnnghh. My head’s buzzing, my hands are itching, and you look like a fucking punching bag. Lucky you!",
			"YOU WANT TO STEAL MY HIT FROM ME? YOU FUCKER, NO ONE STEALS MY HIT FROM ME!",
		])+"[/say]")
		
		saynn("Looks like you will have to fight {npc.him}..")
		
		addButton("Fight", "Start the fight", "startFight")
	
	if(state == "wonFight"):			
		removeCharacter(npcID)
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You won. With the junkies boss defeated, the lab is yours to inspect.")
		
		saynn("You step over the mess of shattered glass and spilled fluids, eyeing the setup. The place is filthy as fuck.. greasy counters, rusted burners, and beakers filled with ominous, bubbling sludge. Despite how shitty it all looks, there’s some real chemistry going on here.")
		
		saynn("There is a few options avaiable to you. You could take a closer look at this setup and try to understand how these junkies manage to cook up their drugs with such limited resources. Might be useful for upgrading your own lab.")
		
		saynn("Or maybe you could use the equipment yourself. There is already something brewing in here.. and also some notes that you can follow.. so why not finish the job? This will probably result in one of those strange pills..")
		
		saynn("Alternatively, you can play it safe and just create some painkillers or anaphrodisiacs.")
		
		saynn("You can always just smash this lab into pieces and be done with it.")
		
		addButton("Make strange pill", "Use this lab setup to create a strange pill. This one is guaranteed to be one of the ones that you haven't discovered yet (unless you have discovered them all already).", "make_strange_pill")
		addButton("Science points", "Closely examine the lab setup to understand how it functions. This will give you some science points.", "do_science")
		addButton("Painkillers", "Use the lab to create 1 painkillers pill", "make_painkillers")
		addButton("Anaphrodisiac", "Use the lab to create 2 anaphrodisiac pills", "make_anaphrodisiac")
		addButton("Just destroy", "Just destroy the lab and move on", "just_destroy_lab")
	
		if(getFlag("DrugDenModule.Kidlat2Hap", false) && !getFlag("DrugDenModule.Kidlat3Hap", false)):
			var drugDen:DrugDen = GM.main.DrugDenRun
			if(!drugDen.getFlag("hasKidlatUniform", false)):
				var uniformLevel = drugDen.getFlag("kidlatUniformFloor", -1)
				
				if(uniformLevel < 0):
					drugDen.setFlag("kidlatUniformFloor", drugDen.level + 3)
					
					addMessage("One of the half-conscious junkies mentions that Kidlat's uniform might somewhere on Drug Den level "+str(drugDen.getFlag("kidlatUniformFloor", 0)))
				if(uniformLevel == drugDen.level):
					saynn("[b]You notice someone's uniform here.[/b]")
					
					addButton("Uniform", "This looks like Kidlat's uniform!", "take_kidlat_uniform")
	
	if(state == "make_strange_pill"):
		saynn("You haphazardly mix questionable fluids, guided by the provided notes, your gut instinct and a bit of luck. The result is a strange, weird pill. Who knows what it will do, even its color is unsettling. You pocket it, hoping it won’t kill you later. Time to move on.")
		
		addButton("Continue", "Time to leave", "endthescene")
	
	if(state == "do_science"):
		saynn("You take your time analyzing the junkies’ setup.. crude, filthy, but surprisingly effective. There’s something to learn from their recklessness. You note a few interesting things before stepping away, satisfied. No reason to linger.")
		
		addButton("Continue", "Time to leave", "endthescene")
	
	if(state == "make_painkillers"):
		saynn("You sift through the chemicals, carefully isolating what you need. A few shaky minutes later, you’ve managed to synthesize a single, reliable painkiller pill. It’s not much, but it could save your ass later. You move on, ready for whatever’s next.")
		
		addButton("Continue", "Time to leave", "endthescene")
	
	if(state == "make_anaphrodisiac"):
		saynn("You scrape together the right compounds, distilling them into two bitter-looking pills. Good enough to dull the heat if things get.. overwhelming. You stash them away, kick a loose vial aside, and continue your exploration.")
		
		addButton("Continue", "Time to leave", "endthescene")
	
	if(state == "just_destroy_lab"):
		playAnimation(StageScene.Solo, "shove")
		
		saynn("Enough of this filth. You sweep your arm across the counter, shattering glass and sending half-mixed sludge splattering across the walls. A few well-placed stomps wreck the burners. Satisfied, you turn away, leaving only ruins behind as you push forward.")
		
		addButton("Continue", "Time to leave", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "make_strange_pill"):
		processTime(5*60)
		var newPill:ItemBase = GlobalRegistry.createItem("TFPill")
		newPill.makePillStrangeIfCan()
		GM.pc.getInventory().addItem(newPill)
		addMessage("You have created a strange pill")
		GM.main.increaseFlag("DrugDenModule.RaidedLabs")
		
	if(_action == "do_science"):
		processTime(5*60)
		GM.main.SCI.addPoints(20 + 5*int(GM.main.DrugDenRun.getLevel()/3.0) + 5*int(GM.main.DrugDenRun.getLevel()/9.0) + 5*int(GM.main.DrugDenRun.getLevel()/27.0))
		GM.main.increaseFlag("DrugDenModule.RaidedLabs")
		
	if(_action == "make_painkillers"):
		processTime(5*60)
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("painkillers"))
		addMessage("You have created some painkillers")
		GM.main.increaseFlag("DrugDenModule.RaidedLabs")
		
	if(_action == "make_anaphrodisiac"):
		processTime(5*60)
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("AnaphrodisiacPill"))
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("AnaphrodisiacPill"))
		addMessage("You have created some anaphrodisiacs")
		GM.main.increaseFlag("DrugDenModule.RaidedLabs")
		
	if(_action == "take_kidlat_uniform"):
		addMessage("You find a uniform that looks a lot like Kidlat's! Better find her now or you will lose it.")
		GM.main.DrugDenRun.setFlag("hasKidlatUniform", true)
		return
		
	if(_action == "startFight"):
		startFightWithNPC()
		return
	if(encounter_react(_action, _args)):
		return
	
	setState(_action)
