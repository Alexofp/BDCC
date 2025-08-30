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

export(ZONE) var zone:int = 0
export var pos:Vector2
export var showLeft:bool = true
export var showRight:bool = true
