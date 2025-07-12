extends SceneBase

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

		addButton("Kill him", "End his life and escape with yours. Alone", "kill_ricky")
		addButton("Save others", "Try to use Ricky to convince the goons to let others go with you. Ricky will have to stay alive for that", "save_others")
	if(state == "kill_ricky"):
		playAnimation(StageScene.Rekt, "end", {pc="pc", npc="psricky"})
		saynn("You let go of his throat and take a step back.")

		saynn("[say=psricky]That's right, you made the right choice. No need to do stupid shit, yeah? We can always talk it out.[/say]")

		saynn("Your eyes just track him, keeping a strict eye contact.")

		saynn("As soon as his stare shifted towards the dropped revolver.. you knew..")

		saynn("Without a drop of hesitation, you dash forward and pierce the fucker's skull with your drill, it's diamond tip destroying his jaw and turning his brain into form-less mush with ease.")

		saynn("[say=pc]Shut your mouth already, I'm sick of it.[/say]")

		saynn("When that's done, you let his lifeless body slump onto the cold rock. No one will ever find him here. Good.")

		saynn("You search his pants and the remains of his jacket, finding some kind of digital keys. You drop the drill and grab his revolver, the thing is useless against rifles anyway.")

		saynn("As you peak over the rock, you see the armed goons patrolling the space around the spaceship. Some of them are loading crates into it.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_drill"):
		processTime(5*60)

	setState(_action)
