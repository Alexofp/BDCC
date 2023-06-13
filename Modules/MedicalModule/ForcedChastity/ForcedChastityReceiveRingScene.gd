extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ForcedChastityReceiveRingScene"

func _run():
	
	if(state == ""):
		saynn("The sleep was alright. Finally you’re not afraid that you will wake up somewhere else. But as you open your eyes you realize that someone left a few things on your pillow.")

		saynn("You get up and get a better look. One of the things seems to be.. a ring? Yeah, it looks like a simple metal ring that goes on your finger. There is also a note that came with it.")

		addButton("Read note", "See what it says", "read_note")

	if(state == "read_note"):
		saynn("\"Accept this gift as a little token of my appreciation. Hope it will be a good reminder of your choice <3.\n\n- Dr. Quinn\"")

		saynn("Huh. That’s kinda sweet. She also left a chip with some credits. You grab the ring and prepare for the day.")

		# (scene ends)

		addButton("Continue", "Huh", "endthescene")
		


func _react(_action: String, _args):
	if(_action == "read_note"):
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("RingOfDevotion"))
		GM.pc.addCredits(10)
		addMessage("You received a ring and 10 credits")

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func getDevCommentary():
	return "If you haven't realized it yet.. the ring is made out of the broken key x3. I hinted at it in Rahi's content, Eliza gave the pieces to Alex and he melted them and created a ring for you ^^. No one mentioned that, maybe I should have been even more obvious.. or not.. dunnyo.. If you realized that before reading this - good job ^^"

func hasDevCommentary():
	return true
