extends "res://Player/Player3D/Parts/Part3D.gd"

#func setColor(newColor):
#	var theMat1:SpatialMaterial = $bodywidepng.get_surface_material(0)
#	theMat1.albedo_color = newColor
#	var theMat2:SpatialMaterial = $PartStatePicker/PartState/breastsScalable001.get_surface_material(0)
#	theMat2.albedo_color = newColor

func setColor(newColor):
	for mesh in [$bodywidepng, $PartStatePicker/PartState/breastsScalable001]:
		var theMat1:SpatialMaterial = mesh.get_surface_material(0)
		var newMat:SpatialMaterial = theMat1.duplicate()
		newMat.albedo_color = newColor
		mesh.set_surface_material(0, newMat)
