extends WorldEditBase

func _init():
	id = "ArticaWorldEdit"
	
func apply(world: GameWorld):
	if(getFlag("ArticaModule.corruptionBegan", false)):
		world.setRoomSprite("main_bench3", RoomStuff.RoomSprite.PERSON)
