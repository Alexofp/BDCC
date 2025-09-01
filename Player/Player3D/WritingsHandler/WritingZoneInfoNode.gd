extends Node
class_name WritingZoneInfoNode

enum ZONE { # IF YOU ADD ANY, ADD THEM TO BodyWritingsZone CLASS TOO
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
const OPPOSITE = {
	ZONE.CheekLeft: ZONE.CheekRight,
	ZONE.CheekRight: ZONE.CheekLeft,
	ZONE.ArmLeft: ZONE.ArmRight,
	ZONE.ArmRight: ZONE.ArmLeft,
	ZONE.ForearmLeft: ZONE.ForearmRight,
	ZONE.ForearmRight: ZONE.ForearmLeft,
	ZONE.HipLeft: ZONE.HipRight,
	ZONE.HipRight: ZONE.HipLeft,
	ZONE.ButtcheekLeft: ZONE.ButtcheekRight,
	ZONE.ButtcheekRight: ZONE.ButtcheekLeft,
	ZONE.ThighLeft: ZONE.ThighRight,
	ZONE.ThighRight: ZONE.ThighLeft,
	ZONE.ShinLeft: ZONE.ShinRight,
	ZONE.ShinRight: ZONE.ShinLeft,
}

export(ZONE) var zone:int = 0
export var pos:Vector2
export var posSpread:float = 0.0
export var rot:float = 0.0
export var rotSpread:float = 0.0
export var scale:float = 1.0
export var squish:Vector2 = Vector2(1.0, 1.0)
export var showLeft:bool = true
export var showRight:bool = true
export var maxWritings:int = 2
