extends WorldEditBase

func _init():
	id = "AlexRynardWorldEdit"
	
func apply(world: GameWorld):
	if(getFlag("PortalPantiesModule.Alex_FirstTimeTalked")):
		world.setRoomSprite("eng_workshop", RoomStuff.RoomSprite.PERSON)
