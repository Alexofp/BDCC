extends SceneBase

func _init():
	sceneID = "SocketHelp3Scene"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You stand near Socket. You just noticed that there are a few boxes under her boots. And what is that.. she is holding something, some kind of little device that looks like a cover for something.")

		saynn("[say=pc]Anything I can help with now?[/say]")

		saynn("[say=socket]Oh, yeah! But I wanna show you this first.[/say]")

		addButton("Continue", "See what happens next", "socket_puts_on_portal")
	if(state == "socket_puts_on_portal"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction=["hold_object", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSocketStraw.tscn"]})
		saynn("Socket presses that little device against her crotch, hiding her pussy.. and.. somehow.. it just stays there when she activates it.")

		saynn("[say=socket]Alex helped me with it.[/say]")

		saynn("After that, she grabs a fancy fleshlight from her backpack and also.. a bottle.")

		saynn("She turns the fleshlight on.. which opens a little portal on it with her pussy sticking out of it.. more than usual, almost like the device is pulling on the petals to make them appear more plump.")

		saynn("[say=socket]I modified it for a tighter fit![/say]")

		saynn("That's not it though.. Socket opens the bottle.. and starts pouring the drink into her own pussy.. a very strange view for sure. After filling herself full, she adds a little drinking straw to top it off.")

		saynn("You're.. not sure how to feel about it. Socket sees your expression and smiles.")

		saynn("[say=socket]My pussy can hold it, I got it upgraded to hold substances even more acidic than that![/say]")

		saynn("[say=pc]Why not just.. drink it normally?[/say]")

		saynn("Socket shrugs and starts sipping the drink through the straw. At least the portal device that she is using is indeed providing quite a snug fit, nothing seems to be leaking out.")

		saynn("[say=socket]It's more fun that way. Want a sip?[/say]")

		saynn("She offers you the fleshlight.")

		addButton("Take a sip", "Why not", "take_a_sip")
		addButton("Refuse", "You'd rather not", "take_no_sip")
	if(state == "take_a_sip"):
		playAnimation(StageScene.Duo, ["hold_object", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSocketStraw.tscn"], {npc="socket"})
		saynn("Well.. why the heck not.")

		saynn("You carefully grab the fleshlight from Socket's hand and move it close to your face. You catch the straw with your lips and start sipping on it.. Socket just silently watches you do it.")

		saynn("Tastes like.. sweet cider. But with a faint salty aftertaste. Not too bad, all things considered, the 'container' gives it a unique flavor for sure.")

		saynn("[say=socket]Like it?[/say]")

		saynn("You can feel the alcohol beverage taking effect, making the world a little.. brighter.")

		saynn("[say=pc]Sure.[/say]")

		saynn("You hand the fleshlight back to Socket.")

		saynn("[say=pc]What do you need help with?[/say]")

		saynn("Socket puts a cap on her pussy and puts the device away. Then she points at the cardboard box under her feet.")

		saynn("[say=socket]Can you help me carry it? The task is to restock the vendomats![/say]")

		addButton("Grab box", "Carry the box for Socket", "grab_box")
	if(state == "take_no_sip"):
		saynn("Drinking.. out of a pussy? Yeah, no. The taste is probably awful anyway.")

		saynn("[say=pc]Sorry, I'd rather not.[/say]")

		saynn("Socket shrugs and sips a bit more from the straw.")

		saynn("[say=socket]No problem. It's just apple cider though.[/say]")

		saynn("[say=pc]What do you need help with?[/say]")

		saynn("Socket puts a cap on her pussy and puts the device away. Then she points at the cardboard box under her feet.")

		saynn("[say=socket]Can you help me carry it? The task is to restock the vendomats![/say]")

		addButton("Grab box", "Carry the box for Socket", "grab_box")
	if(state == "grab_box"):
		playAnimation(StageScene.Duo, "walk", {npc="socket", flipNPC=true, npcAction="walk"})
		aimCameraAndSetLocName("mining_elevator")
		saynn("You grab the box. It's not too heavy. The manifest attached to it says that it came from the cargo.")

		saynn("[say=pc]Alright. Do you need me to show the way to the vendomats?[/say]")

		saynn("[say=socket]I think I know where the first one is.[/say]")

		saynn("Socket heads towards the lift. You follow behind, carrying some generic supplies.")

		saynn("You enter it. Your hands are busy so Socket selects the floor. The big metal room starts to move up with a screech.")

		saynn("[say=socket]I think I'm getting used to this prison's layout, thanks to you.[/say]")

		saynn("She smiles and looks up at you.")

		saynn("[say=pc]Anyone giving you trouble?[/say]")

		saynn("Socket shakes her head.")

		saynn("[say=socket]No, not yet.[/say]")

		saynn("Not yet?")

		saynn("The lift finally arrives at the main level.")

		addButton("Follow", "See where Socket brings you", "first_vendomat")
	if(state == "first_vendomat"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", further=true, npcAction=["stand", "res://Inventory/UnriggedModels/BigWrench/BigWrench.tscn"]})
		aimCameraAndSetLocName("main_hallroom1")
		saynn("You follow Socket through the checkpoint. The guard that is protecting it is clearly too busy staring at the naked butt, he doesn't even check you.")

		saynn("Socket finds a way to the first vendomat.")

		saynn("[say=socket]This must be it.[/say]")

		saynn("She tries to find a way to get to its internal storage.. but there is no obvious way to do it. So she pulls out her giant wrench and..")

		saynn("[say=pc]Maybe you can use your badge?[/say]")

		saynn("Socket tilts her head, ready to hit something, holding the wrench high.")

		saynn("[say=socket]No bonk?[/say]")

		saynn("She puts the wrench down and presses her staff badge against the vendomat's panel. And sure enough, the vendomat's menu now has some extra buttons including a 'resupply' one.")

		saynn("[say=socket]Yay.[/say]")

		saynn("Socket presses it and the vendomat opens up, revealing its internals. Not everything has to be solved with a giant wrench it seems..")

		saynn("And so you and her begin to restock it. Various snacks, energy drinks of different brands.. condoms.")

		addButton("Continue", "See what happens next", "sudden_risha")
	if(state == "sudden_risha"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {pc="socket", npc="risha"})
		saynn("While you were busy putting the supplies into the right slots, a guard sneaks up on you and Socket.")

		saynn("[say=risha]Wow, nice ass there.[/say]")

		saynn("She slaps Socket's rear and then reaches her hand into the unpacked box, grabbing one of the energy drinks.")

		saynn("Socket eeps and rubs her butt.")

		saynn("[say=socket]Hey, you shouldn't take that.[/say]")

		saynn("The guard was about to leave.. but hearing Socket's words made her stop and turn around.")

		saynn("[say=risha]Why not?[/say]")

		saynn("[say=socket]Because.. the system will think that I stole it![/say]")

		saynn("The guard tilts her head slightly.. and starts to slowly approach Socket, blatantly staring at her exposed private bits.")

		saynn("[say=socket]Just.. get one from the.. vendomat..[/say]")

		saynn("Socket is shivering while feeling those mean eyes explore her body.")

		saynn("[say=risha]Why don't I take you instead?[/say]")

		saynn("[say=socket]Uh.. if you say please?[/say]")

		saynn("The guard stays silent for a second.. and then chuckles.")

		saynn("[say=risha]What a slut. I guess it makes sense, you're constantly flashing everyone with your cunt. Bet you get off of that.[/say]")

		saynn("She was about to pop open the energy drink.. when she sees your stare.")

		saynn("[say=risha]What?[/say]")

		addButton("Put it back", "Tell Risha to put the can back into the box", "risha_angry")
		addButton("Nothing", "Let her have it", "no_touch_risha")
	if(state == "no_touch_risha"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("[say=pc]Nothing.[/say]")

		saynn("Risha opens the can with her claw and starts drinking it.")

		saynn("[say=risha]What I thought.[/say]")

		saynn("And just like that, she leaves you two be.")

		saynn("[say=pc]What a bitch.[/say]")

		saynn("[say=socket]It's okay.. it's only a few credits.[/say]")

		saynn("You finish restocking the vendomat, allowing Socket to close it back up. The box still has some supplies in it.")

		saynn("[say=socket]Only the one in the medical left.[/say]")

		saynn("[say=pc]What about the laundry?[/say]")

		saynn("[say=socket]That one is fine. Uniforms and underwear are being sewn on demand by the machines.[/say]")

		saynn("Less work for you. Makes you wonder why they don't automate everything.")

		addButton("Follow", "Follow Socket to the medical wing", "follow_medical")
	if(state == "risha_angry"):
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("You put on your meanest eyes.")

		saynn("[say=pc]Put it back where you took it.[/say]")

		saynn("The guard approaches you now, playing with the energy drink in her hand.")

		saynn("[say=risha]Really? You're ready to get your face smashed over some can?[/say]")

		saynn("She then gives Socket a quick glance.")

		saynn("[say=risha]Or maybe.. hmm. I think I know.[/say]")

		saynn("You clench your fists, the guard smiles.")

		saynn("[say=pc]I'm not gonna repeat myself, put it back.[/say]")

		saynn("[say=risha]Why don't I put you in your place instead.[/say]")

		saynn("She reaches for her stun baton. Looks like it's a fight..")

		addButton("Fight", "Start the first fight", "start_risha_fight")
	if(state == "lost_risha"):
		playAnimation(StageScene.Duo, "defeat", {npc="risha"})
		saynn("Defeated, you drop to your knees.")

		saynn("Risha walks up to you while enjoying her stolen energy drink.")

		saynn("[say=risha]My bad, I was stronger.[/say]")

		saynn("She kneels.. and grabs you by the collar. Not to choke.. she swipes her badge over it, deducting some credits from your account.")

		saynn("[say=risha]You paid for it. So now it's not stolen. Hope you and your slut are happy.[/say]")

		saynn("The lynx giggles and starts walking away. After finishing the can, she just throws it somewhere.")

		addButton("Continue", "See what happens next", "socket_helps_pc_after_loss")
	if(state == "socket_helps_pc_after_loss"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("Socket is quick to help you to get up.")

		saynn("[say=socket]Sorry..[/say]")

		saynn("[say=pc]It's okay. What a bitch though.[/say]")

		saynn("[say=socket]The biggest bitch! The most bitchiest of all the bitches! The..[/say]")

		saynn("[say=pc]Yeah. Let's just continue.[/say]")

		saynn("You catch your breath a little after that fight. Then you finish restocking the vendomat, allowing Socket to close it back up. The box still has some supplies in it.")

		saynn("[say=socket]Only the one in the medical left.[/say]")

		saynn("[say=pc]What about the laundry?[/say]")

		saynn("[say=socket]That one is fine. Uniforms and underwear are being sewn on demand by the machines.[/say]")

		saynn("Less work for you. Makes you wonder why they don't automate everything.")

		addButton("Follow", "Follow Socket to the medical wing", "follow_medical")
	if(state == "won_risha"):
		setFlag("SocketModule.h3BeatRisha", true)
		playAnimation(StageScene.SexFeetPlay, "pin", {pc="pc", npc="risha"})
		saynn("You are quick to pin Risha to the floor when she collapses.")

		saynn("[say=risha]Bitch..[/say]")

		saynn("She keeps trying to resist so you kick her a little until she drops the energy drink. You grab it and give it back to Socket.")

		saynn("After what she said, it only makes sense to humiliate the bully guard.")

		saynn("[say=pc]Thanks for giving it back. Now say that you're sorry and we're done.[/say]")

		saynn("Risha glares up at you.")

		saynn("[say=risha]How about fuck you?[/say]")

		saynn("She gives Socket a quick glance, smiling. The lynx shows her fangs to you.")

		saynn("[say=risha]You really want to do this?[/say]")

		saynn("[say=pc]You don't have to. But then I don't have to let you go.[/say]")

		saynn("Lynx deliberates for a few seconds, the corners of her lips still curved up.")

		saynn("[say=risha]Sorry.[/say]")

		addButton("Let her go", "Good enough", "let_risha_go")
		addButton("Humiliate more", "Let Risha taste your foot", "humiliate_risha_more")
		addButton("Bonk her", "Hit her with the pain stick", "bonk_risha")
	if(state == "let_risha_go"):
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("Beating her was enough. You offer Risha a hand.. and she grabs it, getting up with your help.")

		saynn("[say=risha]Wow. You're just gonna let me go?[/say]")

		saynn("[say=pc]What, you wanted more?[/say]")

		saynn("She shrugs.")

		saynn("[say=risha]No, obviously. Hah. You two are cute. Stay cute.[/say]")

		saynn("[say=socket]We will, thank you![/say]")

		saynn("And just like that, she turns around and leaves.")

		addButton("Continue", "See what happens next", "socket_after_won_risha")
	if(state == "humiliate_risha_more"):
		playAnimation(StageScene.SexFeetPlay, "head", {pc="pc", npc="risha"})
		saynn("That didn't sound sincere at all. So rather than letting her go, you raise your foot.. and place it over her face! She growls and huffs as you drag the sole over her lips and cheeks. But she also keeps her mouth closed.")

		saynn("[say=pc]Where are your fangs now, huh? Afraid that I will break them? Cause I just might if you're gonna be such a bitch.[/say]")

		saynn("Risha quits growling and just keeps huffing at your foot. Socket sees all of this and blinks many times, her naive eyes shining brightly. You almost feel like you should tell her not to look but..")

		saynn("[say=socket]Should we tie her up? Maybe leave her naked here and see what happens.[/say]")

		saynn("..but it looks like she doesn't mind you doing this.")

		saynn("[say=pc]Hah. Should we?[/say]")

		saynn("You look down at Risha.. she shakes her head.. her lips still covered by your foot.")

		saynn("[say=pc]Will you annoy Socket?[/say]")

		saynn("The guard shakes her head again.")

		saynn("[say=pc]Keep it that way. Now get out of here.[/say]")

		saynn("As you pull your foot away, Risha just gets up, gives you a stern look.. and leaves.")

		saynn("[say=socket]Aww![/say]")

		addButton("Continue", "See what happens next", "socket_after_won_risha")
	if(state == "bonk_risha"):
		saynn("You steal Risha's stun baton, enable it and hit her crotch with it! The armor softens the blow.. but the electricity is enough to make Risha arch her back and let out a painful groan.")

		saynn("[say=risha]GRrhh-h!..[/say]")

		saynn("[say=socket]Bonk![/say]")

		saynn("[say=pc]Are you gonna steal from Socket again?[/say]")

		saynn("Risha huffs and glares at you. The long silence makes you raise her weapon again.")

		saynn("[say=risha]I won't. Plenty of sluts around.[/say]")

		saynn("Wow, that was kinda rude. You start to swing the stun baton again but Socket stops you.")

		saynn("[say=socket]May I do it too?[/say]")

		saynn("You were about to hand her the weapon.. but Socket is already holding her giant wrench.. Risha visibly clenches just from looking at it. A single impact would probably destroy her crotch..")

		saynn("[say=risha]Hey, no. Grh.. Fine, you're not a slut. I'm sorry for taking that can, my bad, okay?[/say]")

		saynn("Seems honest enough.")

		saynn("[say=socket]But.. bonk..[/say]")

		saynn("[say=risha]No bonk, please, keep her away.[/say]")

		saynn("You giggle.")

		saynn("[say=pc]Get out of here.[/say]")

		saynn("As you take a step back, Risha gets up and huffs at you two.. then she just turns away and proceeds to leave.")

		saynn("[say=pc]Don't forget this.[/say]")

		saynn("You toss her the stun baton. Risha doesn't catch it though, she has to slowly walk up to it and pick it off the floor.")

		saynn("[say=socket]Aw..[/say]")

		saynn("After all, maybe it's best to solve most things with a bonk..")

		addButton("Continue", "See what happens next", "socket_after_won_risha")
	if(state == "socket_after_won_risha"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You catch your breath a little after that fight. Then you finish restocking the vendomat, allowing Socket to close it back up. The box still has some supplies in it.")

		saynn("[say=socket]Only the one in the medical left.[/say]")

		saynn("[say=pc]What about the laundry?[/say]")

		saynn("[say=socket]That one is fine. Uniforms and underwear are being sewn on demand by the machines.[/say]")

		saynn("Less work for you. Makes you wonder why they don't automate everything.")

		addButton("Follow", "Follow Socket to the medical wing", "follow_medical")
	if(state == "follow_medical"):
		aimCameraAndSetLocName("MedRoom2")
		saynn("You follow Socket back to the lift and wait for it to lower itself to the floor where the medical wing is.")

		saynn("The lobby is bright as ever, the many nurses walk past you, some stopping to confirm what they are seeing. One of them approaches you two, looking quite concerned.")

		saynn("[sayMale]Uh.. Need something to cover yourself up, miss?[/sayMale]")

		saynn("Socket's pussy is still covered by some small device.. but the rest is still exposed.")

		saynn("[say=socket]Why? I'm good. There should be a vendomat somewhere here?[/say]")

		saynn("The nurse points to the corner of the lobby.")

		saynn("[say=socket]Thanks![/say]")

		saynn("He nods subtly.. and leaves you to it.")

		saynn("[say=socket]Let's do it.[/say]")

		saynn("Socket unlocks the vendomat with her badge and proceeds to help you restock it.. This time.. there are lots of drugs and toys.. and condoms.. again?")

		addButton("Restock", "See what happens next", "do_restock")
	if(state == "do_restock"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction=["hold_object", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSocketStraw.tscn"]})
		saynn("Time passes. Most of the work is done, just the last few dozen items left.")

		saynn("[say=socket]I'm a little thirsty..[/say]")

		saynn("[say=pc]Sure, take a break, almost done anyway.[/say]")

		saynn("[say=socket]You're so nice![/say]")

		saynn("Socket fetches the fleshlight.. and takes off the cap, revealing her pussy again. All the nurses stop and start watching how the fennec slides a plastic straw into it.. and starts sipping. She sees that and just waves to people.")

		saynn("[say=socket]Hi, we're almost done, gonna get out of your hair soon![/say]")

		saynn("Something tells you that this is not the reason.. Oh well.")

		saynn("You just keep placing items..")

		addButton("Continue", "See what happens next", "total_accident_happens")
	if(state == "total_accident_happens"):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "hurt", {npc="avy", npcAction="shove"})
		saynn("..until someone accidentally walks into you!")

		saynn("[say=avy]Oops.[/say]")

		saynn("A dark-furred fox collides with you, causing you to drop the box and random pill bottles to roll all over the floor. Ow.")

		saynn("[say=avy]My bad~. I'm so clumsy. Let me help you.[/say]")

		saynn("You get a very strange feeling.")

		saynn("[say=pc]I'd rather you not.[/say]")

		saynn("She tilts her head slightly.")

		saynn("[say=avy]I caused this. Only makes sense for me to help.[/say]")

		saynn("[say=pc]Yeah, I get a feeling that you caused it.[/say]")

		saynn("[say=avy]You're implying something?[/say]")

		saynn("Her eyes are drilling you. Looks like it might be a fight.")

		addButton("Continue", "See what happens next", "socket_saves_the_day")
	if(state == "socket_saves_the_day"):
		playAnimation(StageScene.Duo, ["hold_object", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSocketStraw.tscn"], {pc="socket", npc="avy"})
		saynn("Suddenly Socket takes a spot between you two.")

		saynn("[say=socket]Don't worry about it, we got it![/say]")

		saynn("Foxy switches her gaze to the half-naked engineer.. and raises her brows.")

		saynn("[say=avy]Wait. Is that your cunt?[/say]")

		saynn("Socket smiles and proudly presents the device and then also points at her crotch.")

		saynn("[say=socket]Neat, isn't it! I can hold so much cider in it. Want a sip?[/say]")

		saynn("The inmate stays quiet for some time, you can notice her moving her jaw a bit.")

		saynn("[say=avy]Huh. Can I hold it?[/say]")

		saynn("Socket hums.")

		saynn("[say=socket]Um.. No, sorry, you can take a sip though![/say]")

		saynn("[say=avy]Why not? Gimme.[/say]")

		saynn("Foxy tries to grab the fleshlight out of Socket's hands but she is quick to dodge her attempts.")

		saynn("[say=socket]Because you might want to steal it and then I would have to find you and tie you up in your sleep and maybe even tickle you until you give up, something that I really don't want to do![/say]")

		saynn("She hears all of that.. and rolls her eyes.")

		saynn("[say=avy]Fine. Whatever.[/say]")

		saynn("And so the foxy leaves you two alone.")

		addButton("Continue", "See what happens next", "socket_starts_help_pc")
	if(state == "socket_starts_help_pc"):
		removeCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction=["hold_object", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSocketStraw.tscn"]})
		saynn("Socket turns towards you and starts to help you to pick up all the pill bottles, her left hand still holding the fleshlight.")

		saynn("[say=pc]You handled it pretty well. I thought I'd have to fight her.[/say]")

		saynn("[say=socket]Thanks![/say]")

		saynn("While picking all the pill bottles up, you notice one that says 'aphrodisiac' on it. Holding it in your hands while watching Socket's pussy.. makes you wonder..")

		addButton("Ignore thought", "Resist the temptation", "no_spike_drink")
		addButton("Spike her 'drink'", "Sneakily add an aphrodisiac pill to the fleshlight", "spike_socket_drink")
	if(state == "no_spike_drink"):
		GM.pc.setLocation("MedRoom2")
		saynn("You push the naughty thoughts away and just finish restocking the vendomat.")

		saynn("[say=pc]That should be it.[/say]")

		saynn("[say=socket]Thank you! I don't know what I would do without you.[/say]")

		saynn("You shrug. The image of watching Socket drinking cider out of her pussy won't leave your head for a while.")

		saynn("[say=pc]Someone else would have helped you probably.[/say]")

		saynn("[say=socket]Tell you what, I'm wearing my portal device every once in a while. If you have the 'receiver', feel free to connect to it![/say]")

		saynn("She shakes the fleshlight in front of your face.")

		saynn("[say=socket]My device is only covering the pussy.. so you know.. no anal![/say]")

		saynn("For someone so.. lewd.. She sure is restrictive. But you'd rather not get your head bonked.")

		saynn("[say=socket]Anyway, see you later alligator![/say]")

		saynn("Socket walks away while still sipping cider in the most strange way possible.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "spike_socket_drink"):
		GM.pc.setLocation("mining_elevator")
		saynn("Sneakily, you open the pill bottle and grab a single pill. Then you shift closer to Socket and carefully drop it into her pussy. Luckily she didn't seem to hear the plop noise.")

		saynn("The pill sinks to the bottom of her 'drink' and starts to dissolve. While that is happening, you just finish restocking the vendomat.")

		saynn("[say=pc]That should be it.[/say]")

		saynn("[say=socket]Thank you! I don't know what I would do without you.[/say]")

		saynn("You shrug and notice that Socket's pussy already starts to get a little wet, her folds shining more. It seems the drug is being absorbed through the inner walls of her slit.")

		saynn("[say=pc]We will see. Maybe there is something.[/say]")

		saynn("[say=socket]Tell you what, I'm wearing my portal device every once in a while. If you have the 'receiver', feel free to connect to it![/say]")

		saynn("She smiles and sips some of the cider.")

		saynn("[say=socket]So tasty.. Oh yeah. My device is only covering the pussy.. so you know.. no anal![/say]")

		saynn("For someone so.. lewd.. She sure is restrictive. But you'd rather not get your head bonked.")

		saynn("[say=socket]Anyway, see you later alligator![/say]")

		saynn("She heads towards the elevator and presses a button to call it.")

		saynn("[say=pc]Actually, I'm going the same way.[/say]")

		saynn("[say=socket]Oh, okay![/say]")

		saynn("After some time, the lift arrives.")

		addButton("Step in", "See what happens next", "socket_gets_very_horny")
	if(state == "socket_gets_very_horny"):
		aimCameraAndSetLocName("mining_elevator")
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction=["hold_object", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSocketStraw.tscn"]})
		saynn("You and Socket step into the lift. She presses the button, causing the room to start moving.")

		saynn("Your eyes are glued to her as she is casually sipping her drink, eventually finishing it. She pulls the straw out.. and licks her lips, her thirst is clearly not satisfied yet.")

		saynn("[say=socket]Hm.. Maybe there is some left..[/say]")

		saynn("Suddenly, she switches from licking her lips.. to licking her pussy lips, dragging her tongue over the sensitive flesh, catching any moisture that has accumulated and then swallowing it.")

		saynn("Her legs are shivering a little each time she flicks her tongue over the clit.")

		saynn("[say=socket]Huff..[/say]")

		saynn("The sight is quite.. curious. Maybe she could use some help?")

		addButton("Just watch", "See what she is gonna do", "socket_licks_herself")
		addButton("Offer tongue", "Lick her yourself", "do_lick_socket")
		addButtonWithChecks("Offer cock", "Maybe she just needs a refill.. of cum", "do_fuck_socket", [], [[ButtonChecks.HasReachablePenis]])
	if(state == "socket_licks_herself"):
		playAnimation(StageScene.SexPortalOral, "lick", {pc="socket", onlyRight=true})
		saynn("You decide not to do anything, watching how this will unfold seems like it's gonna be way more entertaining. So you lean against the wall of the lift.. and cross your arms.")

		saynn("Socket, lusty for more cider, slips her tongue deeper and deeper into her pussy.")

		saynn("[say=socket]Ah.. I can't get enough of this taste..[/say]")

		saynn("Her folds react to licking by only getting more wet, the scent that they are producing is making horny even you.")

		saynn("[say=socket]Almost like a drug..[/say]")

		saynn("She probably realized something by now. But it's too late. She digs her face into her slit and starts to eagerly lick and lap at her inner walls, moaning while doing so.")

		saynn("You can't stop smiling while watching her pleasure herself.. just to get more of that taste. It's fading over time, causing the fennec to lick herself more thoroughly. Her body is shivering by now, her tail wagging a lot, her pussy only looking more juicy.")

		addButton("Continue", "See what happens next", "socket_squirts_on_herself")
	if(state == "socket_squirts_on_herself"):
		aimCameraAndSetLocName("mining_elevator")
		GM.pc.setLocation("mining_elevator")
		playAnimation(StageScene.SexPortalOral, "lickfast", {pc="socket", onlyRight=true})
		saynn("You keep hearing the cute muffled noises from Socket.. Until you notice her pussy starting to twitch! And soon enough, it releases a gush of transparent fluids directly into her own face, her body squirming heavily while she just continues to lap up everything she can get to.")

		saynn("[say=socket]Mh-h-hhaah!..[/say]")

		saynn("Just when the lift was beginning to smell like hot sex, the doors opened, allowing some fresh air in.")

		saynn("Socket looks.. slightly drained. She finally stops licking herself and just pants heavily.")

		saynn("[say=pc]Cider was really tasty, huh?[/say]")

		saynn("[say=socket]Yeah.. hah.. I might need some rest now..[/say]")

		saynn("She moans softly as she puts the cap back on the fleshlight before putting it away.")

		saynn("[say=socket]See you around.. ah..[/say]")

		saynn("You wave your hand to her. Hopefully your little mischief won't get you into trouble.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_lick_socket"):
		playAnimation(StageScene.SexPortalOral, "lick", {npc="socket", pc="pc"})
		saynn("[say=pc]Maybe I can help satisfy your thirst?[/say]")

		saynn("Socket turns her head towards you.. and sees you parting your lips and rolling your tongue out as far as it can. The fennec huffs and hands you the fleshlight.")

		saynn("[say=socket]Sounds good..[/say]")

		saynn("You grab and watch Socket's body shiver a little harder each second you don't do anything.")

		saynn("[say=socket]Please?[/say]")

		saynn("Why not. You move it closer to your mouth and start teasing her clit with the tip of your tongue, rubbing it left and right. That makes Socket grab onto her crotch portal device and moan quietly, her pussy getting incredibly wet.")

		saynn("Finally, you decide to do a long lick, sliding your tongue along her petals and getting a feel for them. Yeah, there is still a faint cider aftertaste.. but it's mixed with something "+str("that makes your own pussy wet in seconds too.." if GM.pc.hasReachableVagina() else "that makes you really horny in seconds too..")+"")

		saynn("[say=socket]Mm-m..[/say]")

		saynn("Her pussy tastes so good that your tongue is already circling the love tunnel itself, the tip prodding it occasionally. It doesn't take much effort for you to slip it past her wet folds and start lapping at her inner walls too. Oh, pure bliss..")

		saynn("[say=socket]That's the spot.. ah..[/say]")

		addButton("Faster", "Lick it faster", "socket_squirts_all_over_pc")
	if(state == "socket_squirts_all_over_pc"):
		aimCameraAndSetLocName("mining_elevator")
		GM.pc.setLocation("mining_elevator")
		playAnimation(StageScene.SexPortalOral, "lickfast", {npc="socket", pc="pc"})
		saynn("Seeing Socket like this.. allows you to easily find and abuse her most sensitive spots. You find a little bump with your tongue.. and start hammering away at it, tongue-fucking the girl's pussy.. while she is squirming hard.")

		saynn("[say=socket]Hah.. ah..[/say]")

		saynn("You can feel the muscles spasming.. her inner walls hugging your tongue.. but you keep going, gathering all the moisture and occasionally swallowing it all.")

		saynn("[say=socket]I'm.. gonna..[/say]")

		saynn("The orgasm hits her body like a tidal wave. Socket lets out a passionate noise of pleasure while her disconnected pussy releases a fountain of juices directly into your face! So wet..")

		saynn("She leans against the wall of the lift for support, her legs shaking wildly.. while you just keep lapping away at her walls, eagerly swallowing each drop of girlcum that you can.")

		saynn("By the end of it, both of you are left panting.")

		saynn("[say=socket]That.. felt really good..[/say]")

		saynn("The small metal room smells of sex.. but not for long, the doors finally open, letting some fresh air in.")

		saynn("Socket looks.. very drained. You hand her the fleshlight and lick your lips.")

		saynn("[say=pc]Pretty tasty.[/say]")

		saynn("[say=socket]Hah.. I might need some rest now..[/say]")

		saynn("She moans softly as she puts the cap back on the fleshlight before putting it away.")

		saynn("[say=socket]See you around.. ah..[/say]")

		saynn("You wave your hand to her. Hopefully your little mischief won't get you into trouble.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_fuck_socket"):
		playAnimation(StageScene.SexFleshlight, "tease", {npc="socket", socketPussy=true, bodyState={exposedCrotch=true,hard=true}})
		saynn("This seems like a good opportunity to help clench her thirst. You expose your {pc.penis} and present it to Socket.")

		saynn("[say=pc]Maybe you want a refill?[/say]")

		saynn("She switches her gaze from the fleshlight to you.. and blinks a few times.")

		saynn("[say=socket]Perhaps, yes.[/say]")

		saynn("Socket approaches you and brings the toy that has her pussy sticking out close to your hard member. Seeing them close like that makes it easy for her to judge your size compared to her.. elasticity.")

		var penSize = GM.pc.getPenisSize()
		if (penSize < 6):
			saynn("[say=socket]At least you won't kill me. It's about how you use it, right?[/say]")

		elif (penSize < 10):
			saynn("[say=socket]It's on the smaller side.. but we can make it work.[/say]")

		elif (penSize < 16):
			saynn("[say=socket]Perfect..[/say]")

		elif (penSize < 25):
			saynn("[say=socket]You're pretty huge..[/say]")

		else:
			saynn("[say=socket]I doubt it will fit even.. but let's try..[/say]")

		addButton("Continue", "See what happens next", "socket_penis_starts")
	if(state == "socket_penis_starts"):
		playAnimation(StageScene.SexFleshlight, "sex", {npc="socket", socketPussy=true, bodyState={exposedCrotch=true,hard=true}})
		saynn("Looks like Socket wants to do it herself.. might as well see how she will treat you.")

		saynn("She positions the fleshlight so that your dick is prodding the entrance of her pussy. Its scent.. makes you eager for more, the tip dripping pre onto her sensitive folds.")

		saynn("After putting some pressure, your cock manages to spread her slit enough to bury itself inside.")

		saynn("[say=socket]Nh..[/say]")

		saynn("You can feel her breathing getting deeper as she starts to slowly slide the fleshlight over your length, humming quietly into your ear as her pussy is getting fucked raw.")

		saynn("Whatever little remains of that drug she had on her inner walls, some of them now are getting absorbed by your cock, causing your erection to get extra strong, your dick already throbbing inside her tight love tunnel.")

		saynn("[say=socket]I feel it inside me. Hah..[/say]")

		addButton("Continue", "See what happens next", "socket_penis_faster")
	if(state == "socket_penis_faster"):
		playAnimation(StageScene.SexFleshlight, "fast", {npc="socket", socketPussy=true, bodyState={exposedCrotch=true,hard=true}})
		saynn("Socket moves her hand faster, increasing the pace. It looks like she is just masturbating you with some toy.. but seeing that pussy squeeze you and hearing the girl's little moans make it obvious.")

		saynn("[say=socket]Ah.. ah.. You're throbbing so hard.[/say]")

		saynn("She is not wrong, her pulsating inner walls push you closer and closer, her slick tunnel feels so good to fuck.")

		saynn("The lift sounds like it's about to arrive.. So Socket increases the onslaught even more, pretty much pounding her pussy with your {pc.penis}. Her legs are shivering, her eyes keep sliding up, her cute noises and warm breathing tickling your ear.")

		saynn("[say=socket]Fill me.. Stuff my pussy full..[/say]")

		saynn("How can you say no?")

		addButton("Orgasm", "See how it happens", "socket_penis_cum")
	if(state == "socket_penis_cum"):
		playAnimation(StageScene.SexFleshlight, "inside", {npc="socket", socketPussy=true, bodyState={exposedCrotch=true,hard=true}})
		saynn("You grunt through your teeth, your body arches its back a little as your {pc.penis} pulses and releases its load inside, your balls tensing up as waves of thick creamy seed flood Socket's pussy, triggering her own orgasmic release.")

		saynn("[say=socket]Yeah.. use my pussy as a cum dump..[/say]")

		saynn("Socket has her free hand holding onto you while the one with the fleshlight pushes on it to keep her slit stuffed full, waiting for your orgasms to come to an end. The whole room smells of sex.. but not for long, the elevator doors finally open, letting some fresh air in.")

		saynn("She drained your balls with that toy.. and now just lets herself be your cock warmer for some time.")

		saynn("[say=socket]Good..[/say]")

		addButton("Continue", "See what happens next", "socket_penis_aftercum")
	if(state == "socket_penis_aftercum"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction=["hold_object", "res://Inventory/UnriggedModels/Fleshlight/FleshlightSocketStraw.tscn"]})
		aimCameraAndSetLocName("mining_elevator")
		GM.pc.setLocation("mining_elevator")
		saynn("Socket slowly retrieves the fleshlight, being careful as to not spill anything. Then she just.. adds the straw back.")

		saynn("[say=socket]Thanks! See you around..[/say]")

		saynn("You nod. Hopefully your little mischief won't get you into trouble.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "take_a_sip"):
		GM.pc.addIntoxication(0.6)

	if(_action == "grab_box"):
		processTime(5*60)

	if(_action == "first_vendomat"):
		processTime(5*60)

	if(_action == "sudden_risha"):
		processTime(3*60)

	if(_action == "no_touch_risha"):
		processTime(3*60)

	if(_action == "follow_medical"):
		processTime(5*60)

	if(_action == "start_risha_fight"):
		runScene("FightScene", ["risha"], "rishaFight")
		return

	if(_action == "socket_helps_pc_after_loss"):
		GM.pc.addPain(-30)

	if(_action == "socket_after_won_risha"):
		processTime(5*60)

	if(_action == "do_restock"):
		processTime(20*60)

	if(_action == "total_accident_happens"):
		processTime(5*60)

	if(_action == "socket_starts_help_pc"):
		processTime(5*60)

	if(_action == "no_spike_drink"):
		setFlag("SocketModule.hasPortalPussy", true)
		addMessage("Socket's pussy is now available through the portal fleshlight")

	if(_action == "spike_socket_drink"):
		setFlag("SocketModule.socketWillPunish", true)
		setFlag("SocketModule.punishReason", "spikeddrink")
		setFlag("SocketModule.hasPortalPussy", true)
		addMessage("Socket's pussy is now available through the portal fleshlight")

	if(_action == "socket_gets_very_horny"):
		processTime(3*60)

	if(_action == "socket_squirts_on_herself"):
		processTime(3*60)
		getCharacter("socket").cummedOnBy("socket", FluidSource.Vagina, 0.2)
		getCharacter("socket").cummedInMouthBy("socket", FluidSource.Vagina, 0.1)

	if(_action == "socket_squirts_all_over_pc"):
		processTime(3*60)
		GM.pc.cummedOnBy("socket", FluidSource.Vagina, 0.2)
		GM.pc.cummedInMouthBy("socket", FluidSource.Vagina, 0.1)

	if(_action == "socket_penis_starts"):
		processTime(3*60)

	if(_action == "socket_penis_faster"):
		processTime(5*60)

	if(_action == "socket_penis_cum"):
		getCharacter("socket").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("socket")

	if(_action == "socket_penis_aftercum"):
		processTime(3*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "rishaFight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_risha")
			addExperienceToPlayer(50)
		else:
			setState("lost_risha")
			addExperienceToPlayer(5)
			GM.pc.addCredits(-3)
			addMessage("You lost 3 credits")
