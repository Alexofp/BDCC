extends SceneBase

func _init():
	sceneID = "VionSolvesRush"

func _run():
	if(state == ""):
		addCharacter("vion")
		addCharacter("rush")
		playAnimation(StageScene.Duo, "stand", {npc="vion"})
		
		saynn("Thankfully, the sight of Rush's beaten body is enough of a deterrent that no one bothers you as you laboriously drag him out one cellblock and into another. His weight alone gives you enough trouble, especially once you reach the stairs, but after a bit of time you reach Vion's cell.")
		saynn("[say=vion]What is this!? What did you do?[/say]")
		saynn("[say=pc]I was thinking you're in need of a permanent solution. Help me get him inside.[/say]")
		saynn("Vion's eyes dart around, but seeing no immediate threat he sighs and helps you drag Rush in and seat his unconcious form on the sofa.")
		saynn("[say=vion]What do you expect me to do? I'm not about to shiv him in his sleep if that's what you're thinking![/say]")
		saynn("[say=pc]No, obviously. But maybe you could, you know...[/say]")
		saynn("Vion stares at you, flabbergasted.")
		saynn("[say=vion]Did you miss the part where that requires a willing subject, nevermind the ethical boundaries I'd rather not be crossing?[/say]")
		saynn("[say=pc]That's the thing though. There's something about his behaviour that isn't quite what you'd expect, right? I'm sure you've noticed too.[/say]")
		saynn("[say=vion]Well, I mean- Yes, but I'd really rather not be taking a chance on flawed observations![/say]")
		saynn("You smirk in response.")
		saynn("[say=pc]Well, a bit too late for that now. Work your magic, therapist.[/say]")

		addButton("Get ready", "Prepare", "observe")
		
	if(state == "observe"):
		playAnimation(StageScene.Duo, "sit", {pc="rush", npc="vion", npcAction="stand"})

		saynn("By the time Rush wakes up, Vion is standing over him, his dramatic looming skills on full display, and you've taken up position behind him, ready to hold him down should he struggle.")
		saynn("[say=rush]Wh'... Wha' happened? Where am I?[/say]")
		saynn("[say=vion]Hello, Rush.[/say]")
		saynn("[say=rush]...Four-eyes.[/say]")
		saynn("[say=vion]My friend here insisted that we spend some time together.[/say]")
		saynn("Rush smirks and relaxes just a fraction.")
		saynn("[say=rush]Hah, if ya wanted t' finally put out ya could 'ave just said so.[/say]")
		saynn("[say=vion]Oh, nothing like that, I'm sorry to say. Infact, since I find your advances rather bothersome, I think it's high time I ensure you don't cause me trouble ever again.[/say]")
		saynn("Rush tenses up and shifts in his bonds, testing their strength.")
		saynn("[say=rush]Ya think ya scare me, four-eyes? Wha' ya gonna do, stare me t' death?[/say]")
		saynn("[say=vion]Oh, nothing so crude.[/say]")
		
		addButton("Observe", "", "observe_2")

	if(state == "observe_2"):
		playAnimation(StageScene.Duo, "sit", {pc="rush", npc="vion", npcAction="stand"})
		
		saynn("[say=vion]Here's the thing, Rush. I can't help but wonder, why is it you focus on me exclusively? If you just wanted to tap an ass, there's plenty of willing sluts around. If you were in it for the credits, you'd be extorting more people, not just me. And if you [i]actually[/i] wanted someone who's [i]not[/i] interested, a few paltry credits a week would not have dissuaded you.[/say]")
		saynn("[say=rush]What, a guy can't have a type? Ya ain't givin' that butt o' yours enough credit![/say]")
		saynn("Vion frowns.")
		saynn("[say=vion]I'd be flattered, but that's not it, is it? Want to know what I think?[/say]")
		saynn("[say=rush]Tha' your fancy degree talkin'? Go on then, four-eyes.[/say]")
		saynn("[say=vion]I think you've spent your entire life being the most dangerous person in the room. No matter how polite or soft spoken you might try to be, everyone you talk to knows in the back of their mind that you could snap them in half without breaking a sweat. I think that on some level that you're not even aware of, you want to know what it's like for someone be not afraid of you at all.[/say]")
		saynn("[say=rush]Tha's nonsense. Ya' got a screw or two loose in tha' noggin, four-eyes.[/say]")
		saynn("Vion leans in closer. Rush leans back, unnerved.")
		saynn("[say=vion]Really, Rush? Then tell me, why haven't you broken those cuffs yet? We both know it'd take you one good flex...[/say]")
		saynn("[say=rush]Wha'? I... jus' wanted t' know where this is goin', is all![/say]")
		saynn("Rush plants his feet and tries to stand up.")

		addButton("Hold him", "Hold your horses", "hold_him")

	if(state == "hold_him"):
		playAnimation(StageScene.Duo, "sit", {pc="rush", npc="vion", npcAction="stand"})

		saynn("You place your hands on his shoulders, forcing him back down.")
		saynn("[say=rush]Lemme go, before I do somethin' ya gonna regret![/say]")
		saynn("[say=vion]Something we regret, Rush? Or something [i]you[/i]'d regret? I always wondered why you never mingled with that fight club, but now I get it - you don't much like what you become when you are angry, do you?[/say]")
		saynn("Rush snorts, furrowing his brow.")
		saynn("[say=rush]Fuck off, four-eyes. Ya don't know me.[/say]")
		saynn("Vion glances at you, and you get ready.")
		saynn("[say=vion]I think I hit a nerve. Let's start there then, shall we? Rule one, you will refer to me by name.[/say]")
		saynn("[say=rush]Wha'? Th' fuck do ya think-[/say]")

		addButton("Gag him", "It's no bridle, but it will do", "gag_him")

	if(state == "gag_him"):
		playAnimation(StageScene.Duo, "sit", {pc="rush", npc="vion", npcAction="stand"})

		saynn("You force a ballgag between his teeth, strapping it down tightly while he sputters in surprise.")
		saynn("[say=rush]Ya gotta be fuckin' kiddin' me! Get this off me![/say]")
		saynn("[say=vion]No. Not until I'm convinced you can hold a respectful conversation.[/say]")
		saynn("Rush begins trashing, trying to slip out of your grip. There must have been some truth to Vion's analysis, though - you can tell he's not trying nearly as hard as he could be, and you easily manage to keep him from slipping free.")
		saynn("[say=vion]Behave, Rush. Look at me.[/say]")
		saynn("[say=rush]Get yeh' hands off me! Ya gonna regret this, y'hear! Ya went me to crush yeh' into paste?[/say]")
		saynn("[say=vion][b]Look at me.[/b][/say]")
		saynn("Rush's eyes involuntarily lock onto Vion's. His struggles weaken a fraction.")
		
		addButton("...", "", "timeskip")
		
	if(state == "timeskip"):
		playAnimation(StageScene.Duo, "stand", {pc="rush", npc="vion", npcAction="stand"})
		
		saynn("It goes on like that for some time. Gradually, Rush's struggling weakens, then ceases. His protestations reduce to grumbling, then mumbling, then silence.")
		saynn("Unrelenting, Vion continues directing quiet assurances and commands at Rush. Rush begins to nod when commanded. You take your hands off his shoulders, but he does not stir.")
		saynn("Once you're certain of his cooperation, you remove the gag and the cuffs.")
		saynn("[say=vion]Now one last thing. You will come here, every other day at the least, so I may refresh you on your role henceforth. Understand?[/say]")
		saynn("[say=rush]Yes, Vion.[/say]")
		saynn("[say=vion]Good boy.[/say]")
		saynn("He pats Rush on the head.")
		saynn("[say=vion]Now get up. Go talk to a nurse about those bruises.[/say]")
		saynn("You watch as Rush struggles to his feet and heads off in the direction of the elevator.")
		
		addButton("Speak to Vion", "Seems things worked out", "finalize")
		
	if(state == "finalize"):
		playAnimation(StageScene.Duo, "stand", {pc="pc", npc="vion", npcAction="stand"})
		saynn("Vion sighs, exhaling a breath he's been holding for a long time.")
		saynn("[say=vion]That could have gotten ugly.[/say]")
		saynn("[say=pc]But it didn't. That should take care of things, right?[/say]")
		saynn("He pauses to consider that.")
		saynn("[say=vion]Yeah. I think it just might. If nothing else, other inmates will probably think twice causing trouble if somebody like Rush visits my cell every other day.[/say]")
		saynn("You nod.")
		saynn("[say=vion]Thanks, {pc.name}.[/say]")
		
		addButton("Leave", "", "endthescene")

func _react(_action: String, _args):
	var rush = getCharacter("rush")
	if(_action == "observe"):
		rush.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		rush.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))
	
	if(_action == "gag_him"):
		rush.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ballgag"))
	
	if(_action == "timeskip"):
		processTime(60*60)
		rush.removeAllRestraints()
		
	if(_action == "endthescene"):
		setFlag("HypnokinkModule.Vion_HaveDatapad", false)
		setFlag("HypnokinkModule.RushSubdued", true)
		endScene()
		return

	setState(_action)
