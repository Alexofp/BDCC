extends SceneBase

var choseSave = false

func _init():
	sceneID = "PSShaftMinerEnding2"

func _run():
	if(state == ""):
		addCharacter("psricky")
		saynn("You got the best drill credits can buy. And you are standing in front of the only obstacle that separates you from freedom.")

		saynn("The obvious solution is to just drill through it.. but there could be armed goons there.")

		saynn("Instead, you just knock on the reinforced door and wait.")

		saynn("Soon, enough, a voice behind it answers.")

		saynn("[say=psricky]What, got the target met already, did ya?[/say]")

		saynn("That's him. You see his eyes.. peeking through the little slit.")

		saynn("[say=pc]Perhaps.[/say]")

		saynn("He sees the tool.")

		saynn("[say=psricky]What are ya gonna do with that? Drop it, stupid, this shit is indestructible. Pure voidsteel.[/say]")

		saynn("Your hand clenches around the tool hard. Now is the time to test it.")

		addButton("Drill!", "Time to make that fucker regret it", "do_drill")
	if(state == "do_drill"):
		playAnimation(StageScene.Choking, "idle", {pc="pc", npc="psricky"})
		saynn("Before he can react, you drill through the reinforced barricade like it's made out of paper, voidsteel bending and crumbling with ease.")

		saynn("[say=psricky]What the![/say]")

		saynn("You dash through the hole that you have created and get your hands on Ricky while he is busy fumbling with his holster!")

		saynn("[say=pc]I think you might wanna claim the warranty.[/say]")

		saynn("One hand lands on his throat, squeezing it.. while the second one holds the idling drill pressed against his stomach. The guy is still drying to draw his revolver.")

		saynn("[say=pc]I suggest you drop it. Unless you want me to turn your internal organs into soup.[/say]")

		saynn("Your words make you hungry.. but they made him lose appetite instead.")

		saynn("Ricky raises his arms slightly, his oh-so-mean stare softening up.")

		saynn("[say=psricky]Hey.. uh.. relax, eh? What are you gonna do next, you're fucked![/say]")

		saynn("[say=pc]Quiet, fucker.[/say]")

		saynn("You pull him out of sight behind one of the sharp rocks, giving you plenty of time to deal with him.")

		saynn("[say=psricky]What? You're some kind of hero? I bought you, far and square. You're my property, my asset! Nothing stops me from disassembling you all and selling piece by piece. But I didn't! This is how you repay me, you.. stupid bitch?[/say]")

		saynn("You tap on the trigger.. causing the drill to do half a spin, catching Ricky's jacket and ripping it to shreds. His holster gets caught up and snapped too, his scratched revolver hitting the ground.")

		saynn("[say=psricky]HEY-HEY, listen! I need the fucking credits, alright? I got a shit ton of loans I gotta pay! I got kids, man! Wife and kids! I gotta pay.. for their future.. college and shit, a place to live.[/say]")

		saynn("You tilt your head a bit.")

		saynn("[say=pc]And that's how a family man earns for a living?[/say]")

		saynn("[say=psricky]I never said I'm a good guy. I know I'm the fucking lost cause. But that's life, man, I live the way I was taught. We gotta do what we gotta do to survive, no? Fuck.. I might have pissed my pants a little.[/say]")

		saynn("He is shivering, you can feel it.. his legs are shaking.")

		saynn("[say=pc]Tell me one reason why I shouldn't murder you right here.[/say]")

		saynn("Ricky is panting, his eyes scanning the surroundings in quick bursts of energy.")

		saynn("[say=psricky]My people would kill you on the spot! Shoot you right between your stupid eyeballs, you hear?[/say]")

		saynn("[say=pc]Your ship is right there, I can just take it.[/say]")

		saynn("He spits to the side.")

		saynn("[say=psricky]You're leaving other slaves here? Gosh, I was giving you too much credit. There is not a single alive thing here, you'd be leaving them to die, for sure. You know what? That'd be worse than what I did. I didn't kill a single thing, no matter how stupid it is.[/say]")

		saynn("To be fair, there are fates worse than death.")

		saynn("So this is it. You can either kill him and escape with your life..")

		saynn("Or try to do a dumb thing and save the other slaves too.")

		saynn("[say=psricky]Really? You're still thinking? Just drop the drill, drop the whole act, you ain't got the balls anyway. I might even spare you. You're stupid, you see? Even if you escape.. you got enslaved once, you will just get enslaved again. Again and again. You can't help it, you just need someone to always yank on your leash, don't you?[/say]")

		addButton("Save others", "Try to use Ricky to convince the goons to let others go with you. Ricky will have to stay alive for that", "save_others")
		addButton("Kill him", "End his life and escape with yours. Alone", "kill_ricky")
	if(state == "kill_ricky"):
		removeCharacter("psricky")
		playAnimation(StageScene.Rekt, "end", {pc="pc", npc="psricky"})
		saynn("You let go of his throat and take a step back.")

		saynn("[say=psricky]That's right, you made the right choice. No need to do stupid shit, yeah? We can always talk it out.[/say]")

		saynn("Your eyes just track him, keeping a strict eye contact.")

		saynn("As soon as his stare shifted towards the dropped revolver.. you knew..")

		saynn("Without a drop of hesitation, you dash forward and pierce the fucker's skull with your drill, it's diamond tip destroying his jaw and turning his brain into form-less mush with ease.")

		saynn("[say=pc]Shut your mouth already, I'm sick of it.[/say]")

		saynn("When that's done, you let his lifeless body slump onto the cold rock. No one will ever find him here, especially not on this dead planet. Good.")

		saynn("You search his pants and the remains of his jacket, finding some kind of digital keys. You drop the drill and grab his revolver, the thing is useless against rifles anyway.")

		saynn("As you peak over the rock, you see the armed goons patrolling the space around the spaceship. Some of them are busy loading crates.")

		addButton("Sneak inside", "Try to sneak onto the ship", "sneak_in_kill")
	if(state == "sneak_in_kill"):
		playAnimation(StageScene.Solo, ["firepistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"])
		aimCameraAndSetLocName("psmine_exit")
		saynn("You wait for a good moment when the goons aren't looking your way and sneak onto the ship's loading ramp, using the crates as cover.")

		saynn("Not everything goes as smoothly as you'd hope though. One of the armed dudes spots you and wastes no time, alerting the others. That was his last mistake.")

		saynn("Your finger pulls the trigger on its own. A loud bang deafens your ears. A lead bullet destroys his.")

		saynn("The situation gets heated quickly. Your fist punches the button that starts closing the ramp, making the painfully slow pistons screech below you while the ship's armor interior and exterior start taking damage from a frantic barrage of bullets.")

		saynn("As fast as you can, you find the pilot chair, press the digital keys against the ship's controls and yank on the lever that says 'engines'.")

		saynn("As the engines spool up, the low vibrations echo through your core. It seems the cabin's glass is strong enough to withstand the many impacts.. but it sure gets damaged in the process.")

		saynn("There is not enough time to consult the ship's manual, not even the quick start section.. so you just grab the control wheel and push it.. forward. The ship obeys.. and instantly eats it.. digging its nose into the rocky ground, picking up dust all around.")

		saynn("The dumb trigger-happy fucks still don't understand that if they don't stop shooting, no one will be able to use this thing anyway. The system information displays are beeping angrily at you while you finally pull up, causing the ship to leave the god-forsaken land and start taking off, heading up and away.")

		saynn("Something is sparking somewhere.. but the ship seems to be holding up overall. What a great piece of cheap mass-produced manufactured technology.")

		saynn("You fly up into the red sky, watching it transition into a pure void of space. The goons turn into dots in your rear mirror.. but their rifles are still desperately biting away for a bit. Nothing can stop you from getting that well-deserved freedom.")

		addButton("Continue", "See what happens next", "do_relax_escape1")
	if(state == "do_relax_escape1"):
		playAnimation(StageScene.Solo, "sit")
		saynn("As the ringing in your ears stops.. all that's left.. is a pleasing hum of engines, rumbling the chair that you're sitting in.")

		saynn("The cockpit's windshield has all sorts of cracks in it.. but it doesn't matter, you see enough to keep going. Your hands stop shaking, allowing you to keep this baby directed on course.. somewhere.")

		saynn("The whole world.. the whole universe.. is now at your disposal. Feels like you can go anywhere.. do anything..")

		saynn("That is.. until the power suddenly cuts out, leaving you in complete darkness. Good times never last, huh.")

		saynn("The ship's controls become unresponsive.. the displays stop showing those interesting stats about how fucked your ship really was by that point. The engines spool down. But at least you're still moving, drifting through space.. nothing can stop you now.")

		saynn("So.. where was that manual. Surely you can repair this piece of junk with some scraps.. or maybe switch to some kind of emergency power source.. or at least send a distress signal. You realize that you have all that ore in your trunk. Shit's gotta be valuable to someone.")

		addButton("Continue", "See what happens next", "escape1_fucked")
	if(state == "escape1_fucked"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You get off that comfy seat and start messing around, pressing buttons and pulling levers. It's hard to see much when all you have is the starlight to go off of..")

		saynn("But it looks like you did something! You hear beeping again. Beep.")

		saynn("A blinking red light illuminates the cockpit every few seconds. Those system information displays must be very angry with you for messing with their shit. Beep. Beep. You are so yanking out that speaker when you see it.")

		saynn("The problem is.. when you return back to them.. they're still dead, not giving you any image. While the beeping still happens. Beep. Beep-Beep.")

		saynn("It's only then that you realize.. it's your collar.")

		addButton("Continue", "See how fucked you are", "escape1_actually_fucked")
	if(state == "escape1_actually_fucked"):
		playAnimation(StageScene.Solo, "defeat")
		saynn("Without warning, a jolt of electricity surges through your body.. sharp and searing, like molten knives sliding through your veins. You convulse mid-breath, a strangled scream ripping from your throat.")

		saynn("The world tilts, your vision fracturing into shards of red and black.. and then.. everything goes dark..")

		addButton("Continue", "See what happens next", "everything_dark")
	if(state == "everything_dark"):
		playAnimation(StageScene.Sleeping, "sleep")
		saynn("Everything is dark..")

		saynn("Very dark..")

		saynn("Still dark..")

		saynn("Dark..")

		addButton("Continue", "See what happens after the darkness..", "got_saved")
	if(state == "got_saved"):
		playAnimation(StageScene.GivingBirth, "idle")
		aimCameraAndSetLocName("intro_interogation")
		addCharacter("intro_detective")
		saynn("A faint hiss of recycled air greets you as consciousness seeps back in. You lie on something hard yet oddly cushioned, your limbs heavy as though weighted by steel. Blurred shapes drift in and out of focus.")

		saynn("The sharp scent of antiseptic stings your nostrils.")

		saynn("[say=intro_detective]Thanks, doctor. I will take it from here.[/say]")

		saynn("Familiar voice.. Where did you hear it before?")

		saynn("The vision is blurry.. but you see a silhouette.. well-tailored wolf in a white shirt and grey trousers.")

		saynn("He snaps his fingers in front of your face, making your ears perk. After that, he just takes a seat on a chair. You open your eyes fully and look around.. you're in a rolling bed.. comfy. The guy offers you a cool gaze.")

		saynn("[say=intro_detective]You've been brought back under AlphaCorp's protection. You're safe now.[/say]")

		saynn("Somehow, you don't feel that much more safe.")

		saynn("[say=pc]Yeah, hello to you too..[/say]")

		saynn("[say=intro_detective]My name is Jake, IIPF, threat..[/say]")

		saynn("It hits you.")

		saynn("[say=pc]I know who you are.[/say]")

		saynn("He tilts his head slightly down, brow raised.")

		saynn("[say=pc]How did you find me?[/say]")

		saynn("Jake grabs a few papers and swipes his gaze through them.")

		saynn("[say=intro_detective]We intercepted your signal.[/say]")

		saynn("Your personal escort team, how convenient..")

		saynn("Your hand reaches to tug on your collar.. it's still there.. and it's still sitting just as tight as before.")

		saynn("[say=pc]Was the shock part really that necessary?[/say]")

		saynn("[say=intro_detective]It's for your own protection, really.[/say]")

		saynn("You let out a bitter laugh.")

		if (!choseSave):
			saynn("[say=pc]Of course. Hey, before you say what you're gonna say.. I killed a slaver, the ship is the proof. Doesn't that account for something?[/say]")

			saynn("Jake's pen hovers over the files as he raises a brow.")

			saynn("[say=intro_detective]Something?[/say]")

			saynn("[say=pc]You know.. something. You can keep the medal for yourself, just let me walk.[/say]")

			saynn("He shuffles his papers and then puts them away.")

			saynn("[say=intro_detective]If you killed a slaver, where are his slaves?[/say]")

			saynn("Alright.. fair point. Better to stay quiet before you make things worse.")

		else:
			saynn("[say=pc]Of course. Hey, before you say what you're gonna say. What did you do with the slaves?[/say]")

			saynn("Jake's pen hovers over the files as he raises a brow.")

			saynn("[say=intro_detective]You had slaves on board?[/say]")

			saynn("[say=pc]Yes. Well.. no.. They're not mine. But I saved them. It's a long story, okay? I brought down a slaver, I hope you found him and his goons on that planet already.[/say]")

			saynn("He shuffles his papers and then puts them away.")

			saynn("[say=intro_detective]I'm certain they've been processed accordingly.[/say]")

			saynn("Alright..")

		saynn("[say=pc]So.. what now?[/say]")

		saynn("[say=intro_detective]I'm here to assess the failed escape attempt from one of our correctional facilities, do a clinical review of your actions, and perform all of the required legal procedures. I also gotta make sure this.. incident doesn't happen again.[/say]")

		saynn("[say=pc]Escape attempt? Listen. I got kidnapped by one of the staff! I got sold away on a slave auction.[/say]")

		saynn("He nods subtly after each of your sentences.")

		saynn("[say=pc]You don't believe me, do you?[/say]")

		saynn("You glare at him.")

		saynn("[say=intro_detective]I have no reason to think that any of AlphaCorp's secret facilities are compromised.[/say]")

		saynn("You growl.")

		saynn("[say=pc]Well, you're dumb as bricks, then.[/say]")

		saynn("He stays quiet, his expression barely reacting to your words.")

		saynn("After a few seconds, he grabs a datapad and starts looking up something.")

		saynn("[say=pc]You're not even gonna ask who it was?[/say]")

		saynn("[say=intro_detective]Any of your claims will lack the most important part. Proof.[/say]")

		saynn("Nothing you say can change anything. So you just sigh.. and relax in bed. Feels so much better than that cage..")

		saynn("[say=intro_detective]I'm finishing the required paperwork.[/say]")

		saynn("[say=pc]How are you gonna make sure that this doesn't happen?[/say]")

		saynn("[say=intro_detective]Your sentence has been extended - an administrative penalty for the illegal actions.[/say]")

		saynn("[say=pc]It's already indefinite anyway.[/say]")

		saynn("He stares at you.. intently.")

		saynn("[say=intro_detective]I will now invite the officers in.[/say]")

		saynn("Next many moments blur into one..")

		saynn("The officers cuff you and bring you onto a spaceship.")

		saynn("Soon enough, you're already placing your foot back onto the BDCC's grounds.")

		addButton("Continue", "See what happens next", "risha_items")
	if(state == "risha_items"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		removeCharacter("intro_detective")
		addCharacter("risha")
		saynn("[say=risha]Here is your shit.[/say]")

		saynn("At least.. you don't have to start from zero.")

		saynn("[say=risha]Be glad that I decided against just throwing it all out.[/say]")

		saynn("You nod.")

		saynn("You're back in your cell. Home, sweet home.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "save_others"):
		playAnimation(StageScene.Duo, ["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {npc="psricky", flipNPC=true})
		saynn("The guy is not worth screwing other people over.")

		saynn("[say=pc]Turn around.[/say]")

		saynn("[say=psricky]Why? You're not gonna drill my ass, are you?[/say]")

		saynn("You slap him with the thing and force him to turn.")

		saynn("[say=pc]Shut your sleezy mouth. Keep your hands up or I will bring you down.[/say]")

		saynn("While he is not looking, you switch your drill for his revolver. Just as much lethal power.. but with way higher range.")

		saynn("With its barrel pressed against Ricky's back, you push him out into the open.")

		saynn("[say=psricky]Bold one, aren't ya?[/say]")

		saynn("The goons aim their guns at you the moment they see you.")

		saynn("[say=pc]I don't wanna kill him. But I won't hesitate. Drop your guns. Now.[/say]")

		saynn("They give each other quick glances. One of them barks a few words back.")

		saynn("[sayMale]Why wouldn't we just shoot the both of you?[/sayMale]")

		saynn("[say=psricky]Wow, loyalty means nothing already?[/say]")

		saynn("Suddenly, you weren't the only one who was screwed.")

		saynn("[say=psricky]You don't get paid shit until this gig is done, did you forget already, you dumb fucks? And how exactly are you planning to get off this dead piece of rock without me, huh? The ship's controls are locked. So, please, think for a second and listen to the bitch already. Drop your guns.[/say]")

		saynn("Reluctantly, they obey you. Their rifles begin hitting the ground, one by one. Feels good.")

		saynn("[say=pc]Now, go gather the slaves up near the cage.[/say]")

		saynn("The goons look at Ricky.. who just shrugs and then nods, sending the goons off.")

		saynn("[say=pc]You didn't really lock the controls, did you? You're not that smart.[/say]")

		saynn("[say=psricky]This old piece of junk? It only has shitty digital locks. They could've easily just looted our dead bodies for the keys. Greedy fucks, aren't they?[/say]")

		saynn("You nod.. and feel his pockets with your free hand until you find the keys that he is talking about.")

		saynn("[say=psricky]Hey! You bitch.[/say]")

		saynn("You shove him forward.")

		saynn("[say=pc]Walk.[/say]")

		addButton("Cages", "See what happens next", "escape2_cages")
	if(state == "escape2_cages"):
		aimCameraAndSetLocName("psmine_sleep")
		saynn("You and your new friend join others near the cages.")

		saynn("Disarmed goons have lined the slaves up, some of them still holding their pickaxes. You get a lot of confused looks thrown your way.")

		saynn("[say=pc]You're free now, slaves no more. Ain't that right, Ricky?[/say]")

		saynn("He grunts as you shove the barrel into his back more.")

		saynn("[say=psricky]I guess so. Funny, eh?[/say]")

		saynn("[say=pc]What is?[/say]")

		saynn("The slaves look around.. and see helpless goons. They clench their tools and surround them instead, turning the tables. They are the armed ones here now.")

		saynn("[say=psricky]Since you have the collar, I'd thought you'd be the biggest bitch of them all. In a way, you still are. Are you?[/say]")

		saynn("[say=pc]Here is something else funny. Go join the pile, Ricky.[/say]")

		saynn("[say=psricky]Really?[/say]")

		saynn("You shove him, inviting the guy to listen by pointing the gun at him.")

		saynn("[say=psricky]You can't even use that thing, can you?[/say]")

		saynn("Your finger cocks the revolver, making the barrel move to the next bullet.")

		saynn("[say=psricky]Fine.[/say]")

		saynn("Ricky joins his goons.. who are clearly not exactly happy about this.")

		saynn("[say=psricky]What are you gonna do now? Gonna leave us out here to die? Like a true hero?[/say]")

		saynn("That's an option.. but since you decided against killing anyone.. might as well continue your peaceful mission.")

		saynn("[say=pc]I will send an SOS message with this location from your ship. I promise.[/say]")

		saynn("He chuckles softly.")

		saynn("[say=psricky]You better be honest, you slut. Otherwise, I will find you. And you don't want that, do you?[/say]")

		saynn("You gesture to him and to other goons.")

		saynn("[say=pc]Sure. For now, get in there.[/say]")

		saynn("You point your gun towards the cage.")

		saynn("[say=psricky]Hah. Fuck, that's funny. You're a funny one, you know that?[/say]")

		saynn("The slaves aren't being funny though. They help you, pushing the disarmed goons into the big spacious cage.. before locking it.")

		saynn("[say=pc]I will send the message as soon as I can.[/say]")

		saynn("You lower the gun.. offer them a final wave.. and proceed onto the ship.")

		addButton("Spaceship", "Time to fly away!", "escape2_ship")
	if(state == "escape2_ship"):
		removeCharacter("psricky")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("psmine_exit")
		saynn("You and the other slaves.. ex-slaves.. get onto the spaceship. Since you are the one who got them this far, might as well be the captain-pilot of this vessel.. of this.. bucket.")

		saynn("At least the captain's chair is somewhat comfy. You find a spot to press the keys against.. and watch as all the information displays light up, the engines slowly spooling up.")

		saynn("The loading ramp closes.. the growling vibrations gradually increasing. You have no idea how to pilot this piece of junk.. so you just pull the wheel towards yourself while tugging on the lever that says 'engines'.")

		saynn("And so, the ship begins to get lighter and lighter.. until it starts hovering above the ground, picking up and throwing dust all around. Then you add a slight pitch, guiding the ship's nose towards the sky.. and go full throttle on everything.")

		saynn("You fly up into the red sky, watching it transition into a pure void of space. Nothing can stop you from getting that well-deserved freedom.")

		addButton("Continue", "See what happens next", "escape2_inspace")
	if(state == "escape2_inspace"):
		playAnimation(StageScene.Solo, "stand")
		saynn("Things go relatively smoothly from that point on.")

		saynn("You talk it through with the other slaves, about what you should do next. You have a trunk full of precious ore, the results of your hard labor. The plan is simple.. sell it, split it, go your own separate ways, start new lives. Exciting. You get to keep the ship on top of that.. since it was your plan.")

		saynn("Right, you almost forgot about sending that SOS message.")

		saynn("You approach the communications console and turn it on. The display shows you the latest sent message automatically.. and you can't help but to read it.")

		saynn("[say=psricky]After this little gig, I will be able to get you that ring. Cool, eh? Hole shit you're a pricey one. You're lucky your holes feel so unbelievably tight around my cock. Not for long though, start lubing them up already, princess, you hear? Don't worry about the slaves, I will get rid of them, one way or another. The armed dudes will wipe the floor clean and fuck off into oblivion too. We will have this ship for a whole month only for ourselves. Just stop sending those nudes to the whole intranet, you belong to me now, yeah? Don't make me sad, baby. I know you're a stripper and you just can't help it but to show off that beautiful body of yours. Still, I'm ripping my ass out here for you, please? Alright, I gotta turn off the comms now, send me something nice, be a good girl, okay?[/say]")

		saynn("Right..")

		saynn("You try not to think about it too much and just send an SOS message. Sadly, the system errors out on you.")

		saynn("Error: Communications are disabled. Enable them and try again? Yes/No.")

		saynn("Even though the console is one, the comms themselves are still off. Without much thought, you press Yes.")

		saynn("A helpful window pops up.. one that says 'bluespace jamming protocols have been temporarily disabled'.")

		saynn("Oh. Shit. There is no way that fucker didn't know about this.")

		saynn("Beep.")

		saynn("You look down at your collar.. and watch it start to blink red. Great.")

		saynn("Beep. Beep.")

		saynn("Too late to do anything. Whatever it wants to do to you.. it's probably about to do it..")

		saynn("Beep. Beep-Beep..")

		saynn("Here is hoping others won't let you down.")

		addButton("Continue", "See how fucked you are", "escape2_broughtdown")
	if(state == "escape2_broughtdown"):
		playAnimation(StageScene.Solo, "defeat")
		saynn("A jolt of electricity surges through your body.. sharp and searing, like molten knives sliding through your veins. You convulse mid-breath, a strangled scream ripping from your throat.")

		saynn("The world tilts, your vision fracturing into shards of blue and red.. and then.. everything goes dark..")

		addButton("Continue", "See what happens next", "everything_dark")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_drill"):
		processTime(5*60)

	if(_action == "kill_ricky"):
		choseSave = false

	if(_action == "save_others"):
		choseSave = true

	if(_action == "sneak_in_kill"):
		processTime(5*60)

	if(_action == "do_relax_escape1"):
		processTime(5*60)

	if(_action == "escape1_fucked"):
		processTime(3*60)

	if(_action == "escape1_actually_fucked"):
		processTime(5*60)
		GM.pc.addPain(1000)
		GM.pc.addCredits(-GM.pc.getCredits())

	if(_action == "everything_dark"):
		processTime(10*60)

	if(_action == "got_saved"):
		GM.main.startNewDay()
		GM.pc.addPain(-1000)
		processTime(60*83)

	if(_action == "risha_items"):
		processTime(3*60)
		GM.pc.setLocation(GM.pc.getCellLocation())
		GM.main.stopPlayerSlavery()
		addMessage("All your items were returned to you.")

	if(_action == "escape2_cages"):
		processTime(3*60)

	if(_action == "escape2_ship"):
		processTime(10*60)

	if(_action == "escape2_inspace"):
		processTime(10*60)

	if(_action == "escape2_broughtdown"):
		processTime(3*60)
		
	if(_action == "do_relax_escape1"):
		GM.main.PSH.unlockEndingAddMessage("ShaftMiner", "killedboss")
	if(_action == "escape2_ship"):
		GM.main.PSH.unlockEndingAddMessage("ShaftMiner", "escaped")

	setState(_action)

func saveData():
	var data = .saveData()

	data["choseSave"] = choseSave

	return data

func loadData(data):
	.loadData(data)

	choseSave = SAVE.loadVar(data, "choseSave", false)
