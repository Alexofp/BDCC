extends Object
class_name BodyWritingsZone

enum {
	Forehead,
	CheekLeft,
	CheekRight,
	Chin,
	
	ArmLeft,
	ArmRight,
	ForearmLeft,
	ForearmRight,
	
	UpperChest,
	Breasts,
	Belly,
	LowerAbdomen,
	Back,
	LowerBack,
	HipLeft,
	HipRight,
	
	ButtcheekLeft,
	ButtcheekRight,	
	ThighLeft,
	ThighRight,
	ShinLeft,
	ShinRight,
}
const zoneVisibleName = {
	Forehead: "forehead",
	CheekLeft: "left cheek",
	CheekRight: "right cheek",
	Chin: "chin",
	
	ArmLeft: "left arm",
	ArmRight: "right arm",
	ForearmLeft: "left forearm",
	ForearmRight: "right forearm",
	
	UpperChest: "upper chest",
	Breasts: "breasts",
	Belly: "belly",
	LowerAbdomen: "lower abdomen",
	Back: "back",
	LowerBack: "lower back",
	HipLeft: "left hip",
	HipRight: "right hip",
	
	ButtcheekLeft: "left butt cheek",
	ButtcheekRight: "right butt cheek",
	ThighLeft: "left thigh",
	ThighRight: "right thigh",
	ShinLeft: "left shin",
	ShinRight: "right shin",
}

static func getAll():
	return zoneVisibleName.keys()

static func getRandomZone():
	return RNG.pick(zoneVisibleName.keys())

static func getRandomZoneLowerPart():
	return RNG.pick([
		LowerAbdomen, HipLeft, HipRight, ButtcheekLeft, ButtcheekRight, ThighLeft, ThighRight, ShinLeft, ShinRight
	])

static func getZoneVisibleName(zoneID: int):
	if(!zoneVisibleName.has(zoneID)):
		return "error:BADZONE"+str(zoneID)
	return zoneVisibleName[zoneID]
