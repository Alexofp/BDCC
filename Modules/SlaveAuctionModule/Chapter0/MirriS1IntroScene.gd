extends SceneBase

var hasContraband = false
var slaveAmount = 0
var avoidedFlash = false
var didWin = false

func _init():
	sceneID = "MirriS1IntroScene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("You are walking down one of the many dimly-lit corridors of this station.. but something feels off..")

		saynn("Your mind is correct this time. As soon as you realize this, a guard steps into view, blocking the path. Human features are combined with prominent feline ones.. she is exactly what you'd call.. a catgirl.")

		saynn("[say=mirri]Well, well, what do we have here? Another rule-breaking asshole?[/say]")

		saynn("Sharp blue feline eyes are piercing through you.. a gaze of a predator.")

		saynn("[say=pc]Excuse you? I didn't do anything.[/say]")

		saynn("You quickly notice that her guard armor.. is stripped to its bare minimum.. to the point of you seeing her blue striped panties. A red feline tail is swishing behind her fit back.. one that is giving you a strange feeling.")

		saynn("[say=mirri]You are all the same, don't lie to me. Hands on the wall, fucker, now.[/say]")

		saynn("Wow, she isn't messing around, huh?")

		saynn("[say=pc]Why?[/say]")

		saynn("[say=mirri]Because you look suspicious, that's why. Do you need more reasons, stupid? I got a full belt of them right here. Which toy should I shove up your ass first?[/say]")

		saynn("Her clawed paw is already reaching for her stun baton. A paw, yes, her legs and arms are that of a feline, covered in fur and with pawpads.. but most of her body lacks that animal fur, except for some on her cheeks and neck.")

		saynn("[say=pc]I've never seen you before. But I also think that I did?[/say]")

		saynn("[say=mirri]Quit yapping, yapper. Another word and you will be kissing the floor. Or worse. Now hug the wall for me, make that wall feel loved and cherished.[/say]")

		saynn("Her tail, ears and ponytail are all of ginger color.. but the color of her fur is black.. a huge contrast to her human skin.")

		saynn("Looks like she wants to strip-search you..")

		addButton("Obey", "You're not carrying anything bad anyway", "do_obey")
		addButton("Attack", "You're not letting her touch you", "do_attack")
	if(state == "do_obey"):
		playAnimation(StageScene.SexStanding, "tease", {npc="pc", pc="mirri"})
		saynn("As soon as you turn your head towards the wall, the guard is fast to approach and grab your wrists, positioning them high above your head, your digits holding onto the cold concrete. She then kicks your ankles until you spread your legs wider for her.")

		saynn("[say=mirri]Are you always this slow? Fucking sloth.[/say]")

		saynn("[say=pc]Are you having a bad day?[/say]")

		saynn("You feel sharp claws digging your back while the second paw pats you down in various spots.")

		saynn("[say=mirri]You know what I'm having? None of your bullshit.[/say]")

		saynn("Her actions are rough.. but her search doesn't seem to be that thorough.. she is mostly just groping your {pc.thick} butt by this point..")

		saynn("[say=mirri]Alright, we're going to your cell now.[/say]")

		saynn("[say=pc]Wow, wow. Not even a date first?[/say]")

		saynn("You feel her yanking on your collar and then clipping a leash to it in one smooth trained motion.")

		saynn("[say=mirri]You're gonna have a great date with solitary officers after I'm done turning your little room upside-down.[/say]")

		saynn("Oh shit.. she might not find any contraband.. but she will surely see your.. possessions.. alive ones.")

		saynn("[say=pc]Don't you have better things to do?[/say]")

		saynn("[say=mirri]You're scared. Good. You should be. Pathetic scum like you should be trembling right now.[/say]")

		saynn("She reads your mind.. and your inmate number.. and then heads straight towards your cell.. her paw yanking on the leash, almost tripping you.")

		saynn("Your best hope is she decides to put you into solitary and not something worse..")

		addButton("Continue", "See what happens next", "in_cell")
	if(state == "do_attack"):
		playAnimation(StageScene.Duo, "defeat", {npc="mirri"})
		saynn("The feline's eyes spark brightly as soon as you lash out at her..")

		saynn("You only hear a short beep.. before your collar delivers a dose of pain straight to your muscles, bringing you down.")

		saynn("[say=mirri]Stupid. You think you can handle me? You ain't got the guts.[/say]")

		saynn("[say=pc]ARGH. F-fuck.[/say]")

		saynn("[say=mirri]This is just another day at the office for me.[/say]")

		saynn("She waits for your body to stop convulsing.. before grabbing you by the chin.")

		saynn("Her claws are digging into your skin, making you wince and look up, giving her the ability to click a chain to your collar with one smooth trained motion.")

		saynn("[say=mirri]Guess I'm thrashing your cell too now.[/say]")

		saynn("Oh shit.. she might not find any contraband.. but she will surely see your.. possessions.. alive ones.")

		saynn("[say=pc]Don't you have better things to do?[/say]")

		saynn("[say=mirri]You're scared. Good. You should be. Pathetic scum like you should be trembling right now.[/say]")

		saynn("She reads your mind.. and your inmate number.. and then heads straight towards your cell.. her paw yanking on the leash, pulling you up to your feet.")

		saynn("Your best hope is finding another good moment to strike..")

		addButton("Continue", "See what happens next", "in_cell")
	if(state == "in_cell"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		playAnimation(StageScene.Duo, "stand", {npc="mirri", bodyState={leashedBy="mirri"}})
		slaveAmount = GM.main.getPCSlaveAmount()
		saynn("She steps into your cell, staring at her forearm, under her wrist armor.. She was about to do something.. but then her ears picked up on someone's breathing.")

		saynn("[say=mirri]Huh?[/say]")

		saynn("She looks around and spots your "+str("multiple slaves" if slaveAmount > 1 else "slave")+", chained to the floor. The guard is greeted with "+str("gazes" if slaveAmount > 1 else "a gaze")+" full of hope.")

		saynn("[say=mirri]What the..[/say]")

		saynn("Her paw yanks on the chain, getting you closer to the half-naked catgirl. She slides her clawed digits under your collar, putting even more pressure on your air pipe.")

		saynn("[say=mirri]What is this?[/say]")

		saynn("[say=pc]Kh.. What does it look like to you?[/say]")

		saynn("Her fangs exposed, quiet growling resonates in your ear.")

		saynn("[say=mirri]You have a fucktoy in your closet? A slave? Huh, they look obedient. Yes, this is a slave.[/say]")

		saynn("The gig is up..")

		saynn("[say=pc]I can find a spare pet bed for you too.[/say]")

		saynn("She looks at you.. licks her fangs.. and hums.")

		saynn("[say=mirri]Huh. You chained them to the floor. You're into kinky shit, huh?[/say]")

		saynn("[say=pc]They tend to run away if you don't do that.[/say]")

		saynn("[say=mirri]That's why you break their ankles.[/say]")

		saynn("Ow. It just had to be this guard to find your slave"+str("s" if slaveAmount > 1 else "")+"..")

		saynn("[say=pc]Am I in trouble or what?[/say]")

		saynn("The catgirl puts on a mean smile, her eyes glowing brightly in the dark cell, her voice deafening you with its cunning undertones.")

		saynn("[say=mirri]Oh, fuck yes. You are so coming with me, little wanna-be slaver.[/say]")

		saynn("Whatever she has in mind for you, it can't be anything but bad things..")

		saynn("The guard looks around your cell, seemingly distracted by something.")

		saynn("Now might be the time to turn this around..")

		addButton("Just obey", "You don't want to get into an even bigger trouble", "just_obey")
		addButton("Attack", "Try to bring her down", "actually_attack")
	if(state == "just_obey"):
		saynn("..but you decide against it.")

		saynn("It's not worth it to fight the guards here.. might as well just get it over with.. Doesn't mean you're not gonna complain though.")

		saynn("[say=pc]Listen, the weak should fear the strong. Whatever you will do to me, it won't stop me. Get it over with. The faster this ends, the faster I can return to my stuff.[/say]")

		saynn("Catgirl's expression suddenly changes. She is giggling cutely.. her giggle resonating in your amygdala..")

		saynn("[say=mirri]You got one thing right~.[/say]")

		saynn("Suddenly..")

		saynn("You feel something.. metal.. poking your belly. Something like a pipe.. or.. a gun barrel.")

		saynn("Click..")

		saynn("[say=mirri]But on the other thing.. you are.. dead wrong.[/say]")

		saynn("Her whispering purr envelops your ears as she leans in even closer.")

		saynn("[say=mirri]That's a twelve point seven semiautomatic pressed against your stomach.. One punch of it will leave a bigger hole in your heart than I can.. Still wanna get it over with?[/say]")

		saynn("The fuck..")

		addButton("Continue", "See what happens next", "gun_showing_submit")
	if(state == "actually_attack"):
		playAnimation(StageScene.Duo, "shove", {npc="mirri", npcAction="hurt"})
		saynn("You use this moment to grab the leash that is still connected to your collar.. and wrap it around the guard's neck!")

		saynn("[say=mirri]ARrgh.[/say]")

		saynn("You position yourself behind the guard's back, trying to bring her down, your hands tugging on the chains to try to make her black out. She instinctively tries to free herself, her claws slipping under the chains and doing their best to relax the grip on her throat..")

		saynn("[say=pc]Submit. And you might be my next.[/say]")

		saynn("The catgirl is growling.. before a sudden flash of light makes the whole world white for a second.")

		saynn("Click..")

		saynn("[say=pc]ARGH.[/say]")

		saynn("Instant headache, it feels like your head is about to explode from whatever she did.. This gives her enough time to free herself and to shove you away.")

		saynn("[say=mirri]Gh.. hah. Pathetic.[/say]")

		saynn("As your sight returns to you.. you notice a little cylindrical device in her hand.. that looks like a standalone camera flash.. with a red handle. It must be recharging because she doesn't seem eager to use it again.")

		saynn("Your head is still spinning.. but the guard is also busy trying to catch up her breath.")

		saynn("[say=mirri]Alright.. I ain't gonna let some slave waste my limited time. Let's do this the hard way.[/say]")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "fight_lost"):
		playAnimation(StageScene.Duo, "defeat", {npc="mirri"})
		saynn("You fall to your knees, unable to continue fighting..")

		saynn("[say=mirri]All you did was waste my time, good job. Can't wait to.. send you off to the little room already.[/say]")

		saynn("She clearly wanted to say something else.. but decided to change her words at the last moment.")

		saynn("[say=pc]And I can't wait to break you.. all I need is to get my hands on your..[/say]")

		saynn("She looks at her wrist, under her forearm armor.. the catgirl seems to be checking time on her watch.")

		saynn("[say=mirri]I only have a few minutes left, shit.[/say]")

		saynn("What? You didn't know that solitaries have working hours now..")

		saynn("[say=pc]You won't last a few minutes with me, slut. I will..[/say]")

		saynn("Catgirl approaches you and kneels nearby.")

		saynn("Click..")

		saynn("What was that sound..")

		saynn("[say=mirri]You know what this is..[/say]")

		saynn("Her voice becomes very quiet.. the guard is almost purring into your ear.")

		saynn("[say=mirri]That's a twelve point seven semiautomatic pressed against your stomach.. One punch of it will leave a bigger hole in your heart than I can.. How many minutes will you laste then?[/say]")

		saynn("The fuck..")

		addButton("Continue", "See what happens next", "gun_showing_lost")
	if(state == "fight_won"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcAction="defeat"})
		saynn("The guard falls to her knees, her paw dropping the flash device that she used against you.")

		saynn("[say=mirri]Fuck.. I hate you so much already, can't wait to..[/say]")

		saynn("She ends her sentence early and just shuts her mouth, seeing that your "+str("slave is" if slaveAmount <= 1 else "slaves are")+" still watching.")

		saynn("[say=pc]And I can't wait to break you. Gonna make such a good slave.[/say]")

		saynn("[say=mirri]Oh yeah.. forgot about that..[/say]")

		saynn("She looks at her wrist, under her forearm armor.. the catgirl seems to be checking time on her watch. All the while you just slowly approach her, seeing if she will throw anything else stupid like that.")

		saynn("[say=pc]You will forget everything that you saw here, yes.[/say]")

		saynn("[say=mirri]No, stupid. I gotta be somewhere else now, I only have a few minutes left.[/say]")

		saynn("Her casual speech.. is confusing. Your hand darts out and grabs her throat, digits wrapping around her airpipe, threatening to cut off the oxygen supply.")

		saynn("[say=pc]You're not going anywhere.[/say]")

		saynn("The guard raises her chin high, her breathing getting deeper.. you can feel her heart pulsing, pushing the blood through her veins. The girl is still too exhausted after that loss, barely resisting.")

		saynn("[say=mirri]Hands off, fucker, now. Do you even know who I am?[/say]")

		saynn("With such an attitude.. it's only logical to do the exact opposite.")

		addButton("Choke", "Force her to submit", "start_choke")
	if(state == "start_choke"):
		playAnimation(StageScene.Choking, "idle", {pc="pc", npc="mirri"})
		saynn("[say=pc]It doesn't matter. What matters is that you are now my slave.[/say]")

		saynn("A silent gasp leaves the guard's throat as you squeeze your hands around it. Gradually, you pull the girl up onto her feet, looking her directly into the eyes.")

		saynn("[say=pc]Want some air? It's in short supply I'm afraid.[/say]")

		saynn("She doesn't react much.. but her mean feline eyes are reading you.. almost like they're seeing something curious in you. One of her paws digs its claws into your hand.. drawing blood.. but you just endure it.")

		saynn("[say=pc]So you will have to.. agree to some stuff.. understand?[/say]")

		saynn("[say=mirri]Kh..hah..[/say]")

		saynn("You can see the corners of her mouth raising.. she is smiling.. while you continue to increase the grip, choking the unwilling intruder of your cell.")

		saynn("[say=pc]Passing out is an option too, see if I care.[/say]")

		saynn("Suddenly..")

		saynn("You feel something.. metal.. poking your belly. Something like a pipe.. or.. a gun barrel.")

		saynn("Click..")

		saynn("[say=mirri]You know what this is..[/say]")

		saynn("Her voice is almost gone, just raspy whispers of it are left..")

		saynn("[say=mirri]That's a twelve point seven semiautomatic pressed against your stomach.. One punch of it will leave a bigger hole in your heart than I can.. Wanna see if I care?[/say]")

		saynn("The fuck..")

		addButton("Continue", "See what happens next", "gun_showing_won")
	if(state == "gun_showing"):
		setFlag("SlaveAuctionModule.knowsMirriName", true)
		removeCharacter("mirri")
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcAction=["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]})
		if (didWin):
			saynn("You take your eyes off of hers and look down.. indeed.. her second paw is holding you at gunpoint, keeping the weapon out of sight from your slaves. Your grip on her neck relaxes instinctively..")

		else:
			saynn("You take your eyes off of hers and look down.. indeed.. her second paw is holding you at gunpoint, keeping the weapon out of sight from your slaves. Your mean stare relaxes instinctively..")

		saynn("What the fuck is going on..")

		saynn("[say=mirri]Never gets old. Hah.[/say]")

		saynn("[say=pc]Where the fuck did you get a..[/say]")

		saynn("Her free paw plugs your mouth-hole shut.. all the while she is still being quiet.")

		saynn("[say=mirri]Na-na-nah.. My name is Mirri Blacktail. Rings a bell, I hope~?[/say]")

		saynn("That's.. not the name her badge says.. The girl sees your raw confusion.")

		saynn("[say=mirri]Oh.. hah. Wow. Really? Well.. your mind is about to be blown.. Maybe in more ways than one, depending on how you're gonna act. So don't act.[/say]")

		saynn("Obviously not the desirable outcome for you. The girl looks at her watch under the wrist armor.")

		saynn("[say=mirri]Shit, it's about to start. You wasted me so much time, you fucking sloth.[/say]")

		if (avoidedFlash):
			saynn("She whips out some kind of little device.. that looks like a portable camera flash.. and clicks it near your confused eyes while talking.")

		elif (didWin):
			saynn("She quickly picks up the flash device that she dropped.. and clicks it near your confused eyes while talking.")

		else:
			saynn("She whips out the little flash device again.. and clicks it near your confused eyes while talking.")

		saynn("[say=mirri]Double time then, time to bounce.[/say]")

		addButton("Continue", "See what happens next", "flash_and_tie")
	if(state == "flash_and_tie"):
		playAnimation(StageScene.Solo, "defeat")
		saynn(""+str("The flash hits you stronger than last time.. " if !avoidedFlash else "")+"The whole world became blindingly white.. The ringing in your head hits you off your feet like a truck. The high-pitched buzz is unbearable..")

		saynn("The guard.. the girl.. Mirri.. pulls out some ropes and quickly ties you up, ankles and wrists too.. She sure had a lot of shibari lessons, you can't move a muscle without the ropes painfully tugging on your throat or crotch.")

		saynn("[say=pc]Argh.. fuck..[/say]")

		saynn("A blindfold and a ballgag are next.. stealing your most important sense and ability to communicate.")

		saynn("[say=mirri]There we go.. now let's handle this.[/say]")

		saynn("You can hear her heading towards your "+str("slaves" if slaveAmount > 1 else "slave")+".. Million thoughts rush through your head.")

		saynn("[say=mirri]Oh.. so obedient, lowering your head and everything. Someone actually tried to train you.[/say]")

		if (slaveAmount > 1):
			saynn("She uses the flash device on them too, blinding and disorienting your slaves. Your slave empire is crumbling before you even finished building it..")

		else:
			saynn("She uses the flash device on them too, blinding and disorienting your only slave. Your slave empire is crumbling before you even finished building it..")

		saynn("[say=mirri]Alright, time to go.[/say]")

		saynn("Is she leaving?")

		saynn("You feel the girl grabbing you by the collar and pulling you somewhere.. she isn't planning to carry you across the whole prison, is she? She is not even that strong..")

		saynn("No, she is doing something else..")

		saynn("You can't see it.. you only hear it.. you hear.. energy?")

		saynn("A blast of energy, a quiet but audible pop.. followed by a mechanical hum that changes pitch, starting off high but getting lower and lower..")

		saynn("You can't see shit through the blindfold.. almost.. you see a faint blue glow that somehow manages to overpower the thick fabric.. but that's it.")

		saynn("The girl keeps pulling you somewhere.. until that annoying noise goes away.")

		addButton("Continue", "See what happens next", "pc_tpd")
	if(state == "pc_tpd"):
		aimCameraAndSetLocName("market_market")
		playAnimation(StageScene.Hogtied, "idle")
		addCharacter("slave_guard")
		saynn("Mirri drags you off somewhere and soon drops you..")

		saynn("Your body still feels the cold embrace of the metal floor.. but your head lands on something much softer and warmer.. is that someone's butt?")

		saynn("[say=mirri]One minute, slaves.. Where are the goddamn cuffs, fuck, I'm useless..[/say]")

		saynn("What, slaves? You hear the girl leaving.. And soon, that pillow under your head wakes up.")

		saynn("[sayFemale]H-hey.. psst.. she got you too? Fuck.. where the fuck are we..[/sayFemale]")

		saynn("She is wiggling her rear desperately.. clearly tied up too. You try to say something back but the gag makes your speech come out indistinguishable.")

		saynn("[sayFemale]That bitch came out of nowhere.. used some stupid thingie to blind me.. she fucking took my armor and left me here.. who knows where.. I think she might kill us if we don't get out..[/sayFemale]")

		saynn("Wow.. things are getting worse by the minute. You hear a faint.. speech.. coming from somewhere far away.. lots of footsteps. Action is happening all around you..")

		saynn("[sayFemale]I got the blindfold and the gag off.. but I'm still tied up. You have to help me, I can't reach the knots.. and your fingers are free. And faster, please..[/sayFemale]")

		saynn("She wiggles her ass more, brushing her curves against you while trying to bring her knots closer to your tied up hands..")

		saynn("[sayFemale]I know I'm a guard and you're just an inmate. But I won't leave you here, I promise, please. Just do it, you have to.[/sayFemale]")

		saynn("You find that really hard to believe.. But what choice do you have?")

		addButton("Help her", "Try to save that guard", "try_save")
	if(state == "try_save"):
		saynn("You fumble awkwardly as your fingers work at the ropes holding the tied up girl. Her soft girly curves keep brushing against you with each desperate wiggle, her breathing growing more frantic by the second.. you feel a faint bit of warmth spreading through her thighs..")

		saynn("She shifts again, pressing herself against you and making the ropes dig into her sensitive parts. The more you work on her knots, the more she is squirming, her breath hitching.")

		saynn("[sayFemale]S-sorry.. hurry.. please..[/sayFemale]")

		saynn("You hear voices again.. more than one.. and they're coming from another room.")

		saynn("Eventually, you manage to loosen the first knot, feeling the tension of the rope die down. The girl is feeling the harness giving way and so she wiggles even more. You swear you hear a faint, embarrassed whimper escape her lips as your digits accidentally find her aroused little flower, strangled by the tight damp ropes..")

		saynn("At last, with one final tug, the ropes loosen enough for her to pull free. She wastes no time and starts working on your restraints, quickly pulling off the blindfold and taking out the ballgag before proceeding to tug at the ropes.. The room is too dimly lit to see her face..")

		saynn("Sudden footsteps scare both of you.. getting louder and louder.. coupled with the strange voices coming from all around, this makes the girl snap..")

		saynn("[sayFemale]S-sorry.. I c-can't..[/sayFemale]")

		saynn("[say=pc]Wait, don't leave me here.[/say]")

		saynn("[sayFemale]I c-can't..[/sayFemale]")

		saynn("And so she betrays you, wasting no more time as she scrambles to her feet and dashes towards the first exit that she sees..")

		saynn("As soon as her frame gets obscured by the dark walls.. BOOM. A distant gunshot echoes in your head like it was you pulling the trigger..")

		saynn("Oh fuck..")

		addButton("Continue", "See what happens next", "girl_captured_again")
	if(state == "girl_captured_again"):
		playAnimation(StageScene.SexStart, "start", {pc="mirri", npc="slave_guard"})
		saynn("She didn't make it far.")

		saynn("A sharp painful cry echoes through the space, and suddenly, Mirri is back, pulling the naked guard by the hair back into the room.")

		saynn("[say=mirri]NEXT TIME I'LL ADD A NEW HOLE NEXT TO YOUR ASSHOLE.[/say]")

		saynn("[sayFemale]No, please![/sayFemale]")

		saynn("The catgirl puts the smoking gun away.")

		saynn("[say=mirri]I'm getting tired of your bullshit, whore. You're lucky I can still extract some value out of you.[/say]")

		saynn("The real guard is shaking, her leg bleeding in the spot where the bullet went right through it, near the ankle.")

		saynn("[sayFemale]Don't kill me, please.. please..[/sayFemale]")

		saynn("Mirri quickly injects something into the skin near the gunshot wound.. stopping the bleeding.")

		saynn("[say=mirri]I ain't gonna kill you. But right now you're making me wish I did.[/say]")

		saynn("Mirri walks past and notices that your knots are still tied up tightly.")

		saynn("[say=mirri]Hah. Typical AlphaCorp, so cute.[/say]")

		saynn("[say=pc]What are you gonna do with us?[/say]")

		saynn("[say=mirri]Shut up and watch.[/say]")

		saynn("Fair enough.. Mirri brings the poor guard into the middle of the room and then quickly secures a pair of metal cuffs on her wrists, cold metal snapping tight around her fur. Mirri is clearly in a hurry..")

		saynn("[sayFemale]Let me go, stop, please.. where are we..[/sayFemale]")

		saynn("You look around.. it's dark.. but you can see the fabric sheen coming off of one of the walls. Something ain't right here..")

		saynn("[say=mirri]Quit yapping, I'm late to the show already.[/say]")

		saynn("Mirri reaches high for one of the long chains that is attached to the high ceiling.. before wrapping it around and through the cuffs. Then, with a swift yank on the other end of that chain, she forces the girl into a standing position, hands high above her head..")

		saynn("After that, the mean catgirl takes a spot on a little raised platform nearby.. and audibly sighs, her chin lowered as she prepares herself for something.")

		saynn("[say=mirri]Alright.. Time to shine. Let's go![/say]")

		addButton("Continue", "See what happens next", "market_begins")
	if(state == "market_begins"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="mirri", pc="slave_guard"})
		saynn("Mirri spreads her arms wide as the black curtains open wide and a powerful projector illuminates her with its narrow cone of light.")

		saynn("[say=mirri]My name is Mirri and I welcome all of you! WELCOME TO THE BLACKTAIL MARKET.[/say]")

		saynn("Blacktail Market? You quickly realize.. this isn't a room.. this is a stage.. but this is not a play.. this is something else..")

		saynn("[say=mirri]Today, I got something quite special for you, a real treat![/say]")

		saynn("[sayFemale]Wha.. ah![/sayFemale]")

		saynn("Mirri gestures her paws to her left.. and a second, much bigger, projector illuminates the poor cuffed girl who gasps and squints from the sudden overpowering light hitting her eyes. The projector outlines her features perfectly, highlighting her modest chest and a clump of damp fur between her legs.")

		saynn("There is no denying it anymore. This isn't even a market.. This is.. a slave auction..")

		saynn("[say=mirri]An AlphaCorp work slave! Trust me, you can not find anything like her anywhere in the entire galaxy![/say]")

		saynn("A sudden voice interrupts her.")

		saynn("[sayOther]I'm pretty sure there are plenty of AlphaCorp slaves on the market, what makes this one special?[/sayOther]")

		saynn("It sounds low and growly, it clearly uses some kind of voice changer. You try to look into the darkness.. but you can only see the dark outlines of their figures.")

		saynn("Mirri gets caught off-guard by the question, stumbling on her words for a bit..")

		saynn("[sayFemale]H-hey.. I'm not a slave.. I'm a guard! You can't do this to me![/sayFemale]")

		saynn("[say=mirri]This one comes from a very secret far-away place that me, yours truly, got a unique access to. A secret prison for people that AlphaCorp deemed too dangerous for itself. These are the exact people who they don't want you to have. And now, you can have them as your slaves![/say]")

		saynn("The naked guard struggles against their chains, desperately trying to free herself.")

		saynn("[say=mirri]Her chest is gorgeously small, I know some of you are into small breasts here. She can always be made into a lactating big-chested cow-slut with some drugs. Zero scars, zero births. She will make a great addition to the collection of only the most high-ranking slavers.. for you that is.[/say]")

		saynn("[sayFemale]What the fuck is happening.. stop it, you can't just sell me like this..[/sayFemale]")

		saynn("The.. buyers.. seem to be talking with each other.")

		saynn("[sayOther]Are you trying to sell an unbroken slave?[/sayOther]")

		saynn("Mirri clears her throat and shoots daggers through her eyes at the poor naked girl.. who is crying by this point.")

		saynn("[say=mirri]She.. is a special treat, like I said. I left the pleasure of breaking her to you! Look at her, this bitch got wet from being tied up for only a few hours, it will be incredibly fun to train her![/say]")

		saynn("[sayOther]That's.. a fair point.[/sayOther]")

		saynn("Mirri phews silently as you realize.. it will be your turn soon.. no matter how much you tug on the ropes, these ones you just can't untie..")

		saynn("[say=mirri]So.. The starting bid is.. 100 credits. That's basically a steal for such a good slave![/say]")

		saynn("[sayOther]I will match.[/sayOther]")

		saynn("[sayOther]110.[/sayOther]")

		saynn("[sayFemale]No..[/sayFemale]")

		saynn("[sayOther]120![/sayOther]")

		saynn("The naked guard is desperate, her pleading cries can be barely heard over the low murmurs of the audience. Her wet cheeks glisten in the harsh projector light as she struggles against the cuffs.")

		saynn("[say=mirri]120 credits. Going once.. going twice..[/say]")

		saynn("The more she fights, the more her strength fades. Finally, she hangs there, exhausted, trembling..")

		saynn("[say=mirri]The product is perfectly healthy, might I add. Exactly zero wounds or diseases, a healthy girl, pretty much a virgin. At least AlphaCorp bitches are not spreading STDs, I will give them that. They be spreading legs like crazy though! Just gotta ask them nicely enough, haha.[/say]")

		saynn("[sayOther]130. I want that bitch.[/sayOther]")

		saynn("[sayOther]150. She is mine. An AlphaCorp whore will make for a perfect breeding sow.[/sayOther]")

		saynn("[say=mirri]Nice, we got a little fight happening! It truly is a great product on display, are we gonna get some more bids?[/say]")

		saynn("Mirri smirks, her feline eyes shining with satisfaction, her tail flicking with anticipation. No one else seems to raise the bid.. Does a person really only cost 150 credits..")

		saynn("[say=mirri]150 credits. Going once.. going twice.[/say]")

		saynn("She pauses, her gaze shifting between the trembling ex-guard and the bidders.")

		saynn("[say=mirri]SOLD![/say]")

		saynn("So fast and efficient, they sure got the process nailed down..")

		saynn("Mirri seems to lack a little hammer.. so she just slaps her curvy ass, making it jiggle.")

		addButton("Continue", "See what happens next", "girl_sold")
	if(state == "girl_sold"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="slave_guard", npcBodyState={leashedBy="mirri"}})
		saynn("A soft whimper escapes the girl's lips as the finality of it sinks in. Mirri doesn't waste any time. With a quick flick of her wrist, she pulls out a sleek, black collar and leash combo, strides over to the helpless girl and, without hesitation, fastens the restraint around her neck. The girl flinches as the cold metal clicks into place, putting new weight on her body and soul.")

		saynn("[say=mirri]Consider it a complimentary gift.[/say]")

		saynn("She undoes the chains that were holding the girl standing.. and then gives the leash a firm tug, pulling the slave towards her new owner.. Mirri gives the chain one final yank before releasing the girl to a pair of faceless attendants, who take it from there and guide the girl off the stage.")

		saynn("The ex-guard tries one last time to glance back at you, her tear-filled eyes full of fear and desperation.. until she disappears into the shadows. On second thought, she shouldn't have betrayed you, maybe you'd both had better chances then.")

		addButton("Continue", "And so this was the last time you will ever see her..", "wormy")
	if(state == "wormy"):
		playAnimation(StageScene.Hogtied, "idle")
		removeCharacter("slave_guard")
		saynn("The crowd remains quiet for a moment, tension still thick in the air.")

		saynn("[say=mirri]Alright, next up, our staff is about to bring us..[/say]")

		saynn("An uncanny-sounding voice stops her.")

		saynn("[sayOther]What about that one?[/sayOther]")

		saynn("The projector turns towards you and everyone's gaze follows. You are still tied up tightly in your bounds, unable to move. You try to stay emotionless but you do feel your heart pound harder. It's not each day that you're getting sold at an auction.")

		saynn("Mirri looks at you, her eyes narrowing. For a moment, she seems to consider it, tapping her chin with a wicked smile creeping across her lips.")

		saynn("[say=mirri]That one?[/say]")

		saynn("Her tone is playful and yet dismissive. She strides over to you, her armored boots making scary footsteps. She crouches down in front of you and grabs your chin roughly, forcing you to look into her predatory eyes.")

		saynn("[say=mirri]Scared, fucker?[/say]")

		saynn("[say=pc]Do your worst, bitch.[/say]")

		saynn("She hums.")

		saynn("[say=mirri]Tempting..[/say]")

		saynn("She stands up again and turns towards the audience.")

		saynn("[say=mirri]But no. This one is.. extra-extra special. I've got plans for the wormy.[/say]")

		saynn("Her tail is flicking with amusement.")

		saynn("[say=mirri]Maybe some other time, who knows? If things don't work out, perhaps they will end up on the auction block too.[/say]")

		saynn("A low murmur of interest sweeps through the crowd. But it's clear that she doesn't intend on selling you.. for some reason.")

		saynn("[say=mirri]Let's continue the auction! Next up, we got..[/say]")

		saynn("And so more slaves get sold while you are allowed to watch from your.. position.")

		saynn("Some came from random planets.. Some were war prisoners.. and some are slaves that are being sold away by their owners.. but none of them ended up costing as much as the first one. Looks like BDCC slaves are in high demand here..")

		saynn("[say=mirri]And that concludes tonight's auction! It was a pleasure doing business with you all. Although, for Blacktail, slavery was always more of an.. art form.[/say]")

		saynn("The curtains begin to close, the oppressive darkness folding back over the room as the projects shut off. The footsteps of the bidders retreat into the distance, leaving only a quiet hum behind.")

		saynn("She glances at you, about to do something. But then.. a figure begins to approach you two, coming from the audience..")

		saynn("[say=mirri]Behave, wormy. This is only the beginning for you..[/say]")

		saynn("Not like you have much of a choice..")

		addButton("Continue", "See what happens next", "mirri_talks_with_luxe")
	if(state == "mirri_talks_with_luxe"):
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe"})
		saynn("You were wondering why the shadow-y figure is so hard to pick out from the background.. but that's because their fur is of an almost perfect black color. Only the glow that their amber eyes and gold fur tips give off is even allowing you to see where they are. You squint harder and note that the fuzzy outline resembles that of a wolf.")

		saynn("Mirri tilts her head a bit. The figure stops a few steps away and silently watches.")

		saynn("Not a word is wasted, the figure ignores the fidgeting, his dead stare cutting through the animated shield of the catgirl, causing her to eventually give up.")

		saynn("[say=mirri]Gonna say anything?[/say]")

		saynn("The figure is unmoved by the question, his stare finally releasing the captive, instead analyzing her looks.")

		saynn("[say=luxe]This is how you represent the family?[/say]")

		saynn("The dark undertones in his voice give you chills.")

		saynn("Mirri shrugs and looks at her outfit. She is still wearing the guard's armor.. but with a lot of parts missing. Even the chest piece is not there, replaced by a dark leather corset. And, obviously, her butt is exposed..")

		saynn("[say=mirri]I didn't have time to change, thanks to a certain sloth. And this bitch was too flat so some pieces didn't fit on me.[/say]")

		saynn("The figure directs his attention to you. The deafening silence makes you look away.. but his aura makes that impossible.")

		saynn("[say=luxe]So you made the choice.[/say]")

		saynn("[say=mirri]Yeah? I'm gonna make the most of it, you will see.[/say]")

		saynn("He lets his stare rest on Mirri again, the weight of it bringing her down in everyone's eyes. Even you feel the tension in your muscles, the towering dark figure creating an invisible hand around your throat with just its existence, making it hard to let out even a squeak.")

		saynn("[say=luxe]Mh.[/say]")

		saynn("And, just like that, he steps back into the darkness. The tension gets released with a combined sigh.")

		saynn("[say=mirri]..Hmpf. I like this outfit, screw you..[/say]")

		addButton("Continue", "See what happens next", "mirri_gives_pc_offer")
	if(state == "mirri_gives_pc_offer"):
		removeCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Mirri crouches near and begins to untie you.")

		saynn("[say=mirri]I still got a gun. Try me if you're feeling truly stupid, little slave.[/say]")

		saynn("Somehow she only lightly tugs on the knots.. before they relax enough for you to free your limbs.")

		saynn("The amount of whys and hows in your head.. is making it hard to stand up.. but you manage.")

		saynn("[say=pc]What are you gonna do now? You didn't sell me, clearly for a reason.[/say]")

		saynn("[say=mirri]Your brain cells are working overtime, huh? I will let you ask a single other question before answering that one.[/say]")

		addButton("Who", "Ask her who she is", "ask_who")
		addButton("Where", "Ask her where you are currently", "ask_where")
		addButton("What", "Ask her what is going on", "ask_what")
	if(state == "ask_what"):
		saynn("[say=pc]What the fuck is going on?[/say]")

		saynn("[say=mirri]You weren't paying attention at all, were you? Don't tell me that you were staring at my butt the whole time..[/say]")

		saynn("Mirri dashes up the little raised platform from which she was running the auction.")

		saynn("[say=mirri]You got to experience the show. My show! And I didn't even sell you.[/say]")

		saynn("She jumps off and approaches you again.")

		saynn("[say=mirri]Where is my thanks?[/say]")

		saynn("[say=pc]Why the fuck would I..[/say]")

		saynn("Mirri pulls out her gun.")

		saynn("[say=pc]Hey.[/say]")

		saynn("[say=mirri]Where is my THANKS?[/say]")

		saynn("[say=pc]Calm down, crazy. Thanks for not selling me.[/say]")

		saynn("She smiles.. and points the gun at you anyway.")

		saynn("[say=mirri]Hehe. Does the name Syndicate ring a bell for you?[/say]")

		saynn("Syndicate.. everything makes a lot of sense now. Mirri stares at you with great interest while your brain is desperately trying to process everything.")

		saynn("[say=pc]I don't think the prison had a slave auction floor.. Did you teleport me here somehow?[/say]")

		saynn("Mirri shrugs.")

		saynn("[say=mirri]I dunno.. Maybe I did. Did I?[/say]")

		saynn("As you frown.. you hear her cocking her gun.")

		saynn("[say=mirri]Now you listen.[/say]")

		addButton("Continue", "See what happens next", "after_ask")
	if(state == "ask_where"):
		saynn("[say=pc]Where the fuck are we?[/say]")

		saynn("[say=mirri]Are you stupid? Or you weren't paying attention to the show?[/say]")

		saynn("Mirri dashes up the little raised platform from which she was running the auction. She spreads her arms wide.")

		saynn("[say=mirri]This is Blacktail Market! The best place in the whole galaxy if you're looking for a rare high-quality squirming-under-your-feet product.[/say]")

		saynn("Blacktail market.. You don't remember seeing a button for that floor in the elevator. Mirri catches your confused stare and dashes up to you again.")

		saynn("[say=mirri]Oh, you still think that you're in your little cage of a prison? Hah.[/say]")

		saynn("[say=pc]But I was in my cell.[/say]")

		saynn("[say=mirri]And now you're not. You know where you are?[/say]")

		saynn("She stares at you deeply, her feline stare glows with curiosity, her tail stands erected.")

		saynn("[say=pc]Enlighten me.[/say]")

		saynn("[say=mirri]Does a name.. Syndicate.. ring a bell?[/say]")

		saynn("What. Syndicate.. how can it be.")

		saynn("[say=mirri]Oh, yes-yes, do that more, please~. I love your face right now.[/say]")

		saynn("[say=pc]Syndicate knows the location of BDCC?[/say]")

		saynn("Mirri shrugs and puts on a cunning smile.")

		saynn("[say=mirri]I dunno. But you seem pretty good at making connections, what do you think?[/say]")

		saynn("[say=pc]I don't understand..[/say]")

		saynn("[say=mirri]This stupid silly puppy is so easily confused? I love it.[/say]")

		saynn("This probably means you're not on BDCC.. or anywhere close to it.. are you.. free?")

		saynn("Click..")

		saynn("As you stare down the barrel of Mirri's gun.. you realize that your status didn't really change.. just some of the details..")

		saynn("[say=mirri]Now you listen.[/say]")

		addButton("Continue", "See what happens next", "after_ask")
	if(state == "ask_who"):
		saynn("[say=pc]Who the fuck are you?[/say]")

		saynn("[say=mirri]Are you stupid? You forgot already?[/say]")

		saynn("Mirri dashes up the little raised platform from which she was running the auction.")

		saynn("[say=mirri]My name is Mirri Blacktail. And I'm the best slaver in the whole galaxy, your puny weak AlphaCorp bounty hunters are nothing compared to me![/say]")

		saynn("Blacktail.. Black tail market.. Blacktail market.. They sure know how to market themselves.")

		saynn("[say=pc]You hate AlphaCorp, I get it already. Did they underpay you?[/say]")

		saynn("Mirri tilts her head and squints, silently wondering if you're being serious. She then jumps off the platform and walks up to you.")

		saynn("[say=mirri]Riiight, you didn't even realize it yet.[/say]")

		saynn("[say=pc]I understand enough.[/say]")

		saynn("[say=mirri]Nah~, you're dumb.[/say]")

		saynn("Pretty rude for a lady. But as soon as you frown, you hear her cocking her gun.")

		saynn("[say=mirri]Syndicate, does that name ring a bell for you?[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("[say=mirri]You are in Syndicate territory, far-far away from your.. home.. kennel is a better word I guess~.[/say]")

		saynn("Syndicate.. But you were in your cell not that long ago.. What is she talking about..")

		saynn("[say=mirri]This stupid silly puppy is so easily confused? I just love the look on your face.[/say]")

		saynn("This means you're not on BDCC.. or anywhere close to it.. are you.. free?")

		saynn("As you stare down the barrel of Mirri's gun.. you realize that your status didn't really change.. just some of the details..")

		saynn("[say=mirri]Now you listen.[/say]")

		addButton("Continue", "See what happens next", "after_ask")
	if(state == "after_ask"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri", npcAction=["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]})
		saynn("[say=mirri]You.[/say]")

		saynn("She aims the gun at your head.")

		saynn("[say=mirri]I'm about to give you an offer you won't refuse.[/say]")

		saynn("Can't is a better word here.")

		saynn("[say=mirri]I saw what you did with that slave. I think there is potential in you, something that I can abuse.[/say]")

		saynn("[say=pc]You wish you were in their place? I usually do it for free.. but in your case.. you better offer me a fortune.[/say]")

		saynn("Mirri tilts her head and licks her fangs.")

		saynn("[say=mirri]Your throat looks tasty, you know..[/say]")

		saynn("[say=pc]If you want me, just kneel and start..[/say]")

		saynn("[say=mirri]Shhh. TSHHH![/say]")

		saynn("She presses the gun against your head, her clawed finger displaying a case of very poor trigger discipline. You have to admit.. she can shoot you right now.. and nothing would have stopped her..")

		saynn("[say=mirri]What I want is.. slaves. AlphaCorp slaves. ALL OF THEM.[/say]")

		saynn("Mirri drills you with her mean blue eyes.")

		saynn("[say=mirri]And you.. you will bring me those slaves.[/say]")

		saynn("So this is what it's about, huh. She needs slaves so she can sell them away at an auction..")

		saynn("[say=pc]What if I say no?[/say]")

		saynn("Mirri raises a brow.")

		saynn("[say=mirri]Next auction will happen quite soon.[/say]")

		saynn("[say=pc]Beats being a prisoner.[/say]")

		saynn("Your words make her laugh.. her paw with the gun is shaking as she struggles to stand still.. your heart is beating harder..")

		saynn("[say=mirri]That prison looks like heaven compared to what that bitch guard is about to go through.[/say]")

		saynn("Mirri smiles. Curiosity is killing you.. almost literally..")

		saynn("[say=pc]What are you saying?[/say]")

		saynn("[say=mirri]Oh, you want to know what's going to happen to your little guard friend?[/say]")

		saynn("You realize that you don't even know her name.. Mirri's fangs glint as she tilts her head again.")

		saynn("[say=mirri]Let's just say.. she is going to learn her place in ways that AlphaCorp training never prepared her for.[/say]")

		saynn("The catgirl traces a claw down your cheek, her cat eyes gleaming with a twisted excitement.")

		saynn("[say=mirri]Her new owner.. mm.. they paid a pretty price. A price that guarantees that they will take their time breaking her in. First, they will strip away every bit of that fake confidence, every ounce of defiance she slings to. Slowly. Painfully.[/say]")

		saynn("Her cold words send a chill down your spine.")

		saynn("[say=mirri]She will beg, of course. Oh, she will scream and cry.. like they all do at first. But by the end? She will be so far gone.. so broken.. that she won't even remember her own name.. just the name her master gives her.[/say]")

		saynn("Even if her voice makes it sound very intimidating.. the process seems familiar to you. Mirri smiles, seeing that you're not impressed.")

		saynn("[say=mirri]She won't be a guard anymore. No. She will be nothing but a toy. Passed around, used, traded.. whatever her owner wants. She won't resist. She can't resist. Not after her master's treatment.[/say]")

		saynn("She was just a guard.. she didn't deserve this fate. The gun reminds you that you are at Mirri's mercy, it's still firmly pressed against your skull.")

		saynn("[say=pc]You're sick, you know that?[/say]")

		saynn("Mirri chuckles.")

		saynn("[say=mirri]Sick as fuck. At least I do it for the credits.. unlike you. It's very profitable, you know, so much value. We agree on one thing.. We understand that weak are meant to be broken. It's the natural order. That little guard bitch? She is weak. Pretended to be tough.. but the second I stripped her bare, she became just another piece of merchandise.[/say]")

		saynn("She steps back and lowers the gun.")

		saynn("[say=mirri]You have potential. Bring me slaves, help me grow my market. And maybe.. just maybe, you won't end up like her.[/say]")

		saynn("So that's the offer, huh. Sell the whole prison to slavery, one poor naked guard at a time. Mirri leans closer and whispers into your ear..")

		saynn("[say=mirri]Believe me, you're a lot more fun when you're still able to fight back~.[/say]")

		saynn("[say=pc]You're gonna bring me back to BDCC? What if I just tell the captain that he has a Syndicate agent roaming around?[/say]")

		saynn("She sighs.")

		saynn("[say=mirri]What do you think will happen?[/say]")

		addButton("Continue", "See what happens next", "mirri_invisible")
	if(state == "mirri_invisible"):
		playAnimation(StageScene.Solo, "stand")
		saynn("Mirri presses something on her armor.. and begins to disappear. Her contours become fuzzy.. transparent.. until they're nothing but a very faint blur.")

		saynn("[say=mirri]You really think they will trust you? Tell me.. what proof do you have? Hah. I tell you what.. while you will struggle to prove it to them..[/say]")

		saynn("The source of her voice keeps shifting position. You don't see her.. but you feel.. something.. stepping around you.. a ghost.. such a familiar weird feeling..")

		saynn("[say=mirri]I will make sure to give you the kiss of death.. that you deserve.[/say]")

		saynn("Great. This psycho can turn invisible too.")

		saynn("[say=mirri]AlphaCorp stole a lot of Syndicate tech.. but you never managed to give your dirty paws on this one~.[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("You feel feline claws gently scratching your cheek.")

		saynn("[say=mirri]I'm glad that we have a deal. I didn't even have to turn you into my bitch.. just a small puppy.[/say]")

		saynn("Suddenly, a.. what you can only describe as a rift.. begins to open in front of you.")

		saynn("[say=pc]What the..[/say]")

		saynn("The whole stage gets illuminated by a bright blue light.. coming from this strange anomaly. The more you look at it.. the more it begins to look like a.. portal.")

		saynn("[say=mirri]Maybe one day you will grow into a big dog. Give me a call when you get a good slave to sell. Just know that I'm a very-very impatient girl. So you better impress me, {pc.name}~.[/say]")

		saynn("Huh? You realize that her voice is coming from behind your back.. before she pushes you into the rift.")

		addButton("Continue", "See what happens next", "back_to_bdcc")
	if(state == "back_to_bdcc"):
		removeCharacter("mirri")
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		saynn("You were about to scream.. but then you realize.. you're back in your cell.")

		saynn("She just.. teleported you.")

		saynn("Wow.")

		saynn("That was.. an experience. At least you weren't sold into slavery.. although, your collar tells a different story..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_obey"):
		processTime(3*60)

	if(_action == "do_attack"):
		processTime(3*60)
		GM.pc.addPain(50)

	if(_action == "in_cell"):
		processTime(3*60)

	if(_action == "gun_showing_submit"):
		processTime(3*60)
		didWin = false
		setState("gun_showing")
		return

	if(_action == "start_fight"):
		runScene("FightScene", ["mirri", "firstFight"], "mirriFight")
		return

	if(_action == "gun_showing_lost"):
		processTime(3*60)
		didWin = false
		avoidedFlash = true
		setState("gun_showing")
		return

	if(_action == "start_choke"):
		processTime(3*60)

	if(_action == "gun_showing_won"):
		processTime(3*60)
		didWin = true
		setState("gun_showing")
		return

	if(_action == "flash_and_tie"):
		processTime(3*60)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ropeharness"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ballgag"))

	if(_action == "pc_tpd"):
		processTime(3*60)

	if(_action == "try_save"):
		processTime(2*60)
		GM.pc.getInventory().clearSlot(InventorySlot.Mouth)
		GM.pc.getInventory().clearSlot(InventorySlot.Eyes)

	if(_action == "girl_captured_again"):
		processTime(3*60)

	if(_action == "market_begins"):
		processTime(3*60)

	if(_action == "girl_sold"):
		processTime(5*60)
		getCharacter("slave_guard").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("oldcollar"))

	if(_action == "wormy"):
		processTime(3*60)

	if(_action == "mirri_talks_with_luxe"):
		processTime(3*60)

	if(_action == "mirri_gives_pc_offer"):
		processTime(3*60)
		GM.pc.getInventory().clearSlot(InventorySlot.Torso)

	if(_action == "mirri_invisible"):
		processTime(3*60)
		addMessage("New task added")

	if(_action == "back_to_bdcc"):
		processTime(3*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "mirriFight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("fight_won")
			addExperienceToPlayer(50)
		else:
			setState("fight_lost")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["hasContraband"] = hasContraband
	data["slaveAmount"] = slaveAmount
	data["avoidedFlash"] = avoidedFlash
	data["didWin"] = didWin

	return data

func loadData(data):
	.loadData(data)

	hasContraband = SAVE.loadVar(data, "hasContraband", false)
	slaveAmount = SAVE.loadVar(data, "slaveAmount", 0)
	avoidedFlash = SAVE.loadVar(data, "avoidedFlash", false)
	didWin = SAVE.loadVar(data, "didWin", false)
