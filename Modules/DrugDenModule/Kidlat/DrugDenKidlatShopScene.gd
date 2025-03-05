extends SceneBase

var isBound = false
var buyLine = ""

func _init():
	sceneID = "DrugDenKidlatShopScene"

func _run():
	if(state == ""):
		isBound = getModule("DrugDenModule").isKidlatBound()
		addCharacter("kidlat", [] if !getModule("DrugDenModule").isKidlatNaked() else ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="kidlat", kidlatBox=true, further=true, npcBodyState={naked=getModule("DrugDenModule").isKidlatNaked()}})
		var customGreet = getModule("DrugDenModule").getKidlatCustomGreeting()
		var drugDenEvent = GM.main.DrugDenRun.getEventInRoom(GM.pc.getLocation())
		var isFirstTimeThisFloor:bool = drugDenEvent.isFirstTimeThisFloor()
		var isFirstTimeThisRun:bool = drugDenEvent.isFirstTimeThisRun()
		var isOutOfItems:bool = drugDenEvent.isOutOfItems()
		var hasBap:bool = drugDenEvent.hasBap
		saynn("You find Kidlat, standing behind her cardboard box.")

		if (buyLine != ""):
			saynn("[say=kidlat]"+str(buyLine if !isBound else "I hope you didn't just take it without paying.. This kitty kinda needs the creds.")+"[/say]")

			buyLine = ""
		elif (customGreet != ""):
			saynn("[say=kidlat]"+str(customGreet)+"[/say]")

		elif (isOutOfItems):
			saynn("[say=kidlat]"+str("You bought everything I have, hun! See you around." if !isBound else "Uh.. I think I don't have anything to sell anymore.. Find me again later!")+"[/say]")

		elif (isFirstTimeThisRun || isFirstTimeThisFloor):
			saynn("[say=kidlat]"+str("Hey, luv. Wanna trade?" if !isBound else "Oh, hey.. Welcome to my shop, don't mind how I look..")+"[/say]")

		else:
			saynn("[say=kidlat]"+str("Welcome back, hun." if !isBound else "Welcome back.. I think?")+"[/say]")

		saynn("Here is what she is selling:")

		saynn(""+str(drugDenEvent.getItemsListText())+"")

		addButton("Leave", "Time to go", "endthescene")
		drugDenEvent.addBuyButtons(self)
		drugDenEvent.applyVisitFlags()
		if (false):
			addButton("Buy", "Buy something", "buyKidlatItem")
		if (hasBap && !isBound):
			addButton("Loaf of bread", "Cost: ? credits\n\nA tasty-looking loaf of bread", "get_bapped")
		if (getFlag("DrugDenModule.Kidlat3Hap", false) && !isBound):
			addButton("Chat", "Ask her a few things", "chat_menu")
		if (isBound && !drugDenEvent.isOutOfItems()):
			addButton("Steal", "Take what she is selling for free", "do_sell")
		if (isBound):
			if (!drugDenEvent.wasKidlatGroped()):
				addButton("Grope", "Grope the helpless shopkeeper", "do_grope")
				if (GM.pc.getInventory().getAmountOf("restraintkey") >= 2):
					addButton("Unlock restraints", "Kidlat has 2 pairs of cuffs on her so you will need to use 2 restraint keys to unlock her!", "do_unlock_restraints")
				else:
					addDisabledButton("Unlock restraints", "(Not enough restraint keys) Kidlat has 2 pairs of cuffs on her so you will need to use 2 restraint keys to unlock her!")
			else:
				addDisabledButton("Grope", "You already groped her, give the poor kitty some rest")
				addDisabledButton("Unlock restraints", "Groping her and then immediately saving her would be kinda suspicious..")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["kidlatShop"])
	if(state == "just_unlock_this_time"):
		saynn("You use the restraint keys to unlock the poor Kidlat.")

		saynn("[say=kidlat]Oh, hey luv. Thank you! You saved me trying to get out of these cuffs again.. And for this..[/say]")

		saynn("She runs to one of the corners and pries a panel off.. before pulling a few items out.")

		saynn("[say=kidlat]I can offer you a restock of my wares![/say]")

		saynn("Kidlat neatly places her new wares in her cardboard box.")

		addButton("Continue", "See what happens next", "")
	if(state == "get_bapped"):
		saynn("You notice something unusual among the items that Kidlat is selling.. There is a loaf of bread, just sitting casually in her cardboard box. It looks tasty.. much tastier than the normal slop that you eat.. There doesn't seem to be a price attached to it.. so it must be free?")

		saynn("You reach to grab it.. but before your fingers even graze the squishy crust, Kidlat's paw shoots out, swatting your hand with lighting speed!")

		saynn("[say=kidlat]No, mine![/say]")

		saynn("Huh?")

		saynn("[say=pc]It's not for sale? Why do you keep it?[/say]")

		saynn("[say=kidlat]None of your business, luv! This is my emotional support bread.[/say]")

		saynn("Fair enough.. You raise your hands, surrendering.")

		saynn("[say=kidlat]Wise choice~.[/say]")

		addButton("Continue", "Oh well", "")
	if(state == "chat_menu"):
		saynn("What do you wanna ask Kidlat?")

		addButton("Crimes", "Ask her what she did to end up here in this prison", "ask_crimes")
		addButton("Drug den", "Ask her why she lives here", "ask_drugden")
		if (getFlag("DrugDenModule.Kidlat5Hap")):
			addButton("Credits", "Ask her about credits", "ask_credits")
		else:
			addDisabledButton("Credits", "She doesn't trust you enough")
		addButton("Back", "Go back to the previous menu", "")
	if(state == "ask_crimes"):
		saynn("You lean against the nearest wall, showing that you're not buying stuff anymore. Kidlat closes her cardboard box and looks at you with her waiting eyes.")

		saynn("[say=kidlat]I'm not gonna show you where I stash my box, luv![/say]")

		saynn("[say=pc]That's okay. I just wanted to ask something.[/say]")

		saynn("Her ears perk.. and for a moment.. she just stares at you.")

		saynn("[say=kidlat]Oh, aye? Sure, what's on your mind?[/say]")

		saynn("[say=pc]What did you do to end up here?[/say]")

		saynn("She looks around.")

		saynn("[say=kidlat]Nothing? I just stumbled upon these tunnels one day.. And thought that they're kinda cool.[/say]")

		saynn("Cool? Very debatable.. but that's not what you asked.")

		saynn("[say=pc]No, I mean.. What did you do to end up here, in this prison? Why are you wearing a lilac uniform?[/say]")

		saynn("Her fluffy tail flicks behind her, indecisively. She then huffs a small laugh and leans back against the wall, mimicking your posture.")

		saynn("[say=kidlat]It's a long and boring story. Boring just like me. Ain't ya got better things to do?[/say]")

		saynn("[say=pc]I can spare some time. Tell me, I'm very curious.[/say]")

		saynn("There is a long pause before she finally speaks again.")

		saynn("[say=kidlat]Well, let's just say I helped an ex-mate yoink a truck. Big payday, right? Should've been full of fancy gadgets.. laptops, datapads, all that overpriced crap.[/say]")

		saynn("Interesting. Makes you wonder why she is wearing lilac colors rather than orange..")

		saynn("[say=kidlat]Snoozin' already? I can stop, luv.[/say]")

		saynn("[say=pc]No, keep going, please.[/say]")

		saynn("She shrugs.")

		saynn("[say=kidlat]It was all goin' well.. until we pulled over and checked the haul. Whole bloody thing was stuffed with sex toys.[/say]")

		saynn("You try to.. stifle a laugh.. unsuccessfully. Kidlat smirks.. but her eyes darken a little.")

		saynn("[say=kidlat]Yeah, feel free to laugh, luv.[/say]")

		saynn("[say=pc]I mean, sex toys are expensive too.[/say]")

		saynn("[say=kidlat]Maybe? But they're a pain to push.. Uh.. to sell I mean. 'Course, we weren't exactly thinkin' straight back then. And then we heard a siren.[/say]")

		saynn("She crosses her arms, tail flicking sharply against the ground.")

		saynn("[say=kidlat]My so-called mate decided to lock me up with all that 'inventory' and scattered. And you probably know the rest. Cops bagged me.. the prison slapped me with a collar and this uniform.. And now I get to be a slut, yay me.[/say]")

		saynn("[say=pc]That's rough. Why did they betray you like that?[/say]")

		saynn("Kidlat shrugs it off.")

		saynn("[say=kidlat]No honour among thieves. And I'm a rubbish thief. An even worse person. Surprised we got as far as we did.[/say]")

		saynn("She chuckles.")

		saynn("[say=pc]You're not a bad person.[/say]")

		saynn("Her fold back slightly, her eyes skeptical.")

		saynn("[say=kidlat]Don't be soft on me now. There ain't no good people down here, luv.[/say]")

		saynn("A short moment of silence..")

		saynn("[say=kidlat]Except for you, maybe. Still not sure why you decided to help this dumb blue cat-shaped thing.[/say]")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_drugden"):
		saynn("[say=pc]Might I ask something?[/say]")

		saynn("Her ears perk, twitching slightly.")

		saynn("[say=kidlat]Ye, go ahead.[/say]")

		saynn("[say=pc]You seem to know your way around these tunnels.[/say]")

		saynn("She grins, flashing a little fang.")

		saynn("[say=kidlat]Yep! I don't live here if you're curious. I still have a cell and stuff. I just spend my free time here.[/say]")

		saynn("That makes her very different from the junkies. They all have lost their minds by now.. only caring about getting their next fix.")

		saynn("[say=pc]Okay. But what draws you here?[/say]")

		saynn("She shrugs, leaning against the wall with her arms folded loosely.")

		saynn("[say=kidlat]I get to earn credits.[/say]")

		saynn("[say=pc]You can earn credits up there.[/say]")

		saynn("[say=kidlat]By bashin' rocks all day? Gets old quick.[/say]")

		saynn("She is right on that one.")

		saynn("[say=pc]There are other ways.[/say]")

		saynn("[say=kidlat]Heh, I know what you mean. I feel like I'd make for a bad slut.[/say]")

		saynn("[say=pc]I didn't say that you should be a slut. There are many ways.[/say]")

		saynn("She smiles and sways her girly hips from one side to another, her paws teasingly cupping her breasts as they slide along the contours of her belly. You get a feeling that she'd be a pretty good slut.. if she wanted to that is.")

		saynn("[say=kidlat]Heh, you're precious, you know that?[/say]")

		saynn("[say=pc]And you're a brat.[/say]")

		saynn("She sticks her tongue out at you.")

		saynn("[say=kidlat]Bratty brat~.[/say]")

		saynn("A silence ensures.. an aura of unanswered questions nagging the feline.")

		saynn("[say=kidlat]I don't know.. I just feel like I belong down here. I just fit. I hope that answers your question.[/say]")

		saynn("Answers some of it.")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_credits"):
		playAnimation(StageScene.Cuddling, "idle", {npc="kidlat"})
		saynn("[say=pc]Can I ask you something?[/say]")

		saynn("[say=kidlat]Sure, luv. But can I ask you something back first?[/say]")

		saynn("That's unusual.")

		saynn("[say=pc]Go ahead.[/say]")

		saynn("[say=kidlat]Do you wanna.. cuddle for a bit?..[/say]")

		saynn("Interesting proposition. It doesn't hurt to cuddle..")

		saynn("[say=pc]Alright.[/say]")

		saynn("You find the least grossest place nearby and plop your butts onto the floor. Even though the surface is cold, a warm embrace helps..")

		saynn("[say=kidlat]What's your question, luv?[/say]")

		saynn("[say=pc]You're doing this for credits? You know, selling stuff.[/say]")

		saynn("She thinks for a bit and then sighs.")

		saynn("[say=kidlat]Credits make the world go 'round. I don't think I'm very greedy.. but we all have to be, don't you think?[/say]")

		saynn("That's one way to look at things.")

		saynn("[say=kidlat]You literally can't live without credits. But also.. the more wealth you have, the more friends you have.. and also more ways to get away from bad thoughts. I don't wanna be greedy.. but that's just how life works.[/say]")

		saynn("You can just feel the charred parts of her heart through her words.")

		saynn("[say=pc]You don't seem greedy to me.[/say]")

		saynn("She smiles and nuzzles you with her cheek.")

		saynn("[say=kidlat]Hah, thanks. I keep bringing the mood down, I'm sorry hun.[/say]")

		saynn("[say=pc]You're fine. Your mood corresponds to the overall mood of this place pretty well. These walls put pressure on me too.[/say]")

		saynn("She nods and goes back to thinking.")

		saynn("[say=kidlat]What I noticed is.. as soon as you stop providing value for your friends, they will be gone. The whole thing is.. transactional, really.. For example, you will forget me in an instant as soon as I stop selling things.. My dumb ramblings are probably putting you off too..[/say]")

		saynn("That's a bold statement.")

		saynn("[say=pc]They're not dumb. Why do you think I will forget you?[/say]")

		saynn("Her ear lower, her cheeks blushing with cyan.")

		saynn("[say=kidlat]I shouldn't have said that.. You've been different from my other friends.. ex-friends. Actually.. you're awesome, luv, I don't know how to repay you back for everything that you did.[/say]")

		saynn("[say=pc]Don't worry about it.[/say]")

		saynn("You pull her closer and gently caress her sides. Your ears pick up on her purring.")

		saynn("[say=kidlat]I will worry all I want~.[/say]")

		saynn("She turns her head and mlems your nose.")

		saynn("[say=kidlat]But yeah, don't feel bad if you forget me.. I'm used to it.[/say]")

		saynn("[say=pc]Kidlat..[/say]")

		saynn("[say=kidlat]Sorry-y-y.[/say]")

		saynn("She smiles and nuzzles your cheek again.")

		saynn("[say=kidlat]So, the answer is.. Credits themselves don't help much.. but what I do with them does ease life a bit. I hope that makes sense.[/say]")

		saynn("Makes you wonder what she does with the credits.. But it's probably enough cuddling for now.")

		saynn("You help her to get up and return back to it.")

		saynn("[say=kidlat]That was a good transaction, heh~.[/say]")

		saynn("That it was.")

		addButton("Continue", "See what happens next", "chat_menu")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "buyKidlatItem"):
		var drugDenEvent = GM.main.DrugDenRun.getEventInRoom(GM.pc.getLocation())
		buyLine = drugDenEvent.doBuyItem(_args[0])
		return

	if(_action == "get_bapped"):
		setFlag("DrugDenModule.KidlatBap", true)
		var drugDenEvent = GM.main.DrugDenRun.getEventInRoom(GM.pc.getLocation())
		drugDenEvent.hasBap = false

	if(_action == "do_sell"):
		var drugDenEvent = GM.main.DrugDenRun.getEventInRoom(GM.pc.getLocation())
		buyLine = drugDenEvent.doStealAll()
		return

	if(_action == "do_grope"):
		var drugDenEvent = GM.main.DrugDenRun.getEventInRoom(GM.pc.getLocation())
		runScene("DrugDenKidlatBoundGropeScene")
		drugDenEvent.wasGroped = true
		return

	if(_action == "do_unlock_restraints"):
		GM.pc.getInventory().removeXOfOrDestroy("restraintkey", 2)
		setFlag("DrugDenModule.KidlatLockedUpRandomly", false)
		if(!getFlag("DrugDenModule.Kidlat5Hap", false)):
			setFlag("DrugDenModule.Kidlat5Hap", true)
			getCharacter("kidlat").resetEquipment()
			runScene("DrugDenKidlat5Scene")
			endScene()
		else:
			getCharacter("kidlat").resetEquipment()
			getModule("DrugDenModule").regenerateKidlatItems()
			setState("just_unlock_this_time")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["isBound"] = isBound
	data["buyLine"] = buyLine

	return data

func loadData(data):
	.loadData(data)

	isBound = SAVE.loadVar(data, "isBound", false)
	buyLine = SAVE.loadVar(data, "buyLine", "")
