extends SceneBase

func _init():
	sceneID = "Alex_GiveCage"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		
		saynn("[say=pc]Okay, I'm finished with this. Thanks.[/say]")
		saynn("You hand Alex the datapad and the cage.")
		saynn("[say=alexrynard]Good. Come, take a look.[/say]")
		saynn("Alex fiddles with the cage using some kind of powered tool resembling a screwdriver. The cover pops off, showing off the innards of the device.")
		saynn("[say=alexrynard]Let's see what's useful in here. The electromagnet's pretty compact, and the battery's not bad either, but...[/say]")
		saynn("He points out a green circular component.")
		saynn("[say=alexrynard]This is the star of the show. It's a micro bio-reactor. Generates electricity from body heat, enough to keep the device charged indefinitely despite the inefficient always-on design. You can always count on DeLoxe when it comes to solving engineering problems with excessive amounts of money.[/say]")
		saynn("He taps the component a few times with a desoldering tool, then carefully pulls it out with a pair of pliers.")
		saynn("[say=alexrynard]Yeah, I can think of some uses for this. In the meantime, here.[/say]")
		saynn("He hands you some credits.")
		saynn("[say=pc]Thanks, but why? I figured we were square already.[/say]")
		saynn("[say=alexrynard]Consider it an encouragement to return my stuff when you borrow it.[/say]")
		
		addButton("Leave", "", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		setFlag("HypnokinkModule.Vion_HaveCage", false)
		GM.pc.addCredits(5)
		endScene()
		return

	setState(_action)
