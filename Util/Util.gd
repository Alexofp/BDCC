extends Object
class_name Util

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

static func variantTypeToString(type):
	if(type == TYPE_NIL):
		return "TYPE_NIL"
	if(type == TYPE_BOOL):
		return "TYPE_BOOL"
	if(type == TYPE_INT):
		return "TYPE_INT"
	if(type == TYPE_REAL):
		return "TYPE_REAL"
	if(type == TYPE_STRING):
		return "TYPE_STRING"
	if(type == TYPE_VECTOR2):
		return "TYPE_VECTOR2"
	if(type == TYPE_RECT2):
		return "TYPE_RECT2"
	if(type == TYPE_VECTOR3):
		return "TYPE_VECTOR3"
	if(type == TYPE_TRANSFORM2D):
		return "TYPE_TRANSFORM2D"
	if(type == TYPE_PLANE):
		return "TYPE_PLANE"
	if(type == TYPE_QUAT):
		return "TYPE_QUAT"
	if(type == TYPE_AABB):
		return "TYPE_AABB"
	if(type == TYPE_BASIS):
		return "TYPE_BASIS"
	if(type == TYPE_TRANSFORM):
		return "TYPE_TRANSFORM"
	if(type == TYPE_COLOR):
		return "TYPE_COLOR"
	if(type == TYPE_NODE_PATH):
		return "TYPE_NODE_PATH"
	if(type == TYPE_RID):
		return "TYPE_RID"
	if(type == TYPE_OBJECT):
		return "TYPE_OBJECT"
	if(type == TYPE_DICTIONARY):
		return "TYPE_DICTIONARY"
	if(type == TYPE_ARRAY):
		return "TYPE_ARRAY"
	if(type == TYPE_RAW_ARRAY):
		return "TYPE_RAW_ARRAY"
	if(type == TYPE_INT_ARRAY):
		return "TYPE_INT_ARRAY"
	if(type == TYPE_REAL_ARRAY):
		return "TYPE_REAL_ARRAY"
	if(type == TYPE_STRING_ARRAY):
		return "TYPE_STRING_ARRAY"
	if(type == TYPE_VECTOR2_ARRAY):
		return "TYPE_VECTOR2_ARRAY"
	if(type == TYPE_VECTOR3_ARRAY):
		return "TYPE_VECTOR3_ARRAY"
	if(type == TYPE_COLOR_ARRAY):
		return "TYPE_COLOR_ARRAY"
	return "UNKNOWN_TYPE"
