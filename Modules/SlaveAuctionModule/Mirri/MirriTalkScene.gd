extends SceneBase

var canBreed = false
var usedCondom = false
var straponHasCum = false
var isStrapon = false
var addedCollar = false

func _init():
	sceneID = "MirriTalkScene"

func _run():
	if(state == ""):
		canBreed = !getModule("SlaveAuctionModule").isMirriOnPill()
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		var mirriRank = getModule("SlaveAuctionModule").getRepLevel()
		var canGoNextRank = getModule("SlaveAuctionModule").isReadyToAdvanceRepLevel()
		saynn("You approach Mirri. The catgirl is eyeing you out.")

		saynn("[say=mirri]"+str(getModule("SlaveAuctionModule").getMirriGreeting())+"[/say]")

		saynn(""+str(getModule("SlaveAuctionModule").getRepInfoString())+"")

		saynn("Affection towards you: "+str(Util.roundF(getModule("SlaveAuctionModule").getMirriAffection()*100.0, 1))+"%")

		addButton("Sell Slave", "Sell one of your slaves on a slave auction", "sell_menu")
		if (getFlag("SlaveAuctionModule.upgradeSeePrefs", 0) >= 1):
			addButton("Bidders info", "Check the preferences of the next bidders", "bidders_info")
		addButton("Talk", "Ask her a few things", "chat_menu")
		addButton("Sex", "See if you can get a little kinky with her", "sex_menu_check")
		if (mirriRank >= 1):
			addButton("Upgrades", "Upgrade the Blacktail Market", "open_upgrades_menu")
		else:
			addDisabledButton("Upgrades", "You don't access to this yet")
		if (GlobalRegistry.getItemIDsByTagSlow(ItemTag.SoldByMirri).size() > 0):
			addButton("Buy", "See what you can buy from Mirri", "buyscene")
		if (canGoNextRank):
			if (mirriRank == 5):
				saynn("[b]Next rank will be the last. Make sure you are ready as you won't be able to go back.[/b]")

			addButton("Next rank!", "Progress the story further", "do_next_rank")
		addButton("Leave", "Enough talking", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["mirri"])
	if(state == "bidders_info"):
		saynn("Next bidders will have these preferences:")

		saynn(""+str(getModule("SlaveAuctionModule").getBidderInfo())+"")

		addButton("Back", "Enough peeking", "")
	if(state == "kinky_times_intro"):
		saynn("Feeling horny, you close the distance with Mirri, your stare checking her girly curves.. that she decided to put out on display. Her striped panties are sitting a little tight, the cloth outlining her kitty, highlighting the thin slit.")

		saynn("[say=pc]Why don't we put our side deals away for a second.. and get down to real business.[/say]")

		saynn("Mirri eyes you out.")

		saynn("[say=mirri]Huh. I don't think you can handle a Syndicate Agent, softie. I'm a little.. out of your league.. by a few lightyears at least~.[/say]")

		saynn("[say=pc]Oh yeah?[/say]")

		saynn("The catgirl sways her hips in a hypnotic way while circling you.")

		saynn("[say=mirri]You're welcome to be my obedient sextoy, though~. It gets very lonely on this.. here.[/say]")

		saynn("[say=pc]I guess real sex toys aren't satisfying you anymore.[/say]")

		saynn("Mirri puts on her mean eyes, her claws are out and ready to scratch..")

		addButton("Continue", "See what happens next", "sex_menu")
	if(state == "sex_menu"):
		saynn("How do you want to have fun with Mirri?")

		addButton("Dominate", "Try to overpower Mirri.. Might include a high amount of scratching and biting", "try_dominate")
		if (getFlag("SlaveAuctionModule.sexSubbedToMirri")):
			addButton("Be her toy", "Agree to let Mirri have it her way with you", "sub_menu")
		else:
			addButton("Be her toy", "Agree to let Mirri have it her way with you. Will unlock submissive sex options", "agree_be_toy")
		addButton("Back", "Back to the previous menu", "")
	if(state == "sub_menu"):
		saynn("How do you wanna sub to Mirri?")

		addButton("Painplay", "See what that crazy bitch can do to your body..", "sub_painplay")
		if (true):
			addButton("Pussy worship", "See what that crazy bitch will do to you with her pussy..", "sub_pussy")
		if (true):
			addButton("Puppy walkies", "See yourself become the bitch..", "sub_walkies")
		addButton("Back", "Back to the previous menu", "sex_menu")
	if(state == "chat_menu"):
		saynn("What do you wanna ask Mirri?")

		addButton("Wolf", "Who is that wolf with glowing black and gold fur", "ask_luxe")
		addButton("BDCC", "Ask her about how she stumbled upon the AlphaCorp prison", "ask_bdcc")
		addButton("Blacktail", "Ask her about her family", "ask_blacktail")
		addButton("Slaves", "Ask her about why she enslaves people", "ask_slaves")
		addButton("Collar", "Ask about them possible removing your collar", "ask_collar")
		addButton("Catgirl", "Ask her about her species", "ask_catgirl")
		addButton("Back", "Enough questions..", "")
	if(state == "ask_luxe"):
		saynn("[say=pc]That wolf.. with the black and gold fur. Who is he?[/say]")

		saynn("Mirri rolls her eyes.")

		saynn("[say=mirri]That's my dad.[/say]")

		saynn("That.. wasn't very obvious.. all things considered.")

		saynn("[say=pc]You don't seem particularly happy about that.[/say]")

		saynn("[say=mirri]Uh huh. If he'd hear me tell you that I'd be dead already. Or worse.[/say]")

		saynn("That's one way to parent.")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_bdcc"):
		saynn("[say=pc]How did you stumble upon BDCC?[/say]")

		saynn("[say=mirri]Is that what your stupid giant hamster cage called? Hah, didn't know.[/say]")

		saynn("She didn't even know the prison's name..")

		saynn("[say=mirri]I just scanned the whole dimension.[/say]")

		saynn("[say=pc]That's.. how is that even possible?[/say]")

		saynn("[say=mirri]I guess I'm just that smart~.[/say]")

		saynn("[say=pc]You're not gonna tell me how?[/say]")

		saynn("She shakes her head.")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_blacktail"):
		saynn("[say=pc]So you are.. Blacktail.[/say]")

		saynn("Mirri nods.")

		saynn("[say=mirri]Yeah. One of the Syndicate families. One of the most important ones.[/say]")

		saynn("[say=pc]Syndicate families?[/say]")

		saynn("She tilts her head, annoyed tones hiding in her voice.")

		saynn("[say=mirri]Yeah? You've been living under a rock or something?[/say]")

		saynn("[say=pc]More like, attached to a rock.[/say]")

		saynn("Mirri giggles softly.")

		saynn("[say=mirri]Oh, right, AlphaCorp thinks asteroid belts can protect their stupid silly space stations. Their brains are so one-dimensional.[/say]")

		saynn("[say=pc]Seems to work for them for now.[/say]")

		saynn("She shrugs.")

		saynn("[say=mirri]Syndicate is not a single entity. Syndicate is just many families under the same goal. Having many heads is better than one silly dictator. Brains over brute force, that was always our way.[/say]")

		saynn("[say=pc]And why is Blacktail one of the most important Syndicate families?[/say]")

		saynn("[say=mirri]Cause we enslave people, duh.[/say]")

		saynn("She has a point. But you're not sure if you see it.")

		saynn("[say=mirri]It's fun. And it pays well.[/say]")

		saynn("Interesting.")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_slaves"):
		saynn("[say=pc]Why are you.. selling slaves?[/say]")

		saynn("Mirri blinks, genuinely confused at your question.")

		saynn("[say=mirri]Are you dumb or something? I'm Blacktail.[/say]")

		saynn("[say=pc]So?[/say]")

		saynn("[say=mirri]SO? Yeah, I was right. You are just very-very..[/say]")

		saynn("You decide to cut her off before she insults you even more.")

		saynn("[say=pc]Listen. I know who you are. I know what your family does. I don't care that Blacktail is known for trading slaves. Why are YOU doing this?[/say]")

		saynn("Mirri shuts up and frowns at you, her claws are visible out.")

		saynn("[say=mirri]Fuck you. I do this for the credits and pleasure. Happy now, fucker?[/say]")

		saynn("[say=pc]Why not do something else?[/say]")

		saynn("Suddenly, she pulls her gun out and presses it against your skull. Ohh, the cat got very angry. An audible click makes your blood freeze.")

		saynn("[say=mirri]You're saying that I suck at this? That I should just give up? Yeah, fucker?[/say]")

		saynn("[say=pc]No, I don't.[/say]")

		saynn("Her mean eyes have that predator glow in them, her tail wagging aggressively.")

		saynn("[say=mirri]But you're implying that.[/say]")

		saynn("She pushes the gun more into your head, the barrel leaving a little circular imprint on above your brow already. Better not to push her further now..")

		saynn("[say=pc]Relax, Mirri, please. You're a good slaver, the best one that I know.[/say]")

		saynn("Mirri smiles, her cheeks receive a faint red glow.")

		saynn("[say=mirri]Well thank you, you're such a nice {pc.boy}.[/say]")

		saynn("She decides to put her gun away.")

		saynn("[say=pc]..you're welcome..[/say]")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_collar"):
		saynn("[say=pc]I have this collar on my neck.[/say]")

		saynn("[say=mirri]I've noticed, I like it a lot.[/say]")

		saynn("[say=pc]Yeah, sure. Can you or someone else.. help me remove it?[/say]")

		saynn("Mirri takes a closer look.")

		saynn("[say=mirri]Huh.[/say]")

		saynn("She grabs you by the collar and pulls closer. You can feel her warm breath on your chest as she closely inspects the device.")

		saynn("[say=mirri]Nope. It would be easier to cut your head off. Should I?[/say]")

		saynn("[say=pc]I'm good.[/say]")

		saynn("[say=mirri]It's a different design, I have no idea how to break this one. Looks like your shithole is really worried about the security of its fucktoys. Wrong priorities if you'd ask me.[/say]")

		saynn("[say=pc]I guess.[/say]")

		saynn("[say=mirri]I can see the bluespace transmitter. The thing is relaying its position constantly.[/say]")

		saynn("Does that mean what you think it means?")

		saynn("[say=mirri]You're lucky we have a jammer installed. Otherwise you'd be dead already.[/say]")

		saynn("[say=pc]Wait. But the jammer only covers this..[/say]")

		saynn("You realize that you have no idea if you're on a space station.. or on a planet.. you could be anywhere..")

		saynn("[say=pc]This.. place?[/say]")

		saynn("[say=mirri]Mhm.[/say]")

		saynn("[say=pc]So.. the slaves that you sell..[/say]")

		saynn("[say=mirri]Syndicate isn't stupid. Bluespace might be novel to you but it's a commodity here. Everyone has jammers.[/say]")

		saynn("Necessity pushes the progress forward..")

		saynn("[say=mirri]And if someone doesn't and AlphaCorp frees them.. that's their problem. I'm totally okay with enslaving and selling someone for the second time~.[/say]")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "ask_catgirl"):
		saynn("You focus your curious eyes on her black fur..")

		saynn("[say=pc]Interesting.. pattern.. for a human.[/say]")

		saynn("Mirri shrugs, her tail wagging a bit.")

		saynn("[say=mirri]Yes, I know, I know, I'm a hybrid and everything.[/say]")

		saynn("Her feline ears flick. Huh. That ponytail that she has is hiding something interesting.")

		saynn("[say=mirri]Just call me what I am. A catgirl.[/say]")

		saynn("A question lingers in your mind..")

		saynn("[say=pc]I'm curious.. Do you..[/say]")

		saynn("[say=mirri]..purr during sex? Only one way to find out~.[/say]")

		saynn("[say=pc]That's.. alright. but I had a different question.[/say]")

		saynn("Mirri giggles.")

		saynn("[say=pc]Do you have two pairs of ears?[/say]")

		saynn("She stops giggling and starts coughing instead.")

		saynn("[say=mirri]..really? That's what you're curious about?[/say]")

		saynn("You nod.")

		saynn("[say=mirri]Curiosity.. murdered the cat.[/say]")

		saynn("Looks like you're not gonna get the answer for that question..")

		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "agree_be_toy"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("You glance at Mirri, standing in front of you, with that predatory smile of hers.")

		saynn("Normally, you're the one in control. You dominate and enslave.. but today.. something about the way her blue feline eyes lock onto yours.. makes you hesitate. Maybe a Syndicate agent is indeed a little out of your league..")

		saynn("[say=pc]Mirri..[/say]")

		saynn("Your voice shows those little notes of uncertainty.. Mirri tilts her head slightly, a dangerous glint in her eyes. But then she realizes..")

		saynn("[say=mirri]Oh. Well, well, well..[/say]")

		saynn("She purrs while stepping closer and around you, her armored boots making a powerful cling each time. Her sheer confidence makes you subtly lower your head.")

		saynn("[say=mirri]Someone is acting.. like a subby bitch.[/say]")

		saynn("You showed a little weakness.. but you're not a bitch.. for sure..")

		saynn("[say=pc]I'm not..[/say]")

		saynn("You feel the sting of her claws as she digs them into your cheek, her padded palm covering your lips.")

		saynn("[say=mirri]Shh.. shut your mouth.. Toys don't talk.[/say]")

		saynn("Something is making you stay quiet after she pulls her hand away from your face. Mirri sees that and chuckles.")

		saynn("[say=mirri]You enslave people.. and yet.. inside.. you're the most subby thing that I know. That is so funny.[/say]")

		saynn("You open your mouth and try to say something.. but seeing Mirri frown makes you seize up, her claws are already following the lines of your throat, threatening..")

		saynn("[say=mirri]On your fucking knees, bi-i-itch.[/say]")

		saynn("She is savoring that last word for a long time.")

		addButton("Kneel?", "Do as she says maybe", "subintro_kneel")
	if(state == "subintro_kneel"):
		playAnimation(StageScene.Duo, "kneel", {npc="mirri", bodyState={leashedBy="mirri"}})
		saynn("You silently look at the dark wood under your feet.. while a storm of thoughts, kinky and not, is brewing in your head..")

		saynn("Mirri stares at your face, getting more and more annoyed by the second, her tail swiping the floor.")

		saynn("[say=mirri]Fine, I will make it easy.[/say]")

		saynn("A leash gets clipped to your collar by Mirri. She steps on the hanging bit with her boot and pins it to the floor, making you jerk your head down, your body bending forward.. but you're still standing, putting strain on that leash.")

		saynn("[say=pc]Kh..[/say]")

		saynn("[say=mirri]Lower, whore, lower. Kiss the fucking floor already.[/say]")

		saynn("Mirri pulls on the leash.. pretty much forcing you to bend lower and lower.. until you have to get on your knees before her. But she doesn't stop there..")

		saynn("[say=mirri]Say hi to my boot.[/say]")

		saynn("You resist.. but you also don't, your hands just resting on your knees while Mirri keeps making you kneel lower and lower.. until that boot is all that you can see.")

		saynn("[say=mirri]I'm waiting. Say hi, bitch.[/say]")

		saynn("She can not be serious.. That's humiliating, even for you.. Her boot is shifting a bit, rubbing that leash into the floor.")

		saynn("[say=mirri]Say hi or I will make you kiss it. Try me, subby bitch, see what happens.[/say]")

		saynn("[say=pc]H.. h-hi..[/say]")

		saynn("Mirri hears that and giggles, her boot instantly letting go of the leash, letting you sit up.")

		saynn("[say=mirri]Good {pc.boy}.. such a good little subby {pc.boy}.. I love you, you know?[/say]")

		saynn("Huh? You raise your stare and see her face.. still as mean as before.. while yours is blushing in deep red tones.")

		saynn("[say=mirri]What? I love me a little subby bitch~. You are a subby bitch, right?[/say]")

		saynn("The leash is still in her hand.. and you are still sitting on your knees before her.. obeying her orders.. There is only one correct answer.")

		saynn("You nod.")

		saynn("Mirri smiles, showing her sharp fangs to you. She leans closer to your ear, purring and whispering.")

		saynn("[say=mirri]I could bring you to that auction room at any point.. I could chain you to the ceiling.. and sell you off to the first bidders that I see..[/say]")

		saynn("You swallow audibly. She is not wrong..")

		saynn("[say=mirri]If you didn't notice yet.. I fucking hate AlphaCorp slaves..[/say]")

		saynn("After saying that with such a mean tone, she pulls away from your ear.. the tension in your body is making you squirm hard. You realize how one wrong move from you can basically kill you now..")

		saynn("Mirri's sly smile is making you melt.. you feel like you are ready to do anything.. She slides her paw into her striped panties and moans.")

		saynn("[say=mirri]I'm so fucking wet.[/say]")

		saynn("She looks at you, at the squirming mess beneath her feet.")

		saynn("[say=mirri]Arms behind your back.[/say]")

		saynn("They snap there instantly, your obedient eyes meet hers and try to avoid them. She tugs on the leash to get your attention.")

		saynn("[say=mirri]No, look at me. Look at Mirri, you AlphaCorp bitch.[/say]")

		saynn("You obey.. but your gaze is shaky.. you can't find rest, constantly shifting your position a bit..")

		saynn("[say=mirri]Pull my panties down.[/say]")

		saynn("Instinctively, you reach your hands out.. but Mirri catches them and digs her claws in.")

		saynn("[say=mirri]Wrong.[/say]")

		saynn("You bring your arms behind your back again..")

		saynn("Looks like you will have to do it some other way.")

		addButton("Teeth", "Pull them with your teeth", "subintro_teeth")
	if(state == "subintro_teeth"):
		playAnimation(StageScene.Duo, "kneel", {npc="mirri", npcBodyState={exposedCrotch=true}, bodyState={leashedBy="mirri"}})
		saynn("Having no access to your hands.. There is only one other way to do it. You squirm just thinking about it.. but Mirri is waiting, her impatient figure looming over you, boot tapping the wooden floor.")

		saynn("You begin leaning forward.. but not fast enough for the catgirl. She runs the leash between her legs and pulls on it, yanking you forward, your face meeting her inner thigh. So warm..")

		saynn("[say=mirri]So pathetic.[/say]")

		saynn("She uses her knee to push you back a little and guide you up to her panties. Lips parted, you catch the blue striped cloth between your teeth.. being careful to avoid biting anything sensitive.. and then begin tugging her panties down.")

		saynn("As you do it, the wetness clinging to her skin makes the fabric slightly damp in your mouth. The scent of her arousal fills your senses, you can't help but shudder as the material slides down further, finally revealing the drippy pink folds of her pussy in all its needy glory.")

		saynn("Mirri bites her lip, purring while looking down at you.")

		saynn("[say=mirri]See how wet I am? You did this, you know. Such a good {pc.boy}.[/say]")

		saynn("Your eyes betray you, you can't look away.. Her pussy is right in front of you now, inches from your lips, her juices dripping down onto the floor.. All you have to do is reach out.. touch.. taste.. bury yourself in that wet heat..")

		saynn("But as your breath hitches.. as you begin to reach.. Mirri's voice slices through the air, harsh and teasing.")

		saynn("[say=mirri]Don't even fucking think about it.[/say]")

		saynn("You stop.. the sight makes you desperate.. You almost let out a whine..")

		saynn("[say=mirri]You earned the right to look. But the rest you're yet to earn, little slave.[/say]")

		saynn("You look up at her.. awaiting your next order.")

		saynn("[say=mirri]How? Simple. Through abuse..[/say]")

		saynn("She digs her claws into your chin, sending agonizing sparks of discomfort throughout, drawing some blood even..")

		saynn("[say=mirri]..degradation..[/say]")

		saynn("Her digits find your lips and force themselves in between, making you suck them while she tightens the leash with her other hand.. and begins to slide her pussy along it, each chain link running into her clit and rubbing it..")

		saynn("[say=mirri]..and complete submission. Ah..[/say]")

		saynn("Mirri's body trembles, her pussy visible pulsing in your view while her claws dig into your tongue.. ouch.. and yet, you don't bite, just tasting your blood while watching that beatiful pussy orgasm in front of you..")

		saynn("[say=mirri]Such a good.. sextoy.. fuck yes-s-s..[/say]")

		saynn("The view is great.. but the moment is over just as quick as it started.. Mirri pulls up her panties and takes a step back, her hand detaching the leash.")

		saynn("[say=mirri]I loved it~. Get used to this, toy.[/say]")

		setFlag("SlaveAuctionModule.customMirriGreeting", "Came back for more~? Such a good {pc.boy}.")
		saynn("Just like that, she leaves you there, on your knees..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sub_painplay"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", bodyState={leashedBy="mirri"}})
		saynn("[say=pc]Hey, uh..[/say]")

		saynn("Before you can finish your sentence, a leash gets clipped to your collar, Mirri's predator eyes flashing brightly.")

		saynn("[say=mirri]You are SO coming with me.[/say]")

		saynn("[say=pc]Hey, chill![/say]")

		saynn("Mirri rushes off somewhere, her paw yanking on the leash, forcing you to follow.")

		addButton("Continue", "See what happens next", "sub_painplay_chains")
	if(state == "sub_painplay_chains"):
		playAnimation(StageScene.HangingDuo, "idle", {pc="pc", npc="mirri", bodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("market_market")
		saynn("The next moments are a complete blur..")

		saynn("Only the cold metal rattle of chains makes you snap out of it. They pull your wrists high above your head. You realize that you're standing on the auction stage, completely naked and exposed.. while Mirri is circling you, eyeing out your {pc.masc} body from every angle..")

		saynn("Each step she takes feels like a countdown, echoing out in your head.")

		saynn("[say=pc]Hey.. you're not planning to sell me, are you? Don't you fucking dare.[/say]")

		saynn("She pauses her step and stays quiet, staring you down with a sadistic smirk. In her paw, she toys with a leather nine-tailed whip, letting the tails brush teasingly against her fingers.")

		saynn("[say=mirri]I might. Scared, fucker~? You better be.[/say]")

		saynn("[say=pc]I'm not..[/say]")

		saynn("Snap! The first crack of the whip cuts through the air, landing square on your back, forcing you to lose your train of thought.")

		saynn("[say=pc]Argh..[/say]")

		saynn("[say=mirri]Shut up, little AlphaCorp slave. Right now you're nothing but my toy to play with. Mine to mark..[/say]")

		saynn("The many whip tails strike your back again, leaving lots of little stinging lines all around. Your body jerks involuntarily..")

		saynn("[say=mirri]Mine to hurt.[/say]")

		saynn("..but there is no time to process the pain before another leash follows, hitting your chest now"+str(" and making your {pc.breasts} jiggle.." if GM.pc.hasBigBreasts() else "")+".. and then another.. and another.. You cry out in shock, your body squirming and making the chains rattle, your {pc.feet} barely touching the ground.")

		saynn("[say=mirri]Mine to own.[/say]")

		if (GM.pc.hasPenis()):
			saynn("The last strike hits your {pc.thick} {pc.masc} thighs, forcing you to close your legs tightly. You feel the blood rushing down to your"+str(" locked" if GM.pc.isWearingChastityCage() else "")+" cock"+str(" and pussy slit" if GM.pc.hasVagina() else "")+"..")

		elif (GM.pc.hasVagina()):
			saynn("The last strike hits your {pc.thick} {pc.masc} thighs, forcing you to close your legs tightly. You feel the blood rushing down to your pussy slit..")

		else:
			saynn("The last strike hits your {pc.thick} {pc.masc} thighs, forcing you to close your legs tightly. You feel the blood rushing down to your crotch..")

		saynn("Mirri steps back and admires the many little marks that the whip has left.")

		saynn("[say=mirri]Work of art..[/say]")

		saynn("[say=pc]Ghh.. Too bad the creator went crazy..[/say]")

		saynn("She giggles.")

		saynn("[say=mirri]Nah. Let me fix your sentence.[/say]")

		saynn("Oh no.. Mirri visibly extends her claws and puts her paw on your neck. Her touch is deceptively light at first.. she trails her claws down your skin, over your shoulders, across your chest, just enough to make your skin tingle..")

		saynn("You can feel her warm breath on your ear..")

		saynn("[say=mirri]Too bad the creator didn't finish it yet..[/say]")

		saynn("Without warning, her claws [color=red]DIG IN[/color] - leaving angry red lines along your back that are quick to begin bleeding. Shit, she isn't playing around.. You gasp, jerking in the chains.. but the metal holds you firmly in roughly one place.")

		saynn("[say=mirri]Crazy is such a subjective word..[/say]")

		saynn("She keeps tearing through your skin, leaving more and more shallow cuts with her claws.. each one adding to the pain..")

		saynn("[say=pc]Ghh.h.. fu-uck.. agh.. C-crazy f-fucking bitch..[/say]")

		saynn("She just keeps going.. her half-feline body brushing against yours, sharing heat.")

		saynn("[say=mirri]To me you are the crazy one.. Thinking you can tame me.. The Legendary Syndicate Pussy Cat.[/say]")

		saynn("Her claws, sharp and unforgiving, trace over the fresh whip marks, digging into your skin enough to make your head spin.")

		saynn("[say=mirri]And you seem to like it just as much as me.[/say]")

		saynn("Her other hand is dragging the tips of the whip between your legs.. dangerously close to your most sensitive areas.."+str(" Your pussy dripping like it's a small fountain by now.." if GM.pc.hasReachableVagina() else "")+""+str(" Your cock hard as a rock, swaying from the constant squirming.." if GM.pc.hasReachablePenis() else "")+""+str(" Your caged up toy is leaking in its little prison.." if GM.pc.isWearingChastityCage() else "")+"")

		saynn("She forces eye contact with her claws and then grins.")

		saynn("[say=mirri]You're pathetic.. but it's adorable how much you try to hold on.. Too bad I'm going to break you anyway.[/say]")

		saynn("[say=pc]F-fuck you M-Mirri..[/say]")

		saynn("Hearing your words.. Mirri suddenly stops and puts the whip away for a second.")

		saynn("[say=pc]What are you..[/say]")

		addButton("Continue", "See what happens next", "sub_painplay_panties")
	if(state == "sub_painplay_panties"):
		playAnimation(StageScene.HangingDuo, "idle", {pc="pc", npc="mirri", npcBodyState={exposedCrotch=true}, bodyState={naked=true, hard=true}})
		saynn("She quickly pulls down her wet panties, exposing the moist pink folds to your eyes. The catgirl then takes her panties.. turns them into a ball of dripping cloth.. and forces it into your mouth.")

		saynn("[say=mirri]I told you to shut up, bitch.[/say]")

		saynn("Before you can even taste her juices, she suddenly sinks her fangs into your shoulder, biting down hard enough to draw a thin line of blood.. Her claws follow, raking across your back, leaving more stinging red marks everywhere.. So many that you arch your back and let out a muffled cry, the panties blocking your mouth..")

		saynn("[say=pc]Arghh-h..[/say]")

		saynn("Gasps keep escaping your lips as the pain overwhelms your senses.")

		saynn("Mirri purrs, hearing and feeling your pain. She licks the blood off from your shoulder and then licks her lips..")

		saynn("[say=mirri]Tasty. How can I sell such a tasty bitch?.. I have feelings for you, you know..[/say]")

		saynn("She stands in front of you, her hand gripping the whip again before raising it high. You feel like you know what is coming next.. but you can't stop yourself, the anticipation building in your bruised chest..")

		saynn("[say=mirri]Biggest one is.. love. I just love to hate you.[/say]")

		saynn("She brings the whip down one final time, leather snapping against your most vulnerable spot..")

		if (GM.pc.hasPenis()):
			saynn("The crack of the whip lands square on your dangling balls, sending a shockwave of pain through your entire body. Your knees buckle and give up, making you dangle off of the chains, your mind blanking as a sudden orgasm rips through you, your {pc.penis} pulsing and spilling {pc.cum} helplessly under her control.")

		elif (GM.pc.hasReachableVagina()):
			saynn("The whip tails strike your pussy exactly, the sharp stings sending a jolt of pain through your entire body. Your knees buckle and give up, making you dangle off of the chains, your mind blanking as a sudden orgasm rips through you, your thighs quivering as your slit releases a torrent of slick wetness down onto the floor..")

		else:
			saynn("The whip tails strike your crotch exactly, the sharp stings sending a jolt of pain through your entire body. Your knees buckle and give up, making you dangle off of the chains, your mind blanking as a sudden orgasm rips through you, your thighs quivering, your body convulsing hard..")

		saynn("You gasp into Mirri's panties, every muscle in your body tightening. The mixture of pain and pleasure blurs together, leaving you breathless in the end, just hanging limply from the chains..")

		saynn("Mirri watches with a satisfied grin, her clawed paw groping her own breasts while she is admiring the mess that she's made of you.")

		saynn("[say=mirri]F-fuck me.. now that's art worth masturbating over.. Not your limp-dick golden abstract shit.[/say]")

		saynn("All the cuts, all the wounds.. they ache.. and bleed. The room is getting and darker.. or.. is that your mind saying goodbye?")

		saynn("All you hear is..")

		saynn("[say=mirri]H-hey.[/say]")

		saynn("..before the dreamworld takes over.")

		addButton("Continue", "See what happens next", "sub_painplay_wakeup")
	if(state == "sub_painplay_wakeup"):
		aimCameraAndSetLocName("market_intro")
		playAnimation(StageScene.Sleeping, "sleep", {pc="pc", bodyState={naked=true}})
		saynn("The world seemed to have.. rotated.. while you were taking a nice quiet nap.")

		saynn("You feel a bed underneath you. One of the most comfiest beds that you have ever felt.. it's like a cloud compared to your usual prison ones..")

		saynn("You open your eyes..  and see yourself.. your body is still bruised and cut.. The signs of the abuse are all there.. but not the blood.")

		saynn("[say=mirri]Oh, you're up. Wanna continue?[/say]")

		saynn("[say=pc]No?[/say]")

		saynn("She chuckles.")

		saynn("[say=mirri]How was it?[/say]")

		saynn("[say=pc]..different.[/say]")

		saynn("Your voice barely above a whisper.")

		saynn("[say=mirri]I knew you would like it.[/say]")

		saynn("Her feline eyes shine sharply.")

		saynn("[say=mirri]Now get the fuck off my bed.[/say]")

		saynn("Right..")

		setFlag("SlaveAuctionModule.customMirriGreeting", "How are the bruises~?")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sub_pussy"):
		saynn("[say=pc]Uhm..[/say]")

		saynn("One noise from you is enough to make Mirri perk her ears.")

		saynn("You see her feline eyes.. and take a step back.. while she takes two.. forward.")

		saynn("[say=mirri]Don't make me pull out my gun.[/say]")

		saynn("[say=pc]Hey, no. Bad Mirri.[/say]")

		saynn("She tilts her head, her ass wiggles a bit like she is about to pounce..")

		saynn("[say=mirri]Bad? Being bad is for tame pussies.[/say]")

		saynn("Her tail is wagging. You notice her pulling out the chains..")

		saynn("[say=mirri]I am simply the best.. at being the worst. Get the fuck on the table.[/say]")

		saynn("She swipes everything off her desk, including her laptop.. and then pounces at you!")

		addButton("Continue", "See what happens next", "subpussy_table")
	if(state == "subpussy_table"):
		playAnimation(StageScene.SexOralTable, "hover", {pc="mirri", npc="pc"})
		saynn("In the next moment, you already feel the cold metal of the desk biting into your wrists and ankles as the chains lock you down to it. Only your head is sticking out slightly, hanging from its side, giving you some wiggle room but mostly forcing you to look up at the ceiling..")

		saynn("Mirri paces around you, her armored boots clicking ominously against the wooden floor, her blue eyes shining with wicked delight as she watches you struggle. The more you try to escape.. the more you realize that the resistance is futile. Mirri is a slaver after all..")

		saynn("[say=pc]You are one crazy girl.[/say]")

		saynn("[say=mirri]Look at you. I thought you're tough, big and scary~. But now, you're nothing more than my personal furniture.[/say]")

		saynn("She giggles softly, pacing in your view more, flashing her exposed butt and thighs, her paws tugging on her striped panties, causing the outline of her little slit to show more prominently.")

		saynn("[say=mirri]You called this pussy bad, didn't you.. Such a rude fucker you are..[/say]")

		saynn("[say=pc]Hey, listen.. I didn't say that..[/say]")

		saynn("She presses a button on her fancy desk.. that makes it start to go down.. your head getting dangerously close to her inner thigh level with each second.")

		saynn("When that's done, Mirri positions herself just above you, spreading her legs slightly, the fabric of her panties right above your face. You can smell her, the intoxicating scent of her flower is filling your lungs, and it takes everything in you to not squirm.")

		saynn("[say=mirri]Do you like 'em~?[/say]")

		saynn("Your throat tightens as you feel her clawed digits land on your neck, tracing along the skin.")

		saynn("[say=mirri]I can't hear you..[/say]")

		saynn("Your throat tightens even more as she squeezes it..")

		saynn("[say=pc]I.. gh.. y-yes, sure. Great panties, girl.[/say]")

		saynn("[say=mirri]Make love, not war, is that what they say? You know what happens when you combine them?[/say]")

		saynn("She sways her butt teasingly, making the cloth shift around, creating folds around her natural folds.")

		saynn("[say=pc]Uh.. I don't think I do.[/say]")

		saynn("[say=mirri]Torture~. I'm gonna torture you, {pc.name}. I'm gonna torture you like no one else has ever done.[/say]")

		saynn("Her digits sneak under your collar, eliminating the small amount of space that you had there. Looking at her pussy behind her panties without being able to touch it could be considered cruel.. but it's not exactly a torture, is it..")

		saynn("[say=pc]You're.. gonna sit on my face? That's the torture?[/say]")

		saynn("She gets a better grip.. You feel like something big is about to happen..")

		saynn("[say=mirri]Ever heard of.. waterboarding?[/say]")

		addButton("Continue", "See what happens next", "subpussy_start")
	if(state == "subpussy_start"):
		playAnimation(StageScene.SexOralTable, "lick", {pc="mirri", npc="pc"})
		saynn("You barely have time to react before Mirri suddenly grabs you by the collar and pulls on it while lowering herself and pressing her crotch hard against your face. Her heat is radiating through the fabric as she grinds her pussy against your face without warning.")

		saynn("[say=mirri]This is pussyboarding! I will make your sorry ass drown in my cunt.[/say]")

		saynn("She growls, her voice dark and intimidating. Her striped panties begin to get wet with arousal.. the scent of her juices is all that you can breathe in.. the air is in a very short supply now.")

		saynn("[say=pc]Khh..[/say]")

		saynn("[say=mirri]You're going to lap up every drop that comes off my pussy like a good puppy bitch.[/say]")

		saynn("She doesn't give you a choice exactly, her hips moving in aggressive, tight circles as she rubs herself all over your face, smearing her wetness across your lips and chin. The slick fabric clings to your mouth, pressing against you as she grinds harder, her thighs trapping your head, forcing you into her heat. You feel yourself suffocating..")

		saynn("[say=mirri]What? You're gonna drown? Or you're gonna open your fucking mouth already.[/say]")

		saynn("Your body obeys before your mind can catch up, your lips parting as her soaked panties push into your mouth. The taste of her pussy juices spreads across your tongue, salty and strong. Mirror moans softly as she feels you struggling. Her hips are speeding up, grinding becoming rougher, more desperate, as she forces her dripping cunt onto your face.")

		saynn("[say=mirri]That's right. Nothing but a pussy licker..[/say]")

		saynn("Her words sting.. but her body presses harder, grinding her wet panties into your mouth, the fabric soaked through with her juices. Her hips are bucking as she loses herself in the sensations, her pussy practically leaking into your mouth.")

		saynn("[say=mirri]Pathetic little bitch.. I love using you.. like a fucking rag.. drowning in my cunt.[/say]")

		saynn("Your head spins from the lack of air.. her scent, her taste.. everything about her is overwhelming your senses. You feel yourself losing the last bits of control, submitting fully to her as she rides your face with reckless abandon..")

		addButton("Continue", "See what happens next", "subpussy_breather")
	if(state == "subpussy_breather"):
		playAnimation(StageScene.SexOralTable, "hover", {pc="mirri", npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true}})
		saynn("Just when you think you might pass out.. Mirri finally pulls back, gasping softly as she steps away, her breathing almost as heavy as yours. You're gasping for air, your face soaked with her juices, the taste of her still thick on your tongue.")

		saynn("[say=mirri]Hah.. Think I'm done yet? I'm not one of those soft bitches.[/say]")

		saynn("She hooks her clawed thumbs into the waistband of her striped panties and pulls them down, revealing her soaked pink blushing pussy. Her lips are shining, drenched with her juices.")

		saynn("Mirri smirks down at you, her eyes have that sadistic light in them..")

		saynn("[say=mirri]Look at this..[/say]")

		saynn("She purrs, spreading her legs slightly, her wet pussy on full display with multiple slick ropes of juices hanging between the thighs.")

		saynn("[say=mirri]I love you.. See how wet you made me, you filthy little slut?[/say]")

		saynn("You can't tear your eyes away.. You feel like you will do anything for her by this point..")

		addButton("Continue", "See what happens next..", "subpussy_masturbate")
	if(state == "subpussy_masturbate"):
		playAnimation(StageScene.SexOralTable, "grind", {pc="mirri", npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true}})
		saynn("Mirri steps forward again, positioning herself over your face once more, her naked slit hovering inches above your mouth.")

		saynn("[say=mirri]I want to feel you choke on my juices.. Drown in me, you fuck..[/say]")

		saynn("And with that, she sits on your face, her wet hot pussy resting on your face, covering your mouth. As soon as that happens, you begin polishing her folds with your tongue, gathering all the juices that you can get to.. before swallowing them all.")

		saynn("[say=mirri]Ah..[/say]")

		saynn("She doesn't grind your face as much anymore.. just using your face as a nice firm seat, her slick folds spreading across your lips, the taste of her raw arousal flooding your taste sensors.")

		saynn("[say=mirri]Faster, bitch, faster.. I love you, {pc.name}.. I love you so fucking much.. S-stupid sext-toy..[/say]")

		saynn("While you're busy eating her out, her clawed digits find her clit and proceed to rub it fast. Passionate bright moans begin to fill the dark room, her hips bucking again, her thigh muscles tensing up..")

		saynn("The more you lick her up.. the more she teases her clit.. the deeper her breathing becomes, her voice breaking as she loses herself in the moment, squirming above you like a woman possessed.")

		saynn("[say=mirri]Swallow it all.. Every drop, you useless fuck.. I want to love you.. feel you.. choking on my cum.[/say]")

		addButton("Continue", "See what happens next", "subpussy_mirricum")
	if(state == "subpussy_mirricum"):
		playAnimation(StageScene.SexOralTable, "grindfast", {pc="mirri", npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true}})
		saynn("Suddenly, her thighs clamp around your head, squeezing your head tightly.")

		saynn("[say=mirri]AHhh-h-![/say]")

		saynn("Mirri throws her head back as her juices are gushing into your mouth in a hot, overwhelming flood. You lose your ability to breathe again, her wetness is coating your lips and chin as she pushes you deeper into her cunt.")

		saynn("She growls, her voice breathless as she forces you to swallow every drop of her squirt. Her body is shaking the feral force of her release. You have no choice but to swallow, her hips moving in slow, trembling circles.")

		addButton("Continue", "See what happens next", "subpussy_after")
	if(state == "subpussy_after"):
		playAnimation(StageScene.SexOralTable, "tease", {pc="mirri", npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true}})
		saynn("Finally, after what feels like an eternity, she pulls back, panting heavily as she stares down at you with a satisfied, wicked grin. Her pussy still drips juices onto her thighs..")

		saynn("[say=mirri]Such a good little toy. Proving it again and again that it was worth it to keep you.[/say]")

		saynn("She purrs, her voice soft but still dripping with that cruel satisfaction.")

		saynn("[say=mirri]Let's get you off my fucking desk.[/say]")

		setFlag("SlaveAuctionModule.customMirriGreeting", "You liked my desk, didn't you? It's a nice sturdy desk.")
		addButton("Continue", "See what happens next", "endthescene")
		addButtonWithChecks("Extra humiliation", "Ask her to pee on you..", "subpussy_pee", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])
	if(state == "subpussy_pee"):
		playAnimation(StageScene.SexOralTable, "rub", {pc="mirri", npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true}})
		saynn("You find yourself craving more.. craving extra humiliation.")

		saynn("Before she unchains your wrists and ankles.. you decide to stop her.")

		saynn("[say=pc]Mirri.. I want you..[/say]")

		saynn("[say=mirri]I noticed~.[/say]")

		saynn("[say=pc]No. I want you to.. pee on me.[/say]")

		saynn("Her eyes narrow, sharp as blades, as she stares at you. For a moment, there is silence, just the sound of your ragged breathing and the distance hum of random machinery in the background. Then.. Mirri bursts into laughter, throwing her head back, her fangs shining in the dim light.")

		saynn("[say=mirri]AHAHA. You.. what?[/say]")

		saynn("She steps forward, her boots clacking against the floor as she looms over, her hips swaying provocatively. Her predator eyes lock onto yours. She leans in even lower.. down to your level, her lips bear your ear.. her breath hot against your skin as she whispers, her voice dripping with mockery.")

		saynn("[say=mirri]You're.. that.. pathetic, huh? Really? You are lower than a worm.. You're filth.[/say]")

		saynn("Her words cut deep.. and yet.. there is a twisted thrill in all of this.. Your face blushes red.. her juices are still there on your face.. and yet, you're asking for more. You nod.")

		saynn("[say=pc]Yes. Please, Mirri..[/say]")

		saynn("She stands up and stares at you for a moment, a mixture of disgust and delight swirling in her eyes. Slowly, a smile creeps back onto her lips, the corners of her lips curling up.")

		saynn("[say=mirri]Fine. You want to be my toilet that badly? I could use one. But I ain't pissing on my desk, no fucking way. You understand what I am saying?[/say]")

		saynn("You're going to have to.. drink it all.. Every. Last. Drop..")

		saynn("You nod.. Without another word, she stands over your face again, her crotch hovering inches above your face, her legs spread wide as she positions herself just right.")

		saynn("Mirri bites her lips while looking down at you, her digits teasing her clit a little more. Her juicy pink pussy is up in your face again in its full glory..")

		saynn("[say=mirri]Get ready, pathetic little toy.[/say]")

		addButton("Continue", "See what filthy things will happen next..", "subpussy_peeactual")
	if(state == "subpussy_peeactual"):
		playAnimation(StageScene.SexOralTable, "peefem", {pc="mirri", npc="pc", npcBodyState={hard=true}, bodyState={exposedCrotch=true}})
		saynn("Seconds feel like hours.. You can feel the muscles of her crotch tensing up.. again and again..")

		saynn("You hear her soft grunt.. and then it happens. A sudden, warm stream of piss sprays down onto your face. But, before the mess gets too bad, you clamp your lips around her pisshole and let her start to flood your mouth with her golden juice.")

		saynn("[say=mirri]Drink it. Swallow. Now![/say]")

		saynn("The taste is awful. it's gross.. hot.. bitter.. acrid.. it's simply the worst tasting fluid you have ever tasted. And yet, you force yourself to swallow, gulping down her piss fast.. and then again and again.")

		saynn("Mirri watches, her smirk shining brightly as she keeps the steady yellow stream flowing, the warm liquid going straight into your mouth..")

		saynn("[say=mirri]Ah.. Feels nice~. This is what you wanted, isn't it? You're so pathetic, drinking up my piss like a thirsty little slut. Are you proud of yourself?.. Because I'm proud of you, love~.[/say]")

		saynn("You choke on her piss, your body trembling.. and yet, you submit entirely to her cruel methods. You keep swallowing, drinking her piss, feeling it fill your mouth again and again. The humiliation.. is intoxicating.")

		saynn("[say=mirri]My favorite little toy.[/say]")

		saynn("Her golden stream finally begins to slow down.. making it able for you to catch a break. After she is done, Mirri just stands there, towering over you, her eyes shining brightly.")

		saynn("[say=mirri]Swallowed every drop, huh? Of course you did. You're a good pussy licker and you're an even better toilet~. Did you like it?[/say]")

		saynn("[say=pc]T-thank you, Mirri.. Y-yes.. This is great.. you are great.[/say]")

		saynn("She smiles, a little blush tints her cheeks red.")

		saynn("[say=mirri]Well thank you, kitty likes hearing nice words. I need my desk though. So let's get you the fuck down.[/say]")

		setFlag("SlaveAuctionModule.customMirriGreeting", "I ain't gonna tongue with you for some time. Not after what you begged me to do last time.")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sub_walkies"):
		saynn("You're feeling a bit.. subby.. but you make sure not to show it. You put on a stone-cold face expression and try to be as motionless as possible in front of Mirri.")

		saynn("She looks at you.. and raises a brow. Fuck. Where do you look? At her! Right. You look her into the eyes.")

		saynn("[say=mirri]Oh? My lovely little sextoy is feeling subby?[/say]")

		saynn("You don't even know anymore.. Maybe it was the way you glanced at her.. or the way you hesitated, just a split second longer than usual.")

		saynn("[say=pc]No![/say]")

		saynn("Too late, Mirri's eyes have already lit up, a dangerous, predatory glint flashing through them as she tilts her head, her lips curving into a smirk.")

		saynn("You step back, she steps forward. You hear purring.. dark purring.. purring that gradually crossfades into growling.")

		saynn("[say=pc]Wait, Mirri, wait! Let's not rush to action and just talk about it![/say]")

		saynn("[say=mirri]Do you love me?[/say]")

		saynn("One heck of a question to ask in this situation.")

		saynn("[say=pc]Of course, baby.[/say]")

		saynn("[say=mirri]Shh.. Fine. I won't do anything.[/say]")

		saynn("She suddenly stops dead in her tracks. You can only phew.. It feels like you have defused a bomb.")

		saynn("[say=pc]..crazy..[/say]")

		saynn("[say=mirri]But now I will![/say]")

		saynn("Oh shit.")

		addButton("Continue", "See what happens next", "subwalkies_suit")
	if(state == "subwalkies_suit"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="mirri", npcBodyState={naked=true, leashedBy="mirri", hard=true}})
		saynn("Before you can react, Mirri tackles you and drags you off to the special wardrobe that she has. Your heart sinks when you see what kind of restraints she pulls out.")

		saynn("[say=mirri]Hold still, you stupid mutt! Don't make me grab the buttplug tail![/say]")

		saynn("She forces your knees and elbow into special leather caps that she then tightens using straps and locks with small padlocks, forcing your wrists to your shoulders and your ankles to your thighs.. making you stand on all fours.")

		saynn("[say=mirri]PERFECT![/say]")

		saynn("[say=pc]Mirri, fucking wait, I-..[/say]")

		saynn("She snaps the leash onto your collar with a sharp click, cutting you off. Her eyes narrow.")

		saynn("[say=mirri]Pups don't talk.[/say]")

		saynn("She tugs on the leash, enough to make you jerk your head up.")

		saynn("[say=mirri]A pup is not gonna say a word unless I let them. And you? You're nothing but a little bitch right now![/say]")

		saynn("You open your mouth to argue.. to say something.. anything. But she is quick to crouch and grab you by the muzzles, forcing your lips shut. Her face is inches away from yours, her hot breath tickling your cheek.")

		saynn("[say=mirri]I said.. Shut the fuck up. Do I really need to remind you how a real bitch behaves?[/say]")

		saynn("She gets up and takes a few steps back, as much as the leash allows, her eyes never leaving you.")

		saynn("[say=mirri]Puppy needs to learn.[/say]")

		saynn("You try to speak up again but she just yanks the leash sharply, your throat getting extremely tight as the collar digs in.")

		saynn("[say=mirri]Stop it, you fuck. Pups don't use words. They obey.[/say]")

		saynn("Mirri leans down and gives the leash a soft tug, her voice softening up and becoming all sweet.")

		saynn("[say=mirri]Now, be a good {pc.boy} and give Mirri your paw.[/say]")

		addButton("Give paw", "Obey her words", "subwalkies_paw")
		addButton("Refuse", "You don't have that many spare paws to just hand them to others!", "subwalkies_refusepaw")
	if(state == "subwalkies_paw"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="mirri", npcAction="paw", npcBodyState={naked=true, leashedBy="mirri", hard=true}})
		saynn("You know how it's gonna end if you don't obey.. So might as well.")

		saynn("You lower yourself.. before awkwardly pushing your top part of the body off the floor in order to sit down.")

		saynn("Mirri is crouching near, her eyes judging you.")

		saynn("[say=mirri]Mhm?[/say]")

		saynn("With nothing better to do, you raise your.. paw.. and offer it to Mirri.")

		saynn("[say=mirri]Yay![/say]")

		saynn("She shakes it like crazy and then gives you lots of headpats.")

		saynn("[say=mirri]Good {pc.boy}! Such a good fucking {pc.boy}! See, you can obey when you want to.[/say]")

		saynn("Might as well commit..")

		saynn("[say=pc]A-..woof.. awoof..[/say]")

		saynn("More scritches and pats come your way, Mirri rubs your face and gives you a small kiss.")

		saynn("[say=mirri]Lovely. Now let's go explore your stupid station. Walkies time![/say]")

		saynn("Your heart sinks..")

		saynn("[say=pc]Uh..[/say]")

		saynn("Mirri raises a brow.")

		saynn("[say=mirri]What was that? You don't want walkies?[/say]")

		saynn("[say=pc]Uh.. um.. woof..[/say]")

		saynn("[say=mirri]I knew you would![/say]")

		saynn("She opens a blue glowing rift.. and steps through, her hand tugging on the leash.")

		saynn("Welp..")

		addButton("Continue", "See what happens next", "subwalkies_tp")
	if(state == "subwalkies_refusepaw"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="mirri", npcAction="sad", npcBodyState={naked=true, leashedBy="mirri", hard=true}})
		saynn("You hesitate, still trying to maintain at least some shred of dignity. Your muscles are tensing, resisting the degrading command.")

		saynn("Mirri sees that, her expression shifting from amusement to cold frustration. She steps closer, her armored boot finding your back and resting on it. Her fingers wrap around the stunbaton that is hanging from her leg.")

		saynn("[say=mirri]You're going to be a stubborn little bitch?[/say]")

		saynn("She growls.. but you don't budge.")

		saynn("With a swift motion, she flicks the stunbaton to life, the crackling sound of electricity filling the air. She brings it closer and closer.. just inches away from your face now. Her eyes are locked on yours.")

		saynn("[say=mirri]Last chance, whore. Give paw.[/say]")

		saynn("You swallow hard, fear making all your insides shrink.. but you still can't bring yourself to comply.")

		saynn("Mirri's eyes darken. She clicks her tongue in disapproval. Then, without warning, she presses the weapon against your arm.")

		saynn("[say=pc]ARgh![/say]")

		saynn("The jolts of electricity shoot through your body, sharp and painful, your muscles spasming uncontrollably for a brief moment, making you kiss and hug the wooden floor with all your paws.")

		saynn("[say=mirri]Bad pup. But, you know.. there is a good side to this.[/say]")

		saynn("She smiles, putting the baton away.")

		saynn("[say=mirri]I can do this all day.[/say]")

		saynn("She crouches down near you.")

		if (GM.pc.hasPenis()):
			saynn("[say=mirri]Maybe next time I will press it against something else.. Like your cock. Bet you'd be a real obedient little puppy then, won't you?[/say]")

		elif (GM.pc.hasVagina()):
			saynn("[say=mirri]Maybe next time I will press it against something else.. Like your cunt. Bet you'd be a real obedient little puppy then, won't you?[/say]")

		else:
			saynn("[say=mirri]Maybe next time I will press it against something else.. Like your ass. Bet you'd be a real obedient little puppy then, won't you?[/say]")

		saynn("Your heart races.. the humiliation and fear mix in your stomach..")

		saynn("Slowly, reluctantly, you raise your paw as best as you can.")

		saynn("[say=mirri]Good {pc.boy}. But we're over that now. Let's go for some walkies, I know just the spot![/say]")

		saynn("You get a strong feeling that you know exactly what she means by the.. spot.")

		saynn("Mirri opens the blue glowing rift and invites you to crawl through.. you see your cell through it..")

		saynn("[say=pc]Woo-oof..[/say]")

		saynn("Somehow that noise that came out on its own..")

		saynn("[say=mirri]What? It will be fun![/say]")

		saynn("She yanks you through..")

		addButton("Continue", "See what happens next", "subwalkies_tp")
	if(state == "subwalkies_tp"):
		aimCameraAndSetLocName("cellblock_corridor_middle")
		playAnimation(StageScene.PuppyDuo, "walk", {pc="mirri", npcAction="walk", npcBodyState={naked=true, leashedBy="mirri", hard=true}, flipNPC=true})
		saynn("Mirri tugs you through the corridors of the prison. She looks around a lot, checking out the architecture of this place.. the place that has become a new home for you.")

		saynn("[say=mirri]I don't know what's more stupid, concrete and metal or wood and metal.[/say]")

		saynn("The many inmates that you walk past stop just to check out the fancy leashed pup that is being led by a sexy pantsless catgirl. You two sure are standing out..")

		saynn("[say=mirri]Yes, you all can pat. Just be careful, {pc.he} might bite.[/say]")

		addButton("Continue", "See what happens next", "subwalkies_moreexplore")
	if(state == "subwalkies_moreexplore"):
		aimCameraAndSetLocName("main_punishment_spot")
		playAnimation(StageScene.PuppyDuo, "walk", {pc="mirri", npcAction="walk", npcBodyState={naked=true, leashedBy="mirri", hard=true}, flipNPC=true})
		saynn("Mirri's grin never goes away as she leads you through the prison corridors, her naked half-furry hips swaying confidently, her feline tail playfully flicking behind her as she tugs you along, her striped panties proudly presented to the eyes of others.")

		saynn("You encounter stairs.. your true nemesis. You just about manage to pull your paws onto the first step.. but the next ones Mirri has to help you with, janking you up by the leash.")

		saynn("[say=mirri]Such a clumsy animal, I love you.[/say]")

		saynn("As you walk past the punishment area, Mirri takes note of the many pillories.. with some of them being used.")

		saynn("[say=mirri]Oh wow. Maybe your stupid little prison has some flair to it. I'm sure the captain stole this idea from one of our prisons. You guys steal everything that isn't bolted down.[/say]")

		saynn("She sees the yard.")

		saynn("[say=mirri]Oh, perfect. Let's go play on some grass![/say]")

		addButton("Continue", "See what happens next", "subwalkies_nova")
	if(state == "subwalkies_nova"):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="nova"})
		aimCameraAndSetLocName("yard_northCorridor")
		saynn("Mirri follows the stone pathways while you are touching the grass with your new puppy paws..")

		saynn("But as you turn around a corner, you suddenly run into another guard.")

		saynn("[say=nova]Huh. Oh wow, such an adorable pup~.[/say]")

		saynn("[say=mirri]Takes one to know one.[/say]")

		saynn("A husky blocks your path. Her attention was glued to you.. but then the naked butt stole it.")

		saynn("[say=nova]Interesting armor.. configuration. You're one of the newbies? Don't remember seeing you around. What's your name?[/say]")

		saynn("Nova is trying to make out the badge. The tension is slowly rising..")

		saynn("[say=mirri]Hey, well, you're not running the default kit either, are you?[/say]")

		saynn("Nova looks into her wrist computer that is built into her armor.")

		saynn("[say=nova]You didn't answer my..[/say]")

		saynn("Mirri blocks the screen with her paw, blocking it for Nova. Mirri goes full out, her tail wagging.")

		saynn("[say=mirri]I recognize that. That is Syndicate tech. Should I file a report on your ass? Makes you look like some kind of spy, you know.[/say]")

		saynn("Nova starts reaching for her stun baton.")

		saynn("[say=nova]What is. Your. Name.[/say]")

		saynn("The bluff clearly didn't work.")

		saynn("[say=mirri]It's.. Kirri. Happy, stupid mutt?[/say]")

		saynn("Nova squints and wraps her digits around the handle of her weapon.")

		saynn("[say=nova]Your badge clearly says Officer Lyra.[/say]")

		saynn("[say=mirri]That is my.. that's my other name. And yes, I'm new around here. Don't be stupid.[/say]")

		saynn("Mirri's bullshit clearly isn't working. Her own paw begins to reach.. it begins to reach for her gun. You really don't like where this is going now..")

		saynn("[say=mirri]You know, puppy.. I am just giving my personal little bitch a walk. I think we should just walk past each other and pretend that this little misunderstanding didn't happen.[/say]")

		saynn("[say=nova]Oh yeah? Try me.[/say]")

		saynn("Her paw reaches further..")

		saynn("[say=mirri]I will. You are making a huge mistake. This mistake might just cost you.. everything.. you know?[/say]")

		saynn("[say=nova]I think I'm fixing a mistake right now. You and I are gonna go pay the warden a visit and see what they have to say.[/say]")

		saynn("An unstoppable force has met an immovable object.. This is not how you saw your walkies going.")

		saynn("Mirri is giving you a sneaky stern look.")

		addButton("Do nothing", "Just let it happen", "subwalkies_donothing")
		addButton("Bark!", "Be a puppy", "subwalkies_barksavepuppy")
	if(state == "subwalkies_donothing"):
		playAnimation(StageScene.Solo, "defeat", {pc="nova"})
		removeCharacter("mirri")
		GM.pc.setLocation("yard_northCorridor")
		saynn("You decide to see how this will play out.")

		saynn("Mirri frowns at you.. really hard. But you just shrug with your shoulders.")

		setFlag("SlaveAuctionModule.customMirriGreeting", "You fuck. You almost made me blow my cover, you stupid bitch. I would have easily made 6 new holes in that guard's face if I wanted to. Ugh, fuck you. I could destroy your whole stupid prison at any point, you know!? I need to calm down, bring me a slave to sell or something.")
		saynn("[say=nova]So? What is it gonna.. AGH![/say]")

		saynn("[say=mirri]Shut up.[/say]")

		saynn("A bright flash blinds you.. Nova hits the floor in an instant.")

		saynn("The last thing you see is Mirri taking off in a random direction.. before disappearing into thin air.. like a ghost.")

		saynn("[say=nova]Fuck.. My eyes. What the fuck what that.[/say]")

		saynn("As you recover, you notice Nova.. on her knees.. seemingly fine.")

		saynn("Head is still buzzing like hell.")

		saynn("[say=nova]Shit.. Where is that bitch? Did she disappear or something?[/say]")

		saynn("Nova looks at you.")

		saynn("[say=nova]Who is that girl?[/say]")

		saynn("Probably best to play it dumb. You crawl up to the husky and nuzzle her face.")

		saynn("[say=pc]W-woof..[/say]")

		saynn("[say=nova]Adorable. Oh well, newbies these days, holy shit, they seriously need to learn their place.[/say]")

		saynn("Nova gives you scritches and pats.")

		saynn("[say=nova]You want more walkies?[/say]")

		saynn("You shake your head.")

		saynn("[say=nova]Aww. If you do, just hit me up, I love adorable puppies~. Let's get you out.[/say]")

		saynn("Nova helps you to remove the bitchsuit.")

		saynn("[say=nova]Don't get into trouble now. Or do~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "subwalkies_barksavepuppy"):
		playAnimation(StageScene.PuppySexOral, "tease", {pc="nova", npc="pc", npcBodyState={naked=true, hard=true}})
		saynn("Before the things can escalate any further, you decide to get your paws in this conflict. Without thinking much, you let out a loud cute bark, breaking the tension.")

		saynn("[say=pc]WOOF![/say]")

		saynn("Second bark comes soon after.. and then a few more. You wiggle in your restraints like an excited puppy.")

		saynn("Nova's expression softens, she stops gripping the handle of her weapon and pats you instead.")

		saynn("[say=nova]Awww. This hecking pup is so adorable, I can't.[/say]")

		saynn("Mirri raises a brow.. but stops reaching for her gun. Her smirk returns.")

		saynn("[say=mirri]Yeah, {pc.he} needed some walkies.[/say]")

		saynn("[say=nova]Make sure to treat {pc.him} well~.[/say]")

		saynn("[say=mirri]Oh, of course. That bitch is gonna get my personal treatment~.[/say]")

		saynn("You keep up the act.. nuzzling the hand that pats you and barking enthusiastically.")

		saynn("[say=nova]But yeah. Make sure you report to the warden later, newbie.[/say]")

		saynn("[say=mirri]Of course. I will be sure to do that. It's not like I can just disappear from this place.[/say]")

		saynn("Nova nods softly.")

		saynn("[say=nova]Yeah-h-h.. Stay cute, puppy.[/say]")

		saynn("The guard gives you both one last glance before getting up.. and continuing her patrol.")

		addButton("Continue", "See what happens next", "subwalkies_aftersave")
	if(state == "subwalkies_aftersave"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="mirri", npcBodyState={naked=true, leashedBy="mirri", hard=true}})
		removeCharacter("nova")
		saynn("As soon as Nova is gone, Mirri lets out a soft, relieved laugh.")

		saynn("[say=mirri]Huh. That went better than expected.[/say]")

		saynn("She leans down and boops you on the nose.")

		saynn("[say=mirri]Love you, puppy, good idea to trick that bitch. I think my lovely bitch deserves something as a reward.. something big.[/say]")

		saynn("Something big.. She tugs on the leash, inviting you to follow back to your cell..")

		addButton("Follow", "See what she will do with you next..", "subpuppy_back")
	if(state == "subpuppy_back"):
		aimCameraAndSetLocName("market_intro")
		saynn("As pushes you into the rift that her fancy toys have created.. you end back in her room.")

		saynn("Mirri's smirk widens as she jogs to her special wardrobe, her eyes glowing in the dimly-lit space.. Her tail flicks excitedly as she rummages through her wide collection of toys.")

		saynn("[say=mirri]You know, puppy..[/say]")

		saynn("She purrs.. before pulling out a canine-shaped strapon dildo with a thick knot at the base.")

		saynn("[say=mirri]I think it's time I breed my bitch~.[/say]")

		addButton("Continue", "See what happens next", "subpuppy_putonstrapon")
	if(state == "subpuppy_putonstrapon"):
		playAnimation(StageScene.PuppySexOral, "tease", {pc="mirri", npc="pc", npcBodyState={naked=true, hard=true, leashedBy="mirri"}, bodyState={exposedCrotch=true}})
		saynn("Your heart begins to pound as she straps the harness around her waist, the silicone length now swaying menacingly between her legs, covering up her kitty. Obviously it has that bulbous knot at the base.. what else would Mirri use..")

		saynn("[say=pc]W-woof..[/say]")

		saynn("She snaps her fingers and points to the floor in front of her.")

		saynn("[say=mirri]Hah. I knew you would like it. Now come here like a good bitch.[/say]")

		saynn("You crawl over, still wearing the pieces of that bitchsuit.. Mirri crouches and grabs a fistful of your hair, forcing your face toward the toy, rubbing the tip of the dildo against your closed lips.")

		saynn("[say=mirri]I can always go in dry if you want.[/say]")

		saynn("Looks like saying no now is not an option..")

		addButton("Suck", "Get that toy wet", "subpuppy_suck")
	if(state == "subpuppy_suck"):
		playAnimation(StageScene.PuppySexOral, "sex", {pc="mirri", npc="pc", npcBodyState={naked=true, hard=true, leashedBy="mirri"}, bodyState={exposedCrotch=true}})
		saynn("Slowly, you part your lips, feeling the cool silicone press against your tongue. Mirri isn't exactly the soft kind, instantly pushing more of her new length deeper into your mouth, grinning wickedly as the pointy tip triggers your gag reflex.")

		saynn("[say=mirri]Good puppy. Such a lovely puppy.[/say]")

		saynn("She keeps thrusting the dildo in and out of your mouth with no mercy, making you take every inch apart from the knot.. while your tongue works on polishing it, giving the silicone that wet shiny appearance.")

		saynn("[say=mirri]Such a whore too, wow. Your chocking is making me so fucking wet.[/say]")

		saynn("After a few degrading minutes of forcing you to suck and slurp on the dildo, she pulls out..")

		addButton("Present ass", "Mirri will peg you", "subpuppy_ass")
		addButtonWithChecks("Present pussy", "Mirri will fuck your pussy", "subpuppy_pussy", [], [[ButtonChecks.HasReachableVagina]])
	if(state == "subpuppy_ass"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={naked=true, hard=true}})
		saynn("Mirri jumps behind you and grabs your hips, quickly aligning herself against your exposed {pc.analStretch} tailhole.")

		saynn("Without warning, she pushes the dildo inside, making you groan as it stretches you open, your anal star opening wide.")

		saynn("[say=mirri]You feel that? Gonna breed your ass.[/say]")

		saynn("She purrs while your inner walls grip the wet toy, your fuckhole clenching around the sudden intruding object.")

		saynn("[say=pc]W..woo-of..[/say]")

		saynn("She giggles, enjoying your struggle, her hands gripping your ass tightly as she thrusts deeper, the knot already teasing your rim.")

		saynn("[say=mirri]That's what a good bitch gets.[/say]")

		if (GM.pc.hasPenis()):
			saynn("Each thrust is rough and deliberate, the thick toy pressing against your prostate, sending waves of pleasure through your body. You try to stay quiet.. but the sensation is overwhelming, your {pc.penis} stiffens and throbs, leaking pre onto the floor as Mirri rails your ass, the knot teasing but never quite pushing in all the way.")

		elif (GM.pc.hasVagina()):
			saynn("Each thrust is rough and deliberate, the thick toy subtly massaging your pleasure spot through the inner wall, sending waves of pleasure through your body. You try to stay quiet.. but the sensation is overwhelming, your pussy dripping juices profusely as Mirri rails your ass, the knot teasing but never quite pushing in all the way.")

		else:
			saynn("Each thrust is rough and deliberate, the thick toy pressing against your pleasure spot, sending waves of pleasure through your body. You try to stay quiet.. but the sensation is overwhelming, various lewd noises escape you as Mirri rails your ass, the knot teasing but never quite pushing in all the way.")

		addButton("Continue", "See what happens next", "subpuppy_ass_fast")
	if(state == "subpuppy_ass_fast"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={naked=true, hard=true}, npcCum=true})
		saynn("[say=mirri]You love this, don't you?[/say]")

		saynn("Mirri purrs louder, her hips slamming against you harder, her breath hot against your back as you rock back and forth on your paws.")

		saynn("[say=mirri]My little puppy, begging to get knotted.[/say]")

		if (GM.pc.hasPenis()):
			saynn("You're panting now, the intense pleasure building with every thrust. The way the dildo rubs against your prostate makes it impossible to hold back. Your cock pulses"+str(" in its little cage" if GM.pc.isWearingChastityCage() else "")+", and before you can stop it, you cum hard, ropes of thick {pc.cum} shooting out, splattering onto the cold wooden floor beneath you. Your whole body shudders as you're forced to ride the waves of your orgasm, every second is pure bliss, elevated by the relentless thrusting in your ass.")

		elif (GM.pc.hasVagina()):
			saynn("You're panting now, the intense pleasure building with every thrust. The way the fat dildo rubs your g-spot through the inner wall makes it impossible to hold back. Your {pc.vaginaStretch} pussy pulses, and before you can stop it, you cum hard, a shower of your girlcum shooting out, splattering onto the cold wooden floor beneath you. Your whole body shudders as you're forced to ride the waves of your orgasm, every second is pure bliss, elevated by the relentless thrusting in your ass.")

		else:
			saynn("You're panting now, the intense pleasure building with every thrust. The way the dildo rubs against your sensitive spots makes it impossible to hold back. Your tailhole pulses, and before you can stop it, you cum hard. Your whole body shudders as you're forced to ride the waves of your orgasm, every second is pure bliss, elevated by the relentless thrusting in your ass.")

		saynn("Mirri's giggling echoes in your ears as she notices your peak.")

		saynn("[say=mirri]Already, puppy? How pathetic. I'm not even..[/say]")

		addButton("Continue", "See what happens next", "subpuppy_ass_knot")
	if(state == "subpuppy_ass_knot"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={naked=true, hard=true}, npcCum=true})
		if (GM.pc.hasPenis()):
			saynn("With one final push, she forces the whole length of the toy deep into your ass, stretching you to your limits, the knot locking inside you. The pressure sends you over the edge once more, your cock pulsing as another dribble of your seed leaks from your overstimulated body, coupled with a passionate moan.")

		elif (GM.pc.hasVagina()):
			saynn("With one final push, she forces the whole length of the toy deep into your ass, stretching you to your limits, the knot locking inside you. The pressure sends you over the edge once more, your pussy clenching as another dribble of your girlcum leaks from your overstimulated body, coupled with a passionate moan.")

		else:
			saynn("With one final push, she forces the whole length of the toy deep into your ass, stretching you to your limits, the knot locking inside you. The pressure sends you over the edge once more, your ass clenching hard.")

		saynn("[say=mirri]There we go. Bred like the good bitch that you are.[/say]")

		saynn("She gives a few more slow, grinding thrusts, enjoying every second of your body trembling beneath her.")

		saynn("[say=mirri]Now give me my toy back, slut~.[/say]")

		saynn("Finally, after what feels like an eternity, she pulls out, the knot popping free with a wet noise.")

		setFlag("SlaveAuctionModule.customMirriGreeting", "Hello, lovely pup. How is your ass, still sore I hope?")
		addButton("Continue", "See what happens next", "subpuppy_after_sex")
	if(state == "subpuppy_pussy"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={naked=true, hard=true}})
		saynn("Mirri jumps behind you and grabs your hips, quickly aligning herself against your exposed {pc.pussyStretch} pussy.")

		saynn("Without warning, she pushes the dildo inside, making you groan as it stretches you open, your needy flower opening wide.")

		saynn("[say=mirri]You feel that? Gonna breed you.[/say]")

		saynn("She purrs while your inner walls grip the wet toy, your fuckhole clenching around the sudden intruding object.")

		saynn("[say=pc]W..woo-of..[/say]")

		saynn("She giggles, enjoying your struggle, her hands gripping your ass tightly as she thrusts deeper, the knot already teasing your slick folds.")

		saynn("[say=mirri]That's what a good bitch gets.[/say]")

		if (GM.pc.hasPenis()):
			saynn("Each thrust is rough and deliberate, the thick toy pressing against your g-spot, sending waves of pleasure through your body. You try to stay quiet.. but the sensation is overwhelming, your {pc.penis} stiffens and throbs, leaking pre onto the floor as Mirri rails your cunt, the knot teasing but never quite pushing in all the way.")

		else:
			saynn("Each thrust is rough and deliberate, the thick toy massaging your pleasure spot hard, sending waves of pleasure through your body. You try to stay quiet.. but the sensation is overwhelming, your pussy dripping juices profusely as Mirri rails it, the knot teasing but never quite pushing in all the way.")

		addButton("Continue", "See what happens next", "subpuppy_pussy_fast")
	if(state == "subpuppy_pussy_fast"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={naked=true, hard=true}, npcCum=true})
		saynn("[say=mirri]You love this, don't you?[/say]")

		saynn("Mirri purrs louder, her hips slamming against you harder, her breath hot against your back as you rock back and forth on your paws.")

		saynn("[say=mirri]My little puppy, begging to get knotted.[/say]")

		if (GM.pc.hasPenis()):
			saynn("You're panting now, the intense pleasure building with every thrust. The way the dildo rubs against your pleasure spot makes it impossible to hold back. Your cock pulses"+str(" in its little cage" if GM.pc.isWearingChastityCage() else "")+", and before you can stop it, you cum hard, ropes of thick {pc.cum} shooting out, splattering onto the cold wooden floor beneath you, your pussy clenching hard around the silicon shaft. Your whole body shudders as you're forced to ride the waves of your orgasm, every second is pure bliss, elevated by the relentless thrusting.")

		else:
			saynn("You're panting now, the intense pleasure building with every thrust. The way the fat dildo rubs your g-spot makes it impossible to hold back. Your {pc.vaginaStretch} pussy pulses, and before you can stop it, you cum hard, a shower of your girlcum shooting out, splattering onto the cold wooden floor beneath you, your inner walls clench. Your whole body shudders as you're forced to ride the waves of your orgasm, every second is pure bliss, elevated by the relentless thrusting.")

		saynn("Mirri's giggling echoes in your ears as she notices your peak.")

		saynn("[say=mirri]Already, puppy? How pathetic. I'm not even..[/say]")

		addButton("Continue", "See what happens next", "subpuppy_pussy_knot")
	if(state == "subpuppy_pussy_knot"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}, npcBodyState={naked=true, hard=true}, npcCum=true})
		if (GM.pc.hasPenis()):
			saynn("With one final push, she forces the whole length of the toy deep into your slit, stretching you to your limits, the knot locking inside you, the tip breaking into your womb. The pressure sends you over the edge once more, your cock pulsing as another dribble of your seed leaks from your overstimulated body, coupled with a passionate moan.")

		else:
			saynn("With one final push, she forces the whole length of the toy deep into your slit, stretching you to your limits, the knot locking inside you, the tip breaking into your womb. The pressure sends you over the edge once more, your pussy clenching hard as another dribble of your girlcum leaks from your overstimulated body, coupled with a passionate moan.")

		saynn("[say=mirri]There we go. Bred like the good bitch that you are.[/say]")

		saynn("She gives a few more slow, grinding thrusts, enjoying every second of your body trembling beneath her.")

		saynn("[say=mirri]Now give me my toy back, slut~.[/say]")

		saynn("Finally, after what feels like an eternity, she pulls out, the knot popping free with a wet noise.")

		setFlag("SlaveAuctionModule.customMirriGreeting", "Hello, lovely pup. How is your pussy, still sore I hope?")
		addButton("Continue", "See what happens next", "subpuppy_after_sex")
	if(state == "subpuppy_after_sex"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="mirri", npcAction="sad", npcBodyState={naked=true, leashedBy="mirri", hard=true}})
		saynn("Mirri steps back, admiring her work.. while you just sprawl all over the floor. She gives your ass a sharp slap.")

		saynn("[say=mirri]That's a good puppy. Kitties will always be above pups, you better remember that.[/say]")

		saynn("You pant heavily.. until Mirri finally decides to start removing the puppy restraints.")

		saynn("[say=mirri]Such a mess you left. Was fun though.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dom_about_to_fight"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		if (!getFlag("SlaveAuctionModule.firstTimeDom")):
			saynn("[say=pc]The more I think about it.. the more I realize. You are the sextoy here, Mirri.[/say]")

			saynn("Mirri licks her lips, leaning to the side, the outline of her butt highlighted by the dark lights.")

			saynn("[say=mirri]You can think? That's a new one.[/say]")

			saynn("[say=pc]I'm the brains of this operation, you know. And you're just my puppet, saying what I want you to say.[/say]")

			saynn("She hums and openly licks her teeth now.")

			saynn("[say=mirri]And what should I say now?[/say]")

			saynn("[say=pc]I submit.[/say]")

			saynn("She giggles and takes an offensive stance.")

			saynn("[say=mirri]Haha. I love how cute you are, {pc.name}.. Over my dead body, bitch.[/say]")

		else:
			saynn("You put on your dominant stare. Mirri puts on her mean one.")

			saynn("[say=pc]Let's skip the foreplay, baby. You and I know how this will end.[/say]")

			saynn("[say=mirri]Haha, fuck you. You don't understand, seeing them struggle is the best part.[/say]")

			saynn("Both of you raise your fists.")

			saynn("[say=pc]Let's see you struggle then.[/say]")

		addButton("Fight", "Start the fight", "dom_start_fight")
		if (getFlag("SlaveAuctionModule.mirriCanSkipCombat", false)):
			addButton("(Skip fight)", "You know that you are stronger already!", "dom_fight_won")
	if(state == "dom_fight_lost"):
		playAnimation(StageScene.Duo, "defeat", {npc="mirri"})
		saynn("You hit the floor, unable to continue fighting. Mirri giggles.")

		saynn("[say=mirri]Wow, you seriously suck ass![/say]")

		saynn("[say=pc]Fuck you..[/say]")

		saynn("She stops smiling and puts on mean eyes, her paw reaches out to grab you by the collar.")

		saynn("[say=mirri]You're saying that you don't suck ass?[/say]")

		saynn("[say=pc]I don't, fuck off.[/say]")

		saynn("[say=mirri]That's when I grab your hair.. and make your cute face love my thick ass.[/say]")

		addButton("Pull away", "You'd rather not", "endthescene")
	if(state == "dom_fight_won"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcAction="defeat"})
		saynn("Mirri hits the floor, unable to continue fighting.. she quickly begins reaching for her gun. That's why your hand yanks hard on her ponytail.")

		saynn("[say=pc]Don't you dare.[/say]")

		saynn("[say=mirri]Agh.. haha.. Afraid the kitty is gonna make a few new holes in you? Do you know who I am?[/say]")

		saynn("Her paw keeps reaching.. Your second hand lands on her neck.")

		saynn("[say=pc]You're a spoiled brat.[/say]")

		saynn("She pouts and glares up at you with defiance. Her hand pulls out the gun.. but your leg just kicks it, making her send her gun sliding away across the floor.")

		saynn("[say=mirri]Oops.. my toy is gone. I can still murder you with just my claws.[/say]")

		saynn("She tilts her head a bit, causing your hand to pull out a few extra red hairs.")

		saynn("[say=mirri]AlphaCorp slave~.[/say]")

		saynn("Mirri starts trying to break out, her clawed paws scratching your hands.. but you don't let go.")

		saynn("[say=mirri]Take your hands off me, you bitch..[/say]")

		saynn("What do you wanna do with her?")

		addButton("Nothing", "Just let her go", "dom_nothing")
		addButtonWithChecks("Hatefuck", "Breed the bitch", "dom_hatefuck", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Strapon hatefuck", "Use a strapon against this bitch", "dom_straponfuck_pick", [], [[ButtonChecks.HasStraponAndCanWear]])
		addButtonWithChecks("Rough anal", "Punish her ass with your cock", "dom_anal", [], [[ButtonChecks.HasReachablePenis]])
		addButton("Spank her", "Punish her for being such a bad girl", "dom_spank")
		addButton("Auction roleplay", "Pretend to sell Mirri off at an auction", "dom_rp")
	if(state == "dom_nothing"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("You do what she tells you to do and pull your hands away from her hair and neck.")

		saynn("[say=pc]Get up.[/say]")

		saynn("Mirri tilts her head, her eyes confused.")

		saynn("[say=pc]Get up, Mirri.[/say]")

		saynn("[say=mirri]Is this a trick? I will get up and you will throw me?[/say]")

		saynn("You sigh and pull her up.")

		saynn("[say=pc]You are my bitch. But I changed my mind.[/say]")

		saynn("She blinks a lot.")

		saynn("[say=mirri]Oh. What a softie! I won then![/say]")

		saynn("[say=pc]No you didn't.[/say]")

		saynn("She points at the scratches on your wrists.")

		saynn("[say=mirri]See, I did more damage! You're pathetic, {pc.name}![/say]")

		saynn("The anger makes you bite her neck.")

		saynn("[say=mirri]Ow..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dom_hatefuck"):
		playAnimation(StageScene.SexMatingPress, "tease", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Mirri tries to push herself up but is quickly forced back down by your weight as you pin her beneath you.")

		saynn("[say=mirri]Get off me, you slave.[/say]")

		saynn("You grab her wrists and force them above her head so she can't scratch you. Her legs are spread wide by your body, leaving her utterly exposed. She still struggles against you, her breath coming out in ragged gasps, her feline eyes flashing brightly.")

		saynn("[say=pc]What else are you gonna say?[/say]")

		saynn("Your hand pulls down her panties and grips her throat now instead, making her pull her chin high. Her sex got quite wet after the.. struggle cuddle.")

		saynn("[say=mirri]Bitch.. At least put on a condom if you're going to..[/say]")

		saynn("[say=pc]What if I don't.[/say]")

		saynn("[say=mirri]I will cut your balls off then, I'm warning you! I ain't having your brats![/say]")

		saynn("You notice a free wrapped condom in one of her pouches.")

		addButton("Use it", "Use the offered condom and not anger Mirri too much", "dom_hatefuck_usecondom")
		addButton("Ignore it", "Go in raw", "dom_hatefuck_nocondom")
	if(state == "dom_hatefuck_fuck"):
		playAnimation(StageScene.SexMatingPress, "sex", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true, condom=usedCondom}, npcBodyState={exposedCrotch=true, hard=true}})
		if (usedCondom):
			saynn("Well, you'd rather save your testicles. You grab her offered condom and quickly apply it to your cock. Then, your hand slides down her body and grips the folds of her slick cunt. She is wet, so much wetter than she is letting on, her body betraying her. Mirri tenses, her legs twitching beneath you, her tail wagging actively.")

			saynn("[say=mirri]Good {pc.boy}.. An AlphaCorp slave is not filling me with {pc.his} seed..[/say]")

			saynn("[say=pc]Shut up, fucktoy.[/say]")

		else:
			saynn("You don't bother with the rubber. Your hand slides down her body and grips the folds of her slick cunt. She is wet, so much wetter than she is letting on, her body betraying her. Mirri tenses, her legs twitching beneath you, her tail wagging actively.")

			saynn("[say=mirri]I told you, condom, now! You're not filling me with your seed, I swear-.[/say]")

			saynn("[say=pc]Shut up, fucktoy.[/say]")

		saynn("Her words are cut short as you line yourself up with that drippy cunt and thrust deep into her without warning. Her back arches sharply and a shocked gasp escapes her lips. The wet heat of her pussy tightens around you, welcoming you in.")

		saynn("[say=mirri]You.. fuc-cker!..[/say]")

		saynn("At least this time she isn't wrong, you pound into her, hard and fast, your hands pressed against the cold wooden floor as you drive your {pc.penis} deeper with each thrust.")

		saynn("[say=mirri]..is that all you've got? You're pathetic! Can you go HARDER at least?![/say]")

		saynn("Wow, that's a change. She really likes the mating press it seems.")

		addButton("Faster", "Rail her pussy harder", "dom_hatefuck_fuck_fast")
	if(state == "dom_hatefuck_fuck_fast"):
		playAnimation(StageScene.SexMatingPress, "fast", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true, condom=usedCondom}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Her words only fuel your aggression. You slam into her even harder, your cock ramming deep inside her, kissing her womb and stretching her out with each thrust. Mirri's body shakes beneath you, her breath hitching as you drive her towards the edge and even further, her inner walls suddenly clenching tightly around your shaft.")

		saynn("[say=mirri]Fu-uck! I fucking hate you so much![/say]")

		saynn("[say=pc]Your pussy tells me a different story. What a slut.[/say]")

		if (!usedCondom):
			saynn("The wild pleasure is flickering in her eyes, the slut is cumming hard. Seems like a good moment to lean in and growl into her ear.")

			saynn("[say=pc]I'm going to fill you.[/say]")

			saynn("Her eyes widen, her body trembling beneath you, each your thrust pushing her further into the abyss of dark pleasure.")

			saynn("[say=mirri]No, you fucking don't.. I.. will.. I will.. ahh..[/say]")

			saynn("You pick up the pace and mate with her with a raw animalistic energy.. until your own orgasm begins to draw near..")

		else:
			saynn("The wild pleasure is flickering in her eyes, the slut is cumming hard. Seems like a good moment to lean in and growl into her ear.")

			saynn("[say=pc]You're nothing but a slave to my cock.[/say]")

			saynn("Her eyes widen, her body trembling beneath you, each your thrust pushing her further into the abyss of dark pleasure.")

			saynn("[say=mirri]You're a slave, not me.. ah..[/say]")

			saynn("You pick up the pace and mate with her with a raw animalistic energy.. until your own orgasm begins to draw near..")

		addButton("Cum", "Time to do this", "dom_hatefuck_fuck_cum")
	if(state == "dom_hatefuck_fuck_cum"):
		playAnimation(StageScene.SexMatingPress, "inside", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true, condom=usedCondom}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("The time comes to ram your cock deep inside her one last time. Mirri's body tightens again, her claws digging into your skin as her pussy clamps down around you.")

		if (!usedCondom):
			saynn("You bury yourself to the hilt, slamming your dick deep into her womb as you proceed to pump her full of your seed. Mirri's back arches violently, her breath hitching hard as her entire body convulses beneath you.")

			saynn("[say=mirri]You.. F-fuck!.. I love your.. ah.. no..! S-shit!.. I'm f-fucking c-cumming!..[/say]")

			saynn("She lets out a strangled moan, her pussy milking you for every last drop, her body still shaking for a while longer after her new orgasm.")

			saynn("You hold her down as you finish inside her.. and then you just pull out, causing a flood of your {pc.cum} to start leaking out of her used pussy, dripping onto the wooden floor.")

			saynn("Mean eyes are staring at you. Mirri's chest is rising and falling rapidly.")

			saynn("[say=pc]What? AlphaCorp slave has just bred you.[/say]")

			if (canBreed):
				saynn("[say=mirri]I'm not on the pill anymore, you fuck.. I hate you, stupid. And that was.. that was.. weak.. yeah.. hah..[/say]")

			else:
				saynn("[say=mirri]..I hate you, stupid. And that was.. that was.. weak.. yeah.. hah..[/say]")

		else:
			saynn("You bury yourself to the hilt, slamming your dick deep into her womb as you proceed to pump the condom inside her babymaker full of your seed. Mirri's back arches violently, her breath hitching hard as her entire body convulses beneath you.")

			saynn("[say=mirri]You.. F-fuck!.. I love your.. ah.. no..! S-shit!.. I'm f-fucking c-cumming!..[/say]")

			saynn("She lets out a strangled moan, her pussy milking you for every last drop, her body still shaking for a while longer after her new orgasm.")

			saynn("You hold her down as you finish inside that rubber.. then you carefully pull it out and tie it up before disposing of it")

			saynn("Mean eyes are staring at you. Mirri's chest is rising and falling rapidly.")

			saynn("[say=pc]What? You are impressed?[/say]")

			saynn("[say=mirri]..You had the brains to use a condom but I hate you, stupid. And that was.. that was.. weak.. yeah.. hah..[/say]")

		addButton("Enough", "Enough fucking", "dom_hatefuck_enough")
		if (usedCondom):
			addButton("Breed", "Screw the condom. Fuck her again without it", "dom_hatefuck2_fuck")
		else:
			addButton("More", "Breed her more for being so cocky", "dom_hatefuck2_fuck")
	if(state == "dom_hatefuck_enough"):
		saynn("[say=pc]That's what you get for being a bitch.[/say]")

		saynn("Mirri hums.")

		saynn("[say=mirri]I will keep that in mind..[/say]")

		saynn("Of course she will. You give her ass a smack and get off her.")

		saynn("[say=mirri]Ah.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dom_hatefuck2_fuck"):
		playAnimation(StageScene.SexBehind, "sex", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Weak? You will show her weak. Without a word, you grab her by the hair, yanking her up roughly by the ponytail.")

		saynn("[say=mirri]AGH! THAT'S MY PONYTAIL, YOU FUCK![/say]")

		saynn("The fire is sparking in her eyes once again as she tries to fight you off.")

		saynn("[say=pc]I'm not done with you yet.[/say]")

		saynn("You drag her towards her bed, ignoring the growls and various threats. After throwing her down, you pin her belly-first against the comfy mattress, forcing her into the sheets, her ass raised, her legs spread wide, leaving her dripping"+str(" stuffed" if !usedCondom && !isStrapon else "")+" pussy exposed.")

		if (usedCondom):
			if (canBreed):
				saynn("[say=mirri]I'm not on the pill. Use a new rubber! You forgot the fucking condom, you stupid![/say]")

			else:
				saynn("[say=mirri]Use a new rubber! You forgot the fucking condom, you stupid![/say]")

			saynn("[say=pc]I didn't.[/say]")

			saynn("[say=mirri]What?! I will.. I will RIP YOUR..[/say]")

		else:
			saynn("[say=mirri]Not on my fucking bed, you stupid![/say]")

			saynn("[say=pc]I like your bed. I will fuck you anywhere I want.[/say]")

			saynn("[say=mirri]I will.. I will RIP YOUR..[/say]")

		saynn("You cut her off my slamming into her from behind, driving your "+str("{pc.penis}" if !isStrapon else "slick strapon")+" deep into her wet heat while yanking on her ponytail, making her entire body jerk and her back arch.")

		saynn("[say=mirri]Ah-h!.. Fuck you! D-do you even know who I..[/say]")

		saynn("[say=pc]You're my cocksleeve.[/say]")

		saynn("You grip her hips tightly, pulling her back onto your"+str(" rubber" if isStrapon else "")+" cock with every brutal thrust. Her pussy is soaking wet, the slick loud of your bodies colliding filling the room as you take her hard and fast.")

		saynn("[say=mirri]GRR-rr.. ahh.. shit.. You are SO GONNA PAY FOR THIS.[/say]")

		saynn("[say=pc]You're still talking shit?[/say]")

		saynn("Rather than pulling on her hair, you suddenly shove her head into her pillow, muffling her speech. Her claws are scratching the sheets as her body rocks with the force of your thrusts, her pussy squeezing your "+str("toy" if isStrapon else "cock")+" each time you ram it into her tight fuckhole."+str(" Going in raw feels so much better." if usedCondom else "")+"")

		addButton("Faster", "Increase the pressure. Increase the pleasure", "dom_hatefuck2_fast")
	if(state == "dom_hatefuck2_fast"):
		playAnimation(StageScene.SexBehind, "fast", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("The bed is creaking beneath the force of your movements. You shift your grip from her ponytail, your hand sliding underneath her instead and into her top to squeeze her tits harshly, your fingers digging into her soft flesh and squeeze the hard perky nips.")

		saynn("Mirri's body keeps jerking under the pressure, her muffled moans turning into broken cries.")

		saynn("[say=mirri]Gh-h.. Harder![/say]")

		saynn("She growls through her teeth.")

		saynn("[say=mirri]You think.. you're in charge? You.. ahh-h.. fuck! Harder![/say]")

		saynn("Looks like her resistance is crumbling with each second. And so you continue to slam into her with unrelenting force, your "+str("silicone cock" if isStrapon else "cock")+" smashing into her womb entrance with each thrust. The slaps echo in the room, mixing with her increasingly frantic moans.")

		saynn("[say=mirri]Y-yeah.. fuck! I'm fucking close..[/say]")

		saynn("Her body tightens around you, her pussy clenching desperately as her breathing turns shallow. You feel her starting to lose control, her hips bucking back against you, her ass grinding against your hips.")

		saynn("Her juices are coating your "+str("shiny shaft" if isStrapon else "shaft")+" as you pound into her, your hands roaming her body, grabbing the hair, squeezing her tits, pulling her against you with every thrust.")

		if (!isStrapon):
			saynn("[say=mirri]Grr.. you b-better..[/say]")

			saynn("[say=pc]I ain't pulling..[/say]")

			saynn("[say=mirri]INSIDE! Fill me with your fucking cum, you stupid fuck![/say]")

		else:
			saynn("[say=mirri]Grr.. you b-better..[/say]")

			saynn("[say=pc]I ain't stopping..[/say]")

			saynn("[say=mirri]RAM IT INSIDE! Fill me with your fucking cock, you stupid fuck![/say]")

		saynn("Her fluffy feline tail wraps around your waist. Cute.")

		if (!isStrapon):
			addButton("Cum", "Time to breed her", "dom_hatefuck2_cum")
		else:
			addButton("Orgasm", "Mirri is close", "dom_hatefuck2_cum")
	if(state == "dom_hatefuck2_cum"):
		playAnimation(StageScene.SexBehind, "inside", {pc="pc", npc="mirri", pcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		if (!isStrapon):
			saynn("With a primal growl of your own, you grab her hips tightly and bury yourself deep inside, your cock throbbing inside her babymaker as she arches her back sharply, her eyes going wide as her body convulses under you.")

			saynn("[say=mirri]NHHh-hh..[/say]")

			saynn("Her pussy clenches hard, pushing you over the edge. Your {pc.penis} cock starts throbbing and stuffing her cunt full of your seed, your balls tighten up every second as her womb gets pumped full of it again and again..")

			saynn("[say=mirri]..C-cumming.. F-fuck!..[/say]")

			saynn("Her entire body is shaking violently as the orgasm crashes through her, her stuffed used stretched pussy squirting all over her bed, her juices soaking the sheets beneath her as she loses all control.")

			saynn("Her moans grow weaker, more spaced out as you stop fucking her, just keeping your cock inside, filling her to the brim. Mirri's face is pressed into the pillow, her eyes looking spaced out from pleasure.")

			saynn("Finally, you pull out.. Your cock is slick with a mixture of your {pc.cum} and her juices.")

		else:
			saynn("With a primal growl of your own, you grab her hips tightly and bury yourself deep inside, the strapon breaking into her babymaker again as she arches her back sharply, her eyes going wide as her body convulses under you.")

			saynn("[say=mirri]NHHh-hh..[/say]")

			saynn("Her pussy clenches hard, trying to milk your toy again. Nothing stops you.. so you just continue to thrust at a slow rate, fighting the friction that her walls suddenly have.")

			saynn("[say=mirri]..C-cumming.. F-fuck!..[/say]")

			saynn("Her entire body is shaking violently as the orgasm crashes through her, her used stretched pussy squirting all over her bed, her juices soaking the sheets beneath her as she loses all control.")

			saynn("Her moans grow weaker, more spaced out as you stop fucking her, just keeping your rubber cock inside, filling her. Mirri's face is pressed into the pillow, her eyes looking spaced out from pleasure.")

			saynn("Finally, you pull out.. Your strapon is dripping her juices.")

		saynn("[say=mirri]You.. f-fuck..[/say]")

		saynn("[say=pc]What was that? You want more, still? Didn't know Syndicate's whores are so needy.[/say]")

		addButton("Continue", "See what happens next", "dom_hatefuck2_after")
	if(state == "dom_hatefuck2_after"):
		GM.pc.setLocation("market_nearmirri")
		aimCameraAndSetLocName("market_nearmirri")
		playAnimation(StageScene.Duo, "defeat", {npc="mirri", npcAction=["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], npcBodyState={exposedCrotch=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("Suddenly, she shoves you off, her body springing to life with a surge of energy that catches you completely off guard.")

		saynn("Before you can react, she tackle-climbs you, her legs interlocking around your neck.. before she uses her weight to spin around in the air and throw you out into the main corridor, your back slamming into the wall with a heavy thud. Her Syndicate agent training is on full display..")

		saynn("While you are disoriented, your ears hear something.. Mirri has just picked something up. Click.. The sound of her heavy boots echoes like heavy heartbeats.")

		saynn("You try to get up but can't, collapsing as soon as you raise even a little bit.")

		saynn("Mirri steps out of the corridor, holding that 12.7mm handgun in her paw. She stops and looks at you, the dim lighting hides everything but her blue glowing eyes.")

		saynn("[say=mirri]You're gonna pay for what you did to me.[/say]")

		saynn("Her finger hovers near the trigger.. her used pussy drips with your cum.")

		saynn("[say=pc]Mirri? Hey, wait.[/say]")

		saynn("Slowly, she begins stepping towards you, a small twisted smirk shining on her mean face.")

		saynn("[say=pc]We can talk about it?[/say]")

		saynn("Is she really going to kill you for breeding her?")

		addButton("Continue", "See what happens next", "dom_hatefuck3_pin")
	if(state == "dom_hatefuck3_pin"):
		playAnimation(StageScene.SexStandRide, "tease", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("As you get up and push yourself off the wall, she slams you back into it, her body pressing against yours.")

		saynn("[say=mirri]Not so fast, AlphaCorp slave..[/say]")

		saynn("She raises her leg high, displaying an impressive vertical split.. before pressing it against your shoulder, pinning you that way. Her dripping, used pussy is now on full display.")

		saynn("Mirri toys with the gun, her finger on the trigger.")

		saynn("[say=mirri]I'd murder you on the spot.[/say]")

		saynn("You notice the clear hesitation in her voice.")

		if (!isStrapon):
			saynn("[say=pc]But you love my cock.[/say]")

			saynn("She squints.. and then pouts. Her pussy is dangerously close to your dick in this position, hovering right above it.")

		else:
			saynn("[say=pc]But you love getting fucked.[/say]")

			saynn("She squints.. and then pouts. Her pussy is dangerously close to your strapon in this position, hovering right above it.")

		saynn("[say=mirri]I fucking hate you..[/say]")

		saynn("She leans closer to your face, her voice getting lower, almost purring..")

		if (!isStrapon):
			saynn("[say=mirri]But I wanna drain the fuck out of you too.[/say]")

		else:
			saynn("[say=mirri]But I wanna ride the fuck out of you too.[/say]")

		saynn("Someone is still horny..")

		addButton("Continue", "See what happens next", "dom_hatefuck3_fuck")
	if(state == "dom_hatefuck3_fuck"):
		playAnimation(StageScene.SexStandRide, "sex", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Mirri slowly sinks herself down onto "+str("your hardening cock" if !isStrapon else "rubber shaft")+", impaling herself with a cute moan. Her pistol falls to the floor, forgotten as she grips your shoulders for support, her claws digging in painfully as her slick love tunnel wraps around your shaft yet again.")

		if (!isStrapon):
			saynn("As soon as she feels your cock getting fully hard, she begins riding you hard, slamming her hips down, letting her wet cunt swallow your length with each thrust.")

		else:
			saynn("She begins riding you hard, slamming her hips down, letting her wet cunt swallow that shiny length with each thrust.")

		saynn("[say=pc]You are one needy slut, you know that?[/say]")

		saynn("[say=mirri]..shut up.. ah.. Let me be a good cocksleeve for once.[/say]")

		saynn("Her eyes flashing brightly as she bounces on your"+str(" rubber" if isStrapon else "")+" cock, her hips grinding in desperate circles. As soon as she finds her rhythm, one of her paws slides back to her slit and starts playing with her clit, rubbing it left and right while riding you.")

		saynn("You meet her motions with your own thrusts, plunging your "+str(" toy" if isStrapon else "dick")+" deep inside her with each motion. You hear.. subtle purring.. as you do that. Mirri's body is already shivering with pleasure, her cunt tightening around you, dripping a mix of her juices and your seed.")

		saynn("[say=mirri]More.. ah.. I want you more.. stupid AlphaCorp slave..[/say]")

		addButton("Continue", "See what happens next", "dom_hatefuck3_fast")
	if(state == "dom_hatefuck3_fast"):
		playAnimation(StageScene.SexStandRide, "fast", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Feeling extremely eager, she starts bringing herself down onto your "+str("strapon" if isStrapon else "member")+" harder and faster. The wet sound of your bodies colliding fills the hallway.. together with Mirri's purring and moans. She closes her eyes and just pushes herself further..")

		if (!isStrapon):
			saynn("[say=mirri]I love your cock.. ah..[/say]")

		else:
			saynn("[say=mirri]I love that cock.. ah..[/say]")

		saynn("[say=pc]More than the rest?[/say]")

		saynn("[say=mirri]..don't make me pick up that gun..[/say]")

		if (!isStrapon):
			saynn("Her motions become more and more erratic, her inner walls clenching again and again.. Your balls were drained two times already.. but somehow her pussy manages to push you towards another peak..")

			saynn("You feel yourself getting close..")

			addButton("Cum", "Time to breed her.. again", "dom_hatefuck3_cum")
		else:
			saynn("Her motions become more and more erratic, her inner walls clenching again and again.. She came at least two times already.. but somehow she manages to push herself towards another peak..")

			addButton("Orgasm", "See what happens", "dom_hatefuck3_cum_strapon")
	if(state == "dom_hatefuck3_cum"):
		playAnimation(StageScene.SexStandRide, "inside", {pc="pc", npc="mirri", pcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("With one final motion, she forces your whole length inside her, throwing her head back as a passionate moan leaves her lips.")

		saynn("[say=mirri]Ahh-..[/say]")

		if (!isStrapon):
			saynn("Your balls tense up.. as you begin to release inside her again, your cock being milked by her clenching pussy dry. Her body is convulsing as she rubs her clit to the point of her pussy squirting again, releasing a fountain of fluids onto the wall behind you. Her eyes look wild and unfocussed.")

			saynn("[say=mirri]Yes-ss.. Fill my pussy, you fucker..[/say]")

			saynn("You do just that, pumping her womb to the brim again. Mirri is so close to you, you can feel her trembling against you, her breath ragged.")

		else:
			saynn("Her body is convulsing as she rubs her clit to the point of her pussy squirting again, releasing a fountain of fluids onto the wall behind you. Her eyes look wild and unfocussed.")

			saynn("[say=mirri]Yes-ss.. Fill my pussy, you fucker..[/say]")

			saynn("You would happily do that if your strapon wasn't empty. Mirri is so close to you, you can feel her trembling against you, her breath ragged.")

		saynn("As soon as her orgasm starts to fade, she slumps against you, panting heavily as she rides out the aftershocks, her body finally spent.")

		saynn("A twisted smile spreads across her lips as she finally lets you go, her body sliding off yours.")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("[say=mirri]..where are my panties..[/say]")

		saynn("She rushes away to search for them.")

		if (!isStrapon):
			if (!canBreed):
				setFlag("SlaveAuctionModule.customMirriGreeting", "Found my panties, they somehow ended up under the bed. Oh yeah.. I forgot to tell you that I'm on a pill. I ain't having kids from no AlphaCorp slaves.")
			else:
				if (getCharacter("mirri").isVisiblyPregnant()):
					setFlag("SlaveAuctionModule.customMirriGreeting", "Found my panties, they somehow ended up under the bed. Oh yeah.. I guess I'm pregnant already so whatever..")
				else:
					setFlag("SlaveAuctionModule.customMirriGreeting", "Found my panties, they somehow ended up under the bed. Oh yeah.. If you knocked me up, I swear..")
		addButton("Continue", "See what happens next", "endthescene_unequipstrapon")
	if(state == "dom_straponfuck_pick"):
		saynn("Which strapon do you want to use?")

		addStraponButtons()
		addButton("Back", "You changed your mind", "dom_fight_won")
		if (false):
			addButton("Nope", "You shouldn't see this", "dom_straponfuck_puton")
	if(state == "dom_straponfuck_start"):
		playAnimation(StageScene.SexMatingPress, "tease", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Mirri tries to push herself up but is quickly forced back down by your weight as you pin her beneath you.")

		saynn("[say=mirri]Get off me, you slave.[/say]")

		saynn("You quickly secure a strapon harness around your waist and then grab her wrists and force them above her head so she can't scratch you. Her legs are spread wide by your body, leaving her utterly exposed. She still struggles against you, her breath coming out in ragged gasps, her feline eyes flashing brightly.")

		saynn("[say=pc]What else are you gonna say?[/say]")

		saynn("Your hand pulls down her panties and grips her throat now instead, making her pull her chin high. Her sex got quite wet after the.. struggle cuddle.")

		saynn("[say=mirri]Bitch.. I fucking hope you didn't load that thing up with cum.[/say]")

		if (straponHasCum):
			saynn("Little did she know.. you did exactly that.")

		else:
			saynn("That's not a bad idea. But she lucked out this time.")

		saynn("[say=pc]And what if I did.[/say]")

		saynn("[say=mirri]I will shove it up your butt then, I'm warning you! I ain't having no brats![/say]")

		saynn("So mouthy, that catgirl..")

		addButton("Fuck her", "Have some fun with that pussy", "dom_straponfuck_fuck")
	if(state == "dom_straponfuck_fuck"):
		playAnimation(StageScene.SexMatingPress, "sex", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true, condom=usedCondom}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Your hand slides down her body and grips the folds of her slick cunt. She is wet, so much wetter than she is letting on, her body betraying her. Mirri tenses, her legs twitching beneath you, her tail wagging actively.")

		saynn("[say=mirri]Put a condom on that thing, I swear-..[/say]")

		saynn("[say=pc]Shut up, fucktoy.[/say]")

		saynn("Her words are cut short as you line yourself up with that drippy cunt and thrust deep into her without warning. Her back arches sharply and a shocked gasp escapes her lips. The wet heat of her pussy tightens around your new rubber cock, welcoming you in.")

		saynn("[say=mirri]You.. fuc-cker!..[/say]")

		saynn("At least this time she isn't wrong, you pound into her, hard and fast, your hands pressed against the cold wooden floor as you drive your toy deeper with each thrust.")

		saynn("[say=mirri]Ngh.. h.. Is that all you've got? You're pathetic! Can you go HARDER at least?![/say]")

		saynn("Wow, that's a change. She really likes the mating press it seems.")

		addButton("Faster", "Rail her pussy harder", "dom_straponfuck_fuck_fast")
	if(state == "dom_straponfuck_fuck_fast"):
		playAnimation(StageScene.SexMatingPress, "fast", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true, condom=usedCondom}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Her words only fuel your aggression. You slam into her even harder, the strapon ramming deep inside her, kissing her womb and stretching her out with each thrust. Mirri's body shakes beneath you, her breath hitching as you drive her towards the edge and even further, her inner walls suddenly clenching tightly around your shaft.")

		saynn("[say=mirri]Fu-uck! I fucking hate you so much![/say]")

		saynn("[say=pc]Your pussy tells me a different story. What a slut.[/say]")

		if (straponHasCum):
			saynn("The wild pleasure is flickering in her eyes, she is incredibly close. Seems like a good moment to lean in and growl into her ear.")

			saynn("[say=pc]I did load it with cum.[/say]")

			saynn("Her eyes widen, her body trembling beneath you, each your thrust pushing her further into the abyss of dark pleasure.")

			saynn("[say=mirri]No, you fucking don't.. I.. will.. I will.. ahh..[/say]")

			saynn("You pick up the pace and mate with her with a raw animalistic energy..")

		else:
			saynn("The wild pleasure is flickering in her eyes, she is incredibly close. Seems like a good moment to lean in and growl into her ear.")

			saynn("[say=pc]You're nothing but a slave to my shaft.[/say]")

			saynn("Her eyes widen, her body trembling beneath you, each your thrust pushing her further into the abyss of dark pleasure.")

			saynn("[say=mirri]You're a slave, not me.. ah..[/say]")

			saynn("You pick up the pace and mate with her with a raw animalistic energy..")

		addButton("Orgasm", "Make her cum", "dom_straponfuck_fuck_cum")
	if(state == "dom_straponfuck_fuck_cum"):
		playAnimation(StageScene.SexMatingPress, "inside", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true, condom=usedCondom}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("The time comes to ram your rubber shaft deep inside her one last time. Mirri's body tightens again, her claws digging into your skin as her pussy clamps down around you.")

		if (straponHasCum):
			saynn("You bury yourself to the hilt, slamming your loaded toy deep into her womb as you proceed to pump her full of your seed, the extreme tightness triggers the strapon to release its contents! Mirri's back arches violently, her breath hitching hard as her entire body convulses beneath you.")

			saynn("[say=mirri]You.. F-fuck!.. I love your.. ah.. no..! S-shit!.. I'm f-fucking c-cumming!..[/say]")

			saynn("She lets out a strangled moan, her pussy unwillingly milking your strapon for every last drop of someone's seed, her body still shaking for a while longer after her orgasm.")

			saynn("You hold her down as you finish inside her by using that trusty tool.. and then you just pull out, causing a flood of seed to start leaking out of her used pussy, dripping onto the wooden floor.")

			saynn("Mean eyes are staring at you. Mirri's chest is rising and falling rapidly.")

			saynn("[say=pc]What? AlphaCorp slave has just bred you.[/say]")

			if (canBreed):
				saynn("[say=mirri]I'm not on the pill anymore, you fuck.. I hate you, stupid. And that was.. that was.. weak.. yeah.. hah..[/say]")

			else:
				saynn("[say=mirri]..I hate you, stupid. And that was.. that was.. weak.. yeah.. hah..[/say]")

		else:
			saynn("You bury yourself to the hilt, slamming your toy deep into her womb! Luckily it wasn't loaded with any cum. But still, Mirri's back arches violently, her breath hitching hard as her entire body convulses beneath you.")

			saynn("[say=mirri]You.. F-fuck!.. I love your.. ah.. no..! S-shit!.. I'm f-fucking c-cumming!..[/say]")

			saynn("She lets out a strangled moan, her pussy fruitlessly milking your strapon, her body still shaking for a while longer after her orgasm.")

			saynn("Mean eyes are staring at you. Mirri's chest is rising and falling rapidly.")

			saynn("[say=pc]What? You are impressed?[/say]")

			saynn("[say=mirri]..You had the brains to not breed me but I still hate you, stupid. And that was.. that was.. weak.. yeah.. hah..[/say]")

		addButton("Enough", "Enough fucking", "dom_hatefuck_enough")
		addButton("More", "Breed her more for being so cocky", "dom_hatefuck2_fuck")
	if(state == "dom_anal"):
		playAnimation(StageScene.SexPinnedBehind, "tease", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("The moment Mirri tries to get up, you're on her, grabbing her by the arm and yanking her roughly to her feet and towards the nearest wall. Her eyes are glaring at you with fury.")

		saynn("[say=mirri]The fuck are you doing?[/say]")

		saynn("You don't answer. Instead, you slam her against the cold surface, pinning her there with your body. Her face is pressed into the wall as one of your hands grabs her wrists and forces them above her head. She growls, thrashing in your grip.. but she can't break free in her current state.")

		saynn("[say=pc]What, your toys and armor aren't helping you anymore? This isn't gonna be fun for you, bitch. Not in a slightest.[/say]")

		saynn("[say=mirri]Oh yeah? Do your worst, you fucker, I ain't afraid of no AlphaCorp doormat.[/say]")

		saynn("She craves some roughness.. but you want to actually punish her.. yeah, you know exactly what you are gonna do to her.")

		saynn("You spread her legs, one of your hands grabbing her ankle and lifting it high, forcing her to either lose balance and fall or fully expose her ass. She tries to kick.. but the angle leaves her helpless, her curvy body forced into submission.")

		saynn("[say=mirri]What? You want to take off my boots and touch my feet, you sick-.. HEY![/say]")

		saynn("Her words cut off into a sharp gasp as you press the tip of your cock not against her pussy.. but rather her tight asshole. You can quickly tell from the way her body immediately tenses up.. she hasn't had much experience with this, her muscles clenching reflexively.")

		saynn("[say=mirri]Fuck! You sick.. ah.. Stop! That's the wrong fucking hole! Are you stupid?![/say]")

		saynn("Her curses turn into strained hisses as you push into her tailhole, forcing your cock inside inch by inch. You offer her a slight help by spitting on your dick.. but going in raw otherwise.")

		saynn("Mirri is painfully tight, her asshole squeezing around you in resistance. Her back arches, her claws scraping uselessly against the wall, her angry tail bapping you fast.")

		saynn("[say=mirri]I swear, I will kill you.. ngh..![/say]")

		saynn("Threats? You got something better than threats. Action.")

		addButton("Ram it in", "Ignore her", "dom_anal_fuck")
	if(state == "dom_anal_fuck"):
		playAnimation(StageScene.SexPinnedBehind, "sex", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("You shove your {pc.penis} deeper, ignoring her sharp words. Her whole body jolts from the pain and her tail begins to swish even more frantically, trying to stop you. Your hands keep her pinned against the wall, forcing her to stay in place.")

		saynn("[say=mirri]Fuck! This is worse than anything.. I'd rather let you rail my cunt over this![/say]")

		saynn("[say=pc]You sure whine a lot for a Syndicate agent. Are you sure you are Blacktail?[/say]")

		saynn("[say=mirri]FUCK YOU![/say]")

		saynn("You're not here to give her what she wants. This is punishment and you intend to make it hurt.")

		saynn("You drive yourself in hard, forcing almost every inch of your cock into her, filling her tight hole. Mirri lets out a frustrated growl, squirming and wriggling under you.. but it online makes the penetration feel rougher.")

		saynn("Her tailhole clenches again and again as you thrust deeper, your hips slamming into her ass at a slow but powerful rate. Her cries of protest mix with hissing and groans of discomfort, her head pressing harder against the wall as she tries to endure it.")

		saynn("[say=mirri]Goddamit.. slow the fuck down.. I can't.. ngh..[/say]")

		addButton("Faster", "Do the opposite", "dom_anal_fast")
	if(state == "dom_anal_fast"):
		playAnimation(StageScene.SexPinnedBehind, "fast", {pc="pc", npc="mirri", bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("But you don't slow down. Instead, you pound into her with even more force, your grip tight and relentless, bending her body to your will. Her resistance fades into ragged breathing as you fuck her raw, her completely neglected pussy becoming wet and dripping juices onto the floor.")

		saynn("[say=mirri]I fucking hate you.. ah..[/say]")

		saynn("Her words are choked out between gasps, her ass clenching around your cock despite her protest. The sound of wet slaps fills the air, accompanied by her complaints and hisses.")

		saynn("[say=pc]You should thank me for training your butt.[/say]")

		saynn("[say=mirri]Don't you dare cum inside..[/say]")

		saynn("Sounds like a challenge. Her inner walls are so tight that you are, in fact, not that far from your peak.")

		addButton("Cum inside", "Stuff her ass full", "dom_anal_cum")
		addButton("Pull out", "Cum all over her butt", "dom_anal_pullout")
	if(state == "dom_anal_cum"):
		playAnimation(StageScene.SexPinnedBehind, "inside", {pc="pc", npc="mirri", pcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Her whole body jerks when you slam in one final time, burying your cock deep inside her asshole. You hold her there, pressed against the wall.. as your balls begin to tense up. And soon, you start unloading inside her. Your dick throbs, your {pc.cum} floods her insides, and she shudders in disgust, her tail twitching as her tight ass is stuffed full.")

		saynn("[say=mirri]You.. fucking animal.. ah..[/say]")

		saynn("[say=pc]Well thank you.[/say]")

		saynn("She mutters something else weakly.. panting from both pain and exertion. You give her a few more brutal thrusts to make sure your seed is thoroughly planted inside her.. before pulling out, her asshole clenching shut the moment you're out.")

		saynn("Mirri slumps against the wall, trying to catch her breath. She is still dripping wet, her legs trembling, her used asshole twitching from the rough fuck.")

		saynn("[say=mirri]..I think I almost came. Shit.[/say]")

		saynn("[say=pc]You wanna admit something?[/say]")

		saynn("[say=mirri]Where is my fucking gun?![/say]")

		saynn("Oops.. Better make your escape now.")

		setFlag("SlaveAuctionModule.customMirriGreeting", "I'M NOT A FUCKING BUTTSLUT, YOU FUCK! I WOULD RIP YOU TO SHREDS.. but then I'd have to hunt slaves myself.. fuck.")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dom_anal_pullout"):
		playAnimation(StageScene.SexPinnedBehind, "tease", {pc="pc", npc="mirri", pcCum=true, bodyState={exposedCrotch=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("You slam in deep one final time but pull out just before your orgasm, leaving Mirri gasping against the wall. She grunts, her asshole twitching and closing shut instantly.")

		saynn("Instead of filling her ass, you cum all over her. Thick ropes of your {pc.cum} splatter across her bare ass with some hitting her blue top and even messing up her twitching feline tail.")

		saynn("[say=mirri]Ngh.. You..! Bitch! Why the fuck did you do that![/say]")

		saynn("Her tail lashes angrily, seed dripping from its fur. She looks over her shoulder, her sharp eyes look extremely frustrated.")

		saynn("[say=mirri]You should have.. fuck.. You should have stuffed my ass instead at least..[/say]")

		saynn("[say=pc]Hah. What a fucking buttslut.[/say]")

		setFlag("SlaveAuctionModule.customMirriGreeting", "I'm not a fucking buttslut. Don't you dare fuck my ass again.")
		saynn("Mirri slumps against the wall, trying to catch her breath. She is still dripping wet, her legs trembling, her tight asshole still twitching from the rough fuck.")

		saynn("[say=mirri]..I think I almost came. Shit.[/say]")

		saynn("[say=pc]You wanna admit something?[/say]")

		saynn("[say=mirri]Where is my fucking gun?![/say]")

		saynn("Oops.. Better make your escape now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dom_rp"):
		playAnimation(StageScene.SexStart, "start", {npc="mirri"})
		saynn("An idea comes to your mind.. a mean one.. but it might also be a good way to test Mirri's spirit.")

		saynn("[say=pc]I know exactly what I will do with you.[/say]")

		saynn("Mirri's eyes look fierce, fueled by her rage. And yet, she puts on a cunning smile.")

		saynn("[say=mirri]Oh yeah? Give me a break, I don't wanna laugh too hard![/say]")

		saynn("You crouch and lean close to her face. She tries to swipe her claws over your cheek but the fight has left her exhausted, you can easily avoid her paw.")

		saynn("[say=pc]How hard should I go on you?[/say]")

		saynn("[say=mirri]Go as hard as you can! Amuse me, AlphaCorp bitch.[/say]")

		saynn("Well, you even got the permission..")

		saynn("You nod and look around. You will need a few things.. and luckily, there is a wardrobe full of those things nearby.")

		addButton("Restraints", "Grab some cuffs and a blindfold", "dom_rp_tie")
	if(state == "dom_rp_tie"):
		playAnimation(StageScene.SexStart, "start", {npc="mirri", npcBodyState={leashedBy="pc"}})
		saynn("You rummage through her wardrobe.. Mirri's room looks so clean.. but you can't say the same about her wardrobe, all the restraints are just thrown together into one big pile.")

		saynn("[say=pc]This could really use a cleanup, you know?[/say]")

		saynn("[say=mirri]It's called.. controlled chaos.. you wouldn't understand! Hey, what are you doing?[/say]")

		saynn("You barely find a blindfold and some cuffs that don't have any questionable red stains on them."+str(" You also find a collar.." if addedCollar else "")+"")

		saynn("After that, you crouch before Mirri again.. and begin securing these toys on her.")

		saynn("[say=pc]I will show you what happens to cocky girls like you.[/say]")

		saynn("[say=mirri]You're gonna fuck me?! Don't be so boring![/say]")

		saynn("You smile and grab her wrists before pushing them into the bulky metal cuffs, locking them together. Mirri looks up at you, her feline eyes narrowing, a smirk playing at the corners of her mouth.")

		saynn("[say=pc]I'm curious how much they are gonna give for you.[/say]")

		saynn("While her eyes turn confused, you wrap a blindfold around them, stealing her sense of sight completely. You know very well how tight that cloth is..")

		saynn("[say=mirri]Huh? The heck are you talking about, soft {pc.boy}?[/say]")

		saynn("With one swift motion and an incredibly satisfying click, you lock a collar around her neck.. Your hand holds the leash.")

		saynn("[say=mirri]Kinky. Sadly for you, I can take it off with nothing but a condom wrapper. Can't keep me locked forever, no matter how hard you will try.[/say]")

		saynn("[say=pc]That's gonna be a problem for you next owner.[/say]")

		saynn("She tilts her head.")

		saynn("[say=mirri]Are you gonna sell me off? No fucking way![/say]")

		saynn("Mirri stays silent.. but then she bursts off laughing.")

		saynn("[say=mirri]HAHA. You're bullshitting me, I can tell! No way an AlphaCorp slave is gonna stand on my spot and sell me, no one would allow that to happen![/say]")

		saynn("She is not wrong. But maybe there is a way to convince her.. just enough to scare her off.. bring her ego down a little.")

		saynn("[say=mirri]You know what? I will play along, just for you~. I was always curious how THEY felt.[/say]")

		saynn("[say=pc]That's all that I need.[/say]")

		saynn("You get up and look around..")

		saynn("That teleporter machine.. hm..")

		saynn("And a laptop.. maybe you can do something with that.")

		addButton("Laptop", "Check it", "dom_tp_laptop")
	if(state == "dom_tp_laptop"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcBodyState={leashedBy="pc"}})
		saynn("You check her laptop.. obviously it's locked.. with a fingerprint scanner.. huh.")

		saynn("[say=pc]Give me your paw.[/say]")

		saynn("[say=mirri]Say please?[/say]")

		saynn("You grab her cuffed paws and press them against the scanner. That unlocks the laptop.")

		saynn("[say=mirri]Ohh.. I know what you did. Smart. All the important stuff is locked with a password though. Get fucking wrekt, scrub.[/say]")

		saynn("Someone has played too many online games..")

		saynn("She is not wrong though, all the interesting files seem to be encrypted.. but you do find some old recordings of the slave auctions.. That might be something that you can use.. You grab the laptop and keep it for now.")

		addButton("Teleport", "Make it seem like you have teleported Mirri somewhere", "dom_tp_tp")
	if(state == "dom_tp_tp"):
		saynn("You walk up to the teleport.. and spool it up. It opens the rift to your cell.")

		saynn("[say=mirri]Huh? I see the light.[/say]")

		saynn("You walk past it, holding the leash.. and then turn it off.")

		saynn("[say=mirri]Did you just teleport us somewhere, you fuck? Where are we? Answer me, bitch! Now![/say]")

		saynn("Yeah, you can just feel the fear flowing through.. but she begins to giggle.")

		saynn("[say=mirri]You really thought I would buy that? Pfff, you are even more stupid than I thought. We are exactly where we were, I know that~.[/say]")

		saynn("Shit. Maybe you can salvage it.")

		saynn("[say=pc]Sure, you can think that, future slave.[/say]")

		saynn("[say=mirri]Haha, you are trying so hard, it's adorable. Wait, I gotta get back into the role. Ple-e-ease, don't sell me!!! I will do anything![/say]")

		saynn("You smack her bare ass.. and pull her towards the auction stage, Mirri's laptop is in your other hand..")

		addButton("Auction stage", "Time for the auction!", "dom_tp_stage")
	if(state == "dom_tp_stage"):
		aimCameraAndSetLocName("market_market")
		playAnimation(StageScene.HangingDuo, "idle", {pc="mirri", npc="pc", bodyState={exposedCrotch=true}})
		saynn("You bring Mirri to the Blacktail Market auction stage while making sure to take some extra turns and loops, confusing her about the layout.")

		saynn("Then, when you arrive on the stage, you position her in the middle.")

		saynn("[say=pc]Hands up.[/say]")

		saynn("Mirri sticks her tongue out.. so you just force her hands up and then attach chains to her cuffs, making her stand on her toes.")

		saynn("[say=mirri]That's not a way to treat a lady.[/say]")

		saynn("[say=pc]How does the collar feel, lady?[/say]")

		saynn("[say=mirri]It's tight and heavy! You can take it off now already.[/say]")

		saynn("[say=pc]I don't care.[/say]")

		saynn("You can just feel her rolling her eyes.")

		saynn("Hm.. time to create the right atmosphere. You place the laptop near the closed curtains.. and run the recording of the old auction. It starts with an empty room.. before any bidders have even arrived.. which is perfect.")

		saynn("[say=mirri]What are you doing?[/say]")

		saynn("[say=pc]Gathering the crowd. A little auction is about to take place.[/say]")

		saynn("[say=mirri]Amusing.[/say]")

		saynn("Bidders begin to arrive on that recording.. their boots stepping loudly.")

		saynn("[say=mirri]Huh? Is that you? Hah, you almost got me. You don't have to slap the floor to fool me, silly.[/say]")

		saynn("You begin circling Mirri.. Time to do this.")

		saynn("[say=pc]WELCOME! Welcome to my little auction![/say]")

		saynn("[say=mirri]Hi! I'm the future bitch-slave! Please treat me like the fucktoy that I am![/say]")

		saynn("You chuckle at her confidence, your hand grabbing Mirri's chin.. while the laptop creates sounds far away.")

		saynn("[say=mirri]Yeah, cool, you threw something to make that sound. Very smart. Is that what you did?[/say]")

		saynn("You speak quietly into her ear.")

		saynn("[say=pc]What do you think, Mirri? What am I doing?[/say]")

		saynn("..and then switch back to your loud presenter voice.")

		saynn("[say=pc]Look at this fine specimen, ladies and gentlemen! She is a mouthy one, that's for sure. But that just means it will be more fun to see her gradually break down![/say]")

		saynn("She tries to shake the blindfold off.. but you yank on her ponytail to make her focus.")

		saynn("[say=mirri]Argh.. Is there someone else here?[/say]")

		saynn("[say=pc]She is a hybrid, as you can see! A very exotic one! Agility of a feline and the practicality of a human. You know, those are actually very valuable on some planets. But it's obviously an acquired taste.[/say]")

		saynn("Enough bidders have arrived on the recording.. that they began quietly chatting with each other.")

		saynn("[say=mirri]You're not.. fooling me.. I am one hundred percent sure that this isn't happening.[/say]")

		saynn("[say=pc]Yes, Mirri, you have nothing to worry about.[/say]")

		saynn("You position yourself behind her.. your hands land on her top.. and yank it down, exposing her {mirri.breasts} to the.. curtains. Your digits begin squeezing and groping her chest, forcing a little moan out of her.")

		saynn("[say=mirri]Ah..[/say]")

		saynn("[say=pc]Just look at those perfect tits.. Super squeezable. Some drugs and she can even become a hucow. I heard that catgirl milk is extremely sweet.[/say]")

		saynn("[say=mirri]Hey.. easy..[/say]")

		saynn("The chatter becomes louder and louder.. the speakers on that laptop aren't perfect.. but it seems to be enough..")

		saynn("[say=pc]Yeah.. oh, did someone just bid? I didn't even announce the starting price yet.[/say]")

		saynn("[say=mirri]'Cause you're a dummy..[/say]")

		saynn("[say=pc]Let's say.. A thousand credits. Is someone gonna match that?[/say]")

		saynn("You hold Mirri in suspense.")

		saynn("[say=mirri]A thousand, really? I'm Mirri Blacktail! I'm the best Syndicate slaver, I cost millions at least![/say]")

		saynn("Someone said something on the recording.. perfect timing.")

		saynn("[say=pc]Oh, I see a hand. Interesting. Someone can give me eleven hundred now?[/say]")

		saynn("[say=mirri]What? You're bullshitting me, there is no one there..[/say]")

		saynn("One of your hands keeps groping her breasts firmly.. while the second one reaches down and pulls down her panties, exposing her cute pink pussy slit.. that looks dry.")

		saynn("[say=pc]Who wouldn't want to take a chance on this tight little pussy? She's got zero wear and tear, see? Extremely fuckable.[/say]")

		saynn("When you spread her folds.. you notice the strings of juices hanging between them.")

		saynn("[say=pc]Oh, what's this? Seems like someone is enjoying the thought of being sold.[/say]")

		saynn("[say=mirri]I don't![/say]")

		saynn("You smack her ass, the sound echoing around.. together with Mirri's moan of pleasure.")

		saynn("[say=mirri]Ah![/say]")

		saynn("[say=pc]And just check out that ass. It's begging to be spanked![/say]")

		saynn("Your digits spread her folds again and one slips inside, gently playing with the cocky slave's pussy.. making the girl squirm on the stage.. while the fake audience watches and makes a lot of noise. A second finger joins the first soon, stretching her tight needy entrance, curling to press against that sensitive spot that leaves her breathless.")

		saynn("[say=pc]Oh, are you making a bid? Nice. Can someone give me twelve hundred now? This slave is worth it, trust me.[/say]")

		saynn("[say=mirri]Mmhmm.. ah.. You are not selling me.. I'm pretty sure.. You know how?..[/say]")

		saynn("Her hips buck slightly form the fingering.. but you keep her firmly in place, your fingers pumping in and out, keeping a steady rhythm.")

		saynn("[say=pc]How?[/say]")

		saynn("[say=mirri]You.. wouldn't be able to start the Blacktail Market without my password.. ah..[/say]")

		saynn("You lean really close to her ear.. while your fingers fuck her soaking pussy faster, three of them now, thrusting in and out, causing her slit to produce wet noises. Her legs begin to weaken..")

		saynn("[say=pc]Who said that we are at the Blacktail Market..[/say]")

		saynn("Mirri shuts up and just moans and pants, her wet pussy suddenly getting all tight around your digits, the inner walls clenching hard.")

		saynn("The stage, the lack of vision, the confusion, the sound of the audience, the presenter and the constant rough finger-fucking.. Mirri is so close, you can feel it.")

		saynn("[say=pc]Another bid? Great. Thirteen hundred anyone? Thirteen hundred to the man in black, great choice! Anyone ready to give me fourteen hundred? Look at her squirm, this slave is loving every second! Your collection will get ten times better with this one![/say]")

		saynn("Her moans suddenly become desperate. Her knees give ways as she sags in the cuffs.")

		saynn("[say=mirri]I.. ah.. I'm not some pathetic slave! I'm slaver! You can't just.. ah.. fu-.. fuck, I'm about to.. You c-can't just sell.. ah-h!..[/say]")

		saynn("You whisper into her ear.")

		saynn("[say=pc]Are you scared, bitch?[/say]")

		saynn("She shakes her head a lot.. before throwing it back.. With a sharp cry, she finally loses control. Her body begins to convulse eagerly around your fingers, her inner walls pulsing in rapid contractions as she cums.")

		saynn("[say=mirri]F-fuck you.. ahh.. D-don't.. please.. Ahh!..[/say]")

		saynn("[say=pc]THIRTEEN HUNDRED! SOLD![/say]")

		saynn("Her body shudders violently as her tight pussy squirts, creating a shiny fountain of transparent juices that splashes over the stage floor.")

		saynn("Mirri gasps, caught between shock and overwhelming pleasure, barely enduring the pleasure waves that flow through her as you continue to push your digits in and out, prolonging her climax until she is reduced to a trembling, helpless mess.")

		saynn("Mirri is panting heavily as she dangles limply from her restraints.")

		saynn("[say=pc]You can grab your new slave now.[/say]")

		saynn("[say=mirri]D-don't.. I will f-fucking.. k-kill you.. you all.. ah.. f-fuckers.. ALL OF YOU!..[/say]")

		addButton("Blindfold", "Take off her blindfold", "dom_rp_blindfold_off")
	if(state == "dom_rp_blindfold_off"):
		saynn("You untie the blindfold, letting it onto the wet floor.")

		saynn("Mirri squints.. and then desperately looks around with her crazy blue eyes. The hall is empty, the curtains aren't even opened.. there is just that laptop playing some recording..")

		saynn("[say=mirri]Wh.. there is.. you.. GRRR![/say]")

		saynn("You put on your cheeky smile and stand in front of the girl.")

		saynn("[say=pc]Huh? I thought I didn't fool you.[/say]")

		saynn("[say=mirri]You fucking.. Of course you didn't.. I knew your plan.. I knew everything.[/say]")

		saynn("You chuckle and pinch her hard nipples.")

		saynn("[say=mirri]Ah![/say]")

		saynn("[say=pc]Didn't know simple roleplay can get you so horny.[/say]")

		saynn("She growls louder while you laugh.")

		saynn("[say=mirri]Shut up. Get me down already..[/say]")

		saynn("[say=pc]Can I keep the collar on you? Pretty please.[/say]")

		saynn("[say=mirri]Very funny.. No. I am NOT a slave. Unlike you.[/say]")

		saynn("You'd rather not anger the one who can actually sell you off into slavery at any point.")

		addButton("Restraints", "Bring her down", "dom_rp_after")
	if(state == "dom_rp_after"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("You take off her cuffs and the collar.")

		saynn("Mirri rubs her neck and hisses quietly.")

		saynn("[say=pc]It was fun to see you scared.[/say]")

		saynn("[say=mirri]I wasn't scared, you bitch.. hmpf.[/say]")

		saynn("She grabs all the restraints and her laptop. But before the leaves, you give her ass a final smack.")

		saynn("[say=mirri]Ah. I hate you.[/say]")

		saynn("[say=pc]I thought you loved me.[/say]")

		saynn("[say=mirri]I can not love a stupid {pc.boy}..[/say]")

		saynn("You chuckle and watch her walk away.")

		GM.pc.setLocation("market_market")
		setFlag("SlaveAuctionModule.customMirriGreeting", "You did NOT trick me. I was on top of it! I just played along like I said!")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dom_spank"):
		playAnimation(StageScene.Spanking, "tease", {pc="pc", npc="mirri"})
		saynn("A little spanking is what that spoiled brat needs.")

		saynn("As you grab Mirri by the hips and pull her closer, her eyes flash with anger, her tail whipping furiously.")

		saynn("[say=pc]Pull your ass up, Mirri.[/say]")

		saynn("[say=mirri]Why would I?![/say]")

		saynn("Yeah, you reckon. Rather than ordering, you just firmly plant your hand on your back and press her down into the floor, her arms sprawling out before her and her ass sticking up as a result. Mirri instantly starts to growl, a little blush spreading across her cheeks.")

		saynn("[say=mirri]What are you doing?![/say]")

		saynn("She tries to wiggle out of it.. but the fight left her breathless, causing her to fail. The catgirl is in a very exposed spot, her barely-covered ass on full display, the fabric of her striped panties clings tightly to her sensitive skin, outlining her slit.")

		addButton("Spank!", "Make that booty red", "dom_spank_start")
	if(state == "dom_spank_start"):
		playAnimation(StageScene.Spanking, "spank", {pc="pc", npc="mirri"})
		saynn("Without a word, you raise your free hand.. before bringing it down hard on her curvy ass, the sharp sound of skin meeting skin echoes around the room. Mirri yelps and hisses, her claws digging into the floor as she jerks forward.")

		saynn("[say=mirri]Ow.. Did you just spank my ass?[/say]")

		saynn("You help her understand it better by smacking her butt again, making it jiggle while her tail wags. This time she was ready for it so the effect wasn't as strong.")

		saynn("[say=mirri]Is that all you've got?[/say]")

		saynn("She chuckles and looks back at you, her lips curling into a teasing smirk.")

		saynn("[say=mirri]Pathetic. You think a little spanking is going to-..[/say]")

		saynn("You cut her off with another strike, much harder this time, feeling her flesh heat beneath your palm, her body recoiling forward again. She stifles a gasp, her tail moving to defend her rear, but you simply pin it down, forcing her ass to stay exposed.")

		saynn("[say=pc]Bad girl.[/say]")

		saynn("[say=mirri]BAD GIRL?! Do you even know who I am?! I am-.. AH![/say]")

		saynn("Her worlds are swallowed by another powerful smack. Her body jolts forward, her butt now visible reddened, a little subtle print of your palm visible on it.")

		saynn("[say=pc]You're a brat that needs to learn her place.[/say]")

		addButton("More", "Spank the bitch out of her", "dom_spank_harder")
	if(state == "dom_spank_harder"):
		playAnimation(StageScene.Spanking, "fast", {pc="pc", npc="mirri"})
		saynn("You don't stop, keeping up a steady rhythm of spanks that has her panting, her smut demeanor fading away, giving way to a frustrated snarl. She glares back at you when she can, her stare drilling through you.")

		saynn("[say=mirri]I will.. gh.. kill you! Or worse! Sell you off to someone.. agh..[/say]")

		saynn("You put more authority into each smack against that butt that has gotten quite red by now. You can feel how much it stings.. because it stings your palms too by now.")

		saynn("[say=pc]Bad girl.[/say]")

		saynn("[say=mirri]Shut up with this bad girl shit! Agh.. I'm a Syndicate agent, you're not allowed to.. ah.. fuck, my ass.. not allowed to spank me! You're just a.. FUCK.. grrr-r.. ah.. just an AlphaCorp slave..[/say]")

		saynn("And yet, she is the one squirming under you, each spank making her let out a stifled noise.")

		saynn("By the last strike, her disobedient glare is still present.. but her hips have a mind of their own, trembling slightly, legs rubbing against each other. Her tail hangs low, flicking angrily every few seconds.")

		saynn("You pull her butt close and let your hands rest on her red skin, feeling the heat radiate from each mark.")

		saynn("[say=pc]How was it?[/say]")

		saynn("[say=mirri]That felt great, you fuck.. obviously..[/say]")

		saynn("[say=pc]I'm glad.[/say]")

		saynn("You finish it off by playing a drum solo on her flushed ass, making the poor catgirl throw her head back and let out a painful noise, several huge waves of sharp sensations rock through her body.")

		saynn("[say=mirri]Grr.. I will repeat it, is this all you've got, soft {pc.boy}?..[/say]")

		addButton("Enough", "She received enough spanks", "dom_spank_enough")
		if (false):
			addButton("Breasts", "Give her breasts some love too", "dom_spank_breasts")
		addButton("Whip pussy", "Focus on her pussy specifically now", "dom_spank_pussy")
	if(state == "dom_spank_enough"):
		playAnimation(StageScene.Duo, "stand", {pc="pc", npc="mirri"})
		saynn("You decide that she has earned a breather.")

		saynn("[say=pc]You're barely keeping yourself from collapsing already, Mirri.[/say]")

		saynn("[say=mirri]Hmpf.. talk for yourself, soft {pc.boy}.[/say]")

		saynn("She slowly gets up to her legs.. shaky legs.")

		saynn("[say=mirri]Good job. That was.. at least decent by my standards.[/say]")

		saynn("[say=pc]Huh? And what is good by your standards.[/say]")

		saynn("[say=mirri]Good is when they scream in agony, begging for you to stop! But you don't, slowly breaking them, one bone at a time.[/say]")

		saynn("[say=pc]You are one crazy bitch, Mirri.[/say]")

		saynn("She smiles.")

		saynn("[say=mirri]Well thank you. I don't break everyone's bones, sometimes I make exceptions for certain people in my life~.[/say]")

		saynn("That's.. good.")

		setFlag("SlaveAuctionModule.customMirriGreeting", "I still can't sit on my ass because of you. I need something soft.. like your face!")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dom_spank_pussy"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="mirri"})
		saynn("[say=pc]You asked for it, bitch.[/say]")

		saynn("As you get up and head for her wardrobe of bdsm restraints, Mirri turns herself to her back, her feline eyes curious to see what you're up to.")

		saynn("[say=mirri]Ow, my butt..[/say]")

		saynn("Her eyes widen just a bit as you reach out for a small-looking nine-tailed whip.. Her body tenses as she realizes exactly where you're staring at.")

		saynn("[say=mirri]Don't you dare..[/say]")

		saynn("You close distance with her, the whip tails land on her thigh and gently brushes it.")

		saynn("[say=pc]You're begging me to stop already?[/say]")

		saynn("[say=mirri]No, obviously.. AH![/say]")

		saynn("The first strike lands squarely on her covered up pussy, sharp and precise. Mirri gasps, her legs reflexively snapping shut as the sting radiates through her.")

		saynn("[say=pc]Legs. Now.[/say]")

		saynn("Her mean glare intensifies.. but she does obey, bravely spreading her legs.")

		saynn("[say=mirri]Do your worst.. AGH![/say]")

		saynn("Her breath hitches as you deliver another whip on her pussy, your strikes relentless. The thin fabric of her panties offers little protection, her tail curling in the air, creating interesting patterns as she is trying to endure the pain.")

		saynn("[say=pc]Can't handle it? Just say that you're too soft for this, I won't judge.[/say]")

		saynn("[say=mirri]Nhh-h.. Fuck you.. keep whipping..[/say]")

		saynn("Her legs are twitching, instinctively trying to close when you raise the whip.")

		saynn("[say=pc]Panties off.[/say]")

		saynn("[say=mirri]Grr.. fine..[/say]")

		saynn("She is getting a little obedient.")

		addButton("Continue", "See what happens next", "dom_spank_pussy_naked")
	if(state == "dom_spank_pussy_naked"):
		playAnimation(StageScene.GivingBirth, "birth", {pc="mirri", bodyState={exposedCrotch=true}})
		saynn("Mirri hooks her clawed digits under the waistband of her fancy panties and pulls them down, fully exposing her sensitive, reddened lips.. there are ever so slightly visible strings of transparent juices hanging between them and the cloth..")

		saynn("[say=mirri]Here, whip me, you softie..[/say]")

		saynn("Without hesitation, you raise the whip up.. before bringing it down again, this time directly on her bare skin.")

		saynn("[say=mirri]AH..[/say]")

		saynn("Mirri's breath catches, her entire body jerking and then stiffening, her paws clenching into fists against the floor, her pussy reflectively clenching from the sharp impact.")

		saynn("[say=mirri]Nhh.. harder, you bitch..[/say]")

		saynn("Another hit lands, and she bites down on her lip, her thighs quiver, her pussy muscles pulsing as multiple thin lines of red appear on her skin, her wet sensitive flower trembling under the relentless assault.")

		saynn("[say=mirri]Ah.. F-fuck, that stings.. Nhh-h.. fu-uck..[/say]")

		saynn("[say=pc]One more?[/say]")

		saynn("She presents you her bruised pussy, the folds and the clit tingling every few seconds, her tailhole clenching too,")

		saynn("[say=mirri]..what do you think?[/say]")

		saynn("Knowing her, she clearly wants more. And so you give it to her by delivering one last whip on that tight slit, the sting of the many tails echoing around the whole room.")

		saynn("[say=mirri]AHHhh..[/say]")

		saynn("A gasp tears from her lips as her muscles spasm hard, her hips bucking involuntarily as she writhes under this weird kind of stimulation. Her bruised pussy releases a little stream of transparent juices before she closes her legs shut, too embarrassed to show her body's reaction.")

		saynn("[say=mirri]Mmmmhhh.. s-shit.. t-that's enough.[/say]")

		saynn("[say=pc]Did you just came a little?[/say]")

		saynn("[say=mirri]NO? I'm not a painslut.. I'm a Syndicate agent, I am the biggest sadist in the world..[/say]")

		saynn("You crouch and slide your hand between her closed legs, landing it on her bruised heated sex.. and instantly hear her hissing painfully.")

		saynn("[say=pc]I'm beginning to think that this Syndicate agent might be living a secret double life.[/say]")

		saynn("Mirri pouts.")

		addButton("Enough", "You did enough damage", "dom_spank_whip_enough")
		addButton("Vaginal fisting", "Suddenly switch to testing how much her pussy can swallow!", "dom_spank_fist")
	if(state == "dom_spank_whip_enough"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcBodyState={exposedCrotch=true}})
		saynn("You throw the whip away and help her to get up.")

		saynn("Mirri tries to pull her panties up over her whipped folds.. and grunts, her body trembling.")

		saynn("[say=mirri]Ow.. ah.. fuck.. where is that fucking cream..[/say]")

		saynn("[say=pc]Life is pain, huh.[/say]")

		saynn("[say=mirri]Your life will be nothing but pain if I don't find that cream..[/say]")

		saynn("Cute threats.")

		setFlag("SlaveAuctionModule.customMirriGreeting", "I still can't sit on my ass because of you. I need something soft.. like your face!")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "dom_spank_fist"):
		playAnimation(StageScene.SexFisting, "tease", {pc="pc", npc="mirri", npcBodyState={exposedCrotch=true}})
		saynn("Seeing that bruised pussy.. makes you want to test it even further.. and break down more of that stubborn pride of hers while you're at it.")

		saynn("Without explaining anything, you turn Mirri onto all fours again, your fingers land on her dripping slit and begin to tease her, rubbing in slow, deliberate circles around her entrance.")

		saynn("[say=mirri]Ahh.. hh.. What the fu.. ah.. f-fuck are you doing..[/say]")

		saynn("[say=pc]Breaking you.[/say]")

		saynn("You slide two digits inside her wet love tunnel, parting her red hot folds in the process which makes her arch her back and yelp.")

		saynn("[say=mirri]You just fucking whipped me there, it hurts..[/say]")

		saynn("She gasps as you push deeper, adding another finger, stretching her little by little. The sharp sting of the whip has left her extremely sensitive and vulnerable, each movement of your digits sends electric shivers through her body, her walls clenching around you.")

		saynn("[say=mirri]Nhh..[/say]")

		saynn("[say=pc]Ready to give up now?[/say]")

		saynn("[say=mirri]Fuck you! I love you, keep abusing my cunt, you fuck..[/say]")

		saynn("Looks like you have scrambled her brains a little with all the spanking and whipping, hah.")

		saynn("[say=pc]Syndicate Agent.. more like Syndicate Slut.[/say]")

		saynn("Slowly and teasingly, you work in the fourth finger too.. and begin to really feel her walls ripple around your fingers. Mirri is squirming around on the floor, her eyes full of bliss.. weird kind of bliss.")

		saynn("[say=mirri]Nhh.. I hate you.. My cunt is burning.. ghh-h..[/say]")

		saynn("She is wet inside.. extremely wet.. so much that you begin trying to force the whole palm in, stretching her red pussy with your digits as you slip them in and out.")

		saynn("[say=mirri]Shi-it..[/say]")

		saynn("Mirri is trembling hard, her claws leaving marks on the wooden floor. Cats do love pain after all..")

		addButton("Fist", "Shove the whole fist in", "dom_spank_fist_shove")
	if(state == "dom_spank_fist_shove"):
		playAnimation(StageScene.SexFisting, "sex", {pc="pc", npc="mirri", npcBodyState={exposedCrotch=true}})
		saynn("With each thrust, you push your fingers deeper.. until finally.. you slip your entire hand inside her, now feeling her slick warmness envelop you completely. Mirri's body instantly shudders around you, her loud cry filling the air while her pussy clenches hard, releasing a little short squirt of fluids.")

		saynn("[say=pc]Look at you, taking it all.[/say]")

		saynn("[say=mirri]Mhhhh.. fuuuuuck.. I w-wanna rip your head off.. s-snuggle you to death.. my cu-u-unt..[/say]")

		saynn("Her tail wraps around your wrist as you begin to pump your fist in and out. Each movement sends her spiraling closer to.. some kind of edge. Her body arches against you, the tension in her bruised stretched pussy rising fast as it starts to make wet noises.")

		saynn("[say=mirri]Agh-hh. Ahh.. ahhh.. PUMP THIS WHORE FULL.. AH.. SHIT, I'm CUMMING.. AH..[/say]")

		saynn("With a final, powerful thrust, you drive your fist in deep.. and then it's like a dam breaking. Mirri cries out, a crazy combination of pain and pleasure flooding her senses.. Her clenching pussy squirts, sending a strong current of fluids onto the floor.. again and again.. until there is nothing left but dry convulsions.")

		saynn("You feel her walls tighten.. and then release.. and then tighten again, pulsing at a slow rate while she is losing herself to these sensations that you're bringing her.")

		saynn("Seeing her rolled up eyes.. yeah.. you know that you have pushed her to her limits now.")

		addButton("Enough", "Let her rest now", "dom_spank_fist_shove_enough")
	if(state == "dom_spank_fist_shove_enough"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcBodyState={exposedCrotch=true}})
		saynn("You yank your fist out.. causing her pussy to clench and pulse again for a bit. Then you just help her to get up onto her legs.")

		saynn("Mirri is swaying a lot, her thighs are all wet, her bruised, abused pussy still dripping..")

		saynn("[say=mirri]I think I'm in love with you, {pc.name}..[/say]")

		saynn("[say=pc]Yeah, I heard it. You also wanted to rip my head off.[/say]")

		saynn("[say=mirri]Pff, don't be a pussy cat. I only kill the ones I can't stand.. which is pretty much everyone.. but still! Shit, my ass hurts too still.. Where is that damn cream..[/say]")

		setFlag("SlaveAuctionModule.customMirriGreeting", "I still can't sit on my ass because of you. I need something soft.. like your face!")
		saynn("Mirri heads towards her wardrobe.. better to leave her to it now.")

		addButton("Continue", "See what happens next", "endthescene")
func getDebugActions():
	return [
	{
		"id": "addCredits",
		"name": "Add fake creds",
		"args": [
			{
				"id": "creds",
				"name": "Amount",
				"type": "number",
				"value": 100,
			},
		],
	},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "addCredits"):
		getModule("SlaveAuctionModule").addRepCredits(int(_args["creds"]))

func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "dom_straponfuck_puton", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sell_menu"):
		runScene("SlaveAuctionGenericSellScene")
		endScene()
		return

	if(_action == "sex_menu_check"):
		if(!getModule("SlaveAuctionModule").canDomMirri() && !getFlag("SlaveAuctionModule.pickedSexSub")):
			setFlag("SlaveAuctionModule.pickedSexSub", true)
			setState("kinky_times_intro")
			return
		
		setState("sex_menu")
		return

	if(_action == "open_upgrades_menu"):
		runScene("SlaveAuctionUpgradesScene")
		return

	if(_action == "buyscene"):
		runScene("MirriBuySellScene")
		return

	if(_action == "do_next_rank"):
		var theNextScene = getModule("SlaveAuctionModule").getNextRankScene()
		if(theNextScene  == ""):
			return
		
		var mirriRank = getModule("SlaveAuctionModule").getRepLevel()
		getModule("SlaveAuctionModule").advanceRepLevel()
		runScene(theNextScene)
		addExperienceToPlayer(50 * (mirriRank+1))
		endScene()
		return

	if(_action == "try_dominate"):
		setState("dom_about_to_fight")
		return

	if(_action == "agree_be_toy"):
		setFlag("SlaveAuctionModule.sexSubbedToMirri", true)
		getModule("SlaveAuctionModule").addMirriAffection(0.1)

	if(_action == "sub_painplay"):
		processTime(5*60)
		getModule("SlaveAuctionModule").addMirriAffection(0.1)

	if(_action == "sub_pussy"):
		processTime(5*60)
		getModule("SlaveAuctionModule").addMirriAffection(0.15)

	if(_action == "sub_walkies"):
		processTime(5*60)
		getModule("SlaveAuctionModule").addMirriAffection(0.2)

	if(_action == "ask_luxe"):
		processTime(5*60)

	if(_action == "ask_bdcc"):
		processTime(5*60)

	if(_action == "ask_blacktail"):
		processTime(5*60)

	if(_action == "ask_slaves"):
		processTime(5*60)

	if(_action == "ask_collar"):
		processTime(5*60)

	if(_action == "subintro_kneel"):
		processTime(5*60)

	if(_action == "subintro_teeth"):
		processTime(5*60)
		GM.pc.addLust(100)

	if(_action == "sub_painplay_chains"):
		processTime(5*60)
		GM.pc.doWound("mirri")
		GM.pc.addPain(50)

	if(_action == "sub_painplay_panties"):
		processTime(5*60)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ballgag"))
		GM.pc.doWound("mirri")
		GM.pc.addPain(50)
		GM.pc.orgasmFrom("mirri")

	if(_action == "sub_painplay_wakeup"):
		processTime(60*60)
		GM.pc.getInventory().clearSlot(InventorySlot.Mouth)

	if(_action == "subpussy_table"):
		processTime(5*60)

	if(_action == "subpussy_start"):
		processTime(5*60)

	if(_action == "subpussy_breather"):
		processTime(5*60)

	if(_action == "subpussy_masturbate"):
		processTime(10*60)

	if(_action == "subpussy_mirricum"):
		processTime(3*60)
		GM.pc.cummedOnBy("mirri", FluidSource.Vagina)
		GM.pc.cummedInMouthBy("mirri", FluidSource.Vagina)

	if(_action == "subpussy_after"):
		processTime(5*60)

	if(_action == "subpussy_pee"):
		processTime(5*60)

	if(_action == "subpussy_peeactual"):
		processTime(3*60)
		GM.pc.cummedInMouthBy("mirri", FluidSource.Pissing)

	if(_action == "subwalkies_suit"):
		processTime(10*60)

	if(_action == "subwalkies_paw"):
		processTime(5*60)

	if(_action == "subwalkies_refusepaw"):
		processTime(5*60)

	if(_action == "subwalkies_tp"):
		processTime(5*60)

	if(_action == "subwalkies_moreexplore"):
		processTime(5*60)

	if(_action == "subwalkies_nova"):
		processTime(5*60)

	if(_action == "subwalkies_donothing"):
		processTime(5*60)

	if(_action == "subwalkies_barksavepuppy"):
		processTime(5*60)

	if(_action == "subwalkies_aftersave"):
		processTime(5*60)

	if(_action == "subpuppy_back"):
		processTime(10*60)

	if(_action == "subpuppy_putonstrapon"):
		processTime(5*60)
		getCharacter("mirri").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("StraponCanine"))

	if(_action == "subpuppy_suck"):
		processTime(5*60)

	if(_action == "subpuppy_ass"):
		processTime(5*60)
		GM.pc.gotAnusFuckedBy("mirri")

	if(_action == "subpuppy_pussy"):
		processTime(5*60)
		GM.pc.gotVaginaFuckedBy("mirri")

	if(_action == "subpuppy_ass_fast"):
		processTime(5*60)
		GM.pc.orgasmFrom("mirri")

	if(_action == "subpuppy_ass_knot"):
		processTime(5*60)
		GM.pc.gotAnusFuckedBy("mirri")

	if(_action == "subpuppy_after_sex"):
		processTime(5*60)
		getCharacter("mirri").removeStrapon()

	if(_action == "subpuppy_pussy_fast"):
		processTime(5*60)
		GM.pc.orgasmFrom("mirri")

	if(_action == "subpuppy_pussy_knot"):
		processTime(5*60)
		GM.pc.gotVaginaFuckedBy("mirri")

	if(_action == "dom_start_fight"):
		runScene("FightScene", ["mirri", "domFight"], "mirriFight")
		return

	if(_action == "dom_nothing"):
		processTime(5*60)
		getModule("SlaveAuctionModule").addMirriAffection(0.1)

	if(_action == "dom_hatefuck"):
		getModule("SlaveAuctionModule").addMirriAffection(0.1)

	if(_action == "dom_straponfuck_pick"):
		getModule("SlaveAuctionModule").addMirriAffection(0.1)

	if(_action == "dom_anal"):
		getModule("SlaveAuctionModule").addMirriAffection(0.1)

	if(_action == "dom_spank"):
		processTime(5*60)
		getModule("SlaveAuctionModule").addMirriAffection(0.1)

	if(_action == "dom_rp"):
		processTime(5*60)
		getModule("SlaveAuctionModule").addMirriAffection(0.1)

	if(_action == "dom_hatefuck_usecondom"):
		usedCondom=true
		processTime(5*60)
		setState("dom_hatefuck_fuck")
		setFlag("SlaveAuctionModule.customMirriGreeting", "You know.. I changed my mind. That was pretty good. Doesn't mean I will submit to the AlphaCorp slave again.")
		return

	if(_action == "dom_hatefuck_nocondom"):
		usedCondom=false
		processTime(5*60)
		setState("dom_hatefuck_fuck")
		if(canBreed):
			if(getCharacter("mirri").isVisiblyPregnant()):
				setFlag("SlaveAuctionModule.customMirriGreeting", "I guess I'm pregnant already so whatever..")
			else:
				setFlag("SlaveAuctionModule.customMirriGreeting", "If you knocked me up, I swear..")
		else:
			setFlag("SlaveAuctionModule.customMirriGreeting", "You tried your best to breed me.. But I forgot to tell you that I'm on a pill~. I ain't having kids from no AlphaCorp slaves, understand?")
		return

	if(_action == "dom_hatefuck_fuck_fast"):
		processTime(5*60)

	if(_action == "dom_hatefuck_fuck_cum"):
		processTime(5*60)
		if(!usedCondom):
			getCharacter("mirri").cummedInVaginaBy("pc")
		else:
			addFilledCondomToLootIfPerk(getCharacter("pc").createFilledCondom())
		GM.pc.orgasmFrom("mirri")

	if(_action == "dom_hatefuck_enough"):
		GM.pc.unequipStrapon()

	if(_action == "dom_hatefuck2_fuck"):
		processTime(10*60)

	if(_action == "dom_hatefuck2_fast"):
		processTime(5*60)

	if(_action == "dom_hatefuck2_cum"):
		processTime(10*60)
		if(!isStrapon):
			getCharacter("mirri").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("mirri")

	if(_action == "dom_hatefuck2_after"):
		processTime(5*60)

	if(_action == "dom_hatefuck3_pin"):
		processTime(10*60)

	if(_action == "dom_hatefuck3_fuck"):
		processTime(10*60)

	if(_action == "dom_hatefuck3_fast"):
		processTime(5*60)

	if(_action == "dom_hatefuck3_cum"):
		processTime(10*60)
		getCharacter("mirri").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("mirri")

	if(_action == "dom_hatefuck3_cum_strapon"):
		processTime(10*60)
		GM.pc.orgasmFrom("mirri")
		setState("dom_hatefuck3_cum")
		return

	if(_action == "endthescene_unequipstrapon"):
		endScene()
		GM.pc.unequipStrapon()
		return

	if(_action == "dom_straponfuck_puton"):
		processTime(2*60)
		isStrapon = true
		var strapon = _args[0]
		GM.pc.getInventory().removeItem(strapon)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		var theFluids = strapon.getFluids()
		if(theFluids != null):
			if(theFluids.hasFluidType("Cum")):
				straponHasCum = true
		setState("dom_straponfuck_start")
		
		if(straponHasCum && !getCharacter("mirri").isVisiblyPregnant()):
			setFlag("SlaveAuctionModule.customMirriGreeting", "If you knocked me up with someone's cum, I swear..")
		else:
			setFlag("SlaveAuctionModule.customMirriGreeting", "You're lucky that you won, okay?")
		return

	if(_action == "dom_straponfuck_fuck"):
		processTime(5*60)

	if(_action == "dom_straponfuck_fuck_fast"):
		processTime(5*60)

	if(_action == "dom_straponfuck_fuck_cum"):
		processTime(5*60)
		getCharacter("mirri").cummedInVaginaBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("mirri")

	if(_action == "dom_anal_fuck"):
		processTime(5*60)

	if(_action == "dom_anal_fast"):
		processTime(5*60)

	if(_action == "dom_anal_cum"):
		processTime(5*60)
		getCharacter("mirri").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("mirri")

	if(_action == "dom_anal_pullout"):
		processTime(5*60)
		getCharacter("mirri").cummedOnBy("pc")
		GM.pc.orgasmFrom("mirri")

	if(_action == "dom_rp_tie"):
		processTime(5*60)
		getCharacter("mirri").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		getCharacter("mirri").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		if(getCharacter("mirri").getInventory().hasSlotEquipped(InventorySlot.Neck)):
			getCharacter("mirri").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
			addedCollar = true

	if(_action == "dom_tp_laptop"):
		processTime(5*60)

	if(_action == "dom_tp_tp"):
		processTime(5*60)

	if(_action == "dom_tp_stage"):
		processTime(5*60)

	if(_action == "dom_rp_blindfold_off"):
		processTime(10*60)
		getCharacter("mirri").getInventory().clearSlot(InventorySlot.Eyes)

	if(_action == "dom_rp_after"):
		processTime(5*60)
		if(addedCollar):
			getCharacter("mirri").getInventory().clearSlot(InventorySlot.Neck)
		getCharacter("mirri").getInventory().clearSlot(InventorySlot.Wrists)

	if(_action == "dom_spank_start"):
		processTime(5*60)

	if(_action == "dom_spank_harder"):
		processTime(5*60)

	if(_action == "dom_spank_enough"):
		processTime(5*60)

	if(_action == "dom_spank_breasts"):
		processTime(5*60)

	if(_action == "dom_spank_pussy"):
		processTime(5*60)

	if(_action == "dom_spank_pussy_naked"):
		processTime(5*60)

	if(_action == "dom_spank_fist"):
		processTime(5*60)

	if(_action == "dom_spank_fist_shove"):
		processTime(5*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "mirriFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setFlag("SlaveAuctionModule.firstTimeDom", true)
			setState("dom_fight_won")
			addExperienceToPlayer(50)
		else:
			setState("dom_fight_lost")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["canBreed"] = canBreed
	data["usedCondom"] = usedCondom
	data["straponHasCum"] = straponHasCum
	data["isStrapon"] = isStrapon
	data["addedCollar"] = addedCollar

	return data

func loadData(data):
	.loadData(data)

	canBreed = SAVE.loadVar(data, "canBreed", false)
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
	isStrapon = SAVE.loadVar(data, "isStrapon", false)
	addedCollar = SAVE.loadVar(data, "addedCollar", false)
