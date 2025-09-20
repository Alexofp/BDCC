extends NpcOwnerEventBase

func _init():
	id = "TestEvent"

func startEvent(_args:Array):
	setState("start")

func start():
	saynn("Test!")
	
	addButton("Pet", "Pet the cat", "pet")
	addButton("Pet 2", "Pet the cat but better", "setState", ["petted"])
	addButton("Stop it!", "Stop the petting", "end")

func start_do(_id:String, _args:Array):
	if(_id == "end"):
		endEvent()
	if(_id == "pet"):
		setState("petted")
		#runEvent(id, args)

#func start_eventResult(_id:String, _args:Array)

func petted():
	saynn("You pet the cat.")
	saynn("The cat purrs.")
	
	addButton("Back", "Go back", "setState", ["start"])
