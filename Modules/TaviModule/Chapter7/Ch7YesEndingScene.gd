extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var tookRahi = false

func _init():
	sceneID = "Ch7YesEndingScene"

func _run():
	if(state == ""):
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		if (isCorrupt):
			addCharacter("tavi", ["naked"])
		else:
			addCharacter("tavi")
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("Well.. His words do make sense. Finding good people is easy at a glance.. But to find the best out of the best.. requires trials. You are the best.. and you proved it.")

		saynn("What would saying no bring you? Probably nothing good. It's a huge risk. At best.. you will just stay an inmate here. At worst.. you will probably die.")

		saynn("The solution is right there. It's what you wanted. You will be free. You won't have to wear a collar. Tavi would get what she wants too..")

		saynn("[say=pc]Alright. We showed what we can do. Now get those collars off us. Act rather than talk.[/say]")

		saynn("Tavi looks at you and the captain. And then nods.")

		saynn("[say=captain]Wise choice. One person can't change the world. But three people.. become a team. A single entity still. But so much stronger. Come closer.[/say]")

		saynn("The captain reaches for his neck.. and fetches a thumbdrive-like token from it. As you observe it, you notice that it has a blue round symbol.. same one that your collars have.")

		saynn("[say=tavi]You will have to earn the trust of your team though. After what you did to me.[/say]")

		saynn("[say=captain]Of course. Our relationship was a bit rocky.. But I will be loyal if you are.[/say]")

		addButton("Collars", "Let the captain take the collars off", "collars_off")
	if(state == "collars_off"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=isCorrupt}})
		saynn("Sensing no danger, you slowly approach the captain. He seems pretty chill. Even if his other hand is resting not that far from the weapon holster.")

		saynn("After you close the distance, the captain brings the little token to your collar.. until something mechanical inside it unlocks.. allowing you to just take it off.")

		saynn("Wow.. you almost moan from how good this feels. You start rubbing the skin of your neck and shiver from the sensations. That part of your neck didn't feel the air's touch for so long..")

		saynn("Then it's Tavi's turn. She tilts her head slightly and lets the captain press the token against her collar, unlocking it too.")

		saynn("But when Tavi opens it, she also catches a glass vial falling out of it. A vial with a red-colored drug. Seeing it causes the captain to put his free hand on his gun.")

		saynn("[say=captain]What's that?[/say]")

		saynn("[say=tavi]Does it matter?[/say]")

		saynn("He frowns and looks Tavi in the eyes. While she is shivering and rubs her fluffy neck, actually moaning from the sensations.")

		saynn("[say=tavi]Ah~..[/say]")

		saynn("[say=captain]I don't think starting this.. little initiative.. with a lie.. is a good idea. What do you think?[/say]")

		saynn("Tavi presents the vial to the captain. And even gives it to him.")

		saynn("[say=tavi]It was just.. plan B. In case you would try to kill us.. you know? A safety net.[/say]")

		saynn("[say=captain]Huh. What if it didn't work?[/say]")

		saynn("Tavi shrugs.")

		saynn("[say=tavi]I do the best with what I have. So we're not inmates anymore, right?[/say]")

		saynn("Captain rubs his chin.. and then offers his hand.")

		saynn("[say=captain]I can't officially release you. Since.. you know. But I think no one will bat an eye if two inmates suddenly go missing in the mines. Deal?[/say]")

		saynn("Tavi chuckles and shakes just his two top digits.")

		saynn("[say=tavi]Sure, cap. Couldn't care less about the logistics of how you're gonna get us out.[/say]")

		saynn("Now it's your turn.")

		addButton("Shake hands", "Shake hands with the captain", "shake_hands")
	if(state == "shake_hands"):
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("And so you and the captain shake hands.")

		saynn("[say=captain]Don't have to call me captain anymore. Name is Corwin.[/say]")

		saynn("[say=tavi]Corwin Wright, huh. Can I get that sphere now?[/say]")

		saynn("Corwin shakes his head softly.")

		saynn("[say=captain]You will always be able to talk with her, even on missions. But it will stay with me.[/say]")

		saynn("Hah. He obviously needs some way to make sure you don't just run away with your freedom.")

		saynn("[say=captain]For now.. enjoy this.[/say]")

		saynn("He presses something on that sphere.. and its aperture opens.. a bright light shines onto the floor.. as Elena starts to materialize..")

		addButton("Continue", "See what happens next", "tavi_meets_elena")
	if(state == "tavi_meets_elena"):
		addCharacter("elena")
		playAnimation(StageScene.Hug, "hug", {pc="tavi", npc="elena", bodyState={naked=isCorrupt}})
		saynn("Elena assumes a pose of an obedient maid, her gaze lowered, her hands together at her waist level.")

		saynn("Tavi silently watches her.. and then decides to go for a warm hug.")

		saynn("[say=elena]Hello.. Tavi..[/say]")

		saynn("[say=tavi]Hi.. mother.[/say]")

		saynn("[say=elena]But.. I'm not exactly..[/say]")

		saynn("Tavi cuts her off and only hugs her tighter.")

		saynn("[say=tavi]I don't care..[/say]")

		saynn("Elena sighs.. and hugs Tavi back. Hologram tears stream down her cheeks.")

		saynn("[b]THE END.[/b]")

		saynn("[b]Spy Ending.[/b]")

		addButton("Continue..", "See what happens to everyone..", "start_epilogues")
	if(state == "start_epilogues"):
		playAnimation(StageScene.Solo, "stand", {pc="captain"})
		saynn("And so.. the two brave inmates decided to join efforts with the captain, getting their freedom back in exchange for their skills and experience. Not a bad trade as it turned out.. you just gotta look at it as.. investment for the future.")

		saynn("Nothing really changed about BDCC at first. Prison life continued as normal. Captain was right, no one really cared that two inmates suddenly went missing. Only a few select people know what actually happened to you. And the captain had all of the tools required to make sure this little secret wouldn't be uncovered..")

		saynn("The more missions you were doing for the captain, the more you were getting used to this new lifestyle.. and the more his power was growing. He was climbing ranks quickly, making connections and friends. All the while all his enemies would all suffer from setbacks and failures. There was always some dirt to dig up on someone.. Always.")

		saynn("BDCC was growing fast. It was still producing new people required to fight the on-going wars.. But now the captain was also able to start growing his own little personal army.")

		saynn("Captain was loyal to AlphaCorp.. And so little dark facts about him that kept surfacing.. were going off unnoticed. How can a man of such caliber be ever wrong? Why would we punish him for his past deeds? What matters is how much value he provides to the cause. And even then.. some people shared the guy's beliefs.. They liked what he was doing.")

		saynn("When AlphaCorp realized what was actually happening.. It was already too late. You and Tavi began assassinating all the high-ranking officers, including the commanders of the currently operating forces.")

		saynn("AlphaCorp was big.. very big.. but even it couldn't afford to open a second front. Captain knew where to push.. And so the corporation got brought to its knees fast when its Director.. suddenly went missing.")

		saynn("From that point on.. Director Wright got all the power he ever wanted. He didn't forget about what got him there, indeed giving you and Tavi everything you would ever want. And so you were gonna make sure no one takes his power away from him..")

		addButton("Nova", "See what happens to Nova", "ep_nova")
	if(state == "ep_nova"):
		playAnimation(StageScene.Solo, "stand", {pc="nova"})
		saynn("Nova was the only other staff member who even knew that you and Tavi were alive. The captain knew she wouldn't tell anyone.. The benefits were far outweighing any drawbacks.")

		saynn("And so, Nova just stayed a guard at BDCC. Nothing really changed for her. Apart from the occasional visits by Tavi, her life stayed quite boring.")

		saynn("But Nova always had ambitions.. She always wanted to become bigger than her parents. And, when the captain became the director of the whole AlphaCorp, some of her dreams actually became a reality. Nova suddenly found herself a director too.. even if it was a small company that was just growing food. Nova decided to rename it to Dawfort Inc and try to expand it.")

		addButton("Risha", "See what happens to Risha", "ep_risha")
	if(state == "ep_risha"):
		playAnimation(StageScene.Solo, "stand", {pc="risha"})
		saynn("Risha was destroyed when she found out that Tavi went missing. Deep inside she hoped that her sister just escaped somehow. But no one knew anything when asked.. not even Nova.")

		saynn("She felt like.. she lost something. Risha was primarily driven by her incredible libido. But fucking inmates.. it got old real quick after that.")

		saynn("Risha was actually the one who started to carefully leak the captain's secrets when she saw what his end goal was. She kinda felt.. like she had to.. after all the years of serving him. It wasn't enough though..")

		saynn("She declined the offer to join the captain's personal army.. And just stayed a guard at BDCC.")

		addButton("Skar", "See what happened to Skar..", "ep_skar")
	if(state == "ep_skar"):
		playAnimation(StageScene.Solo, "stand", {pc="skar"})
		saynn("When you and Tavi went missing.. Skar finally got what he wanted. A quiet peaceful life. His job was easy, stopping conflicts between inmates is what he enjoyed. Having to think about his actions.. not so much.")

		saynn("He got the stability that he wanted.. and suddenly realized that he doesn't know what to do with it. His dream.. was achieved. He thought that would make him happy. And yet.. it didn't.. not for long.")

		saynn("So, when given a chance to join the captain's private army.. he signed up instantly.")

		saynn("Did he care that he was gonna have to fight his own people? Yeah. But there is always a way to justify something. It's all just a matter of.. picking the right perspective. And Skar was fine with the picture that he was seeing.")

		addButton("Alex & Eliza", "See what happens with them", "ep_alex_eliza")
	if(state == "ep_alex_eliza"):
		playAnimation(StageScene.Duo, "stand", {pc="alexrynard", npc="eliza"})
		saynn("The captain knew how much potential there is in Alex and Eliza. He was purposefully holding them back, limiting them, creating impossible roadblocks.. but they just kept finding their way around.")

		saynn("The captain was doing this for a very specific reason. When the time became right, they suddenly got the resources and extra knowledge that they needed.")

		saynn("Alex was of course banned from creating any androids.. but instead he was tasked with creating new weaponry.. new kinds of armor.. exosuits.. He began finding uses for bluespace that no one ever thought about. The guy was truly happy when his first spaceship left its docks.")

		saynn("All the while Eliza got a go-ahead to create the best possible drugs that would give the captain's soldiers just the edge that they needed. Painkillers, muscle and reflex stimulants, quick wound fixers. She also found a way to improve a soldier's performance with some hypnotism.. switching their focus to what truly matters during a war.")

		saynn("They never really got to work together on something. Alex and Eliza were from completely different fields. Only makes you wonder what would happen if biology and mechanical engineering was somehow.. combined.")

		saynn("If you and Tavi were the captain's hands.. Alex and Eliza were his legs. Legs without which he would never jump so high.")

		tookRahi = getFlag("RahiModule.rahiMile8Happened")
		if (tookRahi):
			addButton("Rahi", "See what happened with Rahi", "ep_rahi")
		else:
			addButton("Jaxon", "See what happened with Jaxon", "ep_jaxon")
	if(state == "ep_rahi"):
		playAnimation(StageScene.Solo, "stand", {pc="rahi"})
		saynn("The captain knew how much morale matters.. And so, eventually, he allowed you to see Rahi between your missions. Of course she was happy to know that you're okay. But she also began wondering what you do now. And lying about that.. just doesn't feel right.")

		saynn("Rahi began.. asking if she can join you and Tavi. Not because you're doing something good.. but because she wanted to be with you. And so, eventually, the captain has caved in, allowing you to take Rahi on missions when it made sense. The only condition was that she still had to wear a collar.")

		saynn("Her skills.. were actually quite invaluable. Tavi was good at hacking machines and forcing people.. But Rahi's ability to sneak in anywhere and steal anything.. made her fit in perfectly. All the while you were the mastermind of every operation.")

		saynn("The duo became a trio.. and everyone was happy.")

		addButton("Jaxon", "See what happened with Jaxon", "ep_jaxon")
	if(state == "ep_jaxon"):
		if (!getFlag("TaviModule.TaviKilledJaxon")):
			playAnimation(StageScene.Solo, "stand", {pc="jaxontau"})
			saynn("Jaxon returned to his family.. family who was very happy to see him alive after what happened to the Exodus research space station.")

			saynn("But Jaxon wasn't happy. He kept trying to track Tavi down, seeking revenge for his brother. Or at least.. some kind of conclusion. Something.. rather than nothing..")

			saynn("After years of pointless searching.. He finally gave up.. That day is when he saw a new email in his inbox. He opened it..")

			saynn("[say=tavi]Hey. It's.. someone. Lots of time has passed, hasn't it? I don't know if you're looking for me. But in case you do.. I suggest you don't. Why? Well, I'm not the same me that I used to be. Old me is gone. And now I'm surrounded by some powerful people.. Just asking for me might get you in big trouble.[/say]")

			saynn("[say=tavi]Sorry I had to make it somewhat cryptic. But I know you will recognize me.. It's funny, isn't it.. how the world works. Sometimes you become what you seek to destroy.. But I'm happy. I truly am. And that is all that matters I think. Hope you found happiness too. I gotta go now.[/say]")

			saynn("Jaxon sighs.. and deletes it.")

		else:
			playAnimation(StageScene.Solo, "stand", {pc="tavi"})
			saynn("Jaxon's wife, Jill, felt destroyed when she found out what happened to him. She decided not to tell the kids and instead only carried the full grief herself.")

			saynn("She knew that it's a dangerous job.. But he convinced her.. Because of the credits that it would bring.. credits that would give their kids a chance at a good future.")

			saynn("Sadly the credits that she was now earning alone weren't enough. Years were passing.. She did her best to pay for her kids' education.. But she was in the negatives all the time.")

			saynn("Tavi knew about that.. it was the first that she checked when she was given the possibility. But, sadly, she wasn't allowed to intervene in any way.. that would be too dangerous. So all Tavi was able to do.. is watch.")

		addButton("You", "What happens to you..", "ep_you")
	if(state == "ep_you"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=isCorrupt}})
		saynn("And here you are. {pc.name} and Tavi. The perfect spies. And not just spies.. you were so much more than that.")

		saynn("Your first missions were simple. Steal this, hack that. But your abilities were improving fast. And soon enough, you were blackmailing the heads of AlphaCorp, setting people against each other and even using Syndicate to achieve your goals. Everything and everyone was a tool for you. It was fun.")

		saynn("Did you feel bad for what you were doing? Nah, they were all bad people. Otherwise you wouldn't be able to blackmail them to begin with. You and the director weren't perfect yourself, you knew that. But an honest man is never gonna win against someone who isn't playing fair.")

		saynn("And of course, the captain was rewarding you plenty for your hard work. Tavi was able to visit Nova and Elena occasionally while you.. enjoyed your freedom.. constrained freedom.. but still freedom nonetheless.")

		saynn("You would think that when the captain finally became the director of AlphaCorp.. that he would let you go. But there was always someone who needed to be dealt with. Some head that the captain has stepped on in the past. Some threat.. As long as we exist, we will always be in conflict with each other.")

		saynn("What did Corwin do when he finally won? He started to control everything. Laws were strict. The punishments were harsh. But he managed to unite every planet against the global threat that is Syndicate.. and he won. And that was his biggest mistake.")

		saynn("Without a threat that everyone agreed on.. people started to feel safe. And when you feel safe.. you begin to ask for more. Better medicine, better education, better work conditions. Better education leads to smarter people. Smart people that begin to want more freedom. Freedom to express themselves. Freedom to enjoy what they want.")

		saynn("Corwin tried to make smart people a threat. But that only made people see him as a threat instead. And, due to an incredible amount of corruption, his little kingdom began to fall apart. While the Syndicate.. never really went away.")

		addButton("Continue", "See what happens next", "ep_end")
	if(state == "ep_end"):
		playAnimation(StageScene.Duo, "sit", {npc="tavi", npcBodyState={naked=isCorrupt}})
		saynn("On your way back from your last mission..")

		saynn("[say=tavi]What are you thinking about?[/say]")

		saynn("[say=pc]Nothing. Just dreaming.[/say]")

		saynn("Tavi ponders.")

		saynn("[say=tavi]About what?[/say]")

		saynn("[say=pc]About what we could have been.[/say]")

		saynn("[say=tavi]..it's never too late to change course.[/say]")

		saynn("[say=pc]We have so much blood on our hands. I think it is too late.[/say]")

		saynn("Tavi giggles.")

		saynn("[say=tavi]No it's not. All you need is a little push.[/say]")

		saynn("Suddenly, the bluespace communicator explodes with voice messages. Tavi plays the first one.")

		saynn("[say=captain]All AlphaCorp ships, Corwin Wright is speaking. Return to the main base immediately. We are under attack from an unknown enemy. They're strong. I repeat, I need every ship here NOW.[/say]")

		saynn("[say=tavi]Wow. The guy is in trouble it seems.[/say]")

		saynn("Tavi plays the second message.")

		saynn("[say=risha]Hey. Any AlphaCorp ship who hears this..[/say]")

		saynn("[say=tavi]Risha?..[/say]")

		saynn("[say=risha]We are under attack. Someone is attacking us. We're just a prison space station, we can only hold them off for a few hours at most. I can't share the coordinates.. I don't know them. Just the name. BDCC.[/say]")

		saynn("The message ends there. There are many more like it. And more arriving every minute.")

		saynn("[say=pc]Syndicate uprising?[/say]")

		saynn("[say=tavi]Must be. Where are we gonna warp?[/say]")

		saynn("[say=pc]I think I know where. And you do too.[/say]")

		saynn("Tavi smiles.")

		saynn("[say=tavi]Let's do it~. Dream away for now. I will get us where we need to be in half an hour.[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("Time for a power nap. You close your eyes.. And begin dreaming.")

		saynn("- - - - - - - - - - -")

		saynn("Thank you for completing BDCC.")

		saynn("I hope you liked it <3")

		saynn("You can close the game if you want. Or you can press the button and return back to the prison.")

		addButton("Dream", "Broken dreams are still dreams. Heh.", "do_dream")
func taviFullSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak

func taviSpeak(corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return corruptSpeak


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "collars_off"):
		processTime(3*60)
		getCharacter("tavi").getInventory().removeItemFromSlot(InventorySlot.Neck)
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Neck)

	if(_action == "do_dream"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatecollar"))
		getCharacter("tavi").resetEquipment()
		GM.pc.setLocation(GM.pc.getCellLocation())
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["tookRahi"] = tookRahi

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	tookRahi = SAVE.loadVar(data, "tookRahi", false)
