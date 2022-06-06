extends Panel

func has_point(_point):
	var distance = rect_pivot_offset.distance_to(_point)
	if(distance <= rect_size.x / 2.0):
		return true
	return false
