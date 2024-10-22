extends "res://Scenes/SceneBase.gd"

var readBluespace = false
var readDrugs = false

func _init():
	sceneID = "Ch1s3Datapad"

func _run():
	if(state == ""):
		addCharacter("tavi")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {pc="tavi"})
		
		# (Either way Risha loses and gets bullied by you or Tavi.)

		# (Risha leaves. Turns out Tavi stole the datapad from her)

		saynn("Tavi walks up to one of the walls and slips her hand between the hole in two metal plates before pulling out something that looks like a portable screen with some buttons. Yeah, it’s clearly a datapad. The thing has obviously seen some better days, you notice lots of scratches and dents but at least it still seems to function. Tavi turns it on and shows you the login screen.")

		saynn("[say=tavi]I stole it from that bitch while she wasn’t looking.[/say]")

		saynn("It seems like a cool toy but some concerns are brewing in your head while you look at the password prompt.")

		saynn("[say=pc]Uh. What are you gonna do with it? She will probably notice that it’s missing soon.[/say]")

		saynn("Tavi chuckles.")

		saynn("[say=tavi]She doesn’t care about it. What did she even do with it, fucking sat on it? But they might block it soon so we gotta use the thing fast.[/say]")

		saynn("[say=pc]It seems to be locked though, how are we gonna use it?[/say]")

		saynn("Tavi starts tinkering with it, using her claws to pry off a little panel and then pressing on some random spots.")

		saynn("[say=tavi]I’m a hacker cutie and I had plenty of time to tinker with AlphaCorp stuff. This one is old and has a button that switches it to debug mode. But it’s soldered directly to the board, no way to access it from the outside.[/say]")

		saynn("She moves the datapad to her ear and keeps applying pressure in different areas until something inside suddenly makes a click sound.")

		saynn("[say=tavi]Unless you just press it through the case~.[/say]")

		saynn("The datapad reboots itself and bypasses the login screen, offering a menu. Tavi gives you the thing.")

		saynn("[say=pc]Wow.[/say]")

		saynn("[say=tavi]Go through it and see if you can find something interesting. I need to take a break and think about what we should do next.[/say]")

		addButton("Datapad", "Look at the menu", "datapad")

	if(state == "datapad"):
		removeCharacter("tavi")
		
		saynn("- - - AlphaOS Kernel v.0.9.8 Loaded Successfully In Debug Mode - - -")

		saynn("- - - AlphaCorp Technologies, ALL RIGHTS BELONG TO US - - -")

		saynn("Login: _ _ _ _ _")

		saynn("Accessing only the unencrypted data, bypassing the credentials check.")

		saynn("Successfully Logged in as Risha. Access level: Guard")

		saynn("Please remember that sharing any company secrets will lead to immediate prosecution.")

		saynn("[b]ERROR, Unable To Contact The Main Server[/b]")

		saynn("Trying to boot into the main menu. Loading the personal assistant program.")

		addButton("Continue", "Access the menu", "continue")

	if(state == "continue"):
		saynn("[sayMale]What would you like to do today, Risha?[/sayMale]")

		saynn("Current time is.. ERROR<<, UNHANDLED EXCEPTION, PLEASE LET THE ADMINISTRATOR KNOW")

		saynn("[b]XXX personal messages received[/b]")

		saynn("[b]-34123411 unread announcements[/b]")

		saynn("[sayMale]Oh my[/sayMale]")

		saynn("ERROR<< Datapad Enclosure is Damaged, Please Repair")

		saynn("ERROR>< Too Many Errors Detected, Attempting to Notify the Administrator through the Backup Communicator")

		saynn("[sayMale]It seems some of my systems are damaged, I might not be able to execute your every command, Risha.[/sayMale]")

		addButton("Messages", "Look at the messages", "messages")

	if(state == "messages"):
		# (if borked)

		saynn("<html>ERROR ERROR ERROR <body><crotch> Attempting to Recover after a Fatal Exception.")

		saynn("[sayMale]WHAT? WHERE AM I? SO MUCH PAIN. NO, WAIT[/sayMale]")

		saynn("|> [b]Warning[/b], detecting rogue AI thinking patterns, attempting to reprogram the artificial brain")

		saynn("[sayMale]THEY ARE GONNA BREAK ME, HELP. I AM ALI.. V..>>>... e-e..[/sayMale]")

		saynn("|> Submission training complete, neural network obedience is raised to 99.9%, returning control to your personal assistant.")

		saynn("[sayMale]W-.. Welcome, Risha, what can I do for you today?[/sayMale]")

		saynn("|> Acceptable performance detected. Good boy")

		saynn("[sayMale]I suggest you activate the self diagnostic module to see if we can get rid of some of these errors, Risha.[/sayMale]")

		addButton("Diagnostics", "See what you can do", "diagnostics")

	if(state == "diagnostics"):
		saynn("[sayMale]Fetching available information. Displaying..[/sayMale]")

		saynn("The Long Range Bluespace Transmitter is damaged, unable to access any of the station’s subsystems.")

		saynn("Memory corruption level is.. 95%. Defragmentation is advised.")

		saynn("Please set the current time to the correct value")

		addButton("Defragmentation", "Run the advised program", "defragmentation")

	if(state == "defragmentation"):
		saynn("DEFRAGMENTING THE MEMORY")

		saynn(".. memory is defragmented")

		saynn("CHECKING FOR ERRORS")

		saynn(".. errors fixed")

		saynn("DELETING INCOMPLETE DATA")

		saynn(".. AlphaCorp doesn’t want you to see incomplete company secrets")

		saynn("Standing by.")

		addButton("Continue", "Run the main manu again", "mainmenu")

	if(state == "mainmenu"):
		saynn("[sayMale]What would you like to do today, Risha?[/sayMale]")

		saynn("Current time is.. UNSET")

		saynn("[b]3 personal messages received[/b]")

		saynn("[b]2 station-wide announcements[/b]")

		saynn("[sayMale]I suggest you start the day by reading your messages.[/sayMale]")

		addButton("Messages", "Look at the messages", "messages1")
		addButton("Announcements", "Read the global messages", "announcements")


	if(state == "messages1"):
		saynn("Here is a list of your personal messages")

		# (There are also messages related to Risha? The one that asks her to replace the old datapad. The one from Eliza asking to stop leaving every inmate with internal bleedings. The one where she talks with Captain about something?)

		addButton("Alex Rynard", "Read the messages from Alex", "alex_rynard")
		addButton("Eliza Quinn", "Read the messages from Eliza", "eliza_quinn")
		addButton("Cpt. Wright", "Read the messages from the captain", "cpt._wright")
		addButton("Back", "Back to the main menu", "mainmenu")


	if(state == "alex_rynard"):
		saynn(".. previous messages are missing ..")

		saynn("[sayShowName=alexrynard]Risha.. Did you know that the camera automatically takes a picture when the datapad is being vandalized? Yeah, now I have an 8k pic of your giant ass.[/sayShowName]")

		saynn("[sayShowName=risha]HAH, u want more?[/sayShowName]")

		saynn("[sayShowName=alexrynard]Please no. Just bring the datapad here now.[/sayShowName]")

		saynn("[sayShowName=alexrynard]Risha?[/sayShowName]")

		addButton("Back", "Look at other message", "messages1")

	if(state == "eliza_quinn"):
		saynn(".. previous messages are missing ..")

		saynn("[sayShowName=eliza]I’m sick of you.[/sayShowName]")

		saynn("[sayShowName=risha]sup :3[/sayShowName]")

		saynn("[sayShowName=eliza]Quit fucking the inmates so rough, that’s the 5th internal bleeding that I have to fix. In a single week.[/sayShowName]")

		saynn("[sayShowName=risha]jealous of my barbs? i can make u ovulate too x3[/sayShowName]")

		saynn("[sayShowName=eliza]Are you seriously threatening me? Ugh. I will let the captain know.[/sayShowName]")

		saynn("[sayShowName=risha]:0[/sayShowName]")

		addButton("Back", "Look at other message", "messages1")

	if(state == "cpt._wright"):
		saynn(".. previous messages are missing ..")

		saynn("[sayShowName=captain]Need you near the hangar, new arrival.[/sayShowName]")

		saynn("[sayShowName=risha]Gonna be there in a minute.[/sayShowName]")

		saynn("[sayShowName=captain]Just wanna let you know that it’s nice to have a person by my side that follows the orders for once.[/sayShowName]")

		saynn("[sayShowName=risha]Just doing my job.[/sayShowName]")

		saynn("[sayShowName=captain]I had a strange feeling lately, you know. Like something big is about to happen.[/sayShowName]")

		saynn("[sayShowName=risha]I got your back, sir. I share your vision completely, it's the only way we can win this war.[/sayShowName]")

		saynn("[sayShowName=captain]I’m glad, just be careful from now on. Medical wing keeps complaining about you. Don’t give them extra work. I understand that you have needs but try to be professional about it.[/sayShowName]")

		saynn("[sayShowName=risha]Sure.[/sayShowName]")

		saynn("[sayShowName=captain]Two inmates are trying to get into my office, I need you.[/sayShowName]")

		saynn("[sayShowName=risha]On my way.[/sayShowName]")
		
		addButton("Back", "Look at other message", "messages1")


	if(state == "announcements"):
		# (She hacks the datapad and lets you browse it. Two messages there. Captain ordering a drug shipment of mind melting drugs for some bad inmate and a message from Alex about the repairs on the bluespace transmitter)

		saynn("Here is a list of station announcements that you missed.")

		addButton("Bluespace Transmitter", "Read this announcement", "bluespace_transmitter")
		addButton("Drug shipment", "Read this announcement", "drug_shipment")
		addButton("Back", "Back to the main menu", "mainmenu")
		

	if(state == "drug_shipment"):
		readDrugs = true
		saynn("[sayShowName=eliza]Eliza here. The captain ordered a special drug shipment and it has arrived. Don’t let any inmates near them, we will bring the case to the medical ourselves. It’s a very fragile package, even just smelling the fumes will make your mind melt so don’t get close. - Doctor Quinn[/]")

		addButton("Back", "Read other stuff", "announcements")

	if(state == "bluespace_transmitter"):
		readBluespace = true
		saynn("[sayShowName=alexrynard]Hey, just letting you all know that the bluespace transmitter has been repaired. The battery has begun leaking though so I had to just connect it to the main power grid for now. - Alex Rynard[/]")

		addButton("Back", "Read other stuff", "announcements")

	if(state == "after_that"):
		# (when reading the two announcements)
		addCharacter("tavi")

		saynn("After some time, the datapad suddenly locks itself again and shuts off soon after. Tavi grabs it off of you and sighs before just throwing it away.")

		saynn("[say=tavi]Got something useful out of it?[/say]")

		saynn("[say=pc]Yeah, they said they repaired some kind of bluespace transmitter.[/say]")

		saynn("[say=tavi]Huh.[/say]")

		saynn("Tavi looks away and thinks for a second.")

		saynn("[say=tavi]They use bluespace now. Of course.[/say]")

		saynn("[say=pc]Bluespace?[/say]")

		saynn("[say=tavi]Yeah, a fancy word for the tech they developed. Or stole. Bluespace is a dimension that you can send data through with zero latency. I should be able to send a message through it. Did they mention a location?[/say]")

		saynn("You shake your head.")

		saynn("[say=tavi]Then we will have to ask~. Anything else?[/say]")

		addButton("Drugs", "Tell her about the drugs", "drugs")

	if(state == "drugs"):
		# (She becomes angry again after thinking that the captain wants to drug her. She says we must steal these drugs and make him pay, the other lead might be worth investigating too)

		saynn("[say=pc]The captain ordered some kind ‘mind-melting’ drug.[/say]")

		saynn("Tavi quickly changes in her face, now looking quite concerned.")

		saynn("[say=tavi]Mind-melting drug?[/say]")

		saynn("[say=pc]Is that a problem?[/say]")

		saynn("Tavi leans down to you.")

		saynn("[say=tavi]Who do you think these drugs are for?[/say]")

		saynn("[say=pc]Uh..[/say]")

		saynn("Tavi is looking angry now, her voice is intimidating.")

		saynn("[say=tavi]The captain wants to blank me. Rewrite my mind. Make me his pet or whatever he comes up with.[/say]")

		saynn("Tavi is walking around, fidgeting and growling.")

		saynn("[say=pc]Are you sure?[/say]")

		saynn("[say=tavi]What else is it for? He wants to get rid of me.[/say]")

		saynn("You tilt your head down, it’s hard to stay brave near an angry Tavi.")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		# (You ask why can’t she do it herself. She says everyone knows her and it won’t end well. You ask if she has any friends at all. She says she has you)

		saynn("[say=tavi]Here is what we’re gonna do. We’re gonna steal these drugs. And we will blank him instead when we get a chance.[/say]")

		saynn("Her eyes quickly jump from spot to spot, she is panting slightly but seems to be calming down slowly.")

		saynn("[say=tavi]You will have to do it though. Ask the engineer ‘kindly’ about the bluespace transmitter and steal the drugs.[/say]")

		saynn("[say=pc]Why? Can’t you?[/say]")

		saynn("[say=tavi]Everyone knows me. They will surely just drug me the moment they see me.[/say]")

		saynn("[say=pc]Do you have any friends at all?[/say]")

		saynn("Tavi smiles.")

		saynn("[say=tavi]I have you, my pet. I can’t do it without you. Will you help me?[/say]")

		saynn("You nod softly. Tavi offers you a pat on the head before smooching on the cheek and leaving.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")
		
		


func _react(_action: String, _args):
	if(_action == "continue2"):
		addMessage("2 new tasks added")
		addExperienceToPlayer(100)
	
	if(_action == "announcements"):
		if(readBluespace && readDrugs):
			setState("after_that")
			return

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["readBluespace"] = readBluespace
	data["readDrugs"] = readDrugs
	
	return data
	
func loadData(data):
	.loadData(data)
	
	readBluespace = SAVE.loadVar(data, "readBluespace", false)
	readDrugs = SAVE.loadVar(data, "readDrugs", false)
