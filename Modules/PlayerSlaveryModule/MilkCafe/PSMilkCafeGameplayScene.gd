extends SceneBase

func _init():
	sceneID = "PSMilkCafeGameplayScene"

func _run():
	if(state == ""):
		#playAnimation(StageScene.Solo, "stand")
		setCharactersEasyList(GM.main.PS.getCharacterList())
		
		say(GM.main.PS.getFinalText())
		var theActions:Array = GM.main.PS.getFinalActions()
		for actionEntry in theActions:
			var theIndx:int = actionEntry[0]
			var isEnabled:bool = (actionEntry[1] != "")
			var actionName:String = actionEntry[2]
			var actionDesc:String = actionEntry[3]
			
			if(theIndx < 0):
				if(!isEnabled):
					addDisabledButton(actionName, actionDesc)
				else:
					addButton(actionName, actionDesc, "doAction", [actionEntry])
			else:
				if(!isEnabled):
					addDisabledButtonAt(theIndx, actionName, actionDesc)
				else:
					addButtonAt(theIndx, actionName, actionDesc, "doAction", [actionEntry])
	if(state == "end_credits"):
		addCharacter("psmilkgirl")
		addCharacter("psmilkguy")
		playAnimation(StageScene.Duo, "stand", {npc="psmilkguy"})
		saynn("Before you can exit your cell, the two owners step inside.")

		saynn("[say=pc]Is it milking time already?[/say]")

		saynn("[say=psmilkguy]Well.. not exactly.[/say]")

		saynn("A little suspicious. But they seem pretty happy.")

		saynn("[say=psmilkguy]We actually wanted to tell you.. that we have paid all our debts. We're free![/say]")

		saynn("Sofie nods.")

		saynn("[say=pc]That's nice. I'm happy for you two.[/say]")

		saynn("[say=psmilkgirl]Buying you was the right choice. And it was my choice.[/say]")

		saynn("[say=psmilkguy]Yeah, yeah. But now we.. kinda don't need you anymore.[/say]")

		saynn("[say=pc]Uh..[/say]")

		saynn("Sofie licks her lips and smiles.")

		saynn("[say=psmilkgirl]If we were gonna butcher you, we would have brought some knives. Relax, we're gonna set you free.[/say]")

		saynn("[say=psmilkguy]We are very grateful. You gave us a chance to start from a clean slate. No more crime from now on. No more milking slaves.[/say]")

		saynn("Somehow you doubt that they will last much.. but who knows.")

		saynn("[say=psmilkgirl]I was gonna sell you all at the auction again. But Leo talked me out of it.[/say]")

		saynn("They smooch each other. She really changed. Indeed.")

		saynn("[say=pc]I can't really go anywhere because of my collar.[/say]")

		saynn("[say=psmilkguy]Oh, right. You came with some kind of jamming equipment. Do you wanna stay?[/say]")

		saynn("Sofie squints towards her partner. She clearly wants you to leave.")

		saynn("[say=pc]I guess there is no point in running for me.[/say]")

		saynn("Back to the prison it is.. At least you're not getting sold into slavery again.")

		saynn("You say your goodbyes and prepare to leave.")

		addButton("Continue", "See what happens next", "credits_detective")
	if(state == "credits_detective"):
		removeCharacter("psmilkguy")
		removeCharacter("psmilkgirl")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("intro_interogation")
		addCharacter("intro_detective")
		saynn("Hours later.. and you're already sitting in a familiar chair.")

		saynn("[say=intro_detective]And so you're saying that you don't recall anything about what happened in the last few weeks? And why your collar tracking suddenly began working again?[/say]")

		saynn("Sterile lights irritate your eyes that long have forgotten how it feels.. to be in a well-lit room.")

		saynn("[say=pc]I don't remember it, yeah.[/say]")

		saynn("It'd be very easy to snitch on Leo and Sofie. But what's the point?")

		saynn("[say=intro_detective]Do you remember that you somehow managed to escape one of the most secure prisons in the galaxy?[/say]")

		saynn("[say=pc]Sorry, I just can't seem to remember.[/say]")

		saynn("He hums, tapping against the table with his pen. Then he leans a bit closer.")

		saynn("[say=intro_detective]Helping me understand what happened is in our best interest. You're giving me nothing and that makes you seem like a bad person. You don't want the judges to think that you're a bad person, do you? Maybe you just made some mistakes, it's understandable. I can help you. But only if you help me first.[/say]")

		saynn("[say=pc]I know how it will end. Just put me back where I belong.[/say]")

		saynn("Jake tilts his head slightly at first.. but then he just nods.")

		addButton("Continue", "See what happens next", "in_bdcc")

	if(state == "end_officer"):
		playAnimation(StageScene.Duo, "kneel", {npc="psmilkofficer", npcAction="sit", bodyState={leashedBy="psmilkofficer"}})
		saynn("The officer brings you onto his ship and shows you around. Quite spacious for a ship that doesn't require any extra crew..")

		saynn("There is only one bedroom though.. but you're not complaining.. anything is better than sleeping in the old freezer. And the idea of sleeping with your new owner is actually quite appealing.")

		saynn("After a quick ship tour, he plants his butt into the captain's chair.. and invites you to kneel nearby.")

		saynn("[say=psmilkofficer]Hold tight.[/say]")

		saynn("He guides the ship out of the docks.. and directs it towards the many colorful stars.")

		saynn("Freedom. Well.. kinda.")

		addButton("Continue", "See what happens next", "officer_choice")
	if(state == "officer_choice"):
		saynn("After setting the course, the autopilot grabs the controls, allowing the officer to focus on something else. He grabs a laptop and starts using it.")

		saynn("[say=psmilkofficer]You know.. I've typed a report here. All I have to do is press 'Send'. But I promised to not get them into trouble.[/say]")

		saynn("You tilt your head.")

		saynn("[say=psmilkofficer]So I will delete it. But I gotta go visit the toilet first.[/say]")

		saynn("He gives you a quick headpat.. and gets up, leaving his laptop on his chair.")

		saynn("When he is gone, you decide to take a peek.")

		saynn("It's a report about a space cafe.. the one you were in. It explains how its owners are holding illegal slaves and using them to profit. There is some proof attached.. some photos.")

		addButton("Send it", "Send the report", "officer_send")
		addButton("Do nothing", "Just sit still", "officer_nosend")
	if(state == "officer_send"):
		saynn("You press the giant 'Send' button.")

		saynn("The screen tells you that the report has been submitted successfully.")

		saynn("Soon, your owner returns.")

		saynn("[say=psmilkofficer]Hah. Oops. Looks like it got accidentally sent. Oh well. Wasn't me, it's the tech's fault.[/say]")

		saynn("He closes the laptop and kisses you on the cheek.")

		addButton("Continue", "See what happens next", "officer_goodlife")
	if(state == "officer_nosend"):
		saynn("You decide against pressing that button and just wait for your owner to come back.")

		saynn("Soon, he does.")

		saynn("[say=psmilkofficer]Well, I guess that's the right thing.[/say]")

		saynn("He deletes the report and closes his laptop.. before giving you a kiss on the cheek.")

		addButton("Continue", "See what happens next", "officer_goodlife")
	if(state == "officer_goodlife"):
		saynn("You spend the next few months traveling around the galaxy with your owner. Over time, you learned more about him.. and he learned more about your time at BDCC.")

		saynn("His meetings were quite draining.. but at least he knew he could always use you to drain his balls.")

		saynn("Nobody knew that a high-ranking AlphaCorp officer had a personal pet living on his ship.. officially that is. Unofficially.. people obviously had their suspicions. Why else would his ship need a bluespace signal jammer installed?")

		saynn("Still, it was fun. Like you were living a dream.")

		saynn("Sadly, all good things eventually come to an end and dreams are no exception.")

		saynn("[say=psmilkofficer]I'm sorry, cutie pie. They really are after me. If they find out, I will lose my seat in seconds.. end up out of the street. Or worse.. on a battlefield.[/say]")

		saynn("You're kneeling near his chair, your usual spot. The wolf is scritching you behind the ears.")

		saynn("[say=psmilkofficer]I don't care too much about it.. but I don't even want to know what they will do with you. And yeah.. I hate that I can't even show you off to anyone. I hate that you're sitting here all day, in this cage of a ship.[/say]")

		saynn("You can see a few lonely tears streaming down his cheeks.")

		saynn("[say=psmilkofficer]I could release you.. but your collar will just ping your location to the nearest AlphaCorp patrol. It won't work. Nothing will.[/say]")

		saynn("He looks into your eyes.")

		saynn("[say=psmilkofficer]It pains me to say it.. but I think you'd be happier back in your prison. I hope you're not angry at me.[/say]")

		saynn("You nuzzle his leg.")

		saynn("[say=pc]It's okay, really. I'm glad we shared so much time together.[/say]")

		saynn("His cheeks get even more wet.")

		saynn("He nods.")

		addButton("Continue", "See what happens next", "officer_back_interogation")
	if(state == "officer_back_interogation"):
		removeCharacter("psmilkofficer")
		addCharacter("intro_detective")
		aimCameraAndSetLocName("intro_interogation")
		playAnimation(StageScene.Solo, "sit")
		saynn("Hours later, you're already sitting in the familiar chair.. just a little less clothed this time.")

		saynn("[say=intro_detective]So you're saying that you don't know how you managed to evade our search for multiple months?[/say]")

		saynn("[say=pc]Yep.[/say]")

		saynn("He rolls his pen on his clawed digit.")

		saynn("[say=intro_detective]You're not giving me a lot to work with. It's in our best interest to paint the whole picture. The judges, if they see a blindspot, they will assume the worst.[/say]")

		saynn("[say=pc]Tell the judges to buy some buttplugs. They will need them.[/say]")

		saynn("Jake tilts his head slightly at first.. but then his expression switches to a very mean one.")

		addButton("Continue", "See what happens next", "in_bdcc")
	if(state == "in_bdcc"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		removeCharacter("intro_detective")
		addCharacter("risha")
		saynn("A few moments later..")

		saynn("[say=risha]Here is your shit.[/say]")

		saynn("At least.. you don't have to start from zero.")

		saynn("[say=risha]Be glad that I decided against just throwing it all out.[/say]")

		saynn("You nod.")

		saynn("You're back in your cell. Home, sweet home.")

		addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "end_annoying"):
		addCharacter("psmilkgirl")
		addCharacter("psmilkguy")
		playAnimation(StageScene.Duo, "defeat", {npc="psmilkgirl", npcAction="shove"})
		saynn("Before you can fully get up, Sofie rushes into your cell and shoves you back down to the ground. Leo joins too, grabbing Sofie's arm and pulling her away from you.")

		saynn("[say=psmilkguy]Sofie! Stop.[/say]")

		saynn("[say=psmilkgirl]LET ME GO, YOU SPINELESS. I'M GONNA FUCKING KILL THEM.[/say]")

		saynn("Wow. Wow-w-w. You get back a few steps, away from the crazy bitch.")

		saynn("Leo still tries to hold Sofie.")

		saynn("[say=psmilkguy]If you kill {pc.him}, how are we gonna pay our debts? And killing is also.. bad.. you know?[/say]")

		saynn("[say=psmilkgirl]I DON'T EVEN CARE ANYMORE. I JUST HATE THEM. I WANT THEM GONE. DEAD. THROWN OUT INTO SPACE LIKE A PIECE OF THRASH THAT THEY ARE. NOTHING BUT TROUBLE CAME FROM THEM.[/say]")

		saynn("That's not nice..")

		addButton("Continue", "See what happens next", "annoy_shittalk")
	if(state == "annoy_shittalk"):
		playAnimation(StageScene.Duo, "stand", {pc="psmilkguy", npc="psmilkgirl"})
		saynn("Sofie scratches her partner with her claws, trying to break free. The blood gets spilled.. at least it's not yours.")

		saynn("[say=psmilkguy]Ow.. I'm sorry, Sofie. This feeling will pass, just try to relax.. breathe in and out, sweetie, please.[/say]")

		saynn("You look behind the two and realize.. They left the door out of this basement open. This could be your chance.. unless this crazy bitch actually manages to break free.")

		saynn("[say=psmilkgirl]LET ME GO ALREADY, YOU LIMP DICK LOOSER. IT'S ALL YOUR FAULT.[/say]")

		saynn("[say=psmilkguy]Don't say that, sweetheart. And we were choosing the slaves together.. we didn't have much of a choice.. remember our financial situation?[/say]")

		saynn("Sofie stops trying to kill you and instead glares at her partner.")

		saynn("[say=psmilkgirl]SO YOU'RE SAYING I'M TO BLAME? IT'S MY FAULT WE'RE HERE IN THIS SHITHOLE OF A CAFE? I’M THE ONLY ONE WHO KEEPS THIS FAILED BUSINESS STILL RUNNING. ME.[/say]")

		saynn("[say=psmilkguy]Try to relax, you're not thinking straight. I'm not saying you're to blame. You're not, love.. It's just.. We both share some of it. Also, ouch..[/say]")

		saynn("Somehow, the guy is still trying to keep himself composed. You're not sure if you should feel sorry or be impressed.")

		saynn("[say=psmilkgirl]I DON'T SHARE SHIT. THINKING STRAIGHT? YOU'RE THE MOST GAY ONE HERE, BEGGING FOR MY STRAP LIKE A FUCKING SLUT. I SHOULD HAVE JUST MADE YOU ONE OF THE SLAVES. YOU'D BE WAY MORE USEFUL THEN, YOU FUCKING IDIOT.[/say]")

		saynn("[say=psmilkguy]Try to calm down, we can talk it through like adults. I really don't like what you're saying, please.[/say]")

		saynn("It's great that they're busy arguing with each other.. but they're still blocking the only exit.")

		saynn("[say=psmilkgirl]FUCK YOU. WHAT ARE YOU GONNA DO? HUH? YOU'RE JUST A BETA BITCH, A PUSHOVER, A STRAP-HUNGRY WHORE.[/say]")

		saynn("[say=psmilkguy]My interests or personality have nothing to do with this.[/say]")

		saynn("So much yelling makes your ears hurt. Soon they will start bleeding.")

		saynn("[say=psmilkgirl]MAN UP ALREADY. FIND SOME FUCKING BALLS AT LEAST, I KNOW YOU CAN'T GROW ANY.[/say]")

		saynn("[say=psmilkguy]..At least I'm not the one who gambled all our savings away.[/say]")

		saynn("Ooh.")

		addButton("Continue", "See what happens next", "annoy_firstslap")
	if(state == "annoy_firstslap"):
		playAnimation(StageScene.Duo, "stand", {pc="psmilkguy", npc="psmilkgirl", npcAction="defeat"})
		saynn("[say=psmilkgirl]What? REALLY? TRYING TO PUSH THE BLAME ONTO ME, AGAIN? WHAT A FAILURE OF A MAN.[/say]")

		saynn("A loud slap echoes around the whole freezer.. Sofie grabs onto her red cheek.")

		saynn("[say=psmilkgirl]Did you just..[/say]")

		saynn("Another slap makes her other cheek the same color. Sofie collapses down to her knees, her expression.. priceless.")

		saynn("[say=psmilkguy]Shut your mouth, please. I'm so tired of your screaming.[/say]")

		saynn("Sofie is shaking..")

		saynn("[say=psmilkgirl]You.. YOU LITTLE..[/say]")

		saynn("A third slap.. that one looked like it hurt.")

		saynn("[say=psmilkguy]Quiet, I said, just stop shouting to listen to me, for once. I would really hate to use a fucking cattle prod on the love of my life.[/say]")

		saynn("Sofie's lips are trembling as she rubs her red cheeks.")

		saynn("[say=psmilkguy]I tried to be peaceful. I thought that this.. state of yours.. would pass eventually. I thought that it's just the tough times that have caused this. I remember the times where you were acting nice to me.. I cherish those moments. I dreamed of them coming back.[/say]")

		saynn("Slowly, you follow the wall of the cell towards the exit, one step at a time.")

		saynn("[say=psmilkguy]I'm the dumb one here, I know. You can't find a guy who is more stupid than me. I fucking love you, even though you clearly hate me.[/say]")

		saynn("Love is a powerful force, huh.")

		saynn("[say=psmilkguy]I'm not perfect, I made my share of mistakes. I have forgiven you for spending all my savings on gambling. I have even forgiven you for cheating on me with that guy who visits us ever so often and just laughs his ass off behind my back. I agreed to break the law with you and visit that shady-ass Blacktail market. Multiple times. Wow.. What was I thinking?[/say]")

		saynn("Buying you was clearly their biggest mistake.")

		saynn("[say=psmilkguy]But you.. You have bigger problems, Sofie. You are sick in your head. And there is nothing I can do to change that. I can't help you. I don't want to anymore. I hate you.[/say]")

		saynn("Sofie is just blinking a lot, speechless.")

		saynn("[say=psmilkguy]I thought the tough times have caused this.. But they just revealed who you really are.[/say]")

		saynn("You get closer and closer to the exit.")

		saynn("[say=psmilkguy]Do me a favor. Get some help. But not from me. I'm done. Officially. I'm fucking done dealing with your bullshit.[/say]")

		saynn("[say=psmilkgirl]L-Leo.[/say]")

		saynn("[say=psmilkguy]SHUT UP, Sofie. Shut your whore's mouth. Don't make it worse, you did enough.[/say]")

		saynn("They're both busy with each other, barely paying any attention to the surroundings. Now seems like as good of a time as any to make your escape.")

		addButton("Sneak out", "Time to go!", "annoy_sneakout")
	if(state == "annoy_sneakout"):
		removeCharacter("psmilkguy")
		removeCharacter("psmilkgirl")
		aimCameraAndSetLocName("pscafe_counter")
		playAnimation(StageScene.Solo, "stand")
		saynn("You manage to sneak out of the fridge and head towards the door that they have forgotten to close. You still hear some of the pair arguing.")

		saynn("[say=psmilkguy]If I had my ring, I would have thrown it out into the trash right now. But I pawned it. Just so we'd be able to keep this dream afloat for a little longer. Gosh, I'm so fucking stupid.[/say]")

		saynn("As you step out, the bright lights of the small kitchen and the seating area hit you.. It's early morning so there aren't any customers here yet.")

		saynn("You are still naked.. would be nice if you weren't. You look around but all you can find is an apron.. That's better than nothing.")

		saynn("You approach the counter and hop over it. It would be nice to get some credits from the digital cash register.. but it's locked.")

		addButton("Docks", "Head towards the docks", "annoy_docks")
	if(state == "annoy_docks"):
		aimCameraAndSetLocName("pscafe_docks")
		saynn("With nothing better to do, you head towards the docks.")

		saynn("It's a small series of corridors, each one ending with a docking port. Not much you can do unless you have a spaceship.. and last time you checked, you didn't..")

		saynn("The best thing you can do.. is just wait really.")

		addButton("Wait", "See what happens next", "annoy_get_helped")
	if(state == "annoy_get_helped"):
		saynn("After some minutes, the first clients actually begin to dock.")

		saynn("You stop them.. and do your best to explain your situation.. and that you really need a ride somewhere safe.")

		saynn("The first clients seemingly just ignore you.. probably thinking you're some homeless space junkie. But one kind soul offers to help.")

		saynn("You board their ship.. and watch through the ship's window as the cafe gets smaller and smaller.")

		saynn("Freedom. Or so it seems.")

		saynn("Sadly, it doesn't last long.")

		saynn("Soon enough, your spaceship gets stopped by one of the AlphaCorp patrols. Somehow, they knew to check you exactly.")

		saynn("One awkward attempt at fighting back later.. and you're in cuffs.")

		addButton("Continue", "See what happens next", "annoy_detective")
	if(state == "annoy_detective"):
		addCharacter("intro_detective")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("intro_interogation")
		saynn("[say=intro_detective]And so you're saying that you don't recall anything about what happened in the last few days?[/say]")

		saynn("Sterile lights irritate your eyes that long have forgotten how it feels.. to be in a well-lit room.")

		saynn("[say=pc]You say days but it could have been weeks or months, I don't remember shit.[/say]")

		saynn("[say=intro_detective]Do you remember that you somehow managed to escape one of the most secure prisons in the galaxy?[/say]")

		saynn("[say=pc]I was in a prison? Wow. I only saw prisons in my nightmares.[/say]")

		saynn("He hums, tapping against the table with his pen. Then he leans a bit closer.")

		saynn("[say=intro_detective]Helping me understand what happened is in our best interest. You're giving me nothing and that makes you seem like a bad person. You don't want the judges to think that you're a bad person, do you? Maybe you just made some mistakes, it's understandable. I can help you. But only if you help me first.[/say]")

		saynn("[say=pc]You really need new lines, want me to help you come up with some new ones?[/say]")

		saynn("Jake tilts his head slightly at first.. but then his expression switches to a very mean one.")

		addButton("Continue", "See what happens next", "in_bdcc")


	if(state == "end_breaklock"):
		playAnimation(StageScene.Solo, "stand")
		saynn("The padlock isn't holding the door closed anymore.. which means that the freedom is near.")

		saynn("You look through the slit and wait for a good moment..")

		saynn("But then..")

		addButton("Continue", "See what happens next", "lock_pip")
	if(state == "lock_pip"):
		addCharacter("pspip")
		playAnimation(StageScene.Duo, "stand", {npc="pspip"})
		saynn("Before you commit, a hand lands on your shoulder and pulls you back.")

		saynn("You were about to throw a punch.. but then you see who it is.")

		saynn("[say=pspip]Tshh. I think this is a dumb idea.[/say]")

		saynn("[say=pc]Getting out of here is a dumb idea? You can stay here if you want, Pip.[/say]")

		saynn("[say=pspip]No, doing it alone is a dumb idea. One versus two. I wanna help even up the chances.[/say]")

		saynn("That doesn't seem like a bad idea.")

		saynn("[say=pc]Alright.[/say]")

		saynn("Pip peeks his head out slightly, observing the surroundings.")

		saynn("[say=pspip]The girl is standing behind the counter, the guy is serving the tables. I'm pretty sure that one of them has a cattle prod, usually him. Hurts like shit, enough to bring us down.[/say]")

		saynn("A voice from behind..")

		saynn("[say=psmilka]Cattle prod?[/say]")

		addButton("Continue", "See what happens next", "lock_milka")
	if(state == "lock_milka"):
		addCharacter("pspip")
		playAnimation(StageScene.Duo, "stand", {npc="psmilka", pc="pspip"})
		saynn("Sneaky Milka makes both of you jump..")

		saynn("[say=pspip]God dammit Milka.[/say]")

		saynn("[say=psmilka]Moo? Whatcha doing?[/say]")

		saynn("Her ears perked up curiously.")

		saynn("[say=pspip]We're.. gonna steal some ice-cream. To do that, we need to sneak by the owners without them noticing.[/say]")

		saynn("[say=psmilka]Ohh.. Are you trying to escape?[/say]")

		saynn("Pip looks at you, confused.")

		saynn("[say=pc]Yeah.[/say]")

		saynn("Milka blinks a few times, the corners of her mouth turning down.")

		saynn("[say=psmilka]I'm missing my old farm.. I wanna help![/say]")

		saynn("Pip covers her mouth.")

		saynn("[say=pspip]Tshh, quiet. One of them has a weapon, probably the guy. That cattle prod can bring all of us down.[/say]")

		saynn("A visible shiver runs through Milka.")

		saynn("[say=psmilka]Cattle prod..[/say]")

		saynn("She winces just thinking about it.")

		saynn("[say=psmilka]I think I can take it..[/say]")

		saynn("[say=pspip]Are you sure, Milka? It will be set to its most painful setting.[/say]")

		saynn("Milka stares at the walls of this basement for a few long seconds.")

		saynn("[say=psmilka]Yeah..[/say]")

		saynn("Having two friends by your sides.. makes this three versus two.")

		saynn("[say=pc]Hm. I wonder if we can..[/say]")

		saynn("[say=pspip]Change the plan? We might be able to. Here is what I'm thinking..[/say]")

		saynn("You discuss the best way to handle this.. and then.. you get into your positions.")

		saynn("Time to do this.")

		addButton("Continue", "See what happens next", "lock_start")
	if(state == "lock_start"):
		playAnimation(StageScene.Solo, "stand", {pc="psmilka"})
		saynn("The cafe is going through its normal routine. Customers ordering food and consuming it behind the tables. Sofie is taking in the orders.. before handing them to Leo who prepares and hands them out.")

		saynn("Suddenly, the door at the end of the kitchen opens up.. the one that leads to the basement. It reveals.. a curious busty puppy.")

		saynn("[say=psmilka]Moo?[/say]")

		saynn("She steps out into the kitchen and kicks the broken padlock for a bit.")

		addButton("Continue", "See what happens next", "lock_sofie")
	if(state == "lock_sofie"):
		addCharacter("psmilkgirl")
		playAnimation(StageScene.Duo, "stand", {pc="psmilka", npc="psmilkgirl"})
		aimCameraAndSetLocName("pscafe_center")
		saynn("Milka wanders around the kitchen more, sniffing all the various cooking equipment.")

		saynn("It doesn't take long before she gets spotted by Sofie..")

		saynn("[say=psmilkgirl]Hey! No-no-no-no. Bad, the fuck are you doing here.[/say]")

		saynn("[say=psmilka]Moo-o?[/say]")

		saynn("As Sofie starts creeping towards Milka, she keeps stepping back.. until she ends up back in the basement.")

		saynn("[say=psmilkgirl]Did you really break the padlock? What a dumb fucking animal, you need to be taught a good lesson.[/say]")

		saynn("She turns around and yells towards the kitchen.")

		saynn("[say=psmilkgirl]Leo! Come here, you lazy fuck.[/say]")

		addButton("Continue", "See what happens next", "lock_leo")
	if(state == "lock_leo"):
		addCharacter("psmilkguy")
		playAnimation(StageScene.Duo, "stand", {pc="psmilka", npc="psmilkguy"})
		aimCameraAndSetLocName("pscafe_field2")
		saynn("Leo quickly rushes down to the basement.")

		saynn("[say=psmilkguy]Why is the door broken?[/say]")

		saynn("[say=psmilkgirl]That's because this dumb bitch broke it.[/say]")

		saynn("Milka puts on her big puppy eyes, her arms squeezing her breasts.")

		saynn("[say=psmilka]Moo?..[/say]")

		saynn("[say=psmilkgirl]She completely lost her mind by now it seems. Whatever. Hit her with the pain stick. As hard as your tiny balls will let you.[/say]")

		saynn("Milka shivers when hearing that, she keeps backing away, now stepping onto the grass of the small garden.")

		saynn("[say=psmilka]Moo-o![/say]")

		saynn("Leo pulls out his cattle prod.. but he deliberates.")

		saynn("[say=psmilkguy]Are you sure, Sofie? I feel like she got the lesson already. Right, Milka?[/say]")

		saynn("The puppy nods eagerly.")

		saynn("[say=psmilkgirl]Hit her or give me the stick and go away already, I'm getting sick of your softness towards mindless animals.[/say]")

		saynn("Leo squeezes the weapon tighter.")

		saynn("[say=psmilkguy]You're right, Sofie. We gotta punish her.[/say]")

		saynn("Milka backs herself into a corner.. and moos sadly.. while Leo is approaching her.. and Sofie is watching from behind.")

		saynn("[say=psmilka]Moo-o..[/say]")

		saynn("Leo raises the cattle prod..")

		saynn("You gesture to Pip..")

		addButton("Continue", "See what happens next", "lock_ambush")
	if(state == "lock_ambush"):
		playAnimation(StageScene.SexCowgirlChoke, "tease", {pc="psmilkgirl", npc="pspip"})
		saynn("Pip sneaks up behind Sofie and yanks on her hair, bringing her down to the floor and pinning her in place.")

		saynn("[say=psmilkgirl]ARGH-H! YOU BITCH![/say]")

		saynn("[say=pspip]Got you.[/say]")

		saynn("Leo turns around.. and sees her partner in trouble.")

		addButton("Continue", "See what happens next", "lock_maybefight")
	if(state == "lock_maybefight"):
		playAnimation(StageScene.Duo, "stand", {npc="psmilkguy"})
		saynn("You step out and stand between Leo and Sofie, blocking the path.")

		saynn("[say=pc]What are you gonna do without your girl now?[/say]")

		saynn("Sofie is trying to break free.. but Pip seems to be strong enough to hold her.")

		saynn("[say=psmilkgirl]LEO! GET THIS FUCKER OFF ME! SHOCK HIS FUCKING BALLS OFF![/say]")

		saynn("Leo's eyes go wide, he squeezes his cattle prod like it's his last hope, switching it to its most painful setting.")

		saynn("[say=psmilkguy]Let go of her! This will hurt a lot.[/say]")

		saynn("And since you're naked, you can't even block it. Still, you raise your clenched fists, preparing for a fight.")

		saynn("[say=pc]Try and hit me then.[/say]")

		saynn("He furrows his brows.. and starts approaching you, his weapon creating scary sparks.")

		addButton("Continue", "See what happens next", "lock_milkasaves")
	if(state == "lock_milkasaves"):
		playAnimation(StageScene.Duo, "defeat", {pc="psmilka", npc="psmilkguy", npcAction="stunbaton"})
		saynn("Leo raises the cattle prod and swings his arm to strike you..")

		saynn("But just before it connects with your skin, Milka suddenly gets into the way and takes the hit instead!")

		saynn("[say=psmilka]Ahh-hh!..[/say]")

		saynn("She cries out from pain as she drops onto the floor, the shock making her body convulse, her every muscle has started spazzing uncontrollably.")

		saynn("While the guy is confused, you smack the weapon out of his hand and shove him down to the floor!")

		addButton("Continue", "See what happens next", "lock_tieup")
	if(state == "lock_tieup"):
		playAnimation(StageScene.Hogtied, "idle", {pc="psmilkguy"})
		saynn("You quickly go through his things and find some zip ties that you use to tie him up. You toss some to Pip and watch as he does the same with Sofie's wrists and ankles.")

		saynn("[say=psmilkguy]Oh shit..[/say]")

		saynn("[say=psmilkgirl]USELESS! ALL OF YOU! FUCK ME, I'VE NEVER SEEN ANYONE WHO IS MORE PATHETIC THAN YOU, LEO![/say]")

		saynn("You rush to Milka and check if she is okay.")

		saynn("[say=pc]Milka?..[/say]")

		saynn("[say=psmilka]..moo-o.. pain..[/say]")

		saynn("At least she is breathing. You hug the poor pup.. and notice that her breasts are leaking milk even from a slight pressure.")

		saynn("Milka catches some of her milk and laps it up.")

		saynn("[say=psmilka]..strawberries.. that's so tasty.. hah.. ow..[/say]")

		saynn("The more she licks it.. the more her tail starts to wag. She then leans down and noms some grass from the field.")

		saynn("[say=psmilka]Moo..[/say]")

		saynn("Milka is hungry from so much stress. You find a snack in the guy's pockets and give it to her.")

		saynn("[say=psmilka]Thank you-u-u-u!..[/say]")

		saynn("She sits down on her butt and starts snacking, already looking much more lively.")

		saynn("[say=psmilkgirl]I WILL KILL ALL OF YOU, FUCKERS![/say]")

		saynn("Sofie receives a big smack on the ass from Pip.")

		saynn("[say=psmilkgirl]OWW![/say]")

		saynn("[say=pspip]Eat the grass if it hurts, slut.[/say]")

		saynn("[say=psmilkgirl]FUCK YOU![/say]")

		saynn("She is screaming.. but the walls are thick enough for her to not be heard outside. Their own basement is now working against them.")

		saynn("[say=psmilkguy]Welp.. Can we talk about it? We can discuss letting you go..[/say]")

		saynn("Looks like.. both of the owners are defeated!")

		saynn("[say=pc]Talk about letting us go? Suddenly, you want to do that? You didn't discuss with us if we're okay becoming your milking slaves.[/say]")

		saynn("[say=psmilkgirl]WE ARE IN HUGE DEBT, YOU DUMB FUCK! WE HAD TO DO IT![/say]")

		addButton("Continue", "See what happens next", "lock_choicesofie")
	if(state == "lock_choicesofie"):
		playAnimation(StageScene.SexBehind, "tease", {pc="pspip", npc="psmilkgirl", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Sofie is still trying to struggle free so Pip forces her face into the floor instead, his hands stripping her clothes off.")

		saynn("[say=pspip]Hey.. how are we gonna punish this bitch?[/say]")

		saynn("[say=psmilkgirl]HANDS OFF.. GGRR.. F-Fuck you..[/say]")

		saynn("[say=pspip]You thought you could break me. Maybe I should just break into your womb.[/say]")

		saynn("[say=psmilkgirl]WHAT? NEVER IN THE MILLION.. AGH..[/say]")

		saynn("Her ass gets slapped firmly.. Pip's cock seems to be getting hard.")

		saynn("[say=pc]Really? Right in front of her lover?[/say]")

		saynn("[say=psmilkguy]Uhh..[/say]")

		saynn("[say=psmilkgirl]IS THAT ALL YOU CAN SAY? Such a PATHETIC FUCKING MAN. Fine, BREED ME, stud. Make me feel like a woman at least ONCE in my life.[/say]")

		addButton("Let Pip breed", "Let Pip breed Sofie", "lock_sofie_breed")
		addButton("Milking machine", "Hook Sofie up to a milking machine instead", "lock_sofie_milking")
	if(state == "lock_sofie_breed"):
		playAnimation(StageScene.SexMatingPress, "fast", {pc="pspip", npc="psmilkgirl", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let Pip do it.. seems like a good way to let him get his revenge on her.")

		saynn("He wastes no time, grabbing Sofie's legs and pinning them into her shoulders.. before plunging his flared horsecock down her snatch.")

		saynn("[say=psmilkgirl]AHhh-h! Such a THICK COCK![/say]")

		saynn("Pip starts going at it, pounding the mouthy dragon girl into the ground, her pussy making wet noises as it gets stretched wide by the fat shaft again and again.")

		saynn("[say=psmilkgirl]LOOK AT THIS, LOVER! This is how you FUCK A PUSSY! AH!..[/say]")

		saynn("Slutty moans echo around the garden as Pip keeps thrusting inside, really enjoying ravaging that needy slit.")

		saynn("Leo is just watching, rubbing his thighs against each other.")

		saynn("[say=psmilkguy]Sofie..[/say]")

		saynn("It doesn't take long before Pip gets to his peak.. He shoves most of his shaft inside, creating a huge bump on Sofie's belly.. a bump that only starts to inflate more as the stud starts pumping her womb full of his virile seed.. wave after wave.")

		saynn("[say=psmilkgirl]AH-hhh.. My clenching pussy.. is milking your cock.. BREED ME! FEELS SO GOOD![/say]")

		saynn("Pip is grunting.. as he drains his balls into the annoying bitch.. while Leo is squirming around on the floor.")

		saynn("[say=psmilkgirl]Nh-h..[/say]")

		saynn("The girl has been dealt with..")

		addButton("Continue", "See what happens next", "lock_choice_leo")
	if(state == "lock_choice_leo"):
		playAnimation(StageScene.SexCowgirlAmazon, "tease", {pc="psmilkguy", npc="psmilka", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Milka seems to have fully recovered by now.. She unties Leo.. just so she can also strip him of his clothes.")

		saynn("[say=psmilka]Hey there, moo~.[/say]")

		saynn("[say=psmilkguy]Uh.. sorry for.. hitting you.[/say]")

		saynn("Milka chuckles as she straddles him.")

		saynn("[say=psmilka]It's okay~. You can make up for it.[/say]")

		saynn("Sofie is still panting heavily.. but she sees the things that are happening.")

		saynn("[say=psmilkgirl]Hh.. H-hey! That's my husband! He is a limp-dick asshole.. but he is still mine![/say]")

		saynn("Milka smiles as she sees Leo getting hard under her, his cock is brushing against her wet slit..")

		saynn("[say=psmilkguy]Uh.. Milka..[/say]")

		saynn("[say=psmilka]Tshhh~..[/say]")

		saynn("She looks at you for approval.")

		addButton("Let Milka ride", "Allow Milka to ride Leo's cock", "lock_milka_breed")
		addButton("Milking machine", "Hook up Leo into a milking machine instead", "lock_leo_milk")
	if(state == "lock_milka_breed"):
		playAnimation(StageScene.SexCowgirlAmazon, "fast", {pc="psmilkguy", npc="psmilka", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide to let Milka do what she wants to do.")

		saynn("She smiles.. then wraps her digits around Leo's ridged cock.. before guiding it down her pink slit as she lowers herself onto the tip.")

		saynn("[say=psmilka]Mmh.. moo~.[/say]")

		saynn("Milka starts riding the guy.. bouncing up and down on his hard shaft, her big milky breasts jiggling in the process, swollen nips spawning little rivers of her milk..")

		saynn("[say=psmilkguy]Ah.. your pussy.. feels incredible..[/say]")

		saynn("[say=psmilka]Thank you~. Your cock feels great too![/say]")

		saynn("[say=psmilkgirl]YOU DIDN'T EVEN ASK ME, ASSHOLE! I HOPE THAT CUNT IS WORTH IT! Hey!.. No-no-no![/say]")

		saynn("You gesture to Pip to deal with the noisy bitch.. and so he does, gagging her mouth.")

		saynn("[say=psmilkgirl]MHH-hhh! Mhhh..[/say]")

		saynn("Milka chuckles as Leo reaches his hand out to cup and grope Milka's full tits.")

		saynn("[say=psmilka]I'm a good cow, right~?[/say]")

		saynn("[say=psmilkguy]Best one I ever knew.. mhh..[/say]")

		saynn("Leo throws his head back and moans more as Milka increases the pace, riding him harder, her pussy eagerly swallowing his knotted cock, coating it with her juices.")

		saynn("[say=psmilkguy]Milka.. I.. I'm.. ah-..[/say]")

		saynn("[say=psmilka]Breed me~. Moo-o~..[/say]")

		saynn("It doesn't take long before Milka gets what she wants. Leo's balls tense up as his member starts throbbing inside the pup, filling her up with his thick seed.. stuffing more and more into her.")

		saynn("[say=psmilkguy]Nghh-..[/say]")

		saynn("All the while, Sofie is forced to watch how her husband is breeding one of her slaves.")

		saynn("[say=psmilka]Pump this pussy full.. good..[/say]")

		saynn("[say=psmilkgirl]Grrr..[/say]")

		saynn("And now the guy is handled too. Time to make your escape!")

		addButton("Continue", "See what happens next", "lock_about_to_escape")
	if(state == "lock_about_to_escape"):
		removeCharacter("psmilkguy")
		removeCharacter("psmilkgirl")
		aimCameraAndSetLocName("pscafe_docks")
		playAnimation(StageScene.Duo, "stand", {pc="psmilka", npc="pspip"})
		saynn("You sneak up through the cafe's seating area and get into the docks, all three of you.")

		saynn("[say=pc]Well.. what now?[/say]")

		saynn("[say=pspip]I found some keys on the guy. I think they are for the shitty spacetruck that's over there.[/say]")

		saynn("It's a real beater.. but it's better than nothing.")

		saynn("[say=pspip]Where do you wanna go, Milka?[/say]")

		saynn("[say=psmilka]Me?.. um.. my farm.[/say]")

		saynn("[say=pspip]Alright. And where would that be?[/say]")

		saynn("[say=psmilka]I don't.. remember.. I don't remember much, I'm sorry. Not even my real name.[/say]")

		saynn("Pip nods.. while Milka's ears lower themselves.")

		saynn("[say=pspip]Huh. That makes things a bit complicated..[/say]")

		saynn("[say=psmilka]I'm sorry..[/say]")

		saynn("Pip pats Milka on the head.")

		saynn("[say=pspip]Don't be. I will help you, we will figure it out.[/say]")

		saynn("Milka cheers up visibly, her tail wagging.")

		saynn("[say=psmilka]Don't you have your own things that you have you do?[/say]")

		saynn("[say=pspip]Ehh, they can wait.[/say]")

		saynn("Milka nods. Pip turns towards you.")

		saynn("[say=pspip]What about you?[/say]")

		saynn("[say=pc]AlphaCorp is gonna be looking for me. I think I'm screwed either way.[/say]")

		saynn("You tug on your collar.")

		saynn("[say=pspip]Yeah, looks like you are in a bigger pickle than my caged cock was.[/say]")

		saynn("[say=psmilka]But your cock IS a big pickle~.[/say]")

		saynn("[say=pspip]Milka..[/say]")

		saynn("She giggles and sticks her tongue out. Pip rolls his eyes and sighs.")

		saynn("[say=pspip]Brat.[/say]")

		addButton("Continue", "See what happens next", "lock_yadayada")
	if(state == "lock_yadayada"):
		removeCharacter("pspip")
		removeCharacter("psmilka")
		playAnimation(StageScene.Solo, "stand")
		saynn("And so you ride the spacetruck with them until the first space station. That's where you part your ways and say your goodbyes.")

		saynn("It's a good thing that you did.. because soon after one of the AlphaCorp patrols catches you. You couldn't even hide anywhere.. it's like they knew where you were exactly.")

		addButton("Continue", "See what happens next", "lock_caught")
	if(state == "lock_caught"):
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("intro_interogation")
		addCharacter("intro_detective")
		saynn("Hours later.. and you're already sitting in a familiar chair.")

		saynn("[say=intro_detective]And so you're saying that you don't recall anything about what happened in the last few weeks? And why your collar tracking suddenly began working again?[/say]")

		saynn("Sterile lights irritate your eyes that long have forgotten how it feels.. to be in a well-lit room.")

		saynn("[say=pc]I don't remember it, yeah.[/say]")

		saynn("It'd be very easy to snitch on Leo and Sofie. But what's the point?")

		saynn("[say=intro_detective]Do you remember that you somehow managed to escape one of the most secure prisons in the galaxy?[/say]")

		saynn("[say=pc]Sorry, I just can't seem to remember.[/say]")

		saynn("He hums, tapping against the table with his pen. Then he leans a bit closer.")

		saynn("[say=intro_detective]Helping me understand what happened is in our best interest. You're giving me nothing and that makes you seem like a bad person. You don't want the judges to think that you're a bad person, do you? Maybe you just made some mistakes, it's understandable. I can help you. But only if you help me first.[/say]")

		saynn("[say=pc]How long did you practice that one?[/say]")

		saynn("Jake tilts his head slightly at first.. but then his expression switches to a very mean one.")

		addButton("Continue", "See what happens next", "in_bdcc")
	if(state == "lock_sofie_milking"):
		aimCameraAndSetLocName("pscafe_cow")
		playAnimation(StageScene.BDSMMachineFuck, "fastdouble", {pc="psmilkgirl", pcCum=true, bodyState={naked=true, hard=true, chains=[["hose", "breastpump", "scene", "milkIntake"]]}})
		saynn("[say=pc]I think it's best we just give her a taste of her own medicine.[/say]")

		saynn("[say=pspip]I think I know what you are talking about.[/say]")

		saynn("You and Pip pull Sofie onto the advanced milking machine and tightly secure her limbs, making her helpless while all her holes and her tits are nice and exposed.")

		saynn("[say=psmilkgirl]What the fuck are you doing? Stop it![/say]")

		saynn("You select the most.. intense.. mode.. and let the machine start its work.")

		saynn("Two breast pumps get secured around Sofie's tits while two pre-lubed dildos slide dangerously close to her holes, pretty much kissing them.")

		saynn("[say=psmilkgirl]Don't you dare.. AH![/say]")

		saynn("Before she can even complain, her holes get forcibly stretched wide open by the tools. The machine proceeds to double-penetrate Sofie's pussy and ass while the pumps start sucking away at her tits, attempting to draw milk.. but fruitlessly so far.")

		saynn("[say=psmilkgirl]I'M NOT A FUCKING COW!.. AH-h.. F-fuck!..[/say]")

		saynn("Milka brings Leo near so he can watch as her partner gets fucked and milked at the same time.")

		saynn("[say=psmilkguy]That's pretty hot..[/say]")

		saynn("It doesn't take long before Sofie throws her head back and lets out a cry of passion, her helpless body thrashes against the manipulators while the machine just keeps stimulating her everywhere.")

		saynn("[say=psmilkgirl]MHHh.h.. hhh-h.. ah.. Fuck you.. ah..[/say]")

		saynn("Orgasm after orgasm, the mean bitch is slowly loses touch with reality from the constant fucking. Her nips become hard and swollen from getting pumped so much.")

		saynn("[say=psmilkgirl]S-Stop.. T-This.. I'm N-Not.. A.. C-Cow..[/say]")

		saynn("Her body betrays her. Suddenly, her nips start squirting with milk! Multiple little rivers spawn from her enlarged buds, flowing down along her areolas before getting collected by the pumps.")

		saynn("[say=pspip]I think the customers will enjoy today's milkshakes a lot.[/say]")

		saynn("[say=psmilka]Or ice cream![/say]")

		saynn("Sofie moans into the air while her tired body gets milked and her pussy and ass get stuffed again and again.")

		saynn("[say=pc]Ice cream?[/say]")

		saynn("[say=psmilka]Yeah! Or cheese.[/say]")

		saynn("Thinking about breastmilk cheese.. makes you feel uneasy.")

		saynn("Soon, the machine begins to slow down.. Pip helps unlock her. As soon as Sofie steps onto the floor, she just collapses, from exhaustion.")

		saynn("[say=psmilkgirl]Nh-h..[/say]")

		saynn("The girl has been dealt with..")

		addButton("Continue", "See what happens next", "lock_choice_leo")
	if(state == "lock_leo_milk"):
		playAnimation(StageScene.BDSMMachineAltFuck, "fast", {pc="psmilkguy", bodyState={naked=true, hard=true, chains=[["hose", "penisPump", "scene", "milkIntake"]]}})
		aimCameraAndSetLocName("pscafe_bull")
		saynn("[say=pc]Why don't we treat him the way he was treating us?[/say]")

		saynn("[say=psmilka]That works too![/say]")

		saynn("You and Milka drag Leo onto an advanced milking machine and lock his legs and arms to it, exposing his tight tailhole and ridged knotted cock to its tools.")

		saynn("Milka chooses the most intense milking mode available. And so, the machine springs into life, aligning one of its pre-lubed dildos with Leo's cute butthole. At the same time, another manipulator secures a penis pump around his half-hard member..")

		saynn("[say=psmilkguy]Wait.. Are you sure about.. Ah!..[/say]")

		saynn("The dildo stretches Leo's asshole wide and slides inside, exploring him from the inside, quickly stumbling upon a little sensitive bump.. a bump that it proceeds to massage by fucking his ass!")

		saynn("[say=psmilkguy]Mhh-h.. f-fuck.k..[/say]")

		saynn("His cock gets fully hard in seconds.. before the penis pump engages too, sliding its soft pleasure ring along the ridged surface of his shaft.. up and down..")

		saynn("The guy starts moaning.. a lot. His cute noises mix in well with the mechanical hum of the tools as they work on stimulating his prostate and his cock. The tip of his twitching member leaks more and more precum.. before suddenly shooting a thick line of seed! And then another! His cock is throbbing as the pump works hard, milking the rest of his load out and then collecting it.")

		saynn("[say=psmilkguy]Ahh-h.. T-that feels too good..[/say]")

		saynn("[say=psmilkgirl]BECAUSE I MARRIED A FUCKING BOTTOM![/say]")

		saynn("Pip quickly gags her mouth with her own panties.")

		saynn("[say=psmilkgirl]MHHhh-hh!.. hhh-hm..[/say]")

		saynn("[say=pspip]There is nothing wrong with a bottom, miss. Look at him go.[/say]")

		saynn("Leo cums again, throwing his head back and moaning as his cock throbs and shoots more of these beautiful strings of seed, stuffing the pump's reservoir. Even between the orgasms, his cock is constantly leaking something.. his prostate is getting smashed hard by the machine.")

		saynn("[say=psmilka]The cupcakes today are gonna be extra creamy![/say]")

		saynn("[say=pspip]Customers will certainly want more.[/say]")

		saynn("[say=psmilkgirl]Grrr..[/say]")

		saynn("The dildo keeps pounding Leo's ass.. but each orgasm draws out less and less seed from him.. until his balls are left completely dry.")

		saynn("That's when you turn off the machine and let him rest. Now the guy is handled too. Time to make your escape!")

		addButton("Continue", "See what happens next", "lock_about_to_escape")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "doAction"):
		var result:Dictionary = GM.main.PS.doFinalAction(_args[0])
		if(result.has("fight")):
			runScene("FightScene", [result["fight"]], "fight_scene")
		elif(result.has("sex")):
			runScene("GenericSexScene", result["sex"], "sex_scene")
		elif(result.has("end")):
			GM.pc.freeMouthDeleteAll(true)
			setState(result["end"])
		else:
			if(!GM.main.checkExtraScenes()):
				GM.main.showLog()
		return

	if(_action == "doEnd"):
		GM.main.stopPlayerSlavery()
		GM.pc.setLocation(GM.pc.getCellLocation())
		endScene()
		return

	if(_action == "in_bdcc"):
		GM.pc.setLocation(GM.pc.getCellLocation())
		GM.main.stopPlayerSlavery()
		addMessage("All your items were returned to you.")

	if(_action == "lock_sofie_breed"):
		getCharacter("psmilkgirl").cummedInVaginaBy("pspip")

	if(_action == "lock_sofie_milking"):
		var thePump = GlobalRegistry.createItem("BreastPump")
		var theFluids = thePump.getFluids()
		theFluids.addFluid("Milk", 400.0)
		getCharacter("psmilkgirl").getInventory().forceEquipStoreOtherUnlessRestraint(thePump)

	if(_action == "lock_milka_breed"):
		getCharacter("psmilka").cummedInVaginaBy("psmilkguy")

	if(_action == "lock_leo_milk"):
		getCharacter("psmilkguy").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("PenisPump"))

	if(_action == "lock_choice_leo"):
		getCharacter("psmilkgirl").resetEquipment()

	if(_action == "lock_about_to_escape"):
		getCharacter("psmilkguy").resetEquipment()
	
	if(_action == "lock_about_to_escape"):
		GM.main.PSH.unlockEndingAddMessage("MilkCafe", "escaped")
	if(_action == "credits_detective"):
		GM.main.PSH.unlockEndingAddMessage("MilkCafe", "earned")
	if(_action == "annoy_get_helped"):
		GM.main.PSH.unlockEndingAddMessage("MilkCafe", "annoyed")
	if(_action == "officer_goodlife"):
		GM.main.PSH.unlockEndingAddMessage("MilkCafe", "officer")
	
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "sex_scene"):
		GM.main.PS.processSexEnd(_result[0])
	if(_tag == "fight_scene"):
		var battlestate = _result[0]
		GM.main.PS.processFightEnd(battlestate == "win")
