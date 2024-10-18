extends SceneBase

func _init():
	sceneID = "MirriTalkScene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("You approach Mirri. The catgirl is eyeing you out.")

		saynn("[say=mirri]"+str(getModule("SlaveAuctionModule").getMirriGreeting())+"[/say]")

		saynn(""+str(getModule("SlaveAuctionModule").getRepInfoString())+"")

		addButton("Sell Slave", "Sell one of your slaves on a slave auction", "sell_menu")
		addButton("Talk", "Ask her a few things", "chat_menu")
		addButton("Sex", "See if you can get a little kinky with her", "sex_menu_check")
		addDisabledButton("Upgrades", "You don't access to this yet")
		addButton("Leave", "Enough talking", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["mirri"])
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
		addButton("Pussy worship", "See what that crazy bitch will do to you with her pussy..", "sub_pussy")
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

		saynn("[say=mirri]I am the best.. at being the worst.[/say]")


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

	if(_action == "try_dominate"):
		setState("dom_about_to_fight")
		return

	if(_action == "agree_be_toy"):
		setFlag("SlaveAuctionModule.sexSubbedToMirri", true)

	if(_action == "sub_painplay"):
		processTime(5*60)

	if(_action == "sub_pussy"):
		processTime(5*60)

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

	if(_action == "sub_painplay_wakeup"):
		processTime(60*60)
		GM.pc.getInventory().clearSlot(InventorySlot.Mouth)

	setState(_action)
