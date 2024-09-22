extends Spatial
class_name PartOrient

export(bool) var faceRight = false 
# if false, will only be visible when facing left (eg default player pose)
# if true, will only be visible when facing right

func getOrient():
	return faceRight
