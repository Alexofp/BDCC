extends SceneBase

var slaveID = ""
var creditsToGive = 0

func _init():
	sceneID = "MirriS2FirstSellScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "slave"):
		return slaveID

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("You stand in your cell and think about it.. maybe that crazy catgirl.. maybe there is an opportunity here.. of sorts. Yes.")

		saynn("Which of your slaves do you want to sell? Keep in mind that you will never see them again. Any items that they have will be lost forever too.")

		addButton("Cancel", "You changed your mind", "endthescene")
		addSlaveButtons()
		if (false):
			addButton("Nope", "You shouldn't see this ever", "pick_slave")
	if(state == "confirm_pick_slave"):
		addCharacter(slaveID)
		playAnimation(StageScene.Duo, "stand", {npc=slaveID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		saynn("Is {slave.name} the slave that you want to sell? Keep in mind that you will never see them again. Any items that they have will be lost forever too.")

		addButton("Confirm", "Sell this slave!", "do_confirm_pick")
		addButton("Cancel", "You changed your mind", "do_cancel_pick")
	if(state == "do_confirm_pick"):
		setFlag("SlaveAuctionModule.s2hap", true)
		playAnimation(StageScene.Duo, "stand", {npc=slaveID, npcBodyState={leashedBy="pc"}})
		saynn("You approach one of your slaves and clip a leash to {slave.his} collar. {slave.name} gives you a slightly confused look, clearly feeling that something is off.")

		saynn("[say=pc]Well. What now?[/say]")

		saynn("[say=mirri]Made your choice, finally?[/say]")

		saynn("Your slave jumps from the sudden new voice.")

		addButton("Continue", "See what happens next", "mirri_appears")
	if(state == "mirri_appears"):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Mirri suddenly approaches you two, scaring your slave and giving you another feeling of deja vu.")

		saynn("[say=mirri]You sure took your time.[/say]")

		saynn("[say=pc]You sure know how to appear out of nowhere.[/say]")

		saynn("She shrugs and leans against one of the walls, slightly tilting her head while watching you and your slave, a slightly bored expression contrasts well with that of pure confusion.")

		saynn("[say=mirri]I'm always right on time. Unlike someone else.[/say]")

		saynn("[say=pc]Oh yeah, that last.. show.. was so timely.[/say]")

		saynn("[say=mirri]Pff, don't make me smash your beautiful jaw into the ugly concrete.[/say]")

		saynn("Her little sly smile makes you think that she might be serious.")

		saynn("[say=mirri]You get paid when I get paid so you're coming with me. You're ready?[/say]")

		saynn("You can't help but to notice that she is still flashing her striped panties to everyone around.")

		saynn("[say=pc]I guess. You still haven't gotten pants?[/say]")

		saynn("Mirri rolls her eyes.")

		saynn("[say=mirri]Oh, come the fuck on.[/say]")

		saynn("She pulls up her armored wrist piece and presses something. Moments later, a small blue rift begins to open, right in the middle of your cell. Your slave's eyes open wide.")

		saynn("[say=pc]Someone will see it one day.[/say]")

		saynn("[say=mirri]I'm just testing a prototype that your engineers made~. C'mon, the show is about to start.[/say]")

		saynn("Someone is really bad at time management. Mirri winks at you.. before shoving you and your slave into the blue portal.")

		addButton("Continue", "See what happens next", "after_tp")
	if(state == "after_tp"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc=slaveID, npcBodyState={leashedBy="mirri"}})
		aimCameraAndSetLocName("market_intro")
		GM.pc.setLocation("market_intro")
		saynn("You're back at the familiar.. place. But this time you can take a better look around.")

		saynn("A dimly lit room welcomes you. So dimly that your eyes struggle to adjust after the harsh prison lighting. It's so weird to not feel a cold touch of concrete under your {pc.feet}.. the floor seems to be made out of some kind of dark wood.")

		saynn("Mirri grabs the leash. Your slave looks around, getting more and more concerned by the second.")

		saynn("[say=mirri]Don't worry, the less resistance you show, the less times I will have to shoot your ankles.[/say]")

		saynn("Catgirl pulls the slave out the room and into some corridor while you stay and sneak a peek at the furniture.")

		saynn("A bed, a pretty soft looking one. A sofa, a little coffee table, a chair and a desk with a laptop. There is also a wooden wardrobe in the corner.. but rather than having clothes.. you notice a bunch of gags, crops and cuffs, all neatly presented in it. Everything is neat, in fact, this is probably the cleanest room you have seen in your life.. prison life.")

		saynn("Behind you.. is a machine of sorts, currently spooling down.. you can only guess that this is what brought you here.")

		saynn("[say=mirri]Hey, don't make me sell you too, fucking sloth.[/say]")

		saynn("After her words.. you hear sounds of a battle coming from the same direction. Looks like your slave isn't happy about {slave.his} new future. Makes sense, all things considered.")

		addButton("Follow", "Follow the sounds", "in_market")
	if(state == "in_market"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="pc", pc=slaveID, bodyState={naked=true}})
		aimCameraAndSetLocName("market_market")
		saynn("You step out into the corridor through a reinforced door that automatically closes behind you. Most materials have the same dark color.. but at least they didn't cheap out on the lighting here.")

		saynn("Not a single window anywhere.. The walls are covered with paintings of faces that you don't recognize. Seeing the dates.. you doubt that anyone does.")

		saynn("You follow a few smaller rooms and corridors until you join Mirri in a.. preparation room of sorts, a big hall with a very high ceiling. Huh, one of the walls is just a big curtain.. and the raised platform in the corner. Yes, it's that room.")

		saynn("[say=mirri]Stupid fucking bitch, how are you still resisting. Grrr. Fuck me-e-e, what are they putting into that shitty prison food.[/say]")

		saynn("The catgirl is battling your slave's body, pulling on the chains that are pulling on {slave.name}'s wrists, forcing {slave.him} to raise them high.")

		saynn("You realize that your slave is actually unconscious..")

		saynn("[say=pc]What did you do already?[/say]")

		saynn("[say=mirri]Shut up and help me get this whore to stand.[/say]")

		saynn("Mirri is panting so you help her, tugging hard on the chains until the slave's {slave.toes} are the only things that are touching the ground.")

		saynn("[say=mirri]Splendid. Phew. I almost feel like you weren't useless, wormy.[/say]")

		saynn("[say=pc]Give me a break.[/say]")

		saynn("[say=mirri]Your break is that you're not in {slave.his} place, about to be sold. Yo. The auction is starting, make yourself transparent.[/say]")

		saynn("What a bitch, huh. But she is right, you already hear the chatter behind the curtains, people are taking their seats.")

		saynn("You just position yourself in one of the corners of the stage, somewhere where the projectors will never reach.")

		saynn("Mirri flys up the little raised platform and closes her eyes, her fists clenched.")

		saynn("[say=mirri]Alright.. just like last time. Yeah, yeah, yeah, zero worries. Alright. Let's fucking go![/say]")

		addButton("Watch", "See what happens..", "watch_first_auction")
	if(state == "watch_first_auction"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="mirri", pc=slaveID, bodyState={naked=true}})
		saynn("The heavy black curtains part with a faint swish. The stage projector flickers on, casting a warm beam of light over Mirri's girly figure as she spreads her arms wide.")

		saynn("[say=mirri]WELCOME! To the Blacktail Market![/say]")

		saynn("Mirri's voice booms across the room, her usual confidence on full display.")

		saynn("[say=mirri]Tonight, I present to you a fresh AlphaCorp catch. One that.. resisted fiercely, showing the kind of spirit that.. certain owners just love to break![/say]")

		saynn("The main projector turns off, illuminating the naked slave.. who is still unconscious, hanging by the chains. You look into the darkness and notice bidders' confused stares.")

		saynn("[sayOther]Are they.. alive?[/sayOther]")

		saynn("[say=mirri]Of course! Trust me, it's a very rare find. Strong, resilient, but.. adaptable. Blacktail Market sells only the best of the best.[/say]")

		saynn("There is an edge to her voice, a slight tension in her motions.")

		saynn("[say=mirri]Look at.. those {slave.breasts}. Aren't they nice? Just check those attractive curves out. I wanna touch-touch them already myself.[/say]")

		saynn("Her words feel forced.. and so they find little reaction. Huh. Her gaze is flickering to the crowd, her feline eyes flashing brightly.")

		saynn("[say=mirri]That {slave.masc} figure, those {slave.thick} hips.. I'm telling you, there is nothing quite like this one. The one who buys {slave.him} will be so-so lucky. So, place a bid while the price is still low![/say]")

		saynn("Mirri is trying to keep control.. but you can tell her grip is slipping a bit. No wonder, she has to present and look presentable at the same time. The bidders begin to murmur between each other.")

		saynn("[sayOther]{slave.He} looks half-dead. You expect us to pay for that?[/sayOther]")

		saynn("[sayOther]Yeah, is the slave broken already? What's the point of buying a corpse?[/sayOther]")

		saynn("Mirri shoots a sharp glare into the darkness, clearly irked by all the interruptions. But then her gaze meets that of a different caliber. Oh yeah, that wolf is sitting in the audience too, you can see him.. And Mirri sees him too..")

		saynn("[say=mirri]Listen! This one is fresh, pristine. Perfect for those who enjoy molding their property into any state they want. This product will fit any owner! Right now {slave.he} {slave.isAre} just a bit.. sleepy.[/say]")

		saynn("[sayOther]How do we know it isn't damaged goods? I see signs of abuse even from here. Did you check for scars, injuries?[/sayOther]")

		saynn("The questions pile on, each one making Mirri's irritation more obvious.")

		saynn("[say=mirri]It's not! Do you know who I am?![/say]")

		saynn("Her tone sharpens.. but it's clear that the buyers are unconvinced. More murmurs rise, some chuckles even. You notice the wolf standing up.. and just leaving. That makes Mirri's tail wag a lot.")

		saynn("[sayOther]I do know. And to me, it looks like you're trying to sell us something you couldn't handle yourself.[/sayOther]")

		saynn("The answer hits hard. Mirri stammers for a moment, her eyes darting to the unconscious slave.. then back to the bidders. The air feels thick with tension as the crowd waits for the response.")

		saynn("[say=mirri]I.. uh..[/say]")

		saynn("Her clenched fists are shaking. Is that growling you hear?")

		saynn("[sayOther]This is a waste of time. Let's go.[/sayOther]")

		saynn("[say=mirri]Yeah, fine, whatever.. The auction is over, go away now.. fuckers..[/say]")

		saynn("Her last word was said with just the intonation.. incredible.")

		saynn("The bidders are leaving. You counted.. exactly zero bids. Huh.")

		saynn("As the curtains close.. Mirri just stands there, frozen, watching as her audience disappears into the shadows. Her claws are out.")

		saynn("After some time, Mirri slowly turns towards you. Her blue eyes pierce through you.")

		saynn("Time to stand your ground.")

		addButton("Continue", "See what happens next", "mirri_angery")
	if(state == "mirri_angery"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Mirri lets out a low growl as she walks past the unconscious slave.")

		saynn("[say=mirri]Useless! Fuck![/say]")

		saynn("The angry catgirl advances up to you.. but then just presses her back against the wall, staring up at the high ceiling.")

		saynn("[say=mirri]I fucking hate you. You brought me this failure. And he was there too, fuck. Of course he was. I really hope he is happy now.[/say]")

		saynn("[say=pc]Hey, it's not my fault you can't present a slave.[/say]")

		saynn("She places her hand on your shoulder, letting you feel her claws digging into you.. like you're a piece of very scratchable furniture. You let her have it.. the catgirl seems to be on edge.")

		saynn("[say=mirri]Fuck you. I can present, okay? I'm, like, made for this. I'm Blacktail.[/say]")

		saynn("[say=pc]Was it me who was stammering out there? Growling at the bidders?[/say]")

		saynn("Mirri rolls her eyes.")

		saynn("[say=mirri]Yeah, well, what was I supposed to say? It's your fucking slave, you didn't exactly share any info with me.[/say]")

		saynn("Your slave seems to be slowly coming back to senses.. atleast {slave.he} {slave.isAre} not actually dead..")

		saynn("[say=pc]You didn't give me any time to do it.[/say]")

		saynn("[say=mirri]Well, fuck you, I don't have time to listen to your love stories with each of your fucktoys. I barely have enough time to live already.[/say]")

		saynn("She keeps idly scratching you. A weird sensation.. but not too painful. Still, you carefully grab her paw and pull it away from your skin.")

		saynn("An obvious solution comes to mind.")

		saynn("[say=pc]Let me present my slaves then. I know everything about them.[/say]")

		saynn("Mirri looks at you.. and raises a brow.")

		saynn("[say=mirri]Are you serious? AlphaCorp slave selling slaves on the biggest Syndicate slave auction? Hah. I'd be floating in free space in seconds if I'd let that happen. Holy shit you're funny. Funny or dumb.[/say]")

		saynn("She puts her claws on you again, scratching your back. All the while your slave looks around.. and then begins trying to escape, rattling the chains.. fruitlessly.")

		saynn("Mirri hums watching the little show, her claws digging deeper and causing pain as her mind wanders.")

		saynn("[say=mirri]You might have a point though.[/say]")

		saynn("[say=pc]Hey, can you stop..[/say]")

		saynn("She suddenly pulls her gun out and presses it against your lips, shushing you while keeping a forced eye contact.. Her blue eyes glow in the dark..")

		saynn("[say=mirri]I don't know a single thing about this slave. I don't know what they can do, what they're worth.. but you do.[/say]")

		saynn("The catgirl licks her lips while brushing her big scary toy against yours.")

		saynn("[say=mirri]You're the one who caught {slave.him}.. who trained {slave.him}. You know {slave.his} strengths, {slave.his} weaknesses.. yeah.. I actually kinda like your idea.. maybe it's not as stupid as it seemed at first.[/say]")

		saynn("You part your lips.. trying to say something.. but feeling Mirri trying to push the barrel of her gun inside makes you reconsider and keep your mouth shut.")

		saynn("[say=mirri]I know, I know, shut up. I said that I can't let you be the presenter. And that's true, only over my dead abused fucked body I'd let you do that.[/say]")

		saynn("That's.. a weird progression.")

		saynn("[say=mirri]You can't present slaves yourself..[/say]")

		saynn("Mirri stops scratching you and reaches into one of her pouches.. before pulling out a little sneaky headset and putting it on you.")

		saynn("[say=mirri]But you can do it through me![/say]")

		saynn("She reaches into the pouch again and pulls out a little earpiece that she attaches to her feline ear.")

		saynn("[say=mirri]You.. are gonna feed me all the details as I need them, all the selling points. Every little thing that will get those bids rolling in. Understand?[/say]")

		saynn("The gun stops blocking your mouth.. but the barrel is still not exactly too far away from your face.")

		saynn("[say=pc]Alright, as long as I get paid.[/say]")

		saynn("[say=mirri]You will get your cut~.[/say]")

		saynn("A cut? The fuck is she talking about.")

		saynn("[say=pc]You never mentioned a cut. It better be a big one.[/say]")

		saynn("A click of her gun echoes in your ear.")

		saynn("[say=mirri]You want a few grams of lead with your order?[/say]")

		saynn("You frown.. but shake your head.")

		saynn("[say=mirri]Good. You're lucky that you're getting anything at all.[/say]")

		saynn("Mirri holsters the gun and reaches for your headset. She presses a button that turns it on and then purrs into the microphone. The vibrations are making her ear flick in a cute way.")

		saynn("[say=mirri]Five-by-five. Good. New bidders will arrive in a bit, prepare yourself.[/say]")

		saynn("[say=pc]Next bidders will get here so soon already?[/say]")

		saynn("[say=mirri]Who said that it's them who gets to us~.[/say]")

		saynn("Confusing.. but okay.")

		saynn("[say=pc]Shouldn't we practice or something?[/say]")

		saynn("[say=mirri]What is there to practice? I do the talking, you do the thinking. Pick a good spot where you will be able to see the bidders' reaction to my words. Every bidder has different preferences, try to avoid their dislikes and you will be fine. Make them outbid each other for as long as possible![/say]")

		saynn("Seems.. stressful.")

		saynn("[say=mirri]Just don't fuck up![/say]")

		saynn("Easy to say.")

		addButton("Prepare", "Wait until the new bidders arrive..", "prepare_next_auction")
	if(state == "prepare_next_auction"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="mirri", pc=slaveID, bodyState={naked=true, hard=true}})
		saynn("You walk around the stage.. until you find a good spot behind one of the pillars, hidden from any light sources but with full coverage of the whole room.")

		saynn("Mirri seems to be busy preparing your slave.. mentally.. for what is about to happen. You decide not to intervene there.")

		saynn("Time passes, you begin to hear the chatter growing behind the curtains.")

		saynn("You press a button on the headset to turn the microphone on.")

		saynn("[say=pc]Picking me up?[/say]")

		saynn("[say=mirri]Yep, the ear feels funny, I'm picking you up alright. The bidders are here.[/say]")

		saynn("Mirri takes her spot on the little raised platform.")

		saynn("[say=mirri]Time to shine.[/say]")

		saynn("Looks like the auction is about to start.. with you at the wheel.. kinda..")

		saynn("Let's see how hard it's gonna be.")

		addButton("Slave auction", "Begin the minigame", "start_auction_minigame")
	if(state == "failed_to_sell"):
		saynn("The bidders are leaving.. their biggest bid was.. zero credits.")

		saynn("Mirri's eyes look like they're about to pierce you with lasers.. or lead.")

		saynn("[say=pc]Listen, it's not as easy as it seems.[/say]")

		saynn("[say=mirri]Are you really that dumb? We have to sell this slave, we can not keep {slave.him}! Try again, you fuck, the new bidders will arrive soon. It's a busy day.[/say]")

		saynn("Looks like you are given one more chance..")

		addButton("Slave auction", "Begin the minigame", "start_auction_minigame")
	if(state == "after_sold"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc=slaveID, npcBodyState={naked=true, leashedBy="mirri"}})
		saynn("You let out a breath you didn't realize you were holding.")

		saynn("Mirri clips a leash to your slave's collar and whispers a few words to {slave.him}.")

		saynn("[say=mirri]I won't be missing you.[/say]")

		saynn("Harsh. But it's probably true for you as well. She pulls the slave off of the stage and then hands {slave.him} to a few faceless attendants that pick up from there, bringing the toy to {slave.his} new happy owner.")

		saynn("You get a few final glimpses of your slave.. ex-slave.. before {slave.he} vanishes from your sight forever..")

		addButton("Continue", "See what happens next", "slave_sold_yay")
	if(state == "slave_sold_yay"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Soon, the auction ends for the day. The curtains begin to close.. the projectors all turn off, putting the room back into its dimly-lit state.")

		saynn("Mirri approaches you, a smile is tugging at her lips.")

		saynn("[say=mirri]You impressed me, {pc.name}~. Keep it up and I might just spare you when it all ends.[/say]")

		saynn("She giggles watching your concerned eyes.")

		saynn("[say=mirri]Relax, I'm just teasing you~. I seriously love what you did here.. I might have came a little when I finally shouted SOLD.[/say]")

		saynn("[say=pc]Listen, I don't think I need to know every detail of..[/say]")

		saynn("Suddenly, she gets into your face, her hand is holding something.. probably a gun, knowing her.")

		saynn("[say=mirri]I'm spilling out my soul to you and you're gonna reject me like that? Such a rude {pc.boy}. Maybe you don't need this too?[/say]")

		saynn("She raises her hand.. and reveals that she is holding a credit chip.")

		saynn("[say=pc]In fact, I do need this.[/say]")

		saynn("The chip lands in your hands with an audible smack.")

		saynn("[say=mirri]Well, here is your cut, big {pc.boy}. 10%, like we agreed.[/say]")

		saynn("[say=pc]I didn't agree to any..[/say]")

		saynn("Her digits cover your lips.. red claws poking your nose. Mirri tilts her head slightly, closing the distance between your faces.. Her blue eyes glow with excitement.")

		saynn("[say=mirri]Shhh-h.. Sometimes words are unnecessary..[/say]")

		saynn("She gets so close you can feel her warm breath on your neck.. before pulling away.")

		saynn("[say=mirri]You did good today, really good. I knew there was something in you since the moment I saw you. You and I, we could do a lot of damage in this business, don't you think?[/say]")

		saynn("Her clawed digits slide down your chin.. and follow the curves of your shoulder.")

		saynn("[say=pc]Just don't do anything crazy.[/say]")

		saynn("[say=mirri]Hah. Fuck you. I will do anything I want~. Now..[/say]")

		saynn("She grabs your arm and pulls you off stage.")

		addButton("Follow", "See where she brings you", "follow_back")
	if(state == "follow_back"):
		aimCameraAndSetLocName("market_intro")
		GM.pc.setLocation("market_intro")
		saynn("Mirri brings you into the other room with all the furniture.. and that teleporter machine.")

		saynn("[say=mirri]Hold on, last thing.[/say]")

		saynn("She rummages through her desk.. until she finds what she is looking for.")

		saynn("Oh fuck, is that another gun.. this one looks way more.. hi-tech. You see the sparks in her feline eyes as you take a step back.")

		saynn("[say=pc]Hey, hey![/say]")

		saynn("Mirri is swaying her hips slightly, her legs slightly bent, her tail wagging..")

		saynn("You take another step back..")

		saynn("Pounce!")

		saynn("The armored catgirl jumps on you and presses the device against your neck before pulling the trigger.. Thunk.. You feel it injecting something under your skin.")

		saynn("[say=pc]Ow. What the fuck was that?[/say]")

		saynn("[say=mirri]Subdermal a-organic bluespace relay-tag![/say]")

		saynn("You rub your neck.. and don't feel anything apart from a small hole that the injector needle left.")

		saynn("[say=pc]A what?[/say]")

		saynn("[say=mirri]I'm too lazy to teleport you all the time. Press on it and the teleporter will spawn a rift in your cell. Untraceable by all that useless AlphaCorp tech.[/say]")

		saynn("Huh.. looks like she just injected you with a 'order a taxi' button.")

		saynn("[say=pc]Could have told me that earlier. Before you went.. all feral on me.[/say]")

		saynn("[say=mirri]What, can't handle a little pussy cat? Sounds like a 'you' problem![/say]")

		saynn("So this is it, huh. Collared by AlphaCorp and tagged by Syndicate. Great. Just perfect.")

		saynn("[say=mirri]Tell me when you find another good slave to sell off! I'm watching you now, don't disappoint me.[/say]")

		saynn("Her words linger in the air as she steps back, her cunning smile is making you feel weird.")

		saynn("At least you got paid for your trouble. Even if it's not a lot..")

		addButton("Continue", "See what happens next", "endthescene")
func addSlaveButtons():
	var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
	for charID in slaves:
		var character:DynamicCharacter = getCharacter(charID)
		var npcSlavery:NpcSlave = character.getNpcSlavery()
		if(npcSlavery == null):
			continue
		if(npcSlavery.isDoingActivity()):
			addDisabledButton(character.getName(), "This slave is currently busy")
			continue
		addButton(character.getName(), character.getSmallDescription(), "pick_slave", [charID])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pick_slave"):
		slaveID = _args[0]
		setState("confirm_pick_slave")
		return

	if(_action == "do_confirm_pick"):
		processTime(5*60)

	if(_action == "do_cancel_pick"):
		removeCharacter(slaveID)
		slaveID = ""
		setState("")
		return

	if(_action == "mirri_appears"):
		processTime(3*60)

	if(_action == "after_tp"):
		processTime(5*60)

	if(_action == "in_market"):
		processTime(5*60)

	if(_action == "watch_first_auction"):
		processTime(10*60)

	if(_action == "mirri_angery"):
		processTime(5*60)

	if(_action == "prepare_next_auction"):
		processTime(20*60)

	if(_action == "start_auction_minigame"):
		runScene("SlaveAuctionScene", [slaveID, getModule("SlaveAuctionModule").getAuctionSettings()], "slave_auction")
		return

	if(_action == "slave_sold_yay"):
		processTime(10*60)
		removeCharacter(slaveID)
		addExperienceToPlayer(100)
		
		GM.pc.addCredits(int(creditsToGive))
		addMessage("You got "+str(creditsToGive)+" credits!")
		#GM.main.removeDynamicCharacter(slaveID)
		getModule("SlaveAuctionModule").sellToSlavery(slaveID)

	if(_action == "follow_back"):
		processTime(3*60)
		addMessage("Task updated")
		addMessage("You can now teleport between the Blacktail Market and your prison cell")

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "slave_auction"):
		processTime(2 * 60)
		var wasSold = _result[0]["wasSold"] if (_result.size() > 0 && _result[0].has("wasSold")) else true
		
		if(wasSold):
			var creditsAmount = _result[0]["winningBid"]
			var pcNewCredits:int = int(round(float(creditsAmount) * 0.1))
			creditsToGive = pcNewCredits
			
			setState("after_sold")
		
		else:
			setState("failed_to_sell")

func saveData():
	var data = .saveData()

	data["slaveID"] = slaveID
	data["creditsToGive"] = creditsToGive

	return data

func loadData(data):
	.loadData(data)

	slaveID = SAVE.loadVar(data, "slaveID", "")
	creditsToGive = SAVE.loadVar(data, "creditsToGive", 0)
