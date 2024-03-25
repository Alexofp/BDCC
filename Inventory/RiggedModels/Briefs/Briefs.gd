extends "res://Player/Player3D/Parts/Part3D.gd"

func setColor(newColor):
	for mesh in [$bodywidepng, $legupDeformable, $legupDeformable001]:
		var theMat1:SpatialMaterial = mesh.get_surface_material(0)
		var newMat:SpatialMaterial = theMat1.duplicate()
		newMat.albedo_color = newColor
		mesh.set_surface_material(0, newMat)
