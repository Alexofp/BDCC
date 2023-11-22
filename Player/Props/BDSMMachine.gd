extends Spatial

func setDildosVisible(isVis):
	if(isVis):
		$BDSMMachine/Skeleton/Plane.set_surface_material(0, preload("res://Player/Props/BDSMMachine.tres"))
	else:
		$BDSMMachine/Skeleton/Plane.set_surface_material(0, preload("res://Player/Props/BDSMMachineNoDildos.tres"))
