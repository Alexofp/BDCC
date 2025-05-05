extends SceneBase

var isWine = false
var theAns = ""

func _init():
	sceneID = "Eliza6DateScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_lobbymain")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Eliza's shift has ended.. which means.. It's time to meet her.")

		saynn("You find her behind the counter, putting her mug and the laptop away, preparing for something.")

		saynn("[say=eliza]Oh, hey. I'm almost ready.[/say]")

		saynn("She leaves your view.. just to step out of one of the staff-only doors about a minute later.")

		saynn("[say=eliza]Are you, my assistant?[/say]")

		saynn("[say=pc]Depends.[/say]")

		saynn("She smiles, her hand is holding a chain..")

		saynn("[say=eliza]I won't use it more than I have to. Unless you will ask~.[/say]")

		saynn("Makes sense for prisons to have at least some safety measures.")

		addButton("Continue", "See what happens next", "get_leashed")
	if(state == "get_leashed"):
		aimCameraAndSetLocName("cd_elevator")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={leashedBy="eliza"}})
		saynn("Eliza reaches and attached a chain leash to your collar with a satisfying click. Running away is not an option anymore.")

		saynn("[say=eliza]There we go, let's go chill![/say]")

		saynn("She guides you towards the elevator, gently tugging on the leash, inviting you to follow.")

		saynn("As you join her inside, she presses her badge against some panel and selects the floor that you haven't really seen to be picked that much.. the top floor.")

		saynn("Doors shut and the elevator begins to move up with an annoying screech.")

		saynn("[say=eliza]Just act casual.[/say]")

		saynn("Makes you wonder why she said that.")

		saynn("But the reason becomes clear quite soon.")

		addButton("Continue", "See what happens next", "sudden_risha")
	if(state == "sudden_risha"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {pc="eliza", npc="risha"})
		aimCameraAndSetLocName("cd_near_elevator")
		saynn("As soon as you step out, you're pretty much instantly greeted by some guards.. and they're not exactly happy to see you. One of the guards looks particularly annoyed, a tall and buff lynx. She steps out and blocks the path.")

		saynn("[say=risha]Look what we have here. I see intruders on the top floor. Should I just shoot you on sight? Or give a few seconds to explain yourself first?[/say]")

		saynn("Eliza meets her glare with some strict eyes.")

		saynn("[say=eliza]Risha.. The only thing you are shooting is cum.[/say]")

		saynn("Risha's nostrils flare.. she proudly grabs onto her armored crotch plate, emphasizing her.. virility. Her voice drips with smug amusement.")

		saynn("[say=risha]Oh, is the bitch jealous, huh~? I can give you a litter or two, just beg me nicely.[/say]")

		saynn("Eliza rolls her eyes.")

		saynn("[say=eliza]Hard pass. You can't even do it without making it look like a bloodshed.[/say]")

		saynn("[say=risha]That's just how cat dicks work, I thought you knew your biology~.[/say]")

		saynn("An unstoppable force has met an immovable object.")

		saynn("[say=eliza]I also know chemistry. When the next checkup comes, you're getting a prescription for a limp dick drug. Your ass is in the way, move it, please.[/say]")

		saynn("[say=risha]I will put my ass anywhere I want, sugar. Your face looks good.[/say]")

		saynn("[say=eliza]The only reason why your ass can still be here is because I can't be bothered to report it.[/say]")

		saynn("[say=risha]I'm so scared, wow.[/say]")

		saynn("Feels like you're about to witness a catfight.. But then Risha leans to the side.. and sees you.")

		saynn("[say=risha]Inmates aren't allowed to be here. Feels like it's you who should be reported here.[/say]")

		saynn("[say=eliza]That's my assistant. It's under my full responsibility. Now back off, Risha.[/say]")

		saynn("The staff here is so friendly with each other..")

		saynn("[say=risha]Assistant? Looks like a fucktoy to me.[/say]")

		saynn("[say=eliza]Everything looks like a fucktoy to you, your brain is running on spunk.[/say]")

		saynn("[say=risha]That ain't true! For example, you look like a bitchtoy to me instead.[/say]")

		saynn("Eliza furrows her brows and tries to walk past.. but Risha bumps her back.")

		saynn("[say=risha]Nope.[/say]")

		saynn("[say=eliza]Alright, I will be reporting you to the captain now then.[/say]")

		saynn("Eliza turns around and starts heading back to the elevator. Risha growls.")

		saynn("[say=risha]Fine, fine, you softie. Just say please and you may pass.[/say]")

		saynn("[say=eliza]Please go screw yourself, Risha.[/say]")

		saynn("[say=risha]Love you too, sugar. Mwah.[/say]")

		saynn("Risha sends you and Eliza an air kiss.. and finally steps aside.")

		saynn("Eliza rolls her eyes.. and steps past.")

		saynn("At least no blood was spilled.")

		addButton("Continue", "See what happens next", "near_staff_bar")
	if(state == "near_staff_bar"):
		removeCharacter("risha")
		aimCameraAndSetLocName("cd_corridor5")
		playAnimation(StageScene.Duo, "walk", {npc="eliza", bodyState={leashedBy="eliza"}, npcAction="walk", flipNPC=true})
		saynn("While following Eliza through these corridors.. you can't help but notice the stark contrast between them and what the inmates get. Pristine, polished floors.. soft hum of the fancy overhead lights.. slick, clean walls that occasionally have paintings on them. The style is cold and corporate.. but anything is better than ugly concrete and metal.")

		saynn("[say=eliza]We got unlucky today, Risha is a real nightmare.[/say]")

		saynn("[say=pc]I saw it, looks like you're not exactly friendly with each other.[/say]")

		saynn("[say=eliza]That lynx.. is an animal, I don't really have any other words to describe her.[/say]")

		saynn("You've been stopped a few more times by the guards.. but they just let Eliza go without much problem as soon as she tells them who you are.")

		saynn("[say=pc]Animal?[/say]")

		saynn("[say=eliza]She is part of the reason I don't have much free time to work in the lab myself. Always brings me more broken inmates. If you can subdue her, go for it, I'd be happy. Otherwise, just stay away.[/say]")

		saynn("You chuckle softly.")

		saynn("[say=pc]Makes sense.[/say]")

		saynn("[say=eliza]Eh, forget about her. Let's try to relax. That's the bar over there.[/say]")

		addButton("Bar", "Step inside", "in_bar")
	if(state == "in_bar"):
		aimCameraAndSetLocName("cd_office3")
		setLocationName("Staff bar")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={leashedBy="eliza"}})
		saynn("You step inside the bar.. and are met with a different, contrasting environment yet again.")

		saynn("The star of the room is obviously a long counter made out of some fancy red wood. It has some bar stools near it, with a few staff members sitting on them, chilling and doing drinks.")

		saynn("The lighting is dim yet warm, casting soft shadows that create an inviting.. almost intimate atmosphere. The walls are also made fancy with that same red wood trims and tasteful art.")

		saynn("[say=eliza]Let's go get a table. What do you want me to get for you, wine or just some orange juice?[/say]")

		saynn("She makes that question with a playful arch of her eyebrow. Wine or juice? Interesting selection, for sure. But anything is better than plain water.")

		addButton("Wine", "Choose the wine", "choose_wine")
		addButton("Juice", "Choose the orange juice", "choose_juice")
	if(state == "choose_wine"):
		playAnimation(StageScene.PawJobUnderTable, "start", {pc="pc", npc="eliza"})
		if (isWine):
			saynn("[say=pc]Wine sounds good.[/say]")

			saynn("[say=eliza]Good choice~.[/say]")

		else:
			saynn("[say=pc]Juice sounds good. I'd rather keep a clean mind.[/say]")

			saynn("[say=eliza]That will be impossible no matter what~.[/say]")

		saynn("Eliza brings you to one of the tables.. and clips the leash to one of the hooks on it. Huh. Makes you wonder why these tables have them.")

		if (isWine):
			saynn("[say=eliza]I will go source us a bottle.[/say]")

		else:
			saynn("[say=eliza]I will go get me a bottle.. and juice for you~.[/say]")

		saynn("While she is gone, you settle in, planting your butt on the comfy chair. Ambience here is nice.. occasional clink of glasses.. low murmur of conversion.. At least somewhere in this prison, there seems to be peace.")

		saynn("The more you think about it.. The softness in her voice, the subtle smile on her lips.. this bar that she brought you in.. the leash? Huh.")

		if (isWine):
			saynn("Soon enough, Eliza comes back, holding a bottle of wine and two glasses. She places one on your side and pours some of the velvety dark-purple wine into it.")

			saynn("She does the same for herself.. and just relaxes in her chair.")

		else:
			saynn("Soon enough, Eliza comes back, holding two glasses, a bottle of wine and an orange juice box. She places one glass on your side and fills it with juice. Then, she grabs the bottle and pours herself some of the velvety dark-purple wine.")

			saynn("Then.. she just relaxes in her chair.")

		saynn("[say=eliza]Ooh.. finally. It's my favourite time. Time to rest.[/say]")

		saynn("[say=pc]You earned it.[/say]")

		saynn("Little smile illuminates her expression. She sips some of the wine and lets out a breathy sigh.. almost a moan."+str(" You take a sip too.. the fruity taste is so good, you can barely contain it.." if isWine else " You take a sip too.. the taste is so good, you can barely contain it..")+"")

		saynn("[say=eliza]It wouldn't feel so good.. if the rest didn't suck so much, hah. I guess I'm a masochist.[/say]")

		saynn("[say=pc]You're saying that you love pain?[/say]")

		saynn("Little smile turns into a smug one.")

		saynn("[say=eliza]Pain.. can be fun. It all depends on the situation. World isn't simple. But even the most insane events.. or people.. have logic behind them. And that's what I like about it.[/say]")

		saynn("[say=pc]It's like a cardboard box.[/say]")

		saynn("Her ears perk when you say that.")

		saynn("[say=eliza]You remember, yeah~.[/say]")

		saynn("[say=pc]Cardboard boxes are pretty fragile.[/say]")

		saynn("[say=eliza]Well, I'm not hurting the box. I'm just testing it.. exploring its reactions. But maybe my moral compass has shifted too much. Tell me, do you think I'm one of those 'bad guys'? The evil scientist that won't be stopped by anything.[/say]")

		saynn("She catches some of the purple fluid with her feline tongue and keeps the glass raised. It looks like she actually expects an honest answer to this one..")

		addButton("Good girl", "Tell her she is a good girl", "say1_goodgirl")
		addButton("Naughty girl", "Tell her she is a bad and naughty girl", "say1_badgirl")
	if(state == "say1_badgirl"):
		saynn("[say=pc]I think you're being on the naughty side quite often. Perhaps you focus on science a little too much, forgetting that science should benefit people.[/say]")

		saynn("Eliza stays quiet for a bit, wiggling the wine in her glass.")

		saynn("[say=eliza]What we do will benefit a lot of people. It's just that.. inmates that are here are not 'these' people. A real dilemma, isn't it? Do we do tests on people or do we not. If yes, which people?[/say]")

		saynn("It doesn't seem to be much of a dilemma for her, considering what she does. The feline licks some more wine and chuckles, lighting up the mood.")

		saynn("[say=eliza]Hah, but you might be right~. Maybe you're even being a little too soft with me. Because I can be a real mean bitch sometimes~.[/say]")

		saynn("[say=pc]Do you like being treated like a bitch?[/say]")

		saynn("Playfully, she shows you her fangs as she licks her lips.")

		saynn("[say=eliza]I'm a doctor, I treat others~.[/say]")

		saynn("You might need something against a burn that she just caused to you.")

		saynn("[say=eliza]But you know, my mom would agree with you.[/say]")

		saynn("[say=pc]You're not on the best terms?[/say]")

		saynn("[say=eliza]It's a.. it's a thing, for sure.[/say]")

		saynn("[say=pc]We got time. I got ears"+str(" and some wine" if isWine else " and some juice")+".[/say]")

		saynn("[say=eliza]Hah. I'm not sure I trust you enough with that, my assistant.[/say]")

		saynn("She holds a little pause while staring at the wine bottle. A bottle that is still far from being empty.")

		saynn("[say=eliza]Not yet, at least~.[/say]")

		addButton("Continue", "See what happens next", "chat2")
	if(state == "say1_goodgirl"):
		saynn("[say=pc]I think you're a good girl. Incredibly smart too.[/say]")

		saynn("[say=eliza]Aw, you're making me blush, hah. You're just saying it because you don't wanna ruin the mood.[/say]")

		saynn("She sips some more of the purple wine and then licks her lips, flashing her sharp fangs for a second.")

		saynn("[say=pc]Bite me, I mean it.[/say]")

		saynn("[say=eliza]Ohh, I will bite you alright. If my mom was here, she would have started a full-on brawl with you~.[/say]")

		saynn("She wiggles the wine in her glass with little circular motions of her paw.")

		saynn("[say=pc]You're not on the best terms?[/say]")

		saynn("[say=eliza]It's a.. it's a thing.[/say]")

		saynn("[say=pc]We got time. I got ears"+str(" and some wine" if isWine else " and some juice")+".[/say]")

		saynn("[say=eliza]Hah. I'm not sure I trust you enough with that, my assistant.[/say]")

		saynn("She holds a little pause while staring at the wine bottle. A bottle that is still far from being empty.")

		saynn("[say=eliza]Not yet, at least~.[/say]")

		addButton("Continue", "See what happens next", "chat2")
	if(state == "chat2"):
		saynn("[say=pc]Keep your secrets.[/say]")

		saynn("[say=eliza]I very much will, until the bitter end.[/say]")

		saynn("She takes a sip.. emptying her glass.")

		var drugDenLevel = getFlag("DrugDenModule.HighestDrugDenLevel", 0)
		saynn("[say=eliza]You helped me to make some amazing discoveries in the lab. Oh yeah, I'm wondering, have you tried exploring that drug den yet?[/say]")

		if (drugDenLevel <= 0):
			saynn("[say=pc]Well.. uhh..[/say]")

			saynn("[say=eliza]I see. I thought I'm the pussy here~. There could be some drug samples there that we haven't found yet.[/say]")

			saynn("[say=pc]I will run into them one day anyway. I don't have to go down there, it feels risky.[/say]")

			saynn("[say=eliza]Fair. But if you get stuck with the research, the option is always there. Isn't having options nice~?[/say]")

		elif (drugDenLevel <= 3):
			saynn("[say=pc]Well.. uhh.. a little bit?[/say]")

			saynn("[say=eliza]A little bit?[/say]")

			saynn("Better be honest probably.")

			saynn("[say=pc]I didn't get very far. I really don't like those junkies, why not just get rid of them.[/say]")

			saynn("[say=eliza]Science isn't really about getting rid of things. We do help to upkeep the balance sometimes but that's about it. What we mostly do is.. research.[/say]")

			saynn("[say=pc]It's a strange way to research.[/say]")

			saynn("[say=eliza]You're exploring wild nature~. It's the best way to research. There could be some drug samples there that we haven't found yet.[/say]")

			saynn("[say=pc]I will run into them one day anyway. I don't have to go down there, it feels risky.[/say]")

			saynn("[say=eliza]Fair. But if you get stuck with the research, the option is always there. Isn't having options nice~?[/say]")

		elif (drugDenLevel <= 6):
			saynn("[say=pc]I did, actually. I didn't get too far yet, it's a dangerous place.[/say]")

			saynn("[say=eliza]Nature can be dangerous, it's true.[/say]")

			saynn("[say=pc]You're calling that drug den nature?[/say]")

			saynn("[say=eliza]It's a form of nature. A naturally-formed drug den. It wouldn't appear if there weren't perfect conditions for it.[/say]")

			saynn("That's one way to look at things..")

			saynn("[say=eliza]You're exploring wild nature~. It's the best way to research. There could be some drug samples there that we haven't found yet.[/say]")

			saynn("[say=pc]Yeah, I saw some make-shift lab equipment there.[/say]")

			saynn("[say=eliza]Fascinating. I don't regret not telling the guards about it. Because it gave us this option. Isn't having options nice~?[/say]")

		else:
			saynn("[say=pc]I did, actually. Got pretty far too, the thing has many levels to it. I'm not sure it even ever ends.[/say]")

			saynn("[say=eliza]Wow, really? That sounds extremely interesting. Our prison certainly doesn't have an unlimited amount of levels to it. Maybe something down there is affecting your perception?[/say]")

			saynn("[say=pc]It does smell like.. drugs.. down there.[/say]")

			saynn("[say=eliza]Maybe. Still. I don't regret not telling the guards about it. Because it gave us this option. Isn't having options nice~?[/say]")

		saynn("You take a sip.. and now both glasses are empty. But Eliza obviously has not yet achieved her desired level of wobbliness.. although, her cheeks do begin to glow with a pleasant shade of light pink.")

		saynn("[say=eliza]Could you maybe?..[/say]")

		saynn("You're the assistant here.. so you obviously nod."+str(" You grab the wine bottle and fill both glasses, not until edges.. but pretty close." if isWine else " You grab the wine bottle and fill her glass. Yours gets topped with juice instead.")+"")

		saynn("But before you can return to drinking and resting, she covers the top of your glass with her paw.")

		saynn("[say=eliza]I wonder.. hmm~.[/say]")

		saynn("You can see a spark in her eyes.")

		saynn("[say=eliza]Do you trust me, my assistant~?[/say]")

		saynn("Oh no, what is she scheming again.. what other drug den is she gonna ask you to raid.")

		saynn("[say=pc]If I didn't trust you, at least a little bit, I probably wouldn't be here.[/say]")

		saynn("Eliza hums, biting her lip.")

		saynn("[say=eliza]Your words are laced with logic, I will give you that.[/say]")

		saynn("[say=pc]Thank you.[/say]")

		saynn("Her free paw reaches somewhere into her pouches.")

		saynn("[say=eliza]But can you prove your words~.[/say]")

		saynn("She produces a little pill.. one that is lacking any obvious labels. Her digits play with it for a bit.. until it falls directly into your glass"+str(" of wine" if isWine else " of juice")+" with satisfying plop.")

		saynn("Almost immediately, it begins to dissolve. Your brows raise high on their own.")

		saynn("[say=pc]What was it?[/say]")

		saynn("[say=eliza]Well.. Let's say.. It's just some sugar. Yes, exactly~.[/say]")

		saynn("Somehow you find it hard to believe.")

		saynn("[say=pc]Sugar?[/say]")

		saynn("[say=eliza]What, you think I'd lie to you~?[/say]")

		saynn("[say=pc]You sure took your time answering.[/say]")

		saynn("[say=eliza]But I did answer. It's sugar. Or sucrose if you want to be precise.[/say]")

		saynn("She wiggles your glass a bit, to make sure the pill fully dissolves in it. The way it looked.. it sure kinda reminded you of those weird ones.")

		saynn("[say=eliza]Now.. Do you trust this feline that's sitting in front of you? And I'm not looking for just words here~.[/say]")

		saynn("Her paw moves the glass closer to you.")

		saynn("[say=pc]If I don't, will you stop trusting me?[/say]")

		saynn("[say=eliza]We will see~.[/say]")

		saynn("That's not very inspiring. You stare at the "+str("wine" if isWine else "juice")+".. that could potentially be poisoned now.. or contain a drug that would transform you into who knows what..")

		saynn("[say=eliza]C'mon~. Worst case, you will just wake up tied up to my bed. Ain't that exciting~?[/say]")

		saynn("Drink spiking? This is totally just a date..")

		addButton("Drink it", "Why the heck not", "do_drink")
		addButton("Refuse", "(End date) You'd rather not risk it", "do_not_drink")
	if(state == "do_not_drink"):
		setFlag("ElizaModule.dateOutcome", "refused")
		saynn("[say=pc]I'd rather not risk it.[/say]")

		saynn("She nods slowly, her clawed digits tapping away at the table as she just stares at you..")

		saynn("[say=eliza]That's okay, I get it.[/say]")

		saynn("She grabs the glass and empties it down the bar's sink.")

		saynn("[say=pc]What was in that glass?[/say]")

		saynn("[say=eliza]Ain't tellin ya~.[/say]")

		saynn("She really wants to keep you curious, it seems.")

		saynn("[say=eliza]'Cause I don't remember myself.[/say]")

		saynn("..or not..")

		saynn("[say=pc]Really? You needed someone to test it? You lied to me?[/say]")

		saynn("[say=eliza]Hey! I was.. about sixty percent sure that it was just sugar! I just wasn't fully sure~.[/say]")

		saynn("You're not even sure how to feel about that one.")

		saynn("[say=pc]You're.. Do you know that you're crazy?[/say]")

		saynn("She shrugs.")

		saynn("[say=eliza]Someone has to be~.[/say]")

		saynn("You two made a lot of noise.. others in the bar are staring at you, their gazes seem to cool the feline down.")

		saynn("[say=eliza]I guess it didn't work the way I thought it would. Hope you had fun though.[/say]")

		saynn("Looks like a good place to wrap up this.. date.")

		saynn("[say=pc]This was something, for sure.[/say]")

		saynn("Your words leave a lot of uncertainty. Gotta have at least some manners.")

		saynn("[say=pc]Thanks for the "+str("wine" if isWine else "juice")+". I don't get to drink it very often.[/say]")

		saynn("[say=eliza]You're welcome, assistant~.[/say]")

		saynn("At least she didn't revoke your access to the lab.")

		saynn("[say=eliza]Let me get you back to the cellblock.[/say]")

		saynn("She grabs the leash.. and invites you to follow.")

		addButton("Follow", "See where she will bring you", "failed_follow")
	if(state == "failed_follow"):
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={leashedBy="eliza"}})
		saynn("The elevator brings you back to the familiar floor.. Eliza walks you past the checkpoint.. and begins to take off the leash.")

		saynn("[say=eliza]There we are. I hope you're not mad at me, heh.[/say]")

		saynn("[say=pc]You might have almost killed me.[/say]")

		saynn("[say=eliza]Pff, you're being overly dramatic, I'd never let my assistant suffer like that~.[/say]")

		saynn("She puts the chain away.")

		saynn("[say=eliza]If you're mad.. well.. sorry. Didn't mean to.[/say]")

		saynn("Weird to hear that word from her.")

		saynn("[say=pc]Sure. You gave me a choice at least.[/say]")

		saynn("She nods.")

		saynn("[say=eliza]If you want me out of your hair, you can help me fill out the database.[/say]")

		saynn("[say=pc]What will happen then?[/say]")

		saynn("[say=eliza]I will show it to my mother. She will hopefully be impressed. And then.. she will hopefully offer me to join her in her lab.[/say]")

		saynn("Plan built on nothing but hopes. Sounds a lot like a.. dream.")

		saynn("You just nod.")

		saynn("[say=eliza]See ya~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_drink"):
		saynn("Sure, what can go wrong.")

		saynn("You grab the glass of "+str("wine" if isWine else "juice")+".. and empty it in one go.")

		saynn("The taste.. it's hard to describe if it's different or not.. Obviously, the "+str("wine" if isWine else "juice")+" already has some sugar in it.")

		saynn("Do you feel different?.. Maybe? Maybe not?")

		saynn("Eliza tracks the changes in your face expression with great interest.. how you shuffle on the chair.. how you look down at yourself..")

		saynn("You feel a bit.. warmer.. but that might just be from your heart beating faster.")

		saynn("The tension.. It alone is killing you.")

		saynn("[say=pc]Well, I drank it. Can you now tell what it was?[/say]")

		saynn("You see her shrug.")

		saynn("[say=eliza]Sugar, probably~.[/say]")

		saynn("[say=pc]Probably?[/say]")

		saynn("[say=eliza]Almost certainly.[/say]")

		saynn("[say=pc]Almost?[/say]")

		saynn("Her cheeky smile doesn't make it easier.")

		saynn("[say=eliza]Relax, I'm here. I'd never let my assistant suffer~.[/say]")

		saynn("If she wanted to kill you.. this probably ain't a place for it anyway.")

		saynn("[say=pc]Sure.[/say]")

		saynn("She leans in and scritches under your chin with her free paw.")

		saynn("[say=eliza]I'm glad you trust me so much~. But.. Now the question is.. Can I trust you?[/say]")

		saynn("A small, nervous giggle leaves your lips. All the while Eliza just continues to rest and enjoy her wine.")

		saynn("[say=pc]I am not swallowing any more of your pills.[/say]")

		saynn("The last one was hard enough to swallow already.")

		saynn("[say=eliza]That's a very bold statement~. But no, I'm not gonna make you swallow anything for now.[/say]")

		saynn("That chain that holds you leashed to the table keeps reminding about itself.")

		saynn("[say=eliza]I just wanna play a little game with you~.[/say]")

		saynn("[say=pc]I thought we were just gonna rest.[/say]")

		saynn("[say=eliza]Nah-nah-nah~. You already forgot the contract that you signed? We're here to know each other a little better.[/say]")

		saynn("She is right, you don't remember signing any contacts. You must have missed that part.")

		saynn("[say=eliza]I can tell you some of my secrets, answer your questions~.[/say]")

		saynn("Her secrets.. huh..")

		saynn("[say=eliza]All you had to do was drink some sweet "+str("wine" if isWine else "juice")+". Me sharing my secrets sounds like a much better deal, no~?[/say]")

		saynn("To be fair, that drink could have killed you.. But her deal does sound somewhat intriguing.")

		saynn("[say=pc]Alright. This is not how I saw our.. whatever this is.. going. What's the game?[/say]")

		saynn("Her paw puts the glass of wine down.. and produces a piece of tight fabric instead.. It looks like a blindfold.")

		saynn("[say=eliza]You've never been on dates~? I need to put this on you first.[/say]")

		saynn("Dates and blindfolds go so well together..")

		saynn("[say=eliza]Quit worrying, I won't touch you~. It will just be a little quiz. I wanna know if I can trust you with my.. secrets~.[/say]")

		saynn("Well, what's the worst that can happen..")

		saynn("She approaches you and begins tying a blindfold around your eyes..")

		addButton("Continue", "See what happens next", "blindfolded")
	if(state == "challenge_start"):
		playAnimation(StageScene.Solo, "sit")
		removeCharacter("eliza")
		saynn("After she finishes tying up the knot behind your head.. your sense of vision vanishes completely, leaving you completely blind.")

		saynn("It's hard to tell where the feline is now.. It's hard to tell if she is near you at all.")

		saynn("[sayFemale]Alright~. Let's start with something simple. What's my first name?[/sayFemale]")

		saynn("So this is what it's about.. this date is quickly turning into an interrogation.")

		addButton("Elina", "Say this", "say1_elina")
		addButton("Elisa", "Say this", "say1_elisa")
		addButton("Eliza", "Say this", "say1_eliza")
		addButton("Elisha", "Say this", "say1_elisha")
	if(state == "c_failed"):
		playAnimation(StageScene.PawJobUnderTable, "start", {pc="pc", npc="eliza"})
		addCharacter("eliza")
		saynn("[say=pc]"+str(theAns)+"[/say]")

		saynn("The feline's answer is instant.")

		saynn("[say=eliza]Beeeeep, wrong![/say]")

		saynn("[say=pc]Really?[/say]")

		saynn("[say=eliza]Yes, really~. I thought you knew me better than that.[/say]")

		saynn("Fuck!")

		saynn("[say=pc]You're a.. complicated girl, okay?[/say]")

		saynn("[say=eliza]Excuses~.[/say]")

		addButton("Continue", "Oh well. Accept the failure", "accept_fail")
		addButton("(Try again)", "Revert the time. Undo your mistakes", "challenge_start")
	if(state == "accept_fail"):
		setFlag("ElizaModule.dateOutcome", "failed")
		saynn("She undoes the blindfold, letting you see again.")

		saynn("[say=pc]Do I get a consolation prize at least?[/say]")

		saynn("[say=eliza]Sure, make your choice. Getting to kiss my hind paw, a day in the padded room or being my seat for an hour~?[/say]")

		saynn("You're not sure if she is being serious or not by this point.")

		saynn("[say=pc]I guess that's a no.[/say]")

		saynn("She chuckles. Only now you realize that the wine bottle is empty.")

		saynn("[say=eliza]Well, sorry, assistant. I guess I will be keeping my secrets with me~.[/say]")

		saynn("[say=pc]That's okay.[/say]")

		saynn("[say=eliza]Good time to stop, don't you think?[/say]")

		saynn("You nod. She grabs your leash.")

		saynn("[say=eliza]Let's get you back to the cellblock then.[/say]")

		addButton("Continue", "See what happens next", "after_fail_cellblock")
	if(state == "after_fail_cellblock"):
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={leashedBy="eliza"}})
		saynn("The elevator brings you back to the familiar floor.. Eliza walks you past the checkpoint.. and begins to take off the leash.")

		saynn("[say=eliza]There we are. Hope you had fun. I feel rested~.[/say]")

		saynn("[say=pc]You might have almost killed me. That is fun.[/say]")

		saynn("[say=eliza]Pff, you're being overly dramatic.[/say]")

		saynn("She puts the chain away.")

		saynn("[say=eliza]If you're mad.. well.. sorry. Didn't mean to.[/say]")

		saynn("Weird to hear that word from her.")

		saynn("[say=pc]Sure. You gave me a chance at least.[/say]")

		saynn("She nods. Before she leaves, a question comes into your mind randomly..")

		saynn("[say=pc]What will happen after we fill out the drug database?[/say]")

		saynn("[say=eliza]I will show it to my mother. She will hopefully be impressed. And then.. she will hopefully offer me to join her in her lab.[/say]")

		saynn("Plan built on nothing but hopes. Sounds a lot like a.. dream.")

		saynn("You just nod.")

		saynn("[say=eliza]See ya~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "say1_eliza"):
		saynn("[say=pc]Eliza, that's your name.[/say]")

		saynn("[say=eliza]That's correct~. I'd be very surprised if you'd forget that.[/say]")

		saynn("Phew.")

		saynn("[say=eliza]Next.. What's my hair color~?[/say]")

		if (false):
			addButton("Wrong", "Ignore me", "pickWrongAns")
		addWrongAnswer("Red", "Red?")
		addButton("Pink", "Say this", "say2_pink")
		addWrongAnswer("Blonde", "Blonde?")
		addWrongAnswer("Ginger", "Ginger?")
	if(state == "say2_pink"):
		addCharacter("eliza")
		playAnimation(StageScene.PawJobUnderTable, "start", {pc="pc", npc="eliza"})
		saynn("[say=pc]Pink? I remember it being pink-ish.[/say]")

		saynn("[say=eliza]Yep~. You're very observant.[/say]")

		saynn("Wasn't too hard..")

		saynn("[say=eliza]What does my personal coffee cup say?[/say]")

		addWrongAnswer("Nerd cat", "Nerd cat?")
		addWrongAnswer("Coffee is life", "Coffee is life?")
		addWrongAnswer("Life juice", "Life juice?")
		addButton("Best mom", "Say this", "say3_bestmom")
	if(state == "say3_bestmom"):
		saynn("[say=pc]It says.. best mom.[/say]")

		saynn("[say=eliza]Exactly. It's cute, isn't it?[/say]")

		saynn("[say=pc]Why do you have it?[/say]")

		saynn("[say=eliza]It's still my turn to ask questions![/say]")

		saynn("Maybe she will tell you later.. What a date.")

		saynn("[say=eliza]Speaking of.. Last question is.. what's my mother's name?[/say]")

		saynn("Oh shit.")

		addButton("Scarlet", "Say this", "say4_scarlet")
		addWrongAnswer("Selene", "Selene?")
		addWrongAnswer("Sharlene", "Sharlene?")
		addWrongAnswer("Carlotta", "Carlotta?")
	if(state == "say4_scarlet"):
		saynn("[say=pc]Scarlet.. I think..[/say]")

		saynn("[say=eliza]Is that your final answer?[/say]")

		saynn("Why are you still blindfolded..")

		saynn("[say=pc]Sure.[/say]")

		saynn("Eliza keeps quiet for some time.. letting the tension bite at your ankles.")

		saynn("[say=eliza]And.. ding-ding-ding-ding-ding! We have a winner![/say]")

		saynn("You let out a sigh of relief.")

		saynn("[say=eliza]Oh yeah, another question, do you like me?![/say]")

		saynn("[say=pc]Eliza..[/say]")

		saynn("She giggles.")

		saynn("[say=eliza]I know your answer to that one, don't bother~. Let me take off that blindfold.[/say]")

		addButton("Continue", "See what happens next", "won_remove_blindfold")
	if(state == "won_remove_blindfold"):
		setFlag("ElizaModule.dateOutcome", "perfect")
		saynn("As she unties the blindfold, the first thing you see is her emerald eyes from up close..")

		saynn("[say=eliza]Hey there. You know, I think you're worth my trust~.[/say]")

		saynn("Who knew that remembering her mother's name is enough to make her trust you..")

		saynn("She plants her butt back into the chair and continues licking her wine.. the bottle has become considerably closer to being empty since the last time you saw it..")

		saynn("[say=eliza]So if you wanna ask something, now you have the chance.[/say]")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "ask_menu"):
		saynn("What do you want to ask Eliza?")

		addButton("Mug", "Ask about the mug", "ask_mug")
		addButton("Future", "Ask about what she will do next", "ask_future")
		addButton("Mother", "Ask about her mother", "ask_mother")
		addButton("Do you like me", "Ask her if she likes you", "ask_likeme")
		addButton("Bark for me", "Ask her to bark for you", "ask_bark")
		addButton("Enough", "Enough questions", "stop_asking")
	if(state == "ask_mug"):
		saynn("[say=pc]Your mug.. the one that says 'best mom'. Is there a story behind that?[/say]")

		saynn("[say=eliza]Oh yeah![/say]")

		saynn("She rummages through her things.. and pulls out that mug. She carefully places it on the table.")

		saynn("[say=eliza]It's my favorite one.. I hate it so much.[/say]")

		saynn("Confusing..")

		saynn("The mug seems to be just a normal white one.. with a print of a red heart and the words 'Best Mom'.")

		saynn("[say=pc]Why?[/say]")

		saynn("[say=eliza]Well, you might have already realized that this mug isn't exactly mine.. Well.. it IS mine..[/say]")

		saynn("The more you look at it, the more details you begin to see.. The mug's surface has a few subtle cracks going through it.")

		saynn("[say=pc]It's your mother's?[/say]")

		saynn("[say=eliza]It's my gift to her. Well, it was supposed to be. I really meant it when I bought it, she is the best mom.[/say]")

		saynn("[say=pc]So why haven't you gifted it yet? Want some help with that?[/say]")

		saynn("[say=eliza]I did try! But mom just kinda threw it against a wall. Boom-m.[/say]")

		saynn("Ohh. That's one way to deny a gift.")

		saynn("[say=pc]That's not very grateful of her.[/say]")

		saynn("[say=eliza]She was pretty angry. I guess she thought this was me trying to buy her forgiveness with gifts.[/say]")

		saynn("[say=pc]Well, was it?[/say]")

		saynn("[say=eliza]Pfff! Maybe? I don't know, no one likes when their mother is angry with them, I did what I could. But like I said, I really meant it.[/say]")

		saynn("She gently drags her clawed digits along the surface of that mug, really showing how irregular it is.")

		saynn("[say=eliza]I glued it back together. Now it's my mug, I guess.[/say]")

		saynn("Huh. If that mug was really thrown against a wall, it'd be nothing but dust by now. Did she really glue a million little pieces back together..")

		saynn("[say=eliza]I just don't wanna throw it out.[/say]")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "ask_future"):
		saynn("[say=pc]After we discover all of the drugs that the inmates have been making here, what will you do?[/say]")

		saynn("[say=eliza]I will show our findings to my mother. And then.. something will probably happen. I don't know what.[/say]")

		saynn("[say=pc]What are you hoping will happen?[/say]")

		saynn("Her sharp feline tongue catches some more wine from the glass.")

		saynn("[say=eliza]Well.. I never wanted to be here. Imagine.. ugh.. I don't know if I should talk about it. You wanted to know what's next while I'm trying to bring up the past.[/say]")

		saynn("The past will always remind of itself, no matter how far into the future you're trying to look. You pretty much know the answer already.")

		saynn("[say=pc]It's okay. I think you are hoping she will take you back into her lab?[/say]")

		saynn("[say=eliza]Everything that I know, I learned there. It's a good lab.. Well, it was. I didn't wanna work under my mom's supervision so I kept sneaking inside it on my own. It was fun to experiment with all the equipment and substances. But then I accidentally mixed water and potassium.. whole tanks of it.[/say]")

		saynn("You can tell when her love for science began.")

		saynn("[say=pc]Sounds like you shouldn't have?[/say]")

		saynn("[say=eliza]Hah. What I remember is.. a giant fire.. but it wasn't red. It had a lilac tint to it. Most beautiful thing I've ever seen in my life. Felt like I was staring directly into.. some eternal world. It wasn't even Bluespace, it was something else.[/say]")

		saynn("Wow.")

		saynn("[say=pc]What happened then?[/say]")

		saynn("[say=eliza]..boom. What happened then is a big boom. So powerful that it threw me against the wall. That was fun. Wheeee.[/say]")

		saynn("She throws her arms up, like she is riding a rollercoaster.")

		saynn("[say=pc]How did you even survive then?[/say]")

		saynn("Eliza lowers her hands.")

		saynn("[say=eliza]Well, I didn't. I found my eternal peace that day. Dad had to risk his life to get an unconscious me out from under the fire. Somehow he and my mother managed to make me breathe again.[/say]")

		saynn("Hard to imagine what they all felt.")

		saynn("[say=eliza]Seeing their faces.. That wasn't so fun.[/say]")

		saynn("[say=pc]Sounds like your dad is a hero.[/say]")

		saynn("She nods and lowers her head.")

		saynn("[say=eliza]Yeah, he always supports me. He tried to talk mom out of it.. but she was keen on having me as far as possible from chemistry. She punished me by sending me here, to this isolated prison, to be a doctor.[/say]")

		saynn("Her mother would rather let her stay around dangerous inmates than let her do chemistry.")

		saynn("A little smile shines on her face.")

		saynn("[say=eliza]I always find a way though~. A punishment will never stop me from doing what I want.[/say]")

		saynn("[say=pc]That's one hell of a story.[/say]")

		saynn("She chuckles.")

		saynn("[say=eliza]So yeah. Plan is simple. I'm proving to my mother that I should be allowed to do chemistry. And then.. I wanna return back to the old lab. To work by my mother's side.. I guess.[/say]")

		saynn("Somehow, she doesn't sound.. so sure.")

		saynn("[say=pc]Wasn't that your dream?[/say]")

		saynn("[say=eliza]Yeah, it is. Still is. It's just..[/say]")

		saynn("She stays silent, just catching more wine with her tongue.")

		saynn("[say=eliza]Funny stuff.. I'm locked away in this prison by her, stripped of all my freedoms. But I think I'm still the most 'free' I ever was..[/say]")

		saynn("Something for her to think about.")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "ask_mother"):
		saynn("[say=pc]Your mother.. Scarlet Quinn.. She seems like a powerful woman.[/say]")

		saynn("[say=eliza]Hah. You can't even imagine.[/say]")

		saynn("Eliza proudly holds her chin high.")

		saynn("[say=eliza]My mother is the CMO of the whole AlphaCorp![/say]")

		saynn("[say=pc]CMO?[/say]")

		saynn("[say=eliza]Chief Medical Officer, one of the heads of AlphaCorp. There is no one above her in the medical field. She does so much cool secret corporate stuff, you can't even imagine! If I'd tell you even one percent of it, I'd have to kill you~.[/say]")

		saynn("[say=pc]Looks like I will have to interrogate you.[/say]")

		saynn("She laughs.")

		saynn("[say=eliza]Good luck, no one was able to break me yet~.[/say]")

		saynn("Oh yeah, about that.")

		saynn("[say=pc]You're telling me that the CMO of AlphaCorp decided to send her daughter here? As far away from civilization as humanly possible?[/say]")

		saynn("She shrugs.")

		saynn("[say=eliza]It's a punishment for what I did. That's how I see it.[/say]")

		saynn("Right.")

		saynn("[say=eliza]So yeah, you don't wanna mess with my mother~.[/say]")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "ask_likeme"):
		saynn("[say=pc]Do you like me?[/say]")

		saynn("[say=eliza]Sure, you're pretty cute~.[/say]")

		saynn("She said it without hesitation, catching you off-guard.")

		saynn("[say=pc]That was.. fast.[/say]")

		saynn("[say=eliza]I kno-o-ow. I shouldn't get attached to inmates or patients or staff here since I'm not gonna be here for very long..[/say]")

		saynn("Who knows..")

		saynn("[say=eliza]But you're my assistant so it's a different deal~. You seem to want to help me push science forward. And I appreciate it.[/say]")

		saynn("She reaches her paw out to boop you on the nose.")

		saynn("[say=eliza]You also proved that I trust you~. So yeah, you're cute.[/say]")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "ask_bark"):
		saynn("[say=pc]Can you bark for me?[/say]")

		saynn("[say=eliza]Bark-bark~.[/say]")

		saynn("What.. Eliza even holds her paws near her chest, like a puppy. She sticks her tongue out and pants while watching your confused reaction.")

		saynn("[say=eliza]Bark~? Want me to awoo? I can do awoo too.[/say]")

		saynn("Her tail is wagging happily.")

		saynn("[say=pc]Didn't expect you to just do it.[/say]")

		saynn("She chuckles.")

		saynn("[say=eliza]Why not~. I think I have all the kinks in the world. And petplay is certainly one of them.[/say]")

		saynn("What a kinky kitty..")

		saynn("[say=eliza]I like to experiment~. I can dominate or be a subby mess, I'm a total switch. If you want a list of my favorite kinks.. in no particular order..[/say]")

		saynn("She begins listing them all..")

		saynn("[say=eliza]Drug use is the obvious one.. Any kind of BDSM play is fuck yes~. Chastity can be extremely hot.. Petplay is fun. Oh yeah, have you ever tried ponyplay? It includes hot harnesses, wearing pony hooves, bits, reins, pulling carts, lots of whipping~. I love when I get to do it..[/say]")

		saynn("She just doesn't stop..")

		saynn("[say=eliza]Obviously sex is fun.. But vanilla is a bit boring for me, I love when it has some spice to it! Feetplay, tribadism, licking, face-sitting, yes-yes-yes.. Milking, oh yes, please, any kind of milking, I can't live without it~.[/say]")

		saynn("She is breathing deeply, her cheeks blushing..")

		saynn("[say=eliza]Even watersports can be super hot under the right conditions..[/say]")

		saynn("[say=pc]Alright, I see.[/say]")

		saynn("She puts on a polite little smile, her eyes innocent.")

		saynn("[say=eliza]You wanted to hear my secrets, those are my secrets~.[/say]")

		saynn("That's fair enough.")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "stop_asking"):
		saynn("[say=pc]That's all I wanted to know, I think.[/say]")

		saynn("Eliza nods, her paw reaches for the wine bottle.. only to realize that it is now fully empty.")

		saynn("[say=eliza]Just in time~.[/say]")

		saynn("You empty your glass.. and just relax in the chair.. trying to feel as much comfort as you can before you have to leave.")

		saynn("So many challenges.. but you managed to avoid her traps.")

		saynn("[say=eliza]Hope you had fun, assistant, I know I did.[/say]")

		saynn("[say=pc]Yeah.[/say]")

		saynn("She grabs the leash that's connected to your collar.")

		saynn("[say=eliza]But it's getting very late now. Let's get you back into the cellblock.[/say]")

		addButton("Continue", "See what happens next", "after_questions_end")
	if(state == "after_questions_end"):
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={leashedBy="eliza"}})
		saynn("The elevator brings you back to the familiar floor.. Eliza walks you past the checkpoint.. and begins to take off the leash.")

		saynn("[say=eliza]There we are.[/say]")

		saynn("[say=pc]Glad you didn't kill me.[/say]")

		saynn("[say=eliza]Pff, you're being overly dramatic.[/say]")

		saynn("She puts the chain away.")

		saynn("[say=eliza]If you're angry about that.. well.. sorry. Didn't mean to.[/say]")

		saynn("Weird to hear that word from her.")

		saynn("[say=pc]Sure. At least you would have helped me if I'd begun choking on my own saliva.[/say]")

		saynn("She nods.")

		saynn("[say=eliza]You would have done the same, I'm sure. See ya~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
func addWrongAnswer(theText, ttheAns):
	addButton(theText, "Say this", "pickWrongAns", [ttheAns])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_leashed"):
		processTime(3*60)

	if(_action == "sudden_risha"):
		processTime(3*60)

	if(_action == "near_staff_bar"):
		processTime(5*60)

	if(_action == "in_bar"):
		processTime(3*60)

	if(_action == "choose_wine"):
		processTime(5*60)
		isWine=true

	if(_action == "choose_juice"):
		processTime(5*60)
		isWine=false
		setState("choose_wine")
		return

	if(_action == "do_drink"):
		processTime(3*60)
		GM.pc.addPain(-100)
		GM.pc.addStamina(100)

	if(_action == "do_not_drink"):
		processTime(3*60)

	if(_action == "blindfolded"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		setState("challenge_start")
		return

	if(_action == "say1_elina"):
		theAns = "Elina?"
		setState("c_failed")
		return

	if(_action == "say1_elisa"):
		theAns = "Elisa?"
		setState("c_failed")
		return

	if(_action == "say1_elisha"):
		theAns = "Elisha?"
		setState("c_failed")
		return

	if(_action == "accept_fail"):
		GM.pc.getInventory().clearSlot(InventorySlot.Eyes)

	if(_action == "pickWrongAns"):
		setState("c_failed")
		theAns = _args[0]
		return

	if(_action == "won_remove_blindfold"):
		GM.pc.getInventory().clearSlot(InventorySlot.Eyes)

	if(_action == "after_questions_end"):
		addMessage("Sex scenes with Eliza are now unlocked for successfully answering all her questions!")

	setState(_action)

func saveData():
	var data = .saveData()

	data["isWine"] = isWine
	data["theAns"] = theAns

	return data

func loadData(data):
	.loadData(data)

	isWine = SAVE.loadVar(data, "isWine", false)
	theAns = SAVE.loadVar(data, "theAns", "")
