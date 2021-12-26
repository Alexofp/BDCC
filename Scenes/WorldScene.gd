extends SceneBase

func _scene(_args):
	travelMenu([])
	
func travelMenu(_args):
	var roomID = GM.pc.location
	var _roomInfo = GM.world.getRoomByID(roomID)
	
	GM.world.aimCamera(roomID)
	GM.ui.setLocationName(_roomInfo.getName())
	
	#say("Meow\n")
	#say(_roomInfo.getDescription())

	if(GM.world.canGoID(roomID, GameWorld.Direction.NORTH)):
		addButtonAt(6, "North", "Go north", "gonorth")
	else:
		addDisabledButtonAt(6, "North", "Can't go north")
		
	if(GM.world.canGoID(roomID, GameWorld.Direction.WEST)):
		addButtonAt(10, "West", "Go west", "gowest")
	else:
		addDisabledButtonAt(10, "West", "Can't go west")
		
	if(GM.world.canGoID(roomID, GameWorld.Direction.SOUTH)):
		addButtonAt(11, "South", "Go south", "gosouth")
	else:
		addDisabledButtonAt(11, "South", "Can't go south")
	
	if(GM.world.canGoID(roomID, GameWorld.Direction.EAST)):
		addButtonAt(12, "East", "Go east", "goeast")
	else:
		addDisabledButtonAt(12, "East", "Can't go east")
	#addDisabledButton("bark", "no awo")
	
	_roomInfo._onEnter()

func gonorth(_args):
	GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, GameWorld.Direction.NORTH))
	travelMenu([])
	
func gowest(_args):
	GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, GameWorld.Direction.WEST))
	travelMenu([])
	
func gosouth(_args):
	GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, GameWorld.Direction.SOUTH))
	travelMenu([])
	
func goeast(_args):
	GM.pc.setLocation(GM.world.applyDirectionID(GM.pc.location, GameWorld.Direction.EAST))
	travelMenu([])

func roomCallback(_args):
	var roomid = _args[0]
	var keyid = _args[1]
	var _room = GM.world.getRoomByID(roomid)
	_room._onButton(keyid)

func actionCallback(_args):
	var scenetorun = _args[0]
	runScene(scenetorun, "_resume")

func _resume(_args=[]):
	travelMenu([])
