extends Reference
class_name NpcSlave

var npc:WeakRef
var slaveType = SlaveType.Slut
var slaveSpecializations = {
	SlaveType.Slut: 0,
}

var slaveLevel = 0
var slaveExperience = 0

# When reaches 1, the npc submits unwillingly
# Increased by punishing when disobeying?
# Increased by doing things that the npc doesn't like
var brokenspirit = 0.0
# When reaches 1, the npc submits willingly
# Increased by doing things that the npc likes
# Increased by giving gifts?
var love = 0.0

# When reaches 1, the npc becomes a mindless fuckdoll
# Increased by doing bad things (very bad, like making them black out) to them?
# Increased by punishing for no reason
# Decreased by rewarding
var despair = 0.0

# Helps to lower spirit
# Increased by having restraints on the npc each day
# Decreased by rewarding for no reason
var tamed = 0.0

# Daily vars
var punishmentsToday = 0
var rewardsToday = 0

func setChar(theChar):
	npc = weakref(theChar)

func setMainSlaveType(theSlaveType):
	slaveType = theSlaveType

func getMainSlaveType():
	return slaveType

func getChar():
	if(npc == null):
		return null
	return npc.get_ref()
