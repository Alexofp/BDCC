extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AnnouncerTalkScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["announcer"])):
		endScene()
		return

func _run():
	if(state == ""):
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})

	if(state == ""):
		saynn("You wait until Ans is free and get his attention.")

		saynn("[say=announcer]Hey there, babe[/say]")

		addButton("Talk", "Ask him some questions", "talk")
		if(getFlag("FightClubModule.AnnouncerAskedAboutShop")):
			addButton("Buy", "Look at this offers", "buymenu")
			addButton("Sell", "See what you can sell", "sellmenu")
		else:
			addButton("Buy", "Maybe he sells something", "askbuy")
		addButton("Leave", "Enough talking", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["announcer"])
		if(!getFlag("FightClubModule.CanBuySlaveCollars")):
			if(getModule("NpcSlaveryModule").canEnslave()):
				addButton("Collars?", "Ask if he knows where you can get a spare collar", "ask_collars")

	if(state == "ask_collars"):
		saynn("[say=pc]You seem like you know your way around here. Do you know where I can get a collar?[/say]")
		
		saynn("He instinctively tugs on his metal one.")
		
		saynn("[say=announcer]Hmm.. As a matter of fact, I do. Out of curiosity, what makes you want a spare one? Neck not heavy enough, babe?[/say]")

		saynn("He scratches his chin while watching you.")
		
		saynn("[say=announcer]Hah, I think I know. And I think I can help you. While clearing this abandoned space out, we found a few crates with old supplies, including one full of collars. Strangely enough, not the same model that everyone here is wearing.[/say]")
		
		saynn("Great. Any collar should work for you. But it's never that easy, is it?")
		
		saynn("[say=announcer]Avy found a way to modify them so they can be locked and unlocked by us, inmates.[/say]")

		saynn("Avy, huh. It's never that easy with her.")
		
		saynn("[say=announcer]You will have to earn her trust first.[/say]")
		
		saynn("[say=pc]And how am I gonna do that?[/say]")
		
		saynn("The lilac points at the 4 chain fences in the middle of the space.")
		
		saynn("[say=announcer]Arena, babe. That's the answer to most things here.[/say]")
		
		saynn("Looks like you will have to beat Avy up on the arena first to get access to those collars..")

		if(getFlag("FightClubModule.AvyGotRekt")):
			addButton("Done!", "Tell him that you did beat up Avy", "unlock_collars")
			addButton("Back", "Never mind", "")
		else:
			addButton("Continue", "See what happens next", "")

	if(state == "unlock_collars"):
		saynn("[say=pc]Avy got wrecked. I am the grand champion now.[/say]")
		
		saynn("The guy chuckles and offers you some claps.")
		
		saynn("[say=announcer]Good job, babe. I knew you could do it.[/say]")
		
		saynn("You nod-nod and wait for your reward.")
		
		saynn("[say=announcer]Avy agreed to give you one. If you want more, you will have to pay with creds for them. Avy said she doesn't want to give her modified versions out for free.[/say]")

		saynn("Of course she doesn't, that bitch. Ans hands you an old metal collar. The design is indeed quite different.. this one somehow looks even more bulky and uncomfortable than your current one. But that might be a good thing..")
		
		saynn("[say=pc]Thank you.[/say]")
		
		saynn("He nods.")
		
		saynn("[say=announcer]Don't mention it, babe. You were fighting great, the crowd loves you.[/say]")
		
		addButton("Continue", "See what happens next", "")

	if(state == "askbuy"):
		setFlag("FightClubModule.AnnouncerAskedAboutShop", true)
		
		saynn("[say=pc]Do you sell anything?[/say]")
		
		saynn("The guy rubs his chin while eyeing you out.")

		saynn("[say=announcer]Perhaps. Looking for something to spice up your love life? I've got just the thing. [/say]")
		
		saynn("You raise a brow.")
		
		saynn("[say=pc]What are we talking about here?[/say]")
		
		saynn("The guy chuckles.")
		
		saynn("[say=announcer]Fetish gear and toys. Things that staff don't want us to have. I got it all, baby.[/say]")

		saynn("[say=pc]I'll have to think about it. How much are we talking?[/say]")
		
		saynn("[say=announcer]Prices vary depending on the item. Why don't you take a look at my inventory and we can go from there?[/say]")
		
		addButton("Inventory", "Take a look", "buymenu")
		addButton("Nah", "You're good", "")

	if(state == "talk"):
		saynn("[say=pc]Just wanted to talk, ask some things.[/say]")

		saynn("The guy leans against his fancy cane.")

		saynn("[say=announcer]Shoot.[/say]")

		addButton("Name", "Why is he called like that", "name")
		addButton("Staff", "Ask what happens if staff finds this place", "staff")
		addButton("Avy", "Ask about Avy", "avy")
		addButton("Back", "Enough questions", "")

	if(state == "name"):
		saynn("[say=pc]Why ‘The Announcer’?[/say]")

		saynn("He chuckles.")

		saynn("[say=announcer]Because of my voice I guess. Others just began calling me like that and I went with the flow.[/say]")

		saynn("[say=pc]Your voice would be perfect for radio.[/say]")

		saynn("He scratches the back of his head and smiles wider.")

		saynn("[say=announcer]Nah, I’m not a radio person, baby. Thanks anyway.[/say]")

		saynn("[say=pc]Who are you then? How did you end up here?[/say]")

		saynn("He looks down at his lilac clothes.")

		saynn("[say=announcer]Thought it was obvious. I’m a pimp, baby. I used to live on the streets, used to look after my girls. On a green ball of dirt called ‘The Earth’. Though right now the more fitting name for it would be ‘The Wasteland’[/say]")

		addButton("Continue", "Ask something else", "talk")

	if(state == "staff"):
		saynn("[say=pc]This place isn’t exactly legal. What will happen if the staff finds it?[/say]")

		saynn("The guy looks around.")

		saynn("[say=announcer]I have very little doubts about them not knowing about my place. I guess they prefer to look the other way? Your guess is as good as mine.[/say]")

		addButton("Continue", "Ask something else", "talk")

	if(state == "avy"):
		saynn("[say=pc]Who is Avy?[/say]")

		saynn("The guy leans on his cane.")

		saynn("[say=announcer]She handles organizing the fights. And she is also the grand champion of the arena. I guess I know how to pick the right person for the job.[/say]")

		saynn("[say=pc]No one has beaten her?[/say]")

		saynn("[say=announcer]Many tried. Some even succeeded. But she always returns, each time stronger than before.[/say]")

		addButton("Continue", "Ask something else", "talk")


func _react(_action: String, _args):
	if(_action in ["talk", "name", "staff", "avy"]):
		processTime(RNG.randi_range(5, 10) * 60)
	
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "buymenu"):
		runScene("AnnouncerBuySellScene", ["buymenu"])
		setState("")
		return

	if(_action == "sellmenu"):
		runScene("AnnouncerBuySellScene", ["sellmenu"])
		setState("")
		return
	
	if(_action == "unlock_collars"):
		processTime(3*60)
		setFlag("FightClubModule.CanBuySlaveCollars", true)
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("oldcollar"))
		addMessage("You got a slave collar!")
		addMessage("You can now buy more slave collars from Ans")

	setState(_action)
